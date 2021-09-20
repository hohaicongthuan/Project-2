module RegisterFile(
    data_in,
    data_outA,
    data_outB,
    addr_A,
    addr_B,
    write_En,
    Clk,
    Rst_N
);

    parameter DATA_WIDTH = 64;
    parameter ADDR_WIDTH = $clog2(DATA_WIDTH);

    input   Clk, Rst_N, write_En;
    input   [ADDR_WIDTH - 1:0] addr_A, addr_B;
    input   [DATA_WIDTH - 1:0] data_in;

    output  [DATA_WIDTH - 1:0] data_outA, data_outB;

    reg [DATA_WIDTH - 1:0] registerFile [31:0];

endmodule