// Data Memory used for testbench

module DMem(in_data, in_addr, in_wr_en, out_data);
    parameter DATA_WIDTH = 64;

    input   in_wr_en;
    input   [DATA_WIDTH - 1:0] in_data, in_addr;
    
    output reg  [DATA_WIDTH - 1:0] out_data;

    reg     [7:0] Mem [65535:0];

    always @ (*) begin
        if (in_wr_en) begin
            Mem[in_addr] <= in_data[7:0];
            Mem[in_addr + 1] <= in_data[15:8];
            Mem[in_addr + 2] <= in_data[23:16];
            Mem[in_addr + 3] <= in_data[31:24];
            Mem[in_addr + 4] <= in_data[39:32];
            Mem[in_addr + 5] <= in_data[47:40];
            Mem[in_addr + 6] <= in_data[55:48];
            Mem[in_addr + 7] <= in_data[63:56];
        end
        out_data = { Mem[in_addr + 7], Mem[in_addr + 6], Mem[in_addr + 5], Mem[in_addr + 4], Mem[in_addr + 3], Mem[in_addr + 2], Mem[in_addr + 1], Mem[in_addr] };
    end
endmodule