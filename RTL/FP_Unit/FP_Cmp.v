// This module compares two given numbers and returns 1 if the result is true
// otherwise, returns 0
module FP_Cmp(in_numA, in_numB, in_cmp_type, in_fmt, out_data, out_flag_NV);
    parameter DATA_WIDTH = 64;

    input   [DATA_WIDTH - 1:0] in_numA, in_numB;
    input   [1:0] in_cmp_type;  // Comparison type, including: equal (10),
                                // less than (01), and less than or equal comparison (00)
    input   in_fmt;     // Determine the inputted number is single-precision or
                        // double-precision

    output  out_flag_NV;
    output  [DATA_WIDTH - 1:0] out_data;

    // Internal wires
    wire    NaN_exception, NaN_exception_1, NaN_exception_2, numA_dp_exception, numA_sp_exception, numB_dp_exception, numB_sp_exception;
    wire    [DATA_WIDTH - 1:0]  converted_num_1, converted_num_2, input_fp_1, input_fp_2,
                                equ_result, lt_result, lte_result,
                                wire_1, wire_2, wire_3, wire_4, wire_5, wire_6,
                                sign_cmp, exp_cmp;

    // Converting 32-bit to 64-bit FP format
    assign converted_num_1 = {in_numA[31], ({{3{1'b0}}, in_numA[30:23]} + 11'd896), {in_numA[22:0], {29{1'b0}}}};
    assign converted_num_2 = {in_numB[31], ({{3{1'b0}}, in_numB[30:23]} + 11'd896), {in_numB[22:0], {29{1'b0}}}};

    assign input_fp_1 = (in_fmt) ? in_numA : converted_num_1;
    assign input_fp_2 = (in_fmt) ? in_numB : converted_num_2;

    // Check NaN in numA as 32-bit FP
    assign numA_sp_exception = ((in_numA[31:23] == 9'b111111111) & (in_numA[22:0] != 23'd0)) ? 1'b1 : 1'b0;
    // Check NaN in numA as 64-bit FP
    assign numA_dp_exception = ((in_numA[63:52] == 12'b111111111111) & (in_numA[51:0] != 52'd0)) ? 1'b1 : 1'b0;
    // Check NaN in numB as 32-bit FP
    assign numB_sp_exception = ((in_numB[31:23] == 9'b111111111) & (in_numB[22:0] != 23'd0)) ? 1'b1 : 1'b0;
    // Check NaN in numB as 64-bit FP
    assign numB_dp_exception = ((in_numB[63:52] == 12'b111111111111) & (in_numB[51:0] != 52'd0)) ? 1'b1 : 1'b0;

    assign NaN_exception_1 = (in_fmt) ? numA_dp_exception : numA_sp_exception;
    assign NaN_exception_2 = (in_fmt) ? numB_dp_exception : numB_sp_exception;
    assign NaN_exception = NaN_exception_1 | NaN_exception_2;

    assign out_flag_NV = NaN_exception;

    // EQU Comparison
    assign equ_result = (NaN_exception) ? 64'd0 : wire_1;
    assign wire_1 = (input_fp_1 == input_fp_2) ? 64'd1 : 64'd0;

    // LT Comparison
    assign sign_cmp = (input_fp_1 [63] & !input_fp_2 [63]) ? 64'd1 : 64'd0;
    assign exp_cmp = (input_fp_1[62:52] < input_fp_2[62:52]) ? 64'd1 : 64'd0;

    assign lt_result = (NaN_exception) ? 64'd0 : wire_2;
    assign wire_2 = (input_fp_1[63] == input_fp_2[63]) ? wire_3 : sign_cmp;
    assign wire_3 = (input_fp_1[62:52] == input_fp_2[62:52]) ? wire_4 : exp_cmp;
    assign wire_4 = (input_fp_1[51:0] < input_fp_2[51:0]) ? 64'd1 : 64'd0;

    // LTE Comparison
    assign lte_result = (equ_result == 64'd1 | lt_result == 64'd1) ? 64'd1 : 64'd0;

    // Final output
    assign out_data = (in_cmp_type == 2'b10) ? equ_result : wire_5;
    assign wire_5 = (in_cmp_type == 2'b01) ? lt_result : wire_6;
    assign wire_6 = (in_cmp_type == 2'b00) ? lte_result : 64'd0;
endmodule