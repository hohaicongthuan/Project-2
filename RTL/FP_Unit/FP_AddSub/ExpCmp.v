// Exponent Comparator
// Compare two given exponents and output the bigger one, the difference,
// and the signal indicating which one is bigger

module ExpCmp(in_expA, in_expB, out_result, out_biggerExp, out_diff);
    parameter DATA_WIDTH = 11;

    input   [DATA_WIDTH - 1:0] in_expA, in_expB;
    output  out_result; // 0 means A is bigger, 1 means B is bigger
    output  [DATA_WIDTH - 1:0] out_biggerExp, out_diff;

    // Internal wires
    wire    [DATA_WIDTH - 1:0] diff;

    // Compare two exponents
    assign out_result = ((in_expA + 11'd1023) > (in_expB + 11'd1023)) ? 1'b0 : 1'b1;

    // Return bigger exponent
    assign out_biggerExp = (out_result) ? in_expB : in_expA;

    // Return exponent difference
    assign diff = in_expA - in_expB;
    assign out_diff = (diff[DATA_WIDTH - 1]) ? (~diff + 11'd1) : (diff);
endmodule