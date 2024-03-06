# add results
li   $t0, 1
li   $t1, 4200
li   $t3, 0
add_rst:
addi $t1, $t1, 4
lw   $a0, 0($t1)
add  $t3, $t3, $a0         # add rst
addi $t0, $t0, 1
blt  $t0, $s0, add_rst
sll  $t9, $s0, 2 # n
addi $t2, $t9, 4200
sw   $t3, 0($t2)

li   $s4, 1073741840 # $s4存储BCD地址
sw   $zero, 0($s4)

lw   $t0, 0($t2) # $t0存储初始结果

sll  $a0, $t0, 28
srl  $a0, $a0, 28
li   $t1, 0 # if $a0 == 0
beq  $a0, $t1, show00
li   $t1, 1 # if $a0 == 1
beq  $a0, $t1, show01
li   $t1, 2 # if $a0 == 2
beq  $a0, $t1, show02
li   $t1, 3 # if $a0 == 3
beq  $a0, $t1, show03
li   $t1, 4 # if $a0 == 4
beq  $a0, $t1, show04
li   $t1, 5 # if $a0 == 5
beq  $a0, $t1, show05
li   $t1, 6 # if $a0 == 6
beq  $a0, $t1, show06
li   $t1, 7 # if $a0 == 7
beq  $a0, $t1, show07
li   $t1, 8 # if $a0 == 8
beq  $a0, $t1, show08
li   $t1, 9 # if $a0 == 9
beq  $a0, $t1, show09
li   $t1, 10 # if $a0 == 10
beq  $a0, $t1, show0a
li   $t1, 11 # if $a0 == 11
beq  $a0, $t1, show0b
li   $t1, 12 # if $a0 == 12
beq  $a0, $t1, show0c
li   $t1, 13 # if $a0 == 13
beq  $a0, $t1, show0d
li   $t1, 14 # if $a0 == 14
beq  $a0, $t1, show0e
li   $t1, 15 # if $a0 == 15
beq  $a0, $t1, show0f
show00:
li   $a0, 64
j firstnumberend
show01:
li   $a0, 121
j firstnumberend
show02:
li   $a0, 36
j firstnumberend
show03:
li   $a0, 48
j firstnumberend
show04:
li   $a0, 25
j firstnumberend
show05:
li   $a0, 18
j firstnumberend
show06:
li   $a0, 2
j firstnumberend
show07:
li   $a0, 120
j firstnumberend
show08:
li   $a0, 0
j firstnumberend
show09:
li   $a0, 16
j firstnumberend
show0a:
li   $a0, 8
j firstnumberend
show0b:
li   $a0, 3
j firstnumberend
show0c:
li   $a0, 70
j firstnumberend
show0d:
li   $a0, 33
j firstnumberend
show0e:
li   $a0, 6
j firstnumberend
show0f:
li   $a0, 14
j firstnumberend
firstnumberend:
addi $a0, $a0, 3584

sll  $a1, $t0, 24
srl  $a1, $a1, 24
srl  $a1, $a1, 4
move $t8, $a1
li   $t1, 0 # if $a1 == 0
beq  $a1, $t1, show10
li   $t1, 1 # if $a1 == 1
beq  $a1, $t1, show11
li   $t1, 2 # if $a1 == 2
beq  $a1, $t1, show12
li   $t1, 3 # if $a1 == 3
beq  $a1, $t1, show13
li   $t1, 4 # if $a1 == 4
beq  $a1, $t1, show14
li   $t1, 5 # if $a1 == 5
beq  $a1, $t1, show15
li   $t1, 6 # if $a1 == 6
beq  $a1, $t1, show16
li   $t1, 7 # if $a1 == 7
beq  $a1, $t1, show17
li   $t1, 8 # if $a1 == 8
beq  $a1, $t1, show18
li   $t1, 9 # if $a1 == 9
beq  $a1, $t1, show19
li   $t1, 10 # if $a1 == 10
beq  $a1, $t1, show1a
li   $t1, 11 # if $a1 == 11
beq  $a1, $t1, show1b
li   $t1, 12 # if $a1 == 12
beq  $a1, $t1, show1c
li   $t1, 13 # if $a1 == 13
beq  $a1, $t1, show1d
li   $t1, 14 # if $a1 == 14
beq  $a1, $t1, show1e
li   $t1, 15 # if $a1 == 15
beq  $a1, $t1, show1f
show10:
li   $a1, 64
j secondnumberend
show11:
li   $a1, 121
j secondnumberend
show12:
li   $a1, 36
j secondnumberend
show13:
li   $a1, 48
j secondnumberend
show14:
li   $a1, 25
j secondnumberend
show15:
li   $a1, 18
j secondnumberend
show16:
li   $a1, 2
j secondnumberend
show17:
li   $a1, 120
j secondnumberend
show18:
li   $a1, 0
j secondnumberend
show19:
li   $a1, 16
j secondnumberend
show1a:
li   $a1, 8
j secondnumberend
show1b:
li   $a1, 3
j secondnumberend
show1c:
li   $a1, 70
j secondnumberend
show1d:
li   $a1, 33
j secondnumberend
show1e:
li   $a1, 6
j secondnumberend
show1f:
li   $a1, 14
j secondnumberend
secondnumberend:
addi $a1, $a1, 3328

