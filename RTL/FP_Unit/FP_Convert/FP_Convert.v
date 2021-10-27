// This module converts:
//      32-bit floating-point to 64-bit floating-point and vice versa.
//      32-bit floating-point to 32-bit integer and 64-bit integer.
//      64-bit floating-point to 32-bit integer and 64-bit integer.

module FP_Convert(in_data, out_data, in_ctrl);
    input   [63:0] in_data;
    input   in_ctrl;

    output  [63:0] out_data;

endmodule