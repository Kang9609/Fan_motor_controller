`timescale 1ns / 1ps

module Comparator
(
    input [9:0] i_counter,
    output o_motor_1, o_motor_2, o_motor_3, o_motor_4
);

    assign o_motor_1 = (i_counter <300) ? 1'b1 : 1'b0;
    assign o_motor_2 = (i_counter <600) ? 1'b1 : 1'b0;
    assign o_motor_3 = (i_counter <800) ? 1'b1 : 1'b0;
    assign o_motor_4 = (i_counter <990) ? 1'b1 : 1'b0;

endmodule
