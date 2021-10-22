module FP_AddSub(in_numA, in_numB, in_addsub, out_result, out_flag_OF, out_flag_UF);
    parameter DATA_WIDTH = 64;
    parameter EXP_WIDTH = 11;
    parameter MANT_WIDTH = 52;

    input   in_addsub;
    input   [DATA_WIDTH - 1:0] in_numA, in_numB;

    output  out_flag_UF, out_flag_OF;
    output  [DATA_WIDTH - 1:0] out_result;

    wire    exp_cmp_result;
    wire    [EXP_WIDTH - 1:0] biggerExp, diffExp;
    wire    [MANT_WIDTH + 2:0] adjusted_mantA, adjusted_mantB;

    ExpCmp ExpCmp_Inst0(
        .in_expA(in_numA[62:52]),
        .in_expB(in_numB[62:52]),
        .out_result(exp_cmp_result),
        .out_biggerExp(biggerExp),
        .out_diff(diffExp)
    );
    MantAdj MantAdj_Inst0(
        .in_signA(in_numA[63]),
        .in_signB(in_numB[63] ^ in_addsub),
        .in_biggerExp(exp_cmp_result),
        .in_shiftAmount(diffExp),
        .in_mantA(in_numA[51:0]),
        .in_mantB(in_numB[51:0]),
        .out_mantA(adjusted_mantA),
        .out_mantB(adjusted_mantB)
    );
    AddSubNorm AddSubNorm_Inst0(
        .in_Exp(biggerExp),
        .in_Mant(adjusted_mantA + adjusted_mantB),
        .out_result(out_result),
        .out_flag_OF(out_flag_OF),
        .out_flag_UF(out_flag_UF)
    );

endmodule