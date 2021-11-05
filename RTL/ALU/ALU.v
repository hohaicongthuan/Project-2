module ALU(in_rs1, in_rs2, in_ALU_Op, in_fmt, out_data, out_ALU_flag);
    parameter DATA_WIDTH = 64;

    input   [1:0] in_fmt;
    input   [DATA_WIDTH - 1:0] in_rs1, in_rs2;
    input   [3:0] in_ALU_Op;

    output  [DATA_WIDTH - 1:0] data_out;
    output  [4:0] out_ALU_flag;

    wire    [DATA_WIDTH - 1:0] AddSub_Out, And_Out, Or_Out, Xor_Out, Signed_Cmp_Out, Unsigned_Cmp_Out, Left_Shift_Out, Right_Shift_Out, IntToFP_Out;

    AddSub AddSub_Inst0(
        .in_numA(in_rs1), 
        .in_numB(in_rs2),
        .in_ctrl_AddSub(),
        .out_data(AddSub_Out)
    );
    And_Or_Xor And_Or_Xor_Inst0(
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .out_And(And_Out),
        .out_Or(Or_Out),
        .out_Xor(Xor_Out)
    );
    Cmp Cmp_Inst0(
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .out_Signed(Signed_Cmp_Out),
        .out_Unsigned(Unsigned_Cmp_Out),
        .out_flag(out_ALU_flag)
    );
    Shift Shift_Inst0(
        .in_numA(in_rs1),
        .in_numB(in_rs2),
        .in_ctrl(),
        .out_LeftShift(Left_Shift_Out),
        .out_RightShift(Right_Shift_Out)
    );
    IntToFP IntToFP_Inst0(
        .in_data(in_rs1),
        .in_fmt(in_fmt[1]),
        .in_signed_unsigned(in_fmt[0]),
        .in_output_fmt(),
        .out_data(IntToFP_Out)
    );

    assign out_data = (in_ALU_Op == 4'b0000) ? AddSub_Out : wire_1;
    assign wire_1 = (in_ALU_Op == 4'b0001) ? And_Out : wire_2;
    assign wire_2 = (in_ALU_Op == 4'b0010) ? Or_Out : wire_3;
    assign wire_3 = (in_ALU_Op == 4'b0011) ? Xor_Out : wire_4;
    assign wire_4 = (in_ALU_Op == 4'b0100) ? Signed_Cmp_Out : wire_5;
    assign wire_5 = (in_ALU_Op == 4'b0101) ? Unsigned_Cmp_Out : wire_6;
    assign wire_6 = (in_ALU_Op == 4'b0110) ? Left_Shift_Out : wire_7;
    assign wire_7 = (in_ALU_Op == 4'b0111) ? Right_Shift_Out : wire_8;
    assign wire_8 = (in_ALU_Op == 4'b1000) ? IntToFP_Out : 64'd0;
endmodule