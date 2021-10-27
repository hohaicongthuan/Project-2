module FP_Div(in_numA, in_numB, out_result);
    parameter DATA_WIDTH = 64;
    parameter EXP_WIDTH = 11;
    parameter MANT_WIDTH = 52;

    input   [DATA_WIDTH - 1:0] in_numA, in_numB;
    output  [DATA_WIDTH - 1:0] out_result;

    wire    result_sign;
    wire    [EXP_WIDTH - 1:0] result_exp, normalised_exp;
    wire    [MANT_WIDTH - 1:0] result_mant;
    wire    [MANT_WIDTH:0] result_quotient;

    assign result_sign = in_numA[63] ^ in_numB[63];
    assign result_exp = (result_mant == 0) ? 0 : normalised_exp + 1023;
    assign out_result = {result_sign, result_exp, result_mant};

    Mant_Div Mant_Div_Inst0(
        .in_dividend({54'd1, in_numA[51:0]}),
        .in_divisor({1'b1, in_numB[51:0]}),
        .out_quotient(result_quotient),
        .out_remainder()
    );
    DivNorm DivNorm_Inst0(
        .in_Exp((in_numA[62:52] - 1023) - (in_numB[62:52] - 1023)),
        .in_Mant(result_quotient),
        .out_Exp(normalised_exp),
        .out_Mant(result_mant)
    );
endmodule