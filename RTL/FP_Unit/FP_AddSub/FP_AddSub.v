// This is the top module for floating-point adder/subtractor

module FP_AddSub(in_numA, in_numB, in_addsub, in_fmt, out_result, out_flag_OF, out_flag_UF);
    parameter DATA_WIDTH = 64;
    parameter EXP_WIDTH = 11;
    parameter MANT_WIDTH = 52;

    input   in_addsub, in_fmt;
    input   [DATA_WIDTH - 1:0] in_numA, in_numB;

    output  out_flag_UF, out_flag_OF;
    output  [DATA_WIDTH - 1:0] out_result;

    // Internal wires
    wire    exp_cmp_result;
    wire    [7:0] sp_exp_A, sp_exp_B;
    wire    [EXP_WIDTH - 1:0] biggerExp, diffExp, dp_exp_A, dp_exp_B, sp_final_exp;
    wire    [MANT_WIDTH + 2:0] adjusted_mantA, adjusted_mantB, dp_mant_A, dp_mant_B;
    wire    [DATA_WIDTH - 1:0] converted_A, converted_B, numA, numB, separated_A, separated_B, dp_out_result, sp_out_result, AddSubNorm_Out;

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

    ExpCmp ExpCmp_Inst0(
        .in_expA(numA[62:52]),
        .in_expB(numB[62:52]),
        .out_result(exp_cmp_result),
        .out_biggerExp(biggerExp),
        .out_diff(diffExp)
    );
    MantAdj MantAdj_Inst0(
        .in_signA(numA[63]),
        .in_signB(numB[63] ^ in_addsub),
        .in_biggerExp(exp_cmp_result),
        .in_shiftAmount(diffExp),
        .in_mantA(numA[51:0]),
        .in_mantB(numB[51:0]),
        .out_mantA(adjusted_mantA),
        .out_mantB(adjusted_mantB)
    );
    AddSubNorm AddSubNorm_Inst0(
        .in_Exp(biggerExp),
        .in_Mant(adjusted_mantA + adjusted_mantB),
        .out_result(AddSubNorm_Out),
        .out_flag_OF(out_flag_OF),
        .out_flag_UF(out_flag_UF)
    );

    assign sp_final_exp = AddSubNorm_Out[62:52] + 11'd127;
    assign sp_out_result = {{32{1'b1}}, AddSubNorm_Out[63], sp_final_exp[7:0], AddSubNorm_Out[51:29]};
    assign dp_out_result = {AddSubNorm_Out[63], (AddSubNorm_Out[62:52] + 11'd1023), AddSubNorm_Out[51:0]};
    assign out_result = (in_fmt) ? dp_out_result : sp_out_result;

endmodule