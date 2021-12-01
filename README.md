# Project-2
This repo contains codes from my Project 2 class. My task is implementing RISC-V ISA (Instruction Set Architecture) base 64 integer with F extension, acronym RV64IF, on FPGA.

## 1. Directory Info

- `Diagrams`: contains diagrams in DRAWIO format, which can be opened in [Draw.io](https://app.diagrams.net), and PNG format.
- `RTL`: contains the Verilog source code of the project.
- `Scripts`: some utility scripts for creating test cases for some modules and checking the test results.
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
FP_Cmp | Floating-point comparator | TESTED
FP_Div | Floating-point divisor | UNTESTED
FP_Mul | Floating-point multiplier | TESTED
FP_Int_Convert | Floating-point to Integer Converter | TESTED
FP_MinMax | Floating-point Min/Max | TESTED
FP_SGNJ | Floating-point sign injector | TESTED

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
51 | FSW | S | Store a 32-bit floating-point number
52 | FADD.S | R | Add two 32-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
53 | FSUB.S | R | Subtract two 32-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
54 | FMUL.S | R | Multiply two 32-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
55 | FDIV.S | R | Divide two 32-bit floating-point numbers from register `rs1` and `rs2`. The result is saved back to register `rd`.
56 | FMIN.S | R | Compare two 32-bit floating-point numbers from register `rs1` and `rs2`. Return the smaller one to register `rd`.
57 | FMAX.S | R | Compare two 32-bit floating-point numbers from register `rs1` and `rs2`. Return the bigger one to register `rd`.
58 | FCVT.W.S | R | Convert a 32-bit floating-point number in floating-point register `rs1` to a signed 32-bit integer in integer register `rd`.
59 | FCVT.S.W | R | Convert a 32-bit integer number in integer register `rs1` to a 32-bit floating-point in floating-point register `rd`.
60 | FCVT.L.S | R | Convert a 32-bit floating-point number in floating-point register `rs1` to a signed 64-bit integer in integer register `rd`.
61 | FCVT.S.L | R | Convert a 64-bit integer number in integer register `rs1` to a 32-bit floating-point in floating-point register `rd`.
62 | FSGNJ.S | R | SiGN inJection. Copy sign bit of the 32-bit floating-point number in register `r2` and place it in the sign bit of the 32-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
63 | FSGNJN.S | R | SiGN inJection Negated. Copy and invert sign bit of the 32-bit floating-point number in register `r2` and place it in the sign bit of the 32-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
64 | FSGNJX.S | R | SiGN inJection Xor-ed. XOR two sign bits of the 32-bit floating-point number in register `r2` and `r1` and place it in the sign bit of the 32-bit floating-point number in register `r1`. The result is saved in floating-point register `rd`.
65 | FEQ.S | R | Compare two 32-bit floating-point numbers in floating-point register `rs1` and `rs2`. If they're equal, write `1` to the integer register `rd`. Otherwise, write `0`.
66 | FLT.S | R | Compare two 32-bit floating-point numbers in floating-point register `rs1` and `rs2`. If the former is less than the latter, write `1` to the integer register `rd`. Otherwise, write `0`.
67 | FLE.S | R | Compare two 32-bit floating-point numbers in floating-point register `rs1` and `rs2`. If the former is less than or equal to the latter, write `1` to the integer register `rd`. Otherwise, write `0`.
68 | FMV.X.W | R | Move 32-bit floating-point from floating-point register `rs1` to lower 32-bit in integer register `rd`.
69 | FMV.W.X | R | Move 32-bit floating-point from integer register `rs1` to floating-point register `rd`.

## 4. Test Instructions

There is a file at `Testbench/Instructions.txt` that contains the instructions to test with the RV64IF. It was originally written in C and compiled by *RISC-V rv64gc gcc* compiler version 10.2.0 using [Compiler Explorer](https://godbolt.org/).

The C source code:
```C
long Add(long a, long b) {
    return a + b;
}

long Sub(long a, long b) {
    return a - b;
}

float FP_Add(float a, float b) {
    return a + b;
}

float FP_Sub(float a, float b) {
    return a - b;
}

float FP_Mul(float a, float b) {
    return a * b;
}

float FP_Div(float a, float b) {
    return a / b;
}

int main() {
    // Integer operations
    long int_a = 4132;
    long int_b = 2312;

    long int_add = Add(int_a, int_b);
    long int_sub = Sub(int_a, int_b);

    // Floating-point operations
    float fp_a = 12.3456;
    float fp_b = 1.23456;

    float fp_add = FP_Add(fp_a, fp_b);
    float fp_sub = FP_Sub(fp_a, fp_b);
    float fp_mul = FP_Mul(fp_a, fp_b);
    float fp_div = FP_Div(fp_a, fp_b);
    
    return 0;
}
```

The output assembly code:
```asm
load_gp:
    auipc   gp, 0x2
    addi    gp, gp, 930 # 12800 <__global_pointer$>
    ret
Add(long, long):
    addi    sp, sp, -32
    sd      s0, 24(sp)
    addi    s0, sp, 32
    sd      a0, -24(s0)
    sd      a1, -32(s0)
    ld      a4, -24(s0)
    ld      a5, -32(s0)
    add     a5, a4, a5
    mv      a0, a5
    ld      s0, 24(sp)
    addi    sp, sp, 32
    ret
Sub(long, long):
    addi    sp, sp, -32
    sd      s0, 24(sp)
    addi    s0, sp, 32
    sd      a0, -24(s0)
    sd      a1, -32(s0)
    ld      a4, -24(s0)
    ld      a5, -32(s0)
    sub     a5, a4, a5
    mv      a0, a5
    ld      s0, 24(sp)
    addi    sp, sp, 32
    ret
FP_Add(float, float):
    addi    sp, sp, -32
    sd      s0, 24(sp)
    addi    s0, sp, 32
    fsw     fa0, -20(s0)
    fsw     fa1, -24(s0)
    flw     fa4, -20(s0)
    flw     fa5, -24(s0)
    fadd.s  fa5, fa4, fa5
    fmv.s   fa0, fa5
    ld      s0, 24(sp)
    addi    sp, sp, 32
    ret
FP_Sub(float, float):
    addi    sp, sp, -32
    sd      s0, 24(sp)
    addi    s0, sp, 32
    fsw     fa0, -20(s0)
    fsw     fa1, -24(s0)
    flw     fa4, -20(s0)
    flw     fa5, -24(s0)
    fsub.s  fa5, fa4, fa5
    fmv.s   fa0, fa5
    ld      s0, 24(sp)
    addi    sp, sp, 32
    ret
FP_Mul(float, float):
    addi    sp, sp, -32
    sd      s0, 24(sp)
    addi    s0, sp, 32
    fsw     fa0, -20(s0)
    fsw     fa1, -24(s0)
    flw     fa4, -20(s0)
    flw     fa5, -24(s0)
    fmul.s  fa5, fa4, fa5
    fmv.s   fa0, fa5
    ld      s0, 24(sp)
    addi    sp, sp, 32
    ret
FP_Div(float, float):
    addi    sp, sp, -32
    sd      s0, 24(sp)
    addi    s0, sp, 32
    fsw     fa0, -20(s0)
    fsw     fa1, -24(s0)
    flw     fa4, -20(s0)
    flw     fa5, -24(s0)
    fdiv.s  fa5, fa4, fa5
    fmv.s   fa0, fa5
    ld      s0, 24(sp)
    addi    sp, sp, 32
    ret
main:
    addi    sp, sp, -80
    sd      ra, 72(sp)
    sd      s0, 64(sp)
    addi    s0, sp, 80
    lui     a5, 0x1
    addi    a5, a5, 36 # 1024 <__abi_tag-0xf238>
    sd      a5, -24(s0)
    lui     a5, 0x1
    addi    a5, a5, -1784 # 908 <__abi_tag-0xf954>
    sd      a5, -32(s0)
    ld      a1, -32(s0)
    ld      a0, -24(s0)
    jal     ra, 104d0 <Add(long, long)>
    sd      a0, -40(s0)
    ld      a1, -32(s0)
    ld      a0, -24(s0)
    jal     ra, 10500 <Sub(long, long)>
    sd      a0, -48(s0)
    lui     a5, 0x10
    flw     fa5, 1796(a5) # 10704 <__libc_csu_fini+0x4>
    fsw     fa5, -52(s0)
    lui     a5, 0x10
    flw     fa5, 1800(a5) # 10708 <__libc_csu_fini+0x8>
    fsw     fa5, -56(s0)
    flw     fa1, -56(s0)
    flw     fa0, -52(s0)
    jal     ra, 10530 <FP_Add(float, float)>
    fsw     fa0, -60(s0)
    flw     fa1, -56(s0)
    flw     fa0, -52(s0)
    jal     ra, 10560 <FP_Sub(float, float)>
    fsw     fa0, -64(s0)
    flw     fa1, -56(s0)
    flw     fa0, -52(s0)
    jal     ra, 10590 <FP_Mul(float, float)>
    fsw     fa0, -68(s0)
    flw     fa1, -56(s0)
    flw     fa0, -52(s0)
    jal     ra, 105c0 <FP_Div(float, float)>
    fsw     fa0, -72(s0)
    li      a5, 0
    mv      a0, a5
    ld      ra, 72(sp)
    ld      s0, 64(sp)
    addi    sp, sp, 80
    ret
```

The compiler options are: `-march=rv64ifd -mabi=lp64d`. Without these compiler options, the result binary instructions are wrong which I have no idea why.

<!-- In the compiled binary, the address of the entry point (the `main()` function) is `0x105f0`. -->