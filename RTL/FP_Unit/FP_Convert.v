// This module converts:
//      32-bit floating-point to 64-bit floating-point and vice versa.

module FP_Convert(in_data, out_data, in_fmt, out_flag_nx);
    parameter DATA_WIDTH = 64;
    
    input   [DATA_WIDTH - 1:0] in_data;
    input   in_fmt; // Determine the inputted number is single- or double-precision

    output  out_flag_nx; // Inexact flag
    output  [DATA_WIDTH - 1:0] out_data;

    wire [DATA_WIDTH - 1:0] cvt_sp_dp, cvt_dp_sp;
    wire sign;
    wire [10:0] exp;
    wire [22:0] mant;

    assign data_out = (in_fmt) ? cvt_dp_sp : cvt_sp_dp;

    assign sign = (in_fmt) ? in_data[63] : in_data[31];
    assign exp = (in_fmt) ? (in_data[62:52] - 11'd896) : ({3{in_data[30]}, in_data[30:23]} + 11'd896);
    assign mant = (in_fmt) ? (data[51:29]) : (data[22:0]);

    assign cvt_dp_sp = {32{1'b1}, sign, exp[7:0], mant};
    assign cvt_sp_dp = {sign, exp, {mant, 29'd0}};

    assign out_flag_nx = (in_data[28:0] != 29'd0) ? 1'b1 : 1'b0;
endmodule