// Multiplier Normaliser
module MultNorm(in_Exp, in_Mant, out_Exp, out_Mant);
    parameter EXP_WIDTH = 8;
    parameter MANT_WIDTH = 23;

    input [EXP_WIDTH - 1:0] in_Exp;
    input [MANT_WIDTH * 2 + 1:0] in_Mant;

    output [EXP_WIDTH - 1:0] out_Exp;
    output [MANT_WIDTH - 1:0] out_Mant;

    assign out_Exp = (in_Mant[MANT_WIDTH * 2 + 1]) ? (in_Exp + 8'd1) : in_Exp;
    assign out_Mant = (in_Mant[MANT_WIDTH * 2 + 1]) ? in_Mant[MANT_WIDTH * 2:24] : in_Mant[MANT_WIDTH * 2 - 1:23];
endmodule