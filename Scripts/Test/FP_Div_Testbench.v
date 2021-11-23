`timescale 1ns/1ps

module FP_Div_Testbench();
    parameter waittime = 5;
    integer file_numA, file_numB, file_Div_result;

    reg     [31:0] in_numA, in_numB;
    wire    [31:0] out_result;

    initial begin
        file_numA = $fopen("TestCaseA.in", "r");
        file_numB = $fopen("TestCaseB.in", "r");
        file_Div_result = $fopen("Div_Result.out", "w");

        while (! $feof(file_numA)) begin
            $fscanf(file_numA, "%h\n", in_numA);
            $fscanf(file_numB, "%h\n", in_numB);
            
            #waittime;
            $fdisplay(file_Div_result, "%h", out_result);
            #waittime;
        end

        $fclose(file_Div_result);
        #waittime; $finish;
    end

    FP_Div FP_Div_Inst0(
        .in_numA(in_numA),
        .in_numB(in_numB),
        .out_result(out_result)
    );

endmodule