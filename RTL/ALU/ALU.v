module ALU(in_A, in_B, ALU_Op, out_data, out_ALU_flag);
    parameter DATA_WIDTH = 64;

    input   [DATA_WIDTH - 1:0] in_A, in_B;
    input   [3:0] ALU_Op;

    output  [DATA_WIDTH - 1:0] data_out;
    output  [4:0] out_ALU_flag;

    AddSub AddSub_Inst0(
        .in_numA(in_A), 
        .in_numB(in_B),
        .in_ctrl_AddSub(),
        .out_data()
    );
    And_Or_Xor And_Or_Xor_Inst0(
        .in_numA(in_A),
        .in_numB(in_B),
        .out_And(),
        .out_Or(),
        .out_Xor()
    );
    Cmp Cmp_Inst0(
        .in_numA(in_A),
        .in_numB(in_B),
        .out_Signed(),
        .out_Unsigned(),
        .out_flag(out_ALU_flag)
    );
    Shift Shift_Inst0(
        .in_numA(in_A),
        .in_numB(in_B),
        .in_ctrl(),
        .out_LeftShift(),
        .out_RightShift()
    );
    IntToFP IntToFP_Inst0(
        .in_data(in_A),
        .in_int_width(),
        .in_signed_unsigned(),
        .in_fp_width(),
        .out_data()
    );
endmodule