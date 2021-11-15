// Instruction Memory module used for testbench

module IMem(out_inst, in_inst_addr);
    input   [63:0] in_inst_addr;
    output  [31:0] out_inst;

    integer Inst_File, i;

    reg [31:0] Inst_Mem [65535:0];

    initial begin
        i = 0;
        Inst_File = $fopen("Instructions.txt", "r");
        while (! $feof(Inst_File)) begin
            $fscanf(Inst_File, "%b\n", Inst_Mem[i]);
            i = i + 1;
        end
        $fclose(Inst_File);
    end

    assign out_inst = Inst_Mem[in_inst_addr];
endmodule