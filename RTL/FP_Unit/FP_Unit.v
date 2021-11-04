// This module is the top-level of the Floating-point Unit

module FP_Unit(in_rs1, in_rs2, out_data, in_FPU_Op);
    parameter DATA_WIDTH = 64;

    input   [3:0] in_FPU_Op;
    input   [DATA_WIDTH - 1:0] in_rs1, in_rs2;

    output  [DATA_WIDTH - 1:0] out_data;

endmodule