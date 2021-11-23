module FP_Mul(in_numA, in_numB, out_result);
    parameter DATA_WIDTH = 32;
    parameter EXP_WIDTH = 8;
    parameter MANT_WIDTH = 23;

    input   [DATA_WIDTH - 1:0] in_numA, in_numB;
    output  [DATA_WIDTH - 1:0] out_result;

    // Internal wires
    wire    result_sign;
    wire    [EXP_WIDTH - 1:0] result_exp, normalised_exp, sp_final_exp, sp_exp_A, sp_exp_B;
    wire    [MANT_WIDTH - 1:0] normalised_mant;
    wire    [DATA_WIDTH - 1:0] numA, numB, dp_out_result, sp_out_result;
    wire    [47:0] product_mant;

    assign numA = {in_numA[31], (in_numA[30:23] - 8'd127), in_numA[22:0]};
    assign numB = {in_numB[31], (in_numB[30:23] - 8'd127), in_numB[22:0]};

    assign result_sign = numA[31] ^ numB[31];
    assign result_exp = (normalised_mant == 23'd0) ? 8'd0 : normalised_exp;

    Mant_Mult Mant_Mult_Inst0(
        .in_multiplicand({26'd1, numA[22:0]}),
        .in_multiplier({1'b1, numB[22:0]}),
        .out_product(product_mant)
    );
    MultNorm MultNorm_Inst0(
        .in_Exp(numA[30:23] + numB[30:23]),
        .in_Mant(product_mant),
        .out_Exp(normalised_exp),
        .out_Mant(normalised_mant)
    );

    assign sp_final_exp = result_exp + 8'd127;
    assign out_result = {result_sign, sp_final_exp, normalised_mant};

endmodule