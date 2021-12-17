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
FP_AddSub | Floating-point adder/subtractor | TESTED
FP_Cmp | Floating-point comparator | TESTED
FP_Div | Floating-point divisor | TESTED
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

There is a file at `Testbench/Instructions.txt` that contains the instructions to test with the RV64IF. It was originally written in C and compiled using [GNU toolchain for RISC-V](https://github.com/riscv-collab/riscv-gnu-toolchain).

The C source code:
```C
long Add(long a, long b) { return a + b; }

long Sub(long a, long b) { return a - b; }

float FP_Add(float a, float b) { return a + b; }

float FP_Sub(float a, float b) { return a - b; }

float FP_Mul(float a, float b) { return a * b; }

float FP_Div(float a, float b) { return a / b; }

int main() {
    // Integer operations
    long int_a = 4132; long int_b = 2312;

    long int_add = Add(int_a, int_b);
    long int_sub = Sub(int_a, int_b);

    // Floating-point operations
    float fp_a = 12.3456; float fp_b = 1.23456;

    float fp_add = FP_Add(fp_a, fp_b);
    float fp_sub = FP_Sub(fp_a, fp_b);
    float fp_mul = FP_Mul(fp_a, fp_b);
    float fp_div = FP_Div(fp_a, fp_b);
    
    return 0;
}
```

The code dump using the `objdump` tool provided by the [GNU toolchain for RISC-V](https://github.com/riscv-collab/riscv-gnu-toolchain) is shown below. The column on the leftmost represents the address (in hexadecimal) of the instruction, the next column represents the hexadecimal form of the instruction and the rightmost column represents the corresponding assembly code.
```asm
0000000000010450 <Add>:
   10450:	fe010113          	addi	sp,sp,-32
   10454:	00813c23          	sd	s0,24(sp)
   10458:	02010413          	addi	s0,sp,32
   1045c:	fea43423          	sd	a0,-24(s0)
   10460:	feb43023          	sd	a1,-32(s0)
   10464:	fe843703          	ld	a4,-24(s0)
   10468:	fe043783          	ld	a5,-32(s0)
   1046c:	00f707b3          	add	a5,a4,a5
   10470:	00078513          	mv	a0,a5
   10474:	01813403          	ld	s0,24(sp)
   10478:	02010113          	addi	sp,sp,32
   1047c:	00008067          	ret

0000000000010480 <Sub>:
   10480:	fe010113          	addi	sp,sp,-32
   10484:	00813c23          	sd	s0,24(sp)
   10488:	02010413          	addi	s0,sp,32
   1048c:	fea43423          	sd	a0,-24(s0)
   10490:	feb43023          	sd	a1,-32(s0)
   10494:	fe843703          	ld	a4,-24(s0)
   10498:	fe043783          	ld	a5,-32(s0)
   1049c:	40f707b3          	sub	a5,a4,a5
   104a0:	00078513          	mv	a0,a5
   104a4:	01813403          	ld	s0,24(sp)
   104a8:	02010113          	addi	sp,sp,32
   104ac:	00008067          	ret

00000000000104b0 <FP_Add>:
   104b0:	fe010113          	addi	sp,sp,-32
   104b4:	00813c23          	sd	s0,24(sp)
   104b8:	02010413          	addi	s0,sp,32
   104bc:	fea42627          	fsw	fa0,-20(s0)
   104c0:	feb42427          	fsw	fa1,-24(s0)
   104c4:	fec42707          	flw	fa4,-20(s0)
   104c8:	fe842787          	flw	fa5,-24(s0)
   104cc:	00f777d3          	fadd.s	fa5,fa4,fa5
   104d0:	20f78553          	fmv.s	fa0,fa5
   104d4:	01813403          	ld	s0,24(sp)
   104d8:	02010113          	addi	sp,sp,32
   104dc:	00008067          	ret

00000000000104e0 <FP_Sub>:
   104e0:	fe010113          	addi	sp,sp,-32
   104e4:	00813c23          	sd	s0,24(sp)
   104e8:	02010413          	addi	s0,sp,32
   104ec:	fea42627          	fsw	fa0,-20(s0)
   104f0:	feb42427          	fsw	fa1,-24(s0)
   104f4:	fec42707          	flw	fa4,-20(s0)
   104f8:	fe842787          	flw	fa5,-24(s0)
   104fc:	08f777d3          	fsub.s	fa5,fa4,fa5
   10500:	20f78553          	fmv.s	fa0,fa5
   10504:	01813403          	ld	s0,24(sp)
   10508:	02010113          	addi	sp,sp,32
   1050c:	00008067          	ret

0000000000010510 <FP_Mul>:
   10510:	fe010113          	addi	sp,sp,-32
   10514:	00813c23          	sd	s0,24(sp)
   10518:	02010413          	addi	s0,sp,32
   1051c:	fea42627          	fsw	fa0,-20(s0)
   10520:	feb42427          	fsw	fa1,-24(s0)
   10524:	fec42707          	flw	fa4,-20(s0)
   10528:	fe842787          	flw	fa5,-24(s0)
   1052c:	10f777d3          	fmul.s	fa5,fa4,fa5
   10530:	20f78553          	fmv.s	fa0,fa5
   10534:	01813403          	ld	s0,24(sp)
   10538:	02010113          	addi	sp,sp,32
   1053c:	00008067          	ret

0000000000010540 <FP_Div>:
   10540:	fe010113          	addi	sp,sp,-32
   10544:	00813c23          	sd	s0,24(sp)
   10548:	02010413          	addi	s0,sp,32
   1054c:	fea42627          	fsw	fa0,-20(s0)
   10550:	feb42427          	fsw	fa1,-24(s0)
   10554:	fec42707          	flw	fa4,-20(s0)
   10558:	fe842787          	flw	fa5,-24(s0)
   1055c:	18f777d3          	fdiv.s	fa5,fa4,fa5
   10560:	20f78553          	fmv.s	fa0,fa5
   10564:	01813403          	ld	s0,24(sp)
   10568:	02010113          	addi	sp,sp,32
   1056c:	00008067          	ret

0000000000010570 <main>:
   10570:	fb010113          	addi	sp,sp,-80
   10574:	04113423          	sd	ra,72(sp)
   10578:	04813023          	sd	s0,64(sp)
   1057c:	05010413          	addi	s0,sp,80
   10580:	000017b7          	lui	a5,0x1
   10584:	02478793          	addi	a5,a5,36 # 1024 <__abi_tag-0xf238>
   10588:	fef43423          	sd	a5,-24(s0)
   1058c:	000017b7          	lui	a5,0x1
   10590:	90878793          	addi	a5,a5,-1784 # 908 <__abi_tag-0xf954>
   10594:	fef43023          	sd	a5,-32(s0)
   10598:	fe043583          	ld	a1,-32(s0)
   1059c:	fe843503          	ld	a0,-24(s0)
   105a0:	eb1ff0ef          	jal	ra,10450 <Add>
   105a4:	fca43c23          	sd	a0,-40(s0)
   105a8:	fe043583          	ld	a1,-32(s0)
   105ac:	fe843503          	ld	a0,-24(s0)
   105b0:	ed1ff0ef          	jal	ra,10480 <Sub>
   105b4:	fca43823          	sd	a0,-48(s0)
   105b8:	000107b7          	lui	a5,0x10
   105bc:	6847a787          	flw	fa5,1668(a5) # 10684 <__libc_csu_fini+0x4>
   105c0:	fcf42627          	fsw	fa5,-52(s0)
   105c4:	000107b7          	lui	a5,0x10
   105c8:	6887a787          	flw	fa5,1672(a5) # 10688 <__libc_csu_fini+0x8>
   105cc:	fcf42427          	fsw	fa5,-56(s0)
   105d0:	fc842587          	flw	fa1,-56(s0)
   105d4:	fcc42507          	flw	fa0,-52(s0)
   105d8:	ed9ff0ef          	jal	ra,104b0 <FP_Add>
   105dc:	fca42227          	fsw	fa0,-60(s0)
   105e0:	fc842587          	flw	fa1,-56(s0)
   105e4:	fcc42507          	flw	fa0,-52(s0)
   105e8:	ef9ff0ef          	jal	ra,104e0 <FP_Sub>
   105ec:	fca42027          	fsw	fa0,-64(s0)
   105f0:	fc842587          	flw	fa1,-56(s0)
   105f4:	fcc42507          	flw	fa0,-52(s0)
   105f8:	f19ff0ef          	jal	ra,10510 <FP_Mul>
   105fc:	faa42e27          	fsw	fa0,-68(s0)
   10600:	fc842587          	flw	fa1,-56(s0)
   10604:	fcc42507          	flw	fa0,-52(s0)
   10608:	f39ff0ef          	jal	ra,10540 <FP_Div>
   1060c:	faa42c27          	fsw	fa0,-72(s0)
   10610:	00000793          	li	a5,0
   10614:	00078513          	mv	a0,a5
   10618:	04813083          	ld	ra,72(sp)
   1061c:	04013403          	ld	s0,64(sp)
   10620:	05010113          	addi	sp,sp,80
   10624:	00008067          	ret
```

The compiler options are: `-march=rv64ifd -mabi=lp64d`. Without these compiler options, the result binary instructions are wrong which I have no idea why.

<!-- In the compiled binary, the address of the entry point (the `main()` function) is `0x105f0`. -->