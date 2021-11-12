// Floating-point Adder/Subtractor Normaliser
// This module normalises the input mantissa and adjust the exponent accordingly.

module AddSubNorm(in_Exp, in_Mant, out_result, out_flag_OF, out_flag_UF);
    parameter EXP_WIDTH = 11;
    parameter MANT_WIDTH = 52;
    parameter DATA_WIDTH = 64;

    input   [EXP_WIDTH - 1:0] in_Exp;
    input   [MANT_WIDTH + 2:0] in_Mant;
    output  out_flag_UF, out_flag_OF;
    output  [DATA_WIDTH - 1:0] out_result;

    wire    [EXP_WIDTH:0] extended_Exp, Exp_2, normalised_Exp, result_Exp;
    wire    [MANT_WIDTH + 2:0] Mant_1, Mant_2, normalised_Mant, result_Mant;

    // Check if mantisa should be reverted
    assign Mant_1 = (in_Mant[54]) ? ~in_Mant : in_Mant;
    // Check if mantissa should be shifted
    assign Mant_2 = (in_Mant[53]) ? (Mant_1 >> 1'b1) : Mant_1;

    // Sign extend the exponent to 12 bits to check for overflow/underflow
    assign extended_Exp = (in_Exp[10]) ? {1'b1, in_Exp} : {1'b0, in_Exp};
    // Check if exponent should be increment by one
    assign Exp_2 = (in_Mant[53]) ? (extended_Exp + 1) : extended_Exp;

    // Output result
    assign result_Exp = (in_Mant[52]) ? Exp_2 : normalised_Exp;
    assign result_Mant = (in_Mant[52]) ? Mant_2 : normalised_Mant;
    assign out_result = {in_Mant[54], result_Exp[10:0], result_Mant[51:0]};

    // Assign flags
    assign out_flag_OF = (result_Exp > 12'd1024) ? 1'b1 : 1'b0;
    assign out_flag_UF = (result_Exp < -12'd1023) ? 1'b1 : 1'b0;

    AddSubNorm_child AddSubNorm_child_Inst0(
        .in_Exp(Exp_2),
        .in_Mant(Mant_2),
        .out_Exp(normalised_Exp),
        .out_Mant(normalised_Mant)
    );
endmodule