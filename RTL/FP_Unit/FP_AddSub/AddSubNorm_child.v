// This module is instantiated in "AddSubNorm" module
module AddSubNorm_child(in_Exp, in_Mant, out_Exp, out_Mant);
    parameter EXP_WIDTH = 11;
    parameter MANT_WIDTH = 52;

    input   [EXP_WIDTH:0] in_Exp;
    input   [MANT_WIDTH + 2:0] in_Mant;

    output reg  [EXP_WIDTH:0] out_Exp;
    output reg  [MANT_WIDTH + 2:0] out_Mant;

    always @ (*) begin
        if (in_Mant[51]) begin out_Exp = in_Exp - 12'd1; out_Mant = in_Mant << 1; end
        else if (in_Mant[50]) begin out_Exp = in_Exp - 12'd2; out_Mant = in_Mant << 2; end
        else if (in_Mant[50]) begin out_Exp = in_Exp - 12'd3; out_Mant = in_Mant << 3; end
        else if (in_Mant[49]) begin out_Exp = in_Exp - 12'd4; out_Mant = in_Mant << 4; end
        else if (in_Mant[48]) begin out_Exp = in_Exp - 12'd5; out_Mant = in_Mant << 5; end
        else if (in_Mant[47]) begin out_Exp = in_Exp - 12'd6; out_Mant = in_Mant << 6; end
        else if (in_Mant[46]) begin out_Exp = in_Exp - 12'd7; out_Mant = in_Mant << 7; end
        else if (in_Mant[45]) begin out_Exp = in_Exp - 12'd8; out_Mant = in_Mant << 8; end
        else if (in_Mant[44]) begin out_Exp = in_Exp - 12'd9; out_Mant = in_Mant << 9; end
        else if (in_Mant[43]) begin out_Exp = in_Exp - 12'd10; out_Mant = in_Mant << 10; end
        else if (in_Mant[42]) begin out_Exp = in_Exp - 12'd11; out_Mant = in_Mant << 11; end
        else if (in_Mant[41]) begin out_Exp = in_Exp - 12'd12; out_Mant = in_Mant << 12; end
        else if (in_Mant[40]) begin out_Exp = in_Exp - 12'd13; out_Mant = in_Mant << 13; end
        else if (in_Mant[39]) begin out_Exp = in_Exp - 12'd14; out_Mant = in_Mant << 14; end
        else if (in_Mant[38]) begin out_Exp = in_Exp - 12'd15; out_Mant = in_Mant << 15; end
        else if (in_Mant[37]) begin out_Exp = in_Exp - 12'd16; out_Mant = in_Mant << 16; end
        else if (in_Mant[36]) begin out_Exp = in_Exp - 12'd17; out_Mant = in_Mant << 17; end
        else if (in_Mant[35]) begin out_Exp = in_Exp - 12'd18; out_Mant = in_Mant << 18; end
        else if (in_Mant[34]) begin out_Exp = in_Exp - 12'd19; out_Mant = in_Mant << 19; end
        else if (in_Mant[33]) begin out_Exp = in_Exp - 12'd20; out_Mant = in_Mant << 20; end
        else if (in_Mant[32]) begin out_Exp = in_Exp - 12'd21; out_Mant = in_Mant << 21; end
        else if (in_Mant[31]) begin out_Exp = in_Exp - 12'd22; out_Mant = in_Mant << 22; end
        else if (in_Mant[30]) begin out_Exp = in_Exp - 12'd23; out_Mant = in_Mant << 23; end
        else if (in_Mant[29]) begin out_Exp = in_Exp - 12'd24; out_Mant = in_Mant << 24; end
        else if (in_Mant[28]) begin out_Exp = in_Exp - 12'd25; out_Mant = in_Mant << 25; end
        else if (in_Mant[27]) begin out_Exp = in_Exp - 12'd26; out_Mant = in_Mant << 26; end
        else if (in_Mant[26]) begin out_Exp = in_Exp - 12'd27; out_Mant = in_Mant << 27; end
        else if (in_Mant[25]) begin out_Exp = in_Exp - 12'd28; out_Mant = in_Mant << 28; end
        else if (in_Mant[24]) begin out_Exp = in_Exp - 12'd29; out_Mant = in_Mant << 29; end
        else if (in_Mant[23]) begin out_Exp = in_Exp - 12'd30; out_Mant = in_Mant << 30; end
        else if (in_Mant[22]) begin out_Exp = in_Exp - 12'd31; out_Mant = in_Mant << 31; end
        else if (in_Mant[21]) begin out_Exp = in_Exp - 12'd32; out_Mant = in_Mant << 32; end
        else if (in_Mant[20]) begin out_Exp = in_Exp - 12'd33; out_Mant = in_Mant << 33; end
        else if (in_Mant[19]) begin out_Exp = in_Exp - 12'd34; out_Mant = in_Mant << 34; end
        else if (in_Mant[18]) begin out_Exp = in_Exp - 12'd35; out_Mant = in_Mant << 35; end
        else if (in_Mant[17]) begin out_Exp = in_Exp - 12'd36; out_Mant = in_Mant << 36; end
        else if (in_Mant[16]) begin out_Exp = in_Exp - 12'd37; out_Mant = in_Mant << 37; end
        else if (in_Mant[15]) begin out_Exp = in_Exp - 12'd38; out_Mant = in_Mant << 38; end
        else if (in_Mant[14]) begin out_Exp = in_Exp - 12'd39; out_Mant = in_Mant << 39; end
        else if (in_Mant[13]) begin out_Exp = in_Exp - 12'd40; out_Mant = in_Mant << 40; end
        else if (in_Mant[12]) begin out_Exp = in_Exp - 12'd41; out_Mant = in_Mant << 41; end
        else if (in_Mant[11]) begin out_Exp = in_Exp - 12'd42; out_Mant = in_Mant << 42; end
        else if (in_Mant[10]) begin out_Exp = in_Exp - 12'd43; out_Mant = in_Mant << 43; end
        else if (in_Mant[9]) begin out_Exp = in_Exp - 12'd44; out_Mant = in_Mant << 44; end
        else if (in_Mant[8]) begin out_Exp = in_Exp - 12'd45; out_Mant = in_Mant << 45; end
        else if (in_Mant[7]) begin out_Exp = in_Exp - 12'd46; out_Mant = in_Mant << 46; end
        else if (in_Mant[6]) begin out_Exp = in_Exp - 12'd47; out_Mant = in_Mant << 47; end
        else if (in_Mant[5]) begin out_Exp = in_Exp - 12'd48; out_Mant = in_Mant << 48; end
        else if (in_Mant[4]) begin out_Exp = in_Exp - 12'd49; out_Mant = in_Mant << 49; end
        else if (in_Mant[3]) begin out_Exp = in_Exp - 12'd50; out_Mant = in_Mant << 50; end
        else if (in_Mant[2]) begin out_Exp = in_Exp - 12'd51; out_Mant = in_Mant << 51; end
        else if (in_Mant[1]) begin out_Exp = in_Exp - 12'd52; out_Mant = in_Mant << 52; end
        else begin out_Exp = in_Exp - 12'd53; out_Mant = in_Mant << 53; end
    end

endmodule