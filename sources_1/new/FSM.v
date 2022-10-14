`timescale 1ns / 1ps

module FSM
(
    input i_clk,
    input i_reset,
    input [4:0] i_button,
    output [2:0] o_motorState,
    output [2:0] o_ledState, 
    output [2:0] o_fndState
);
    parameter S_MOTOR_0 = 3'd0,
              S_MOTOR_1 = 3'd1,
              S_MOTOR_2 = 3'd2,
              S_MOTOR_3 = 3'd3,
              S_MOTOR_4 = 3'd4;



    reg [2:0] curState, nextState;
    reg [2:0] r_motorState;
    reg [2:0] r_ledState;
    reg [2:0] r_fndState;

    assign o_motorState = r_motorState;
    assign o_ledState = r_ledState;
    assign o_fndState = r_fndState;

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) curState <= S_MOTOR_0;
        else         curState <= nextState;
    end

    always @(curState or i_button) begin
        case (curState)
            S_MOTOR_0 : begin
                // if (i_button[0])       nextState <= S_MOTOR_0;
                if (i_button [1]) nextState <= S_MOTOR_1;
                else if (i_button [2]) nextState <= S_MOTOR_2;
                else if (i_button [3]) nextState <= S_MOTOR_3;
                else if (i_button [4]) nextState <= S_MOTOR_4;
                else                   nextState <= S_MOTOR_0;
            end

            S_MOTOR_1 : begin
                if (i_button[0])       nextState <= S_MOTOR_0;
                // else if (i_button [1]) nextState <= S_MOTOR_1;
                else if (i_button [2]) nextState <= S_MOTOR_2;
                else if (i_button [3]) nextState <= S_MOTOR_3;
                else if (i_button [4]) nextState <= S_MOTOR_4;
                else                   nextState <= S_MOTOR_1;
            end

            S_MOTOR_2 : begin
                if (i_button[0])       nextState <= S_MOTOR_0;
                else if (i_button [1]) nextState <= S_MOTOR_1;
                // else if (i_button [2]) nextState <= S_MOTOR_2;
                else if (i_button [3]) nextState <= S_MOTOR_3;
                else if (i_button [4]) nextState <= S_MOTOR_4;
                else                   nextState <= S_MOTOR_2;
            end

            S_MOTOR_3 : begin
                if (i_button[0])       nextState <= S_MOTOR_0;
                else if (i_button [1]) nextState <= S_MOTOR_1;
                else if (i_button [2]) nextState <= S_MOTOR_2;
                // else if (i_button [3]) nextState <= S_MOTOR_3;
                else if (i_button [4]) nextState <= S_MOTOR_4;
                else                   nextState <= S_MOTOR_3;
            end

            S_MOTOR_4 : begin
                if (i_button[0])       nextState <= S_MOTOR_0;
                else if (i_button [1]) nextState <= S_MOTOR_1;
                else if (i_button [2]) nextState <= S_MOTOR_2;
                else if (i_button [3]) nextState <= S_MOTOR_3;
                // else if (i_button [4]) nextState <= S_MOTOR_4;
                else                   nextState <= S_MOTOR_4;
            end
        endcase
    end

    always @(curState) begin
        r_motorState <= 3'bxxx;

        case (curState)
            S_MOTOR_0 : r_motorState <= 3'd0;
            S_MOTOR_1 : r_motorState <= 3'd1;
            S_MOTOR_2 : r_motorState <= 3'd2;
            S_MOTOR_3 : r_motorState <= 3'd3;
            S_MOTOR_4 : r_motorState <= 3'd4;
        endcase
    end

    always @(curState) begin
        r_ledState <= 3'bxxx;

        case (curState)
            S_MOTOR_0 : r_ledState <= 3'd0;
            S_MOTOR_1 : r_ledState <= 3'd1;
            S_MOTOR_2 : r_ledState <= 3'd2;
            S_MOTOR_3 : r_ledState <= 3'd3;
            S_MOTOR_4 : r_ledState <= 3'd4;
        endcase
    end

    always @(curState) begin
        r_ledState <= 3'bxxx;

        case (curState)
            S_MOTOR_0 : r_fndState <= 3'd0;
            S_MOTOR_1 : r_fndState <= 3'd1;
            S_MOTOR_2 : r_fndState <= 3'd2;
            S_MOTOR_3 : r_fndState <= 3'd3;
            S_MOTOR_4 : r_fndState <= 3'd4;
        endcase
    end
endmodule
