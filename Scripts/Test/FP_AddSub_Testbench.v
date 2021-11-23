`timescale 1ns/1ps

module FP_AddSub_Testbench();
    parameter waittime = 5;
    integer file_numA, file_numB, file_Add_result, file_Sub_result;

    reg     [31:0] in_numA, in_numB;
    reg     in_addsub;
    wire    [31:0] out_result;

    initial begin
        file_numA = $fopen("TestCaseA.in", "r");
        file_numB = $fopen("TestCaseB.in", "r");
        file_Add_result = $fopen("Add_Result.out", "w");
        file_Sub_result = $fopen("Sub_Result.out", "w");

        while (! $feof(file_numA)) begin
            $fscanf(file_numA, "%h\n", in_numA);
            $fscanf(file_numB, "%h\n", in_numB);
            
            in_addsub = 1'b0;   // Add
            #waittime;
            $fdisplay(file_Add_result, "%h", out_result);
            #waittime;
            
            in_addsub = 1'b1;   // Subtract
            #waittime;
            $fdisplay(file_Sub_result, "%h", out_result);
            #waittime;
        end

        $fclose(file_Add_result);
        $fclose(file_Sub_result);
        #waittime; $finish;
    end

    FP_AddSub FP_AddSub_Inst0(
        .in_numA(in_numA),
        .in_numB(in_numB),
        .in_ctrl_addsub(in_addsub),
        .out_data(out_result)
    );

endmodule