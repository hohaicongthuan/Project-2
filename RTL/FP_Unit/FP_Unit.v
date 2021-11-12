// This module is the top-level of the Floating-point Unit

module FP_Unit(in_rs1, in_rs2, out_data, in_FPU_Op, in_fmt, in_output_fmt);
    parameter DATA_WIDTH = 64;

    input   in_fmt, in_output_fmt;
    input   [3:0] in_FPU_Op;
    input   [DATA_WIDTH - 1:0] in_rs1, in_rs2;

    output  [DATA_WIDTH - 1:0] out_data;

    // Internal wires
    wire    flag_NX, flag_NV, flag_OF, flag_UF;
    wire    [DATA_WIDTH - 1:0] FP_AddSub_Out, FP_Mul_Out, FP_Div_Out, FP_MinMax_Out, FP_Cmp_Out, FP_SGNJ_Out, FP_Convert_Out, FP_Int_Convert_Out, wire_1, wire_2, wire_3, wire_4, wire_5, wire_6, wire_7;

    FP_AddSub FP_AddSub_Inst0 (
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .in_addsub(),
        .out_result(FP_AddSub_Out),
        .out_flag_OF(),
        .out_flag_UF()
    );
    FP_Mul FP_Mul_Inst0 (
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .out_result(FP_Mul_Out)
    );
    FP_Div FP_Div_Inst0 (
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .out_result(FP_Div_Out)
    );
    FP_MinMax FP_MinMax_Inst0 (
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .out_num(FP_MinMax_Out),
        .in_ctrl_minmax(),
        .in_fmt()
    );
    FP_Cmp FP_Cmp_Inst0 (
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .in_cmp_type(),
        .in_fmt(in_fmt),
        .out_data(FP_Cmp_Out),
        .out_flag_NV()
    );
    FP_SGNJ FP_SGNJ_Inst0 (
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .in_ctrl_jnx(),
        .in_fmt(in_fmt),
        .out_data(FP_SGNJ_Out)
    );
    FP_Convert FP_Convert_Inst0 (
        .in_data(in_rs1),
        .out_data(FP_Convert_Out),
        .in_fmt(in_fmt),
        .out_flag_nx()
    );
    FP_Int_Convert FP_Int_Convert_Inst0 (
        .in_data(in_rs1),
        .in_fmt(in_fmt),
        .in_output_fmt(),
        .out_data(FP_Int_Convert_Out),
        .out_flg_NV()
    );

    assign out_data = (in_FPU_Op == 4'b0000) ? FP_AddSub_Out : wire_1;
    assign wire_1 = (in_FPU_Op == 4'b0001) ? FP_Mul_Out : wire_2;
    assign wire_2 = (in_FPU_Op == 4'b0010) ? FP_Div_Out : wire_3;
    assign wire_3 = (in_FPU_Op == 4'b0011) ? FP_MinMax_Out : wire_4;
    assign wire_4 = (in_FPU_Op == 4'b0100) ? FP_Cmp_Out : wire_5;
    assign wire_5 = (in_FPU_Op == 4'b0101) ? FP_SGNJ_Out : wire_6;
    assign wire_6 = (in_FPU_Op == 4'b0110) ? FP_Convert_Out : wire_7;
    assign wire_7 = (in_FPU_Op == 4'b0111) ? FP_Int_Convert_Out : 64'd0;
endmodule