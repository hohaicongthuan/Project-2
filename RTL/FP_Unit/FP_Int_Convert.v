// This module converts:
//      32-bit floating-point to 32-bit (signed/unsigned) integer
//      32-bit floating-point to 64-bit (signed/unsigned) integer
//      64-bit floating-point to 32-bit (signed/unsigned) integer
//      64-bit floating-point to 64-bit (signed/unsigned) integer
module FP_Int_Convert(in_data, in_fmt, in_output_fmt, out_data, out_flg_NV);
    parameter DATA_WIDTH = 64;

    input   in_fmt;                 // Determine the input format (32-bit or 64 bit, signed or unsigned integer)

    input   [DATA_WIDTH - 1:0] in_data;
    input   [1:0]   in_output_fmt;  // Determine the output format (32-bit or 64 bit, signed or unsigned integer)

    output  out_flg_NV;             // Invalid flag
    output  [DATA_WIDTH - 1:0] out_data;

    // Internal wires
    wire    [DATA_WIDTH - 1:0] converted_input, input_fp, output_1, output_2;
    wire    [115:0] shifted_num, mant;
    wire    sign, invalid_case_1, invalid_case_2, invalid_case_3, invalid_case_4;
    wire    [10:0] exp, exp_abs;

    // Converting 32-bit to 64-bit FP format
    assign converted_input = {in_data[31], ({{3{1'b0}}, in_data[30:23]} + 11'd896), {in_data[22:0], {29{1'b0}}}};

    assign input_fp = (in_fmt) ? in_data : converted_input;

    assign sign = input_fp[63];
    assign exp = input_fp[62:52] - 11'd1023;
    assign mant = {{63{1'b0}}, 1'b1, input_fp[51:0]};

    assign shifted_num = mant << exp[5:0];

    assign output_1 = (in_output_fmt[1]) ? shifted_num[115:52] : {{32{1'b0}}, shifted_num[83:52]};
    assign output_2 = (sign & !in_output_fmt[0]) ? (~output_1 + 64'd1) : (output_1);

    assign out_data = (exp[10]) ? 64'd0 : output_2;

    // Get absolute value of exponent
    assign exp_abs = (exp[10]) ? (~exp + 11'd1) : exp;

    // Check if the inputted number could be represent in 32 or 64 bit integer
    // If it could, NV flag is clear, otherwise, it is set
    assign invalid_case_1 = ((exp_abs > 30) & (in_output_fmt == 2'b00)) ? 1'b1 : 1'b0;
    assign invalid_case_2 = ((exp_abs > 31) & (in_output_fmt == 2'b01)) ? 1'b1 : 1'b0;
    assign invalid_case_3 = ((exp_abs > 62) & (in_output_fmt == 2'b10)) ? 1'b1 : 1'b0;
    assign invalid_case_4 = ((exp_abs > 63) & (in_output_fmt == 2'b11)) ? 1'b1 : 1'b0;
    assign out_flg_NV = invalid_case_1 | invalid_case_2 | invalid_case_3 | invalid_case_4;
endmodule