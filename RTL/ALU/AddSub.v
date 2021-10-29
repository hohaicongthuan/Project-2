// Integer adder/subtractor module
module AddSub(in_numA, in_numB, in_ctrl_AddSub, out_data);
    parameter DATA_WIDTH = 64;

    input   in_ctrl_AddSub;
    input   [DATA_WIDTH - 1:0] in_numA, in_numB;

    output  [DATA_WIDTH - 1:0] out_data;

    assign out_data = (!in_ctrl_AddSub) ? (in_numA + in_numB) : (in_numA - in_numB);
endmodule