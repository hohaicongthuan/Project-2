// Exponent Comparator
// Compare two given exponents and output the bigger one, the difference,
// and the signal indicating which one is bigger

module ExpCmp(in_expA, in_expB, out_result, out_biggerExp, out_diff);
    parameter DATA_WIDTH = 11;

    input   [DATA_WIDTH - 1:0] in_expA, in_expB;
    output  out_result;
    output  [DATA_WIDTH - 1:0] out_biggerExp, out_diff;

    assign out_result = (in_expB > in_expA) ? 1'b1 : 1'b0;
    assign out_biggerExp = (out_result) ? (in_expB - 1023) : (in_expA - 1023);
    assign out_diff = in_expA - in_expB;
endmodule