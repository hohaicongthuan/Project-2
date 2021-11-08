# Project-2
This repo contains codes from my Project 2 class. My task is implementing RISC-V base 64 integer with F and D extensions, acronym is RV64IFD, ISA on FPGA.

## 1. Directory Info

- `Diagrams`: contains diagrams in DRAWIO format, which can be opened in [Draw.io](https://app.diagrams.net), and PNG format.
- `RTL`: contains the Verilog source code of the project.
- `Testbench`: contains files for Testbench.

## 2. Modules' Status

Module | Description | Status
-|-|-
AddSub | Integer adder/subtractor | TESTED
And_Or_Xor | Integer logical AND/OR/XOR | TESTED
Cmp | Integer comparator | TESTED
IntToFP | Integer to floating-point Converter | TESTED
Shift| Integer logical/arithmetic left/right Shifter | TESTED
FP_AddSub | Floating-point adder/subtractor | UNTESTED
FP_Cmp | Floating-point comparator | UNTESTED
FP_Div | Floating-point divisor | UNTESTED
FP_Mul | Floating-point multiplier | UNTESTED
FP_Convert | Floating-point converter (32-bit FP to 64-bit FP and vice versa) | UNTESTED
FP_Int_Convert | Floating-point to Integer Converter | UNTESTED
FP_MinMax | Floating-point Min/Max | UNTESTED
FP_SGNJ | Floating-point sign injector | UNTESTED

## 3. Supported Instructions

### 3.1. Base Integer Instructions

No. | Mnemonic | Type | Description
:-:|-|:-:|-
1 | ADDI | I | Add Immediate. Add sign-extended 12-bit immediate to register `rs1`. The result is saved to `rd` register.
2 | SLTI | I | Set Less Than Immediate. Write `1` to register `rd` if the value in register `rs1` is less than the specified immediate value. Otherwise, write `0`.
3 | ANDI | I | AND Immediate. Bitwise AND an immediate with the value in register `rs1`. The result is saved to register `rd`.
4 | ORI | I | OR Immediate.  Bitwise OR an immediate with the value in register `rs1`. The result is saved to register `rd`.
5 | XORI | I | XOR Immediate.  Bitwise OR an immediate with the value in register `rs1`. The result is saved to register `rd`.
6 | SLTIU | I | Set Less Than Immediate Unsigned.
7 | SLLI | I | Shift Left Logical Immediate.
8 | SRLI | I | Shift Right Logical Immediate.
9 | SRAI | I | Shift Right Arithmetic Immediate.
10 | LUI | U | Load Upper Immediate.
11 | AUIPC | U | Add Upper Immediate to PC.
12 | ADD | R | Add. Add two numbers in register `rs1` and `rs2`. The result is saved in register `rd`.
13 | SLT | R | Set Less Than.  Write `1` to register `rd` if the value in register `rs1` is less than the one in `rs2`. Otherwise, write `0`.
14 | SLTU | R | Set Less Then Unsigned.  Write `1` to register `rd` if the value in register `rs1` is less than (using unsigned comparison) the one in `rs2`. Otherwise, write `0`
15 | AND | R | AND. Bitwise AND two numbers in register `rs1` and `rs2`. The result is saved in register `rd`.
16 | OR | R | OR. Bitwise OR two numbers in register `rs1` and `rs2`. The result is saved in register `rd`.
17 | XOR | R | XOR. Bitwise XOR two numbers in register `rs1` and `rs2`. The result is saved in register `rd`.
18 | SLL | R | Shift Left Logical. Left shift the value in register `rs1`, shift amount is defined by the lower 6-bit of the value in register `rs2`. The result is save to register `rd`.
19 | SRL | R | Shift Right Logical. Right shift the value in register `rs1`, shift amount is defined by the lower 6-bit of the value in register `rs2`. The result is save to register `rd`.
20 | SUB | R | Subtract.  Subtract two numbers in register `rs1` and `rs2`. The result is saved in register `rd`.
21 | SRA | R | Shift Right Arithmetic. Right shift the value in register `rs1` arithmetically, shift amount is defined by the lower 6-bit of the value in register `rs2`. The result is save to register `rd`.

### 3.2. Jump & Branch Instructions

No. | Mnemonic | Type | Description
:-:|-|:-:|-
22 | JAL | J | Jump And Link. Jump to the specified address. The address following the `JAL` instruction will be saved to register `rd`.
23 | JALR | I | Jump And Link Register. Jump to the specified address in register `rs1`. The address following the `JALR` instruction will be saved to register `rd`.
24 | BEQ | B | Branch if Equal. Compare two numbers in register `rs1` and `rs2`, jumps to the specified address if the two are equal.
25 | BNE | B | Branch if Not Equal. Compare two numbers in register `rs1` and `rs2`, jumps to the specified address if the two are not equal.
26 | BLT | B | Branch if Less Than. Compare two numbers in register `rs1` and `rs2`, jumps to the specified address if the former is less than the latter.
27 | BLTU | B | Branch if Less Than Unsigned. Compare two numbers in register `rs1` and `rs2`, jumps to the specified address if the former is less than the latter (using unsigned comparison).
28 | BGE | B | Branch if Greater Than. Compare two numbers in register `rs1` and `rs2`, jumps to the specified address if the former is greater than the latter.
29 | BGEU | B | Branch if Greater Than Unsigned. Compare two numbers in register `rs1` and `rs2`, jumps to the specified address if the former is greater than the latter (using unsigned comparison).

### 3.3. Instructions on 32-bit Integer

No. | Mnemonic | Type | Description
:-:|-|:-:|-
30 | ADDIW | I | Add Immediate Word
31 | SLLIW | I | Shift Left Logical Immediate Word
32 | SRLIW | I | Shift Right Logical Immediate Word
33 | SRAIW | I | Shift Right Arithmetic Immediate Word
34 | ADDW | I | Add Word
35 | SLLW | I | Shift Left Logical Word
36 | SRLW | I | Shift Right Logical Word
37 | SUBW | I | Subtract Word
38 | SRAW | I | Shift Right Arithmetic Word

### 3.4. Load & Store Instructions

No. | Mnemonic | Type | Description
:-:|-|:-:|-
39 | LB | I | Load a Byte (8 bits)
40 | LH | I | Load Half a byte (4 bits)
41 | LW | I | Load a Word (32 bits)
42 | LD | I | Load Double words (64 bits)
43 | LBU | I | Load a Byte Unsigned
44 | LHU | I | Load Half a byte Unsigned
45 | LWU | I | Load a Word Unsigned
46 | SB | S | Store a Byte
47 | SH | S | Store Half a byte
48 | SW | S | Store a Word
49 | SD | S | Store Double words

### 3.5. Floating-point Instructions

No. | Mnemonic | Type | Description
:-:|-|:-:|-
50 | FLW | I | Load a 32-bit floating-point number from memory to register `rd`.
51 | FLD | I | Load a 64-bit floating-point number from memory to register `rd`.
52 | FSW | S | Store a 32-bit floating-point number
53 | FSD | S | Store a 64-bit floating-point number
54 | FADD.S | R | Add two 32-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
55 | FSUB.S | R | Subtract two 32-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
56 | FMUL.S | R | Multiply two 32-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
57 | FDIV.S | R | Divide two 32-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
58 | ~~FSQRT.S~~ | R | Calculate the square root of the 32-bit floating-point value in register `rs1`. The result is saved in register `rd`.
59 | FMIN.S | R | Compare two 32-bit floating-point numbers from register `rs1` and `rs2`. Return the smaller one to register `rd`.
60 | FMAX.S | R | Compare two 32-bit floating-point numbers from register `rs1` and `rs2`. Return the bigger one to register `rd`.
61 | FADD.D | R | Add two 64-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
62 | FSUB.D | R | Subtract two 64-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
63 | FMUL.D | R | Multiply two 64-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
64 | FDIV.D | R | Divide two 64-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
65 | ~~FSQRT.D~~ | R | Calculate the square root of the 64-bit floating-point value in register `rs1`. The result is saved in register `rd`.
66 | FMIN.D | R | Compare two 64-bit floating-point numbers from register `rs1` and `rs2`. Return the smaller one to register `rd`.
67 | FMAX.D | R | Compare two 64-bit floating-point numbers from register `rs1` and `rs2`. Return the bigger one to register `rd`.
68 | FCVT.S.D | R | Convert 64-bit floating-point number from floating-point register `rs1` to 32-bit one which will be saved to floating-point register `rd`
69 | FCVT.D.S | R | Convert 32-bit floating-point number from floating-point register `rs1` to 64-bit one which will be saved to floating-point register `rd`
70 | FCVT.W.S | R | Convert a 32-bit floating-point number in floating-point register `rs1` to a signed 32-bit integer in integer register `rd`.
71 | FCVT.S.W | R | Convert a 32-bit integer number in integer register `rs1` to a 32-bit floating-point in floating-point register `rd`.
72 | FCVT.W.D | R | Convert a 64-bit floating-point number in floating-point register `rs1` to a signed 32-bit integer in integer register `rd`.
73 | FCVT.D.W | R | Convert a 32-bit integer number in integer register `rs1` to a 64-bit floating-point in floating-point register `rd`.
74 | FCVT.L.D | R | Convert a 64-bit floating-point number in floating-point register `rs1` to a signed 64-bit integer in integer register `rd`.
75 | FCVT.D.L | R | Convert a 64-bit integer number in integer register `rs1` to a 64-bit floating-point in floating-point register `rd`.
76 | FCVT.L.S | R | Convert a 32-bit floating-point number in floating-point register `rs1` to a signed 64-bit integer in integer register `rd`.
77 | FCVT.S.L | R | Convert a 64-bit integer number in integer register `rs1` to a 32-bit floating-point in floating-point register `rd`.
78 | FSGNJ.S | R | SiGN inJection. Copy sign bit of the 32-bit floating-point number in register `r2` and place it in the sign bit of the 32-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
79 | FSGNJN.S | R | SiGN inJection Negated. Copy and invert sign bit of the 32-bit floating-point number in register `r2` and place it in the sign bit of the 32-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
80 | FSGNJX.S | R | SiGN inJection Xor-ed. XOR two sign bits of the 32-bit floating-point number in register `r2` and `r1` and place it in the sign bit of the 32-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
81 | FSGNJ.D | R | SiGN inJection. Copy sign bit of the 64-bit floating-point number in register `r2` and place it in the sign bit of the 64-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
82 | FSGNJN.D | R | SiGN inJection Negated. Copy and invert sign bit of the 64-bit floating-point number in register `r2` and place it in the sign bit of the 64-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
83 | FSGNJX.D | R | SiGN inJection Xor-ed. XOR two sign bits of the 64-bit floating-point number in register `r2` and `r1` and place it in the sign bit of the 64-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
84 | FEQ.S | R | Compare two 32-bit floating-point numbers in floating-point register `rs1` and `rs2`. If they're equal, write `1` to the integer register `rd`. Otherwise, write `0`.
85 | FLT.S | R | Compare two 32-bit floating-point numbers in floating-point register `rs1` and `rs2`. If the former is less than the latter, write `1` to the integer register `rd`. Otherwise, write `0`.
86 | FLE.S | R | Compare two 32-bit floating-point numbers in floating-point register `rs1` and `rs2`. If the former is less than or equal to the latter, write `1` to the integer register `rd`. Otherwise, write `0`.
87 | FEQ.D | R | Compare two 64-bit floating-point numbers in floating-point register `rs1` and `rs2`. If they're equal, write `1` to the integer register `rd`. Otherwise, write `0`.
88 | FLT.D | R | Compare two 64-bit floating-point numbers in floating-point register `rs1` and `rs2`. If the former is less than the latter, write `1` to the integer register `rd`. Otherwise, write `0`.
89 | FLE.D | R | Compare two 64-bit floating-point numbers in floating-point register `rs1` and `rs2`. If the former is less than or equal to the latter, write `1` to the integer register `rd`. Otherwise, write `0`.
90 | FMV.X.W | R | Move 32-bit floating-point from floating-point register `rs1` to lower 32-bit in integer register `rd`.
91 | FMV.W.X | R | Move 32-bit floating-point from integer register `rs1` to floating-point register `rd`.
92 | FMV.X.D | R | Move 64-bit floating-point from floating-point register `rs1` to integer register `rd`.
93 | FMV.D.X | R | Move 64-bit floating-point from integer register `rs1` to floating-point register `rd`.
