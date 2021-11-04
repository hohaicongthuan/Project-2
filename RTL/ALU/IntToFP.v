// This module converts:
//      32-bit (signed/unsigned) integer to 32-bit FP
//      32-bit (signed/unsigned) integer to 64-bit FP
//      64-bit (signed/unsigned) integer to 32-bit FP
//      64-bit (signed/unsigned) integer to 64-bit FP
module IntToFP(in_data, in_fmt, in_signed_unsigned, in_output_fmt, out_data);
    parameter DATA_WIDTH = 64;
    
    input   in_signed_unsigned, // Determine the inputted number is signed or unsigned
            in_fmt,             // Determine the inputted number is 32 or 64-bit integer
            in_output_fmt;      // Determine the output is 32 or 64-bit FP
    input   [DATA_WIDTH - 1:0] in_data;

    output  [DATA_WIDTH - 1:0] out_data;

    // Internal wires
    wire    sign;
    wire    [DATA_WIDTH - 1:0] in_num_abs;
    wire    [51:0]  mant_result, mant, mant_wire_1, mant_wire_2, mant_wire_3, mant_wire_4, mant_wire_5, mant_wire_6, mant_wire_7, mant_wire_8, mant_wire_9, mant_wire_10, mant_wire_11, mant_wire_12, mant_wire_13, mant_wire_14, mant_wire_15, mant_wire_16, mant_wire_17, mant_wire_18, mant_wire_19, mant_wire_20, mant_wire_21, mant_wire_22, mant_wire_23, mant_wire_24, mant_wire_25, mant_wire_26, mant_wire_27, mant_wire_28, mant_wire_29, mant_wire_30, mant_wire_31, mant_wire_32, mant_wire_33, mant_wire_34, mant_wire_35, mant_wire_36, mant_wire_37, mant_wire_38, mant_wire_39, mant_wire_40, mant_wire_41, mant_wire_42, mant_wire_43, mant_wire_44, mant_wire_45, mant_wire_46, mant_wire_47, mant_wire_48, mant_wire_49, mant_wire_50, mant_wire_51, mant_wire_52, mant_wire_53, mant_wire_54, mant_wire_55, mant_wire_56, mant_wire_57, mant_wire_58, mant_wire_59, mant_wire_60, mant_wire_61;
    wire    [10:0]  exp_result, exp, exp_wire_1, exp_wire_2, exp_wire_3, exp_wire_4, exp_wire_5, exp_wire_6, exp_wire_7, exp_wire_8, exp_wire_9, exp_wire_10, exp_wire_11, exp_wire_12, exp_wire_13, exp_wire_14, exp_wire_15, exp_wire_16, exp_wire_17, exp_wire_18, exp_wire_19, exp_wire_20, exp_wire_21, exp_wire_22, exp_wire_23, exp_wire_24, exp_wire_25, exp_wire_26, exp_wire_27, exp_wire_28, exp_wire_29, exp_wire_30, exp_wire_31, exp_wire_32, exp_wire_33, exp_wire_34, exp_wire_35, exp_wire_36, exp_wire_37, exp_wire_38, exp_wire_39, exp_wire_40, exp_wire_41, exp_wire_42, exp_wire_43, exp_wire_44, exp_wire_45, exp_wire_46, exp_wire_47, exp_wire_48, exp_wire_49, exp_wire_50, exp_wire_51, exp_wire_52, exp_wire_53, exp_wire_54, exp_wire_55, exp_wire_56, exp_wire_57, exp_wire_58, exp_wire_59, exp_wire_60, exp_wire_61, exp_wire_62;

    assign in_num_abs = (in_data[63] & !in_signed_unsigned) ? (~in_data + 64'd1) : in_data;

    assign sign = in_data[63] & !in_signed_unsigned;

    assign mant = (in_num_abs[63]) ? in_num_abs[62:11] : mant_wire_1;
    assign mant_wire_1 = (in_num_abs[62]) ? in_num_abs[61:10] : mant_wire_2;
    assign mant_wire_2 = (in_num_abs[61]) ? in_num_abs[60:9] : mant_wire_3;
    assign mant_wire_3 = (in_num_abs[60]) ? in_num_abs[59:8] : mant_wire_4;
    assign mant_wire_4 = (in_num_abs[59]) ? in_num_abs[58:7] : mant_wire_5;
    assign mant_wire_5 = (in_num_abs[58]) ? in_num_abs[57:6] : mant_wire_6;
    assign mant_wire_6 = (in_num_abs[57]) ? in_num_abs[56:5] : mant_wire_7;
    assign mant_wire_7 = (in_num_abs[56]) ? in_num_abs[55:4] : mant_wire_8;
    assign mant_wire_8 = (in_num_abs[55]) ? in_num_abs[54:3] : mant_wire_9;
    assign mant_wire_9 = (in_num_abs[54]) ? in_num_abs[53:2] : mant_wire_10;
    assign mant_wire_10 = (in_num_abs[53]) ? in_num_abs[52:1] : mant_wire_11;
    assign mant_wire_11 = (in_num_abs[52]) ? in_num_abs[51:0] : mant_wire_12;
    assign mant_wire_12 = (in_num_abs[51]) ? {in_num_abs[50:0], {1{1'b0}}} : mant_wire_13;
    assign mant_wire_13 = (in_num_abs[50]) ? {in_num_abs[49:0], {2{1'b0}}} : mant_wire_14;
    assign mant_wire_14 = (in_num_abs[49]) ? {in_num_abs[48:0], {3{1'b0}}} : mant_wire_15;
    assign mant_wire_15 = (in_num_abs[48]) ? {in_num_abs[47:0], {4{1'b0}}} : mant_wire_16;
    assign mant_wire_16 = (in_num_abs[47]) ? {in_num_abs[46:0], {5{1'b0}}} : mant_wire_17;
    assign mant_wire_17 = (in_num_abs[46]) ? {in_num_abs[45:0], {6{1'b0}}} : mant_wire_18;
    assign mant_wire_18 = (in_num_abs[45]) ? {in_num_abs[44:0], {7{1'b0}}} : mant_wire_19;
    assign mant_wire_19 = (in_num_abs[44]) ? {in_num_abs[43:0], {8{1'b0}}} : mant_wire_20;
    assign mant_wire_20 = (in_num_abs[43]) ? {in_num_abs[42:0], {9{1'b0}}} : mant_wire_21;
    assign mant_wire_21 = (in_num_abs[42]) ? {in_num_abs[41:0], {10{1'b0}}} : mant_wire_22;
    assign mant_wire_22 = (in_num_abs[41]) ? {in_num_abs[40:0], {11{1'b0}}} : mant_wire_23;
    assign mant_wire_23 = (in_num_abs[40]) ? {in_num_abs[39:0], {12{1'b0}}} : mant_wire_24;
    assign mant_wire_24 = (in_num_abs[39]) ? {in_num_abs[38:0], {13{1'b0}}} : mant_wire_25;
    assign mant_wire_25 = (in_num_abs[38]) ? {in_num_abs[37:0], {14{1'b0}}} : mant_wire_26;
    assign mant_wire_26 = (in_num_abs[37]) ? {in_num_abs[36:0], {15{1'b0}}} : mant_wire_27;
    assign mant_wire_27 = (in_num_abs[36]) ? {in_num_abs[35:0], {16{1'b0}}} : mant_wire_28;
    assign mant_wire_28 = (in_num_abs[35]) ? {in_num_abs[34:0], {17{1'b0}}} : mant_wire_29;
    assign mant_wire_29 = (in_num_abs[34]) ? {in_num_abs[33:0], {18{1'b0}}} : mant_wire_30;
    assign mant_wire_30 = (in_num_abs[33]) ? {in_num_abs[32:0], {19{1'b0}}} : mant_wire_31;
    assign mant_wire_31 = (in_num_abs[32]) ? {in_num_abs[31:0], {20{1'b0}}} : mant_wire_32;
    assign mant_wire_32 = (in_num_abs[31]) ? {in_num_abs[30:0], {21{1'b0}}} : mant_wire_33;
    assign mant_wire_33 = (in_num_abs[30]) ? {in_num_abs[29:0], {22{1'b0}}} : mant_wire_34;
    assign mant_wire_34 = (in_num_abs[29]) ? {in_num_abs[28:0], {23{1'b0}}} : mant_wire_35;
    assign mant_wire_35 = (in_num_abs[28]) ? {in_num_abs[27:0], {24{1'b0}}} : mant_wire_36;
    assign mant_wire_36 = (in_num_abs[27]) ? {in_num_abs[26:0], {25{1'b0}}} : mant_wire_37;
    assign mant_wire_37 = (in_num_abs[26]) ? {in_num_abs[25:0], {26{1'b0}}} : mant_wire_38;
    assign mant_wire_38 = (in_num_abs[25]) ? {in_num_abs[24:0], {27{1'b0}}} : mant_wire_39;
    assign mant_wire_39 = (in_num_abs[24]) ? {in_num_abs[23:0], {28{1'b0}}} : mant_wire_40;
    assign mant_wire_40 = (in_num_abs[23]) ? {in_num_abs[22:0], {29{1'b0}}} : mant_wire_41;
    assign mant_wire_41 = (in_num_abs[22]) ? {in_num_abs[21:0], {30{1'b0}}} : mant_wire_42;
    assign mant_wire_42 = (in_num_abs[21]) ? {in_num_abs[20:0], {31{1'b0}}} : mant_wire_43;
    assign mant_wire_43 = (in_num_abs[20]) ? {in_num_abs[19:0], {32{1'b0}}} : mant_wire_44;
    assign mant_wire_44 = (in_num_abs[19]) ? {in_num_abs[18:0], {33{1'b0}}} : mant_wire_45;
    assign mant_wire_45 = (in_num_abs[18]) ? {in_num_abs[17:0], {34{1'b0}}} : mant_wire_46;
    assign mant_wire_46 = (in_num_abs[17]) ? {in_num_abs[16:0], {35{1'b0}}} : mant_wire_47;
    assign mant_wire_47 = (in_num_abs[16]) ? {in_num_abs[15:0], {36{1'b0}}} : mant_wire_48;
    assign mant_wire_48 = (in_num_abs[15]) ? {in_num_abs[14:0], {37{1'b0}}} : mant_wire_49;
    assign mant_wire_49 = (in_num_abs[14]) ? {in_num_abs[13:0], {38{1'b0}}} : mant_wire_50;
    assign mant_wire_50 = (in_num_abs[13]) ? {in_num_abs[12:0], {39{1'b0}}} : mant_wire_51;
    assign mant_wire_51 = (in_num_abs[12]) ? {in_num_abs[11:0], {40{1'b0}}} : mant_wire_52;
    assign mant_wire_52 = (in_num_abs[11]) ? {in_num_abs[10:0], {41{1'b0}}} : mant_wire_53;
    assign mant_wire_53 = (in_num_abs[10]) ? {in_num_abs[9:0], {42{1'b0}}} : mant_wire_54;
    assign mant_wire_54 = (in_num_abs[9]) ? {in_num_abs[8:0], {43{1'b0}}} : mant_wire_55;
    assign mant_wire_55 = (in_num_abs[8]) ? {in_num_abs[7:0], {44{1'b0}}} : mant_wire_56;
    assign mant_wire_56 = (in_num_abs[7]) ? {in_num_abs[6:0], {45{1'b0}}} : mant_wire_57;
    assign mant_wire_57 = (in_num_abs[6]) ? {in_num_abs[5:0], {46{1'b0}}} : mant_wire_58;
    assign mant_wire_58 = (in_num_abs[5]) ? {in_num_abs[4:0], {47{1'b0}}} : mant_wire_59;
    assign mant_wire_59 = (in_num_abs[4]) ? {in_num_abs[3:0], {48{1'b0}}} : mant_wire_60;
    assign mant_wire_60 = (in_num_abs[3]) ? {in_num_abs[2:0], {49{1'b0}}} : mant_wire_61;
    assign mant_wire_61 = (in_num_abs[2]) ? {in_num_abs[1:0], {50{1'b0}}} : {52{1'b0}};

    assign exp = (in_num_abs[63]) ? 11'd63 : exp_wire_1;
    assign exp_wire_1 = (in_num_abs[62]) ? 11'd62 : exp_wire_2;
    assign exp_wire_2 = (in_num_abs[61]) ? 11'd61 : exp_wire_3;
    assign exp_wire_3 = (in_num_abs[60]) ? 11'd60 : exp_wire_4;
    assign exp_wire_4 = (in_num_abs[59]) ? 11'd59 : exp_wire_5;
    assign exp_wire_5 = (in_num_abs[58]) ? 11'd58 : exp_wire_6;
    assign exp_wire_6 = (in_num_abs[57]) ? 11'd57 : exp_wire_7;
    assign exp_wire_7 = (in_num_abs[56]) ? 11'd56 : exp_wire_8;
    assign exp_wire_8 = (in_num_abs[55]) ? 11'd55 : exp_wire_9;
    assign exp_wire_9 = (in_num_abs[54]) ? 11'd54 : exp_wire_10;
    assign exp_wire_10 = (in_num_abs[53]) ? 11'd53 : exp_wire_11;
    assign exp_wire_11 = (in_num_abs[52]) ? 11'd52 : exp_wire_12;
    assign exp_wire_12 = (in_num_abs[51]) ? 11'd51 : exp_wire_13;
    assign exp_wire_13 = (in_num_abs[50]) ? 11'd50 : exp_wire_14;
    assign exp_wire_14 = (in_num_abs[49]) ? 11'd49 : exp_wire_15;
    assign exp_wire_15 = (in_num_abs[48]) ? 11'd48 : exp_wire_16;
    assign exp_wire_16 = (in_num_abs[47]) ? 11'd47 : exp_wire_17;
    assign exp_wire_17 = (in_num_abs[46]) ? 11'd46 : exp_wire_18;
    assign exp_wire_18 = (in_num_abs[45]) ? 11'd45 : exp_wire_19;
    assign exp_wire_19 = (in_num_abs[44]) ? 11'd44 : exp_wire_20;
    assign exp_wire_20 = (in_num_abs[43]) ? 11'd43 : exp_wire_21;
    assign exp_wire_21 = (in_num_abs[42]) ? 11'd42 : exp_wire_22;
    assign exp_wire_22 = (in_num_abs[41]) ? 11'd41 : exp_wire_23;
    assign exp_wire_23 = (in_num_abs[40]) ? 11'd40 : exp_wire_24;
    assign exp_wire_24 = (in_num_abs[39]) ? 11'd39 : exp_wire_25;
    assign exp_wire_25 = (in_num_abs[38]) ? 11'd38 : exp_wire_26;
    assign exp_wire_26 = (in_num_abs[37]) ? 11'd37 : exp_wire_27;
    assign exp_wire_27 = (in_num_abs[36]) ? 11'd36 : exp_wire_28;
    assign exp_wire_28 = (in_num_abs[35]) ? 11'd35 : exp_wire_29;
    assign exp_wire_29 = (in_num_abs[34]) ? 11'd34 : exp_wire_30;
    assign exp_wire_30 = (in_num_abs[33]) ? 11'd33 : exp_wire_31;
    assign exp_wire_31 = (in_num_abs[32]) ? 11'd32 : exp_wire_32;
    assign exp_wire_32 = (in_num_abs[31]) ? 11'd31 : exp_wire_33;
    assign exp_wire_33 = (in_num_abs[30]) ? 11'd30 : exp_wire_34;
    assign exp_wire_34 = (in_num_abs[29]) ? 11'd29 : exp_wire_35;
    assign exp_wire_35 = (in_num_abs[28]) ? 11'd28 : exp_wire_36;
    assign exp_wire_36 = (in_num_abs[27]) ? 11'd27 : exp_wire_37;
    assign exp_wire_37 = (in_num_abs[26]) ? 11'd26 : exp_wire_38;
    assign exp_wire_38 = (in_num_abs[25]) ? 11'd25 : exp_wire_39;
    assign exp_wire_39 = (in_num_abs[24]) ? 11'd24 : exp_wire_40;
    assign exp_wire_40 = (in_num_abs[23]) ? 11'd23 : exp_wire_41;
    assign exp_wire_41 = (in_num_abs[22]) ? 11'd22 : exp_wire_42;
    assign exp_wire_42 = (in_num_abs[21]) ? 11'd21 : exp_wire_43;
    assign exp_wire_43 = (in_num_abs[20]) ? 11'd20 : exp_wire_44;
    assign exp_wire_44 = (in_num_abs[19]) ? 11'd19 : exp_wire_45;
    assign exp_wire_45 = (in_num_abs[18]) ? 11'd18 : exp_wire_46;
    assign exp_wire_46 = (in_num_abs[17]) ? 11'd17 : exp_wire_47;
    assign exp_wire_47 = (in_num_abs[16]) ? 11'd16 : exp_wire_48;
    assign exp_wire_48 = (in_num_abs[15]) ? 11'd15 : exp_wire_49;
    assign exp_wire_49 = (in_num_abs[14]) ? 11'd14 : exp_wire_50;
    assign exp_wire_50 = (in_num_abs[13]) ? 11'd13 : exp_wire_51;
    assign exp_wire_51 = (in_num_abs[12]) ? 11'd12 : exp_wire_52;
    assign exp_wire_52 = (in_num_abs[11]) ? 11'd11 : exp_wire_53;
    assign exp_wire_53 = (in_num_abs[10]) ? 11'd10 : exp_wire_54;
    assign exp_wire_54 = (in_num_abs[9]) ? 11'd9 : exp_wire_55;
    assign exp_wire_55 = (in_num_abs[8]) ? 11'd8 : exp_wire_56;
    assign exp_wire_56 = (in_num_abs[7]) ? 11'd7 : exp_wire_57;
    assign exp_wire_57 = (in_num_abs[6]) ? 11'd6 : exp_wire_58;
    assign exp_wire_58 = (in_num_abs[5]) ? 11'd5 : exp_wire_59;
    assign exp_wire_59 = (in_num_abs[4]) ? 11'd4 : exp_wire_60;
    assign exp_wire_60 = (in_num_abs[3]) ? 11'd3 : exp_wire_61;
    assign exp_wire_61 = (in_num_abs[2]) ? 11'd2 : exp_wire_62;
    assign exp_wire_62 = (in_num_abs[1]) ? 11'd1 : 11'd0;

    assign exp_result = (in_fmt) ? exp : exp_wire_32;
    assign mant_result = (in_fmt) ? mant : mant_wire_32;

    // assign sp_fp_mant_result = mant_result[51:29];
    // assign sp_fp_exp_result = exp_result[7:0] + 8'd127;

    assign out_data = (in_output_fmt) ? {sign, (exp_result + 11'd1023), mant_result} : {{32{1'b1}}, sign, (exp_result[7:0] + 8'd127), mant_result[51:29]};

endmodule