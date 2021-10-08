module ALU(data_inA, data_inB, ALU_Op, data_out);
    parameter DATA_WIDTH = 64;

    input   [DATA_WIDTH - 1:0] data_inA, data_inB;
    input   [3:0] ALU_Op;
    output  [DATA_WIDTH - 1:0] data_out;

    
endmodule