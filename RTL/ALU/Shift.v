// Bits logical/arithmetic left/right shifter
module Shift(in_numA, in_numB, in_ctrl, out_LeftShift, out_RightShift);
    parameter DATA_WIDTH = 64;

    input   in_ctrl;    // Control logical or arithmetic right shift
    input   [DATA_WIDTH - 1:0] in_numA, in_numB;

    output  [DATA_WIDTH - 1:0] out_LeftShift, out_RightShift;

    assign out_LeftShift = in_numA << in_numB;
    assign out_RightShift = (!in_ctrl) ? (in_numA >> in_numB) : (in_numA >>> in_numB);
endmodule