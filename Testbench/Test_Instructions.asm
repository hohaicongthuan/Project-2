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
    # jal ra, auipc_inst
    # addi sp, sp, 4
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

#############################
# ADD IMMEDIATE INSTRUCTION #
#############################    
addi_inst:
    addi t1, x0, 123
    addi t2, x0, 123
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

############################################
# SET (IF) LESS THAN IMMEDIATE INSTRUCTION #
############################################
slti_inst:
    addi t1, x0, 120
    slti t0, t1, 123
    sd t0, 0(sp)
    addi sp, sp, 4
    addi t1, x0, 255
    slti t0, t1, 123
    sd t0, 0(sp)
    jal x0, ra

#######################################
# (LOGICAL) AND IMMEDIATE INSTRUCTION #
#######################################
andi_inst:
    addi t1, x0, 123
    andi t2, t1, 456        # 123 AND 456 = 72
    addi t3, x0, 72
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

######################################
# (LOGICAL) OR IMMEDIATE INSTRUCTION #
######################################
ori_inst:
    addi t1, x0, 123
    ori t2, t1, 456        # 123 OR 456 = 507
    addi t3, x0, 507
    beq t2, t3, ori_inst_true
    jal x0, ori_inst_false
ori_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, ori_inst_ret
ori_inst_false:
    sd x0, 0(sp)
ori_inst_ret:
    jal x0, ra

#######################################
# (LOGICAL) XOR IMMEDIATE INSTRUCTION #
#######################################
xori_inst:
    addi t1, x0, 123
    xori t2, t1, 456        # 123 XOR 456 = 435
    addi t3, x0, 435
    beq t2, t3, xori_inst_true
    jal x0, xori_inst_false
xori_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, xori_inst_ret
xori_inst_false:
    sd x0, 0(sp)
xori_inst_ret:
    jal x0, ra

#####################################################
# SET (IF) LESS THAN IMMEDIATE UNSIGNED INSTRUCTION #
#####################################################
sltiu_inst:
    addi t1, x0, 120
    slti t0, t1, 123
    sd t0, 0(sp)
    addi sp, sp, 4
    addi t1, x0, 255
    slti t0, t1, 123
    sd t0, 0(sp)
    jal x0, ra

############################################
# SHIFT LEFT LOGICAL IMMEDIATE INSTRUCTION #
############################################
slli_inst:
    addi t1, x0, 1
    slli t2, t1, 3          # 1 << 3 = 8
    addi t3, x0, 8
    beq t2, t3, slli_inst_true
    jal x0, slli_inst_false
slli_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, slli_inst_ret
slli_inst_false:
    sd x0, 0(sp)
slli_inst_ret:
    jal x0, ra

#############################################
# SHIFT RIGHT LOGICAL IMMEDIATE INSTRUCTION #
#############################################
srli_inst:
    addi t1, x0, 16
    srli t2, t1, 3          # 16 >> 3 = 2
    addi t3, x0, 2
    beq t2, t3, srli_inst_true
    jal x0, srli_inst_false
srli_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, srli_inst_ret
srli_inst_false:
    sd x0, 0(sp)
srli_inst_ret:
    jal x0, ra

################################################
# SHIFT RIGHT ARITHMETIC IMMEDIATE INSTRUCTION #
################################################
srai_inst:
    addi t1, x0, -16
    srai t2, t1, 3          # -16 >> 3 = -2
    addi t3, x0, -2
    beq t2, t3, srai_inst_true
    jal x0, srai_inst_false
srai_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, srai_inst_ret
srai_inst_false:
    sd x0, 0(sp)
srai_inst_ret:
    jal x0, ra

####################################
# LOAD UPPER IMMEDIATE INSTRUCTION #
####################################
lui_inst:
    lui t1, 1               # t1 = 4096
    addi t2, x0, 1
    slli t2, t2, 12         # t2 = 1 << 12 = 4096
    beq t1, t2, lui_inst_true
    jal x0, lui_inst_false
lui_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, lui_inst_ret
lui_inst_false
    sd x0, 0(sp)
lui_inst_ret:
    jal x0, ra

# auipc_inst:
#     jal x0, ra

###################
# ADD INSTRUCTION #
###################
add_inst:
    addi t1, x0, 123
    addi t2, x0, 456
    add t3, t1, t2          # 123 + 456 = 579
    addi t4, x0, 579
    beq t3, t4, add_inst_true
    jal x0, add_inst_false
add_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, add_inst_ret
add_inst_false:
    sd x0, 0(sp)
add_inst_ret:
    jal x0, ra

##################################
# SET (IF) LESS THAN INSTRUCTION #
##################################
slt_inst:
    addi t1, x0, 123
    addi t2, x0, 456
    slt t3, t1, t2          # 123 < 456 = 1
    addi t4, x0, 1
    beq t3, t4, slt_inst_true
    jal x0, slt_inst_false
slt_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, slt_inst_ret
slt_inst_false:
    sd x0, 0(sp)
slt_inst_ret:
    jal x0, ra

###########################################
# SET (IF) LESS THAN UNSIGNED INSTRUCTION #
###########################################
sltu_inst:
    addi t1, x0, 123
    addi t2, x0, 456
    slt t3, t1, t2          # 123 < 456 = 1
    addi t4, x0, 1
    beq t3, t4, slt_inst_true
    jal x0, slt_inst_false
slt_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, slt_inst_ret
slt_inst_false:
    sd x0, 0(sp)
slt_inst_ret:
    jal x0, ra

#############################
# (LOGICAL) AND INSTRUCTION #
#############################
and_inst:
    addi t1, x0, 123
    addi t2, x0, 678
    and t3, t1, t2          # 123 AND 678 = 34
    addi t4, x0, 34
    beq t3, t4, and_inst_true
    jal x0, and_inst_false
