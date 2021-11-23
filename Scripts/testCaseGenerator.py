# This Python script generate test cases for floating-point adder/subtractor,
# multiplier, divider modules

import struct
import random

# Function that converts a hex string (in 32-bit floating-point format) to a float number
# def Hex_To_Float(x):
#     return struct.unpack('!f', bytes.fromhex(x))[0]

# Function that converts a hex string (in 64-bit floating-point format) to a float number
# def Hex_To_Double(x):
#     return struct.unpack('!d', bytes.fromhex(x))[0]

# Function that converts a 32-bit floating-point number to a hex string
def Float_To_Hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])

# Function that converts a 64-bit floating-point number to a hex string
# def Double_To_Hex(f):
#     return hex(struct.unpack('<Q', struct.pack('<d', f))[0])

if __name__ == "__main__":
    expected_sum = open("fp_sum.expected", "w")
    expected_diff = open("fp_diff.expected", "w")
    expected_product = open("fp_product.expected", "w")
    expected_quotient = open("fp_quotient.expected", "w")

    f1 = open("TestCaseA.in", "w")
    f2 = open("TestCaseB.in", "w")
    
    for i in range(1000000):
        num1 = random.uniform(-1000000.00, 1000000.00)
        num2 = random.uniform(-1000000.00, 1000000.00)

        sum = num1 + num2
        diff = num1 - num2
        product = num1 * num2
        quotient = num1 / num2

        ################################
        # 32-BIT FLOATING-POINT FORMAT #
        ################################
        temp1 = Float_To_Hex(num1).replace("0x", "").zfill(8)
        temp2 = Float_To_Hex(num2).replace("0x", "").zfill(8)
        temp3 = Float_To_Hex(product).replace("0x", "").zfill(8)
        temp4 = Float_To_Hex(sum).replace("0x", "").zfill(8)
        temp5 = Float_To_Hex(diff).replace("0x", "").zfill(8)
        temp6 = Float_To_Hex(quotient).replace("0x", "").zfill(8)

        f1.write(temp1 + "\n")
        f2.write(temp2 + "\n")
        expected_sum.write(temp4 + "\n")
        expected_diff.write(temp5 + "\n")
        expected_product.write(temp3 + "\n")
        expected_quotient.write(temp6 + "\n")

        ################################
        # 64-BIT FLOATING-POINT FORMAT #
        ################################
        # temp1 = Double_To_Hex(num1).replace("0x", "").zfill(16)
        # temp2 = Double_To_Hex(num2).replace("0x", "").zfill(16)
        # temp3 = Double_To_Hex(product).replace("0x", "").zfill(16)
        # temp4 = Double_To_Hex(sum).replace("0x", "").zfill(16)
        # temp5 = Double_To_Hex(diff).replace("0x", "").zfill(16)
        # temp6 = Double_To_Hex(quotient).replace("0x", "").zfill(16)

        # f1.write(temp1 + "\n")
        # f2.write(temp2 + "\n")
        # expected_sum.write(temp4 + "\n")
        # expected_diff.write(temp5 + "\n")
        # expected_product.write(temp3 + "\n")
        # expected_quotient.write(temp6 + "\n")

    f1.close()
    f2.close()
    expected_product.close()
    expected_sum.close()
    expected_diff.close()
    expected_quotient.close()
