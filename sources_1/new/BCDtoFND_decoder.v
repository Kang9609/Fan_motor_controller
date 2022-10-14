`timescale 1ns / 1ps

module BCDtoFND_Decoder(
    input [3:0] i_value,
    input i_SW_FndLight,
    input i_en,
    output [7:0] o_fndfont
    );

    reg [7:0] r_fndfont;
    assign o_fndfont = r_fndfont;

    always @(i_value or i_en) begin
        if (i_en) begin
                r_fndfont = 8'hff;     //?���?? 추�??��?�� default값을 만들?��주면 ?��치않?�� ?��치�? ?��?��긴다.
        end
            else begin
                case (i_value)
                4'h0 : r_fndfont = 8'hc0;
                4'h1 : r_fndfont = 8'hf9;
                4'h2 : r_fndfont = 8'ha4;
                4'h3 : r_fndfont = 8'hb0;
                4'h4 : r_fndfont = 8'h99;
                4'h5 : r_fndfont = 8'h92;
                4'h6 : r_fndfont = 8'h82;
                4'h7 : r_fndfont = 8'hf8;
                4'h8 : r_fndfont = 8'h80;
                4'h9 : r_fndfont = 8'h90;
                4'ha : r_fndfont = 8'h7f;  //dot = segment dp
                default : r_fndfont = 8'hff;   
                endcase
            end
                       
    end
endmodule
