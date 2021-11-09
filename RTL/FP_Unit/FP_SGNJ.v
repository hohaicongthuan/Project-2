// This module performs sign injection on a given number
// (Normal sign injection, negated sign injection, and XOR-ed sign injection).

module FP_SGNJ(in_numA, in_numB, in_ctrl_jnx, in_fmt, out_data);
    input   [63:0] in_numA, in_numB;
    input   [1:0] in_ctrl_jnx;  // 00 -> normal sign injection
                                // 01 -> negated sign injection
                                // 10 -> XOR-ed sign injection
    input   in_fmt;   // Determine the inputted number
                        // is double-precision or single-precision

    output  [63:0] out_data;

    wire [63:0] wire_1, wire_2, wire_3, wire_4, sp_fp_sgnj, dp_fp_sgnj;

    assign dp_fp_sgnj = (in_ctrl_jnx == 2'd0) ? ({in_numB[63], in_numA[62:0]}) : wire_1;
    assign wire_1 = (in_ctrl_jnx == 2'd1) ? ({!in_numB[63], in_numA[62:0]}) : wire_2;
    assign wire_2 = (in_ctrl_jnx == 2'd1) ? ({(in_numA[63] ^ in_numB[63]), in_numA[62:0]}) : in_numA;

    assign sp_fp_sgnj = (in_ctrl_jnx == 2'd0) ? ({{32{1'b1}}, in_numB[31], in_numA[30:0]}) : wire_3;
    assign wire_3 = (in_ctrl_jnx == 2'd1) ? ({{32{1'b1}}, !in_numB[31], in_numA[30:0]}) : wire_4;
    assign wire_4 = (in_ctrl_jnx == 2'd1) ? ({{32{1'b1}}, (in_numA[31] ^ in_numB[31]), in_numA[30:0]}) : in_numA;

    assign out_data = (!in_fmt) ? sp_fp_sgnj : dp_fp_sgnj;
endmodule