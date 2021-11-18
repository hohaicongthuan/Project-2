`timescale 1ns/1ps

module FP_Div_Testbench();
    parameter waittime = 5;
    integer file_numA, file_numB, file_Div_result;

    reg     [63:0] in_numA, in_numB;
    reg     in_fmt;
    wire    [63:0] out_result;

    initial begin
        file_numA = $fopen("TestCaseA.in", "r");
        file_numB = $fopen("TestCaseB.in", "r");
        file_Div_result = $fopen("Div_Result.out", "w");

        in_fmt = 1'b1;      // 64-bit FP

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
        .in_fmt(in_fmt),
        .out_result(out_result)
    );

endmodule