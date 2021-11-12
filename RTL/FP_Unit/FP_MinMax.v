// This module returns the min/max number of two inputted numbers

module FP_MinMax(in_numA, in_numB, out_data, in_ctrl_minmax, in_fmt);
    parameter DATA_WIDTH = 64;

    input   in_ctrl_minmax, in_fmt;
    input   [DATA_WIDTH - 1:0] in_numA, in_numB;

    output reg  [DATA_WIDTH - 1:0] out_data;

    always @ (*) begin
        if (in_fmt) begin // The inputted number is 64-bit floating-point
            if (in_ctrl_minmax) begin
                // Find maximum
                if (in_numA[63] != in_numB[63]) begin// Two numbers have different signs
                    out_data = (!in_numA[62:52]) ? in_numA : in_numB;
                end else begin // Two numbers have the same signs -> compare exponents
                    if (in_numA[62:52] != in_numB[62:52]) begin // Two numbers have different exponents
                        out_data = (in_numA[62:52] > in_numB[62:52]) ? in_numA : in_numB;
                    end else begin // Two numbers have the same exponents -> compare mantissae
                        out_data = (in_numA[51:0] > in_numB[51:0]) ? in_numA : in_numB;
                    end
                end
            end else begin
                // Find minimum
                if (in_numA[63] != in_numB[63]) begin// Two numbers have different signs
                    out_data = (in_numA[62:52]) ? in_numA : in_numB;
                end else begin // Two numbers have the same signs -> compare exponents
                    if (in_numA[62:52] != in_numB[62:52]) begin // Two numbers have different exponents
                        out_data = (in_numA[62:52] < in_numB[62:52]) ? in_numA : in_numB;
                    end else begin // Two numbers have the same exponents -> compare mantissae
                        out_data = (in_numA[51:0] < in_numB[51:0]) ? in_numA : in_numB;
                    end
                end
            end
        end else begin // The inputted number is 32-bit floating-point
            if (in_ctrl_minmax) begin
                // Find maximum
                if (in_numA[31] != in_numB[31]) begin// Two numbers have different signs
                    out_data = (!in_numA[30:23]) ? in_numA : in_numB;
                end else begin // Two numbers have the same signs -> compare exponents
                    if (in_numA[30:23] != in_numB[30:23]) begin // Two numbers have different exponents
                        out_data = (in_numA[30:23] > in_numB[30:23]) ? in_numA : in_numB;
                    end else begin // Two numbers have the same exponents -> compare mantissae
                        out_data = (in_numA[22:0] > in_numB[22:0]) ? in_numA : in_numB;
                    end
                end
            end else begin
                // Find minimum
                if (in_numA[31] != in_numB[31]) begin// Two numbers have different signs
                    out_data = (in_numA[30:23]) ? in_numA : in_numB;
                end else begin // Two numbers have the same signs -> compare exponents
                    if (in_numA[30:23] != in_numB[30:23]) begin // Two numbers have different exponents
                        out_data = (in_numA[30:23] < in_numB[30:23]) ? in_numA : in_numB;
                    end else begin // Two numbers have the same exponents -> compare mantissae
                        out_data = (in_numA[22:0] < in_numB[22:0]) ? in_numA : in_numB;
                    end
                end
            end
        end
    end
endmodule