and_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, and_inst_ret
and_inst_false:
    sd x0, 0(sp)
and_inst_ret:
    jal x0, ra

############################
# (LOGICAL) OR INSTRUCTION #
############################
or_inst:
    addi t1, x0, 123
    addi t2, x0, 678
    or t3, t1, t2          # 123 OR 678 = 767
    addi t4, x0, 767
    beq t3, t4, or_inst_true
    jal x0, or_inst_false
or_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, or_inst_ret
or_inst_false:
    sd x0, 0(sp)
or_inst_ret:
    jal x0, ra

#############################
# (LOGICAL) XOR INSTRUCTION #
#############################
xor_inst:
    addi t1, x0, 123
    addi t2, x0, 678
    and t3, t1, t2          # 123 XOR 678 = 733
    addi t4, x0, 733
    beq t3, t4, xor_inst_true
    jal x0, xor_inst_false
xor_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, xor_inst_ret
xor_inst_false:
    sd x0, 0(sp)
xor_inst_ret:
    jal x0, ra

##################################
# SHIFT LEFT LOGICAL INSTRUCTION #
##################################
sll_inst:
    addi t1, x0, 1
    addi t2, x0, 3
    sll t3, t1, t2          # 1 << 3 = 8
    addi t4, x0, 8
    beq t3, t4, sll_inst_true
    jal x0, sll_inst_false
sll_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, sll_inst_ret
sll_inst_false:
    sd x0, 0(sp)
sll_inst_ret:
    jal x0, ra

###################################
# SHIFT RIGHT LOGICAL INSTRUCTION #
###################################
srl_inst:
    addi t1, x0, 16
    addi t2, x0, 3
    srl t3, t1, t2          # 16 >> 3 = 2
    addi t4, x0, 2
    beq t3, t4, srl_inst_true
    jal x0, srl_inst_false
srl_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, srl_inst_ret
srl_inst_false:
    sd x0, 0(sp)
srl_inst_ret:
    jal x0, ra

########################
# SUBTRACT INSTRUCTION #
########################
sub_inst:
    addi t1, x0, 123
    addi t2, x0, 456
    sub t3, t1, t2          # 123 - 456 = -333
    addi t4, x0, -333
    beq t3, t4, sub_inst_true
    jal x0, sub_inst_false
sub_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, sub_inst_ret
sub_inst_false:
    sd x0, 0(sp)
sub_inst_ret:
    jal x0, ra

######################################
# SHIFT RIGHT ARITHMETIC INSTRUCTION #
######################################
sra_inst:
    addi t1, x0, -16
    addi t2, x0, 3
    sra t3, t1, t2          # -16 >>> 3 = -2
    addi t4, x0, -2
    beq t3, t4, sra_inst_true
    jal x0, sra_inst_false
sra_inst_true:
    addi t0, x0, 1
    sd t0, 0(sp)
    jal x0, sra_inst_ret
sra_inst_false:
    sd x0, 0(sp)
sra_inst_ret:
    jal x0, ra

# Floating-point instructions

######################
# FP ADD INSTRUCTION #
######################
fadd_s_inst:
    
    jal x0, ra

###########################
# FP SUBTRACT INSTRUCTION #
###########################
fsub_s_inst:
    jal x0, ra

#################################
# FP MULTIPLICATION INSTRUCTION #
#################################
fmul_s_inst:
    jal x0, ra

###########################
# FP DIVISION INSTRUCTION #
###########################
fdiv_s_inst:
    jal x0, ra

##########################
# FP MINIMUM INSTRUCTION #
##########################
fmin_s_inst:
    jal x0, ra

##########################
# FP MAXIMUM INSTRUCTION #
##########################
fmax_s_inst:
    jal x0, ra

###############################################
# FP TO 32-BIT INTEGER CONVERSION INSTRUCTION #
###############################################
fcvt_w_s_inst:
    jal x0, ra

###############################################
# 32-BIT INTEGER TO FP CONVERSION INSTRUCTION #
###############################################
fcvt_s_w_inst:
    jal x0, ra

###############################################
# FP TO 64-BIT INTEGER CONVERSION INSTRUCTION #
###############################################
fcvt_l_s_inst:
    jal x0, ra

###############################################
# 64-BIT INTEGER TO FP CONVERSION INSTRUCTION #
###############################################
fcvt_s_l_inst:
    jal x0, ra

#################################
# FP SIGN INJECTION INSTRUCTION #
#################################
fsgnj_s_inst:
    jal x0, ra

#########################################
# FP SIGN INJECTION NEGATED INSTRUCTION #
#########################################
fsgnjn_s_inst:
    jal x0, ra

########################################
# FP SIGN INJECTION XOR-ED INSTRUCTION #
########################################
fsgnjx_s_inst:
    jal x0, ra

###################################
# FP EQUAL COMPARISON INSTRUCTION #
###################################
feq_s:
    jal x0, ra

#######################################
# FP LESS THAN COMPARISON INSTRUCTION #
#######################################
flt_s:
    jal x0, ra

################################################
# FP LESS THAN OR EQUAL COMPARISON INSTRUCTION #
################################################
fle_s:
    jal x0, ra

################################################################
# MOVE NUMBER FROM INTEGER REGISTER TO FP REGISTER INSTRUCTION #
################################################################
fmv_x_w:
    jal x0, ra

################################################################
# MOVE NUMBER FROM FP REGISTER TO INTEGER REGISTER INSTRUCTION #
################################################################
fmv_w_x:
    jal x0, ra

HALT: