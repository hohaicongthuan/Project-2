module Datapath(in_ctrl_signal, in_inst, in_DM_data, in_Clk, out_inst_addr, out_addr, out_wr_data, out_flag);
    input   Clk;
    input   [22:0] in_ctrl_signal;
    input   [31:0] in_inst;
    input   [63:0] in_DM_data;

    output  [63:0] out_inst_addr, out_addr, out_wr_data;
    output  flag;

    // Internal wires
    wire    [63:0] int_RF_out_A, int_RF_out_B, fp_RF_out_A, fp_RF_out_B, ALU_Out, FPU_Out, ImmGen_Out;

    ImmGen ImmGen_Inst0 (
        .in_data(in_inst),
        .in_inst_type(),
        .out_data(ImmGen_Out)
    );
    ALU ALU_Inst0 (
        .in_rs1(int_RF_out_A),
        .in_rs2(int_RF_out_B),
        .in_ALU_Op(),
        .in_fmt(),
        .out_data(ALU_Out),
        .out_ALU_flag()
    );
    FP_Unit FP_Unit_Inst0 (
        .in_rs1(fp_RF_out_A),
        .in_rs2(fp_RF_out_B),
        .out_data(FPU_Out),
        .in_FPU_Op(),
        .in_fmt()
    );
    RegisterFile RegisterFile_Inst0 (
        .data_in(),
        .data_outA(int_RF_out_A),
        .data_outB(int_RF_out_B),
        .addr_A(),
        .addr_B(),
        .writeAddr();
        .write_En(),
        .Clk(Clk)
    );
    FP_RegisterFile FP_RegisterFile_Inst0(
        .data_in(),
        .data_outA(fp_RF_out_A),
        .data_outB(fp_RF_out_B),
        .addr_A(),
        .addr_B(),
        .writeAddr();
        .write_En(),
        .Clk(Clk)
    );
endmodule