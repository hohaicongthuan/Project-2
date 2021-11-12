module FP_Mul(in_numA, in_numB, in_fmt, out_result);
    parameter DATA_WIDTH = 64;
    parameter EXP_WIDTH = 11;
    parameter MANT_WIDTH = 52;

    input   in_fmt;
    input   [DATA_WIDTH - 1:0] in_numA, in_numB;
    output  [DATA_WIDTH - 1:0] out_result;

    // Internal wires
    wire    result_sign;
    wire    [7:0] sp_exp_A, sp_exp_B;
    wire    [EXP_WIDTH - 1:0] result_exp, normalised_exp, dp_exp_A, dp_exp_B, sp_final_exp;
    wire    [MANT_WIDTH - 1:0] normalised_mant, dp_mant_A, dp_mant_B;
    wire    [DATA_WIDTH - 1:0] converted_A, converted_B, separated_A, separated_B, numA, numB, dp_out_result, sp_out_result;
    wire    [105:0] product_mant;

    // Convert 32-bit FP to 64-bit FP
    assign sp_exp_A = in_numA[30:23] - 8'd127;
    assign dp_exp_A = {{3{sp_exp_A[7]}}, sp_exp_A};
    assign sp_exp_B = in_numB[30:23] - 8'd127;
    assign dp_exp_B = {{3{sp_exp_B[7]}}, sp_exp_B};
    assign dp_mant_A = {in_numA[22:0], {29{1'b0}}};
    assign dp_mant_B = {in_numB[22:0], {29{1'b0}}};
    assign converted_A = {in_numA[31], dp_exp_A, dp_mant_A};
    assign converted_B = {in_numA[31], dp_exp_B, dp_mant_B};

    assign separated_A = {in_numA[63], (in_numA[62:52] - 11'd1023), in_numA[51:0]};
    assign separated_B = {in_numB[63], (in_numB[62:52] - 11'd1023), in_numB[51:0]};

    assign numA = (in_fmt) ? separated_A : converted_A;
    assign numB = (in_fmt) ? separated_B : converted_B;

    assign result_sign = numA[63] ^ numB[63];
    assign result_exp = (normalised_mant == 0) ? 0 : normalised_exp;

    Mant_Mult Mant_Mult_Inst0(
        .in_multiplicand({54'd1, numA[51:0]}),
        .in_multiplier({1'b1, numB[51:0]}),
        .out_product(product_mant)
    );
    MultNorm MultNorm_Inst0(
        .in_Exp(numA[62:52] + numB[62:52]),
        .in_Mant(product_mant),
        .out_Exp(normalised_exp),
        .out_Mant(normalised_mant)
    );

    assign sp_final_exp = result_exp + 11'd127;
    assign sp_out_result = {{32{1'b1}}, result_sign, sp_final_exp[7:0], normalised_mant[51:29]};
    assign dp_out_result = {result_sign, (result_exp + 11'd1023), normalised_mant[51:0]};
    assign out_result = (in_fmt) ? dp_out_result : sp_out_result;

endmodule