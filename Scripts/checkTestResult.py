# This Python script compares the produced results and the expected results
# and returns results that don't match.

import struct

# Function that converts a hex string (in 64-bit floating-point format) to a float number
# def Hex_To_Double(x):
#     return struct.unpack('!d', bytes.fromhex(x))[0]

# Function that converts a hex string (in 32-bit floating-point format) to a float number
def Hex_To_Float(x):
    return struct.unpack('!f', bytes.fromhex(x))[0]

if __name__ == "__main__":
    
    # SET ERROR HERE
    ERROR = 0.001
    
    f_A = open("TestCaseA.in", "r")
    f_B = open("TestCaseB.in", "r")
    f_sum_expected = open("fp_sum.expected", "r")
    f_diff_expected = open("fp_diff.expected", "r")
    f_product_expected = open("fp_product.expected", "r")
    f_quotient_expected = open("fp_quotient.expected", "r")
    f_add_result = open("Add_Result.out", "r")
    f_sub_result = open("Sub_Result.out", "r")
    f_mul_result = open("Mul_Result.out", "r")
    f_div_result = open("Div_Result.out", "r")

    numA = f_A.readlines()
    numB = f_B.readlines()
    sum_Expected = f_sum_expected.readlines()
    diff_Expected = f_diff_expected.readlines()
    product_Expected = f_product_expected.readlines()
    quotient_Expected = f_quotient_expected.readlines()
    add_Result = f_add_result.readlines()
    sub_Result = f_sub_result.readlines()
    mul_Result = f_mul_result.readlines()
    div_Result = f_div_result.readlines()

    ##########################
    # CHECK ADDITION RESULTS #
    ##########################
    matched = 0
    total = 0
    for i in range(len(sum_Expected)):
        temp1 = Hex_To_Float(sum_Expected[i])
        temp2 = Hex_To_Float(add_Result[i])
        
        if (abs(temp1 - temp2) <= ERROR):
            matched += 1
        else:
            print("ERROR: ", Hex_To_Float(numA[i]), " + ", Hex_To_Float(numB[i]), " = ", temp2, "\tEXPECTED: ", temp1, sep="")
        total += 1
    print("\nRESULT: ", matched, "/", total, " results matched!", "\n", sep="")

    #############################
    # CHECK SUBTRACTION RESULTS #
    #############################
    matched = 0
    total = 0
    for i in range(len(diff_Expected)):
        temp1 = Hex_To_Float(diff_Expected[i])
        temp2 = Hex_To_Float(sub_Result[i])

        if (abs(temp1 - temp2) < ERROR):
            matched += 1
        else:
            print("ERROR: ", Hex_To_Float(numA[i]), " - ", Hex_To_Float(numB[i]), " = ", temp2, "\tEXPECTED: ", temp1, sep="")
        total += 1
    print("\nRESULT: ", matched, "/", total, " results matched!", "\n", sep="")

    ################################
    # CHECK MULTIPLICATION RESULTS #
    ################################
    matched = 0
    total = 0
    for i in range(len(product_Expected)):
        temp1 = Hex_To_Float(product_Expected[i])
        temp2 = Hex_To_Float(mul_Result[i])
        
        if (abs(temp1 - temp2) < ERROR):
            matched += 1
        else:
            print("ERROR: ", Hex_To_Float(numA[i]), " * ", Hex_To_Float(numB[i]), " = ", temp2, "\tEXPECTED: ", temp1, sep="")
        total += 1
    print("\nRESULT: ", matched, "/", total, " results matched!", "\n", sep="")

    ##########################
    # CHECK DIVISION RESULTS #
    ##########################
    matched = 0
    total = 0
    for i in range(len(quotient_Expected)):
        temp1 = Hex_To_Float(quotient_Expected[i])
        temp2 = Hex_To_Float(div_Result[i])
        
        if (abs(temp1 - temp2) < ERROR):
            matched += 1
        else:
            print("ERROR: ", Hex_To_Float(numA[i]), " / ", Hex_To_Float(numB[i]), " = ", temp2, "\tEXPECTED: ", temp1, sep="")
        total += 1
    print("\nRESULT: ", matched, "/", total, " results matched!", "\n", sep="")