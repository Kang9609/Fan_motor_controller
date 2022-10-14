`timescale 1ns / 1ps

module Mux_2x1(
    input [3:0] i_a,
    input [2:0] i_b,
    input i_sel,
    output [3:0] o_y
    );

    reg [3:0] r_y;
    assign o_y = r_y;

    always @(*) begin
        case (i_sel)
            1'b0 : r_y <= i_a;
            1'b1 : r_y <= i_b;
        endcase
    end
endmodule
