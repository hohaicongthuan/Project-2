// Divider Normaliser
module DivNorm(in_Exp, in_Mant, out_Exp, out_Mant);
    parameter EXP_WIDTH = 11;
    parameter MANT_WIDTH = 52;

    input   [EXP_WIDTH - 1:0] in_Exp;
    input   [MANT_WIDTH:0] in_Mant;

    output   [EXP_WIDTH - 1:0] out_Exp;
    output   [MANT_WIDTH - 1:0] out_Mant;

    // Shift right mantissa 1 bit and decrement exponent by 1
    assign out_Exp = in_Exp - 12'd1;
    assign out_Mant = {in_Mant[50:0], 1'b1};
endmodule