// Mantissa Adjuster
module MantAdj(in_signA, in_signB, in_biggerExp, in_shiftAmount, in_mantA, in_mantB, out_mantA, out_mantB);
    parameter DATA_WIDTH = 52;
    parameter SHAMT_WIDTH = 11;

    input   in_signA, in_signB, in_biggerExp;
    input   [SHAMT_WIDTH - 1:0] in_shiftAmount;
    input   [DATA_WIDTH - 1:0] in_mantA, in_mantB;
    output  [DATA_WIDTH + 2:0] out_mantA, out_mantB;

    wire    [DATA_WIDTH:0] trueMantA, trueMantB, adjusted_A, adjusted_B;
    wire    [DATA_WIDTH + 2:0] extended_A, extended_B;

    // Add hidden bit to the mantissae
    assign trueMantA = {1'b1, in_mantA};
    assign trueMantB = {1'b1, in_mantB};

    // Adjust the mantissae
    assign adjusted_A = trueMantA >> in_shiftAmount;
    assign adjusted_B = trueMantB >> in_shiftAmount;

    // Extend the mantissae to 55 bits
    assign extended_A = (in_biggerExp) ? ({2'b0, adjusted_A}) : ({2'b0, adjusted_B});
    assign extended_B = (!in_biggerExp) ? ({2'b0, trueMantA}) : ({2'b0, trueMantB});

    // Output
    assign out_mantA = (in_signA) ? ~extended_A : extended_A;
    assign out_mantB = (in_signB) ? ~extended_B : extended_B;

endmodule