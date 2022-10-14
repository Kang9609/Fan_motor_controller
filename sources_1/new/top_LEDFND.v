`timescale 1ns / 1ps

module top_LightStand
(
    input i_clk,
    // input i_fndclk,
    input i_reset,
    // input i_modeSW,
    input i_en,
    // input i_SW_FndLight,
    input [4:0] i_button,
    output o_motorState,
    output [7:0] o_fndfont
);

    wire w_clk;
    wire w_clk_1khz;
    wire [1:0] w_fndCounter;
    wire [9:0] w_counter;
    wire [3:0] w_x;
    wire [4:0] w_button;
    wire [2:0] w_lightState;
    wire [2:0] w_motorState;
    wire [2:0] w_fndState;
    wire [3:0] w_digitPosition;
    wire [3:0] w_fndValue;
 
    Clock_Divider clkDiv
    (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk)
    );

    counter counter
    (
        .i_clk(w_clk),
        .i_reset(i_reset),
        .o_counter(w_counter)
    );

    Comparator compare
    (
        .i_counter(w_counter),
        .o_motor_1(w_x[0]),
        .o_motor_2(w_x[1]), 
        .o_motor_3(w_x[2]), 
        .o_motor_4(w_x[3])
    );

    fnd_ClockDivider fnd_clkDiv(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk_1khz)
    );

    CounterFnd cntFnd(
        .i_clk(w_clk_1khz),
        .i_reset(i_reset),
        .o_counter(w_fndCounter)  //output [1:0] o_counter
    );

    Decoder_2x4 fnd_decoder(
        .i_select(w_fndCounter),
        .i_en(i_en),
        .o_digitPosition(w_digitPosition)
    );

    Button_Controller btn1
    (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[0]),
        .o_button(w_button[0])
    );

    Button_Controller btn2
    (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[1]),
        .o_button(w_button[1])
    );

    Button_Controller btn3
    (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[2]),
        .o_button(w_button[2])
    );

    Button_Controller btn4
    (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[3]),
        .o_button(w_button[3])
    );

    Button_Controller btn5
    (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[4]),
        .o_button(w_button[4])
    );

    FSM fsm   
    (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(w_button),
        .o_motorState(w_motorState),
        .o_ledState(w_ledState), 
        .o_fndState(w_fndState)
    );

    mux MUX
    (
        .i_x(w_x),
        .sel(w_motorState),
        .o_y(o_motorState)
    );

    Mux_2x1 fnd_mux(
        .i_a(w_digitPosition),
        .i_b(w_fndState),
        .i_sel(i_sel),
        .o_y(w_fndValue)
    );

    BCDtoFND_Decoder BCDtoFND(  
        .i_value(w_fndValue),
        .i_en(i_en),
        .o_fndfont(o_fndfont)
    );

endmodule