sll  $a2, $t0, 20
srl  $a2, $a2, 20
srl  $a2, $a2, 8
li   $t1, 0 # if $a2 == 0
beq  $a2, $t1, show20
li   $t1, 1 # if $a2 == 1
beq  $a2, $t1, show21
li   $t1, 2 # if $a2 == 2
beq  $a2, $t1, show22
li   $t1, 3 # if $a2 == 3
beq  $a2, $t1, show23
li   $t1, 4 # if $a2 == 4
beq  $a2, $t1, show24
li   $t1, 5 # if $a2 == 5
beq  $a2, $t1, show25
li   $t1, 6 # if $a2 == 6
beq  $a2, $t1, show26
li   $t1, 7 # if $a2 == 7
beq  $a2, $t1, show27
li   $t1, 8 # if $a2 == 8
beq  $a2, $t1, show28
li   $t1, 9 # if $a2 == 9
beq  $a2, $t1, show29
li   $t1, 10 # if $a2 == 10
beq  $a2, $t1, show2a
li   $t1, 11 # if $a2 == 11
beq  $a2, $t1, show2b
li   $t1, 12 # if $a2 == 12
beq  $a2, $t1, show2c
li   $t1, 13 # if $a2 == 13
beq  $a2, $t1, show2d
li   $t1, 14 # if $a2 == 14
beq  $a2, $t1, show2e
li   $t1, 15 # if $a2 == 15
beq  $a2, $t1, show2f
show20:
li   $a2, 64
j thirdnumberend
show21:
li   $a2, 121
j thirdnumberend
show22:
li   $a2, 36
j thirdnumberend
show23:
li   $a2, 48
j thirdnumberend
show24:
li   $a2, 25
j thirdnumberend
show25:
li   $a2, 18
j thirdnumberend
show26:
li   $a2, 2
j thirdnumberend
show27:
li   $a2, 120
j thirdnumberend
show28:
li   $a2, 0
j thirdnumberend
show29:
li   $a2, 16
j thirdnumberend
show2a:
li   $a2, 8
j thirdnumberend
show2b:
li   $a2, 3
j thirdnumberend
show2c:
li   $a2, 70
j thirdnumberend
show2d:
li   $a2, 33
j thirdnumberend
show2e:
li   $a2, 6
j thirdnumberend
show2f:
li   $a2, 14
j thirdnumberend
thirdnumberend:
addi $a2, $a2, 2816

sll  $a3, $t0, 16
srl  $a3, $a3, 16
srl  $a3, $a3, 12
li   $t1, 0 # if $a3 == 0
beq  $a3, $t1, show30
li   $t1, 1 # if $a3 == 1
beq  $a3, $t1, show31
li   $t1, 2 # if $a3 == 2
beq  $a3, $t1, show32
li   $t1, 3 # if $a3 == 3
beq  $a3, $t1, show33
li   $t1, 4 # if $a3 == 4
beq  $a3, $t1, show34
li   $t1, 5 # if $a3 == 5
beq  $a3, $t1, show35
li   $t1, 6 # if $a3 == 6
beq  $a3, $t1, show36
li   $t1, 7 # if $a3 == 7
beq  $a3, $t1, show37
li   $t1, 8 # if $a3 == 8
beq  $a3, $t1, show38
li   $t1, 9 # if $a3 == 9
beq  $a3, $t1, show39
li   $t1, 10 # if $a3 == 10
beq  $a3, $t1, show3a
li   $t1, 11 # if $a3 == 11
beq  $a3, $t1, show3b
li   $t1, 12 # if $a3 == 12
beq  $a3, $t1, show3c
li   $t1, 13 # if $a3 == 13
beq  $a3, $t1, show3d
li   $t1, 14 # if $a3 == 14
beq  $a3, $t1, show3e
li   $t1, 15 # if $a3 == 15
beq  $a3, $t1, show3f
show30:
li   $a3, 64
j forthnumberend
show31:
li   $a3, 121
j forthnumberend
show32:
li   $a3, 36
j forthnumberend
show33:
li   $a3, 48
j forthnumberend
show34:
li   $a3, 25
j forthnumberend
show35:
li   $a3, 18
j forthnumberend
show36:
li   $a3, 2
j forthnumberend
show37:
li   $a3, 120
j forthnumberend
show38:
li   $a3, 0
j forthnumberend
show39:
li   $a3, 16
j forthnumberend
show3a:
li   $a3, 8
j forthnumberend
show3b:
li   $a3, 3
j forthnumberend
show3c:
li   $a3, 70
j forthnumberend
show3d:
li   $a3, 33
j forthnumberend
show3e:
li   $a3, 6
j forthnumberend
show3f:
li   $a3, 14
j forthnumberend
forthnumberend:
addi $a3, $a3, 1792

showloop:
li   $t0, 0
li   $t1, 1000
show1:
sw   $a0, 0($s4)
addi $t0, $t0, 1
blt  $t0, $t1, show1
li   $t0, 0
li   $t1, 1000
show2:
sw   $a1, 0($s4)
addi $t0, $t0, 1
blt  $t0, $t1, show2
li   $t0, 0
li   $t1, 1000
show3:
sw   $a2, 0($s4)
addi $t0, $t0, 1
blt  $t0, $t1, show3
li   $t0, 0
li   $t1, 1000
show4:
sw   $a3, 0($s4)
addi $t0, $t0, 1
blt  $t0, $t1, show4
j showloop