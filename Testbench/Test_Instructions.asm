# These instructions are used to test different instructions in RV64IF

main:
    addi sp, x0, 0

    jal ra, addi_inst
    addi sp, sp, 4
    jal ra, slti_inst
    addi sp, sp, 4
    jal ra, andi_inst
    addi sp, sp, 4
    jal ra, ori_inst
    addi sp, sp, 4
    jal ra, xori_inst
    addi sp, sp, 4
    jal ra, sltui_inst
    addi sp, sp, 4
    jal ra, slli_inst
    addi sp, sp, 4
    jal ra, srli_inst
    addi sp, sp, 4
    jal ra, srai_inst
    addi sp, sp, 4
    jal ra, lui_inst
    addi sp, sp, 4
    jal ra, auipc_inst
    addi sp, sp, 4
    jal ra, add_inst
    addi sp, sp, 4
    jal ra, slt_inst
    addi sp, sp, 4
    jal ra, sltu_inst
    addi sp, sp, 4
    jal ra, and_inst
    addi sp, sp, 4
    jal ra, or_inst
    addi sp, sp, 4
    jal ra, xor_inst
    addi sp, sp, 4
    jal ra, sll_inst
    addi sp, sp, 4
    jal ra, srl_inst
    addi sp, sp, 4
    jal ra, sub_inst
    addi sp, sp, 4
    jal ra, sra_inst

    jal x0, HALT        # Halts the programme
    
addi_inst:
    addi t1, x0, 12345
    addi t2, x0, 12345
    beq t1, t2, addi_inst_true
    jal x0, addi_inst_false
addi_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, addi_inst_ret
addi_inst_false:
    sd x0, 0(sp)
addi_inst_ret:
    jal x0, ra

slti_inst:
    addi t1, x0, 120
    slti t0, t1, 123
    sd t0, 0(sp)
    addi sp, sp, 4
    addi t1, x0, 255
    slti t0, t1, 123
    sd t0, 0(sp)
    jal x0, ra

andi_inst:
    addi t1, x0, 12345
    andi t2, t1, 67890
    addi t3, x0, 48
    beq t2, t3, andi_inst_true
    jal x0, andi_inst_false
andi_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, andi_inst_ret
andi_inst_false:
    sd x0, 0(sp)
andi_inst_ret:
    jal x0, ra

ori_inst:
    jal x0, ra

xori_inst:
    jal x0, ra

sltiu_inst:
    jal x0, ra

slli_inst:
    jal x0, ra

srli_inst:
    jal x0, ra

srai_inst:
    jal x0, ra

lui_inst:
    jal x0, ra

auipc_inst:
    jal x0, ra

add_inst:
    jal x0, ra

slt_inst:
    jal x0, ra

sltu_inst:
    jal x0, ra

and_inst:
    jal x0, ra

or_inst:
    jal x0, ra

xor_inst:
    jal x0, ra

sll_inst:
    jal x0, ra

srl_inst:
    jal x0, ra

sub_inst:
    jal x0, ra

sra_inst:
    jal x0, ra

# Floating-point instructions
fadd_s_inst:
    jal x0, ra

fsub_s_inst:
    jal x0, ra

fmul_s_inst:
    jal x0, ra

fdiv_s_inst:
    jal x0, ra

fmin_s_inst:
    jal x0, ra

fmax_s_inst:
    jal x0, ra

fcvt_w_s_inst:
    jal x0, ra

fcvt_s_w_inst:
    jal x0, ra

fcvt_l_s_inst:
    jal x0, ra

fcvt_s_l_inst:
    jal x0, ra

fsgnj_s_inst:
    jal x0, ra

fsgnjn_s_inst:
    jal x0, ra

fsgnjx_s_inst:
    jal x0, ra

feq_s:
    jal x0, ra

flt_s:
    jal x0, ra

fle_s:
    jal x0, ra

fmv_x_w:
    jal x0, ra

fmv_w_x:
    jal x0, ra

HALT: