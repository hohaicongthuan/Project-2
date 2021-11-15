`timescale 1ns/1ps

module Testbench();
    parameter DATA_WIDTH    = 64;
    parameter waittime      = 20;
    parameter clocktime     = 10;
    
    reg     DM_wr_en, Clk;
    reg     [31:0] Inst;
    reg     [DATA_WIDTH - 1:0] Inst_Addr, Addr, Wr_Data, DM_Data;

    initial begin
        Clk = 1'b0; // Initial value of the clock signal
        forever #clocktime Clk = ~Clk; // Generates clock pulses forever
    end

    initial begin
        
    end

    RV64IFD_top RV64IFD_top_Inst0(
        .in_DM_data(DM_Data),
        .in_inst(Inst),
        .in_Clk(Clk),
        .out_inst_addr(Inst_Addr),
        .out_addr(Addr),
        .out_wr_data(Wr_Data),
        .out_DM_wr_en(DM_wr_en)
    );

    IMem IMem_Inst0(
        .out_inst(Inst),
        .in_inst_addr(Inst_Addr)
    );

    DMem DMem_Inst0(
        .in_data(Wr_Data),
        .in_addr(Addr),
        .in_wr_en(DM_wr_en),
        .out_data(DM_Data)
    );
endmodule