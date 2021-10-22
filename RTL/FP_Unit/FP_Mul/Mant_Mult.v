module Mant_Mult(in_multiplicand, in_multiplier, out_product);
    input [105:0] in_multiplicand;
    input [52:0] in_multiplier;

    output reg [105:0] out_product;

    reg [105:0] product_0, product_1, product_2, product_3, product_4, product_5, product_6, product_7, product_8, product_9, product_10, product_11, product_12, product_13, product_14, product_15, product_16, product_17, product_18, product_19, product_20, product_21, product_22, product_23, product_24, product_25, product_26, product_27, product_28, product_29, product_30, product_31, product_32, product_33, product_34, product_35, product_36, product_37, product_38, product_39, product_40, product_41, product_42, product_43, product_44, product_45, product_46, product_47, product_48, product_49, product_50, product_51, product_52;

    always @ (*) begin
        product_0 = (in_multiplier[0]) ? in_multiplicand : 0;
        product_1 = (in_multiplier[1]) ? (in_multiplicand << 1) : 0;
        product_2 = (in_multiplier[2]) ? (in_multiplicand << 2) : 0;
        product_3 = (in_multiplier[3]) ? (in_multiplicand << 3) : 0;
        product_4 = (in_multiplier[4]) ? (in_multiplicand << 4) : 0;
        product_5 = (in_multiplier[5]) ? (in_multiplicand << 5) : 0;
        product_6 = (in_multiplier[6]) ? (in_multiplicand << 6) : 0;
        product_7 = (in_multiplier[7]) ? (in_multiplicand << 7) : 0;
        product_8 = (in_multiplier[8]) ? (in_multiplicand << 8) : 0;
        product_9 = (in_multiplier[9]) ? (in_multiplicand << 9) : 0;
        product_10 = (in_multiplier[10]) ? (in_multiplicand << 10) : 0;
        product_11 = (in_multiplier[11]) ? (in_multiplicand << 11) : 0;
        product_12 = (in_multiplier[12]) ? (in_multiplicand << 12) : 0;
        product_13 = (in_multiplier[13]) ? (in_multiplicand << 13) : 0;
        product_14 = (in_multiplier[14]) ? (in_multiplicand << 14) : 0;
        product_15 = (in_multiplier[15]) ? (in_multiplicand << 15) : 0;
        product_16 = (in_multiplier[16]) ? (in_multiplicand << 16) : 0;
        product_17 = (in_multiplier[17]) ? (in_multiplicand << 17) : 0;
        product_18 = (in_multiplier[18]) ? (in_multiplicand << 18) : 0;
        product_19 = (in_multiplier[19]) ? (in_multiplicand << 19) : 0;
        product_20 = (in_multiplier[20]) ? (in_multiplicand << 20) : 0;
        product_21 = (in_multiplier[21]) ? (in_multiplicand << 21) : 0;
        product_22 = (in_multiplier[22]) ? (in_multiplicand << 22) : 0;
        product_23 = (in_multiplier[23]) ? (in_multiplicand << 23) : 0;
        product_24 = (in_multiplier[24]) ? (in_multiplicand << 24) : 0;
        product_25 = (in_multiplier[25]) ? (in_multiplicand << 25) : 0;
        product_26 = (in_multiplier[26]) ? (in_multiplicand << 26) : 0;
        product_27 = (in_multiplier[27]) ? (in_multiplicand << 27) : 0;
        product_28 = (in_multiplier[28]) ? (in_multiplicand << 28) : 0;
        product_29 = (in_multiplier[29]) ? (in_multiplicand << 29) : 0;
        product_30 = (in_multiplier[30]) ? (in_multiplicand << 30) : 0;
        product_31 = (in_multiplier[31]) ? (in_multiplicand << 31) : 0;
        product_32 = (in_multiplier[32]) ? (in_multiplicand << 32) : 0;
        product_33 = (in_multiplier[33]) ? (in_multiplicand << 33) : 0;
        product_34 = (in_multiplier[34]) ? (in_multiplicand << 34) : 0;
        product_35 = (in_multiplier[35]) ? (in_multiplicand << 35) : 0;
        product_36 = (in_multiplier[36]) ? (in_multiplicand << 36) : 0;
        product_37 = (in_multiplier[37]) ? (in_multiplicand << 37) : 0;
        product_38 = (in_multiplier[38]) ? (in_multiplicand << 38) : 0;
        product_39 = (in_multiplier[39]) ? (in_multiplicand << 39) : 0;
        product_40 = (in_multiplier[40]) ? (in_multiplicand << 40) : 0;
        product_41 = (in_multiplier[41]) ? (in_multiplicand << 41) : 0;
        product_42 = (in_multiplier[42]) ? (in_multiplicand << 42) : 0;
        product_43 = (in_multiplier[43]) ? (in_multiplicand << 43) : 0;
        product_44 = (in_multiplier[44]) ? (in_multiplicand << 44) : 0;
        product_45 = (in_multiplier[45]) ? (in_multiplicand << 45) : 0;
        product_46 = (in_multiplier[46]) ? (in_multiplicand << 46) : 0;
        product_47 = (in_multiplier[47]) ? (in_multiplicand << 47) : 0;
        product_48 = (in_multiplier[48]) ? (in_multiplicand << 48) : 0;
        product_49 = (in_multiplier[49]) ? (in_multiplicand << 49) : 0;
        product_50 = (in_multiplier[50]) ? (in_multiplicand << 50) : 0;
        product_51 = (in_multiplier[51]) ? (in_multiplicand << 51) : 0;
        product_52 = (in_multiplier[52]) ? (in_multiplicand << 52) : 0;

        out_product = product_0 + product_1 + product_2 + product_3 + product_4 + product_5 + product_6 + product_7 + product_8 + product_9 + product_10 + product_11 + product_12 + product_13 + product_14 + product_15 + product_16 + product_17 + product_18 + product_19 + product_20 + product_21 + product_22 + product_23 + product_24 + product_25 + product_26 + product_27 + product_28 + product_29 + product_30 + product_31 + product_32 + product_33 + product_34 + product_35 + product_36 + product_37 + product_38 + product_39 + product_40 + product_41 + product_42 + product_43 + product_44 + product_45 + product_46 + product_47 + product_48 + product_49 + product_50 + product_51 + product_52;
    end
endmodule