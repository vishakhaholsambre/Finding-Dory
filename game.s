	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L16
	ldr	ip, .L16+4
	ldr	r3, [r0, #4]
	push	{r4, r5, r6, r7, lr}
	lsl	r3, r3, #23
	ldr	lr, [ip, #32]
	ldr	r2, .L16+8
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	cmp	lr, #0
	strh	r3, [r2, #2]	@ movhi
	moveq	r3, #512
	ldr	r1, [r0, #24]
	ldrb	r0, [r0]	@ zero_extendqisi2
	lsl	r1, r1, #1
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strheq	r3, [r2, #240]	@ movhi
	bne	.L14
.L3:
	mov	r3, #0
	mov	lr, #512
	ldr	r1, .L16+12
	ldr	r4, .L16+16
.L6:
	ldr	r0, [r1, #32]
	cmp	r0, #0
	addeq	r0, r3, #560
	strheq	lr, [r2, r0]	@ movhi
	bne	.L15
.L5:
	add	r3, r3, #8
	cmp	r3, #40
	add	r1, r1, #56
	bne	.L6
	mov	r4, #512
	mov	r6, #384
	ldr	r3, .L16+20
	add	ip, r3, #168
.L9:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	ldr	r1, [r3, #24]
	ldrne	r0, [r3, #4]
	lslne	r1, r1, #3
	ldrne	r5, [r3]
	addne	lr, r2, r1
	orrne	r0, r0, #16384
	lsleq	r1, r1, #3
	add	r3, r3, #28
	strhne	r5, [r2, r1]	@ movhi
	strhne	r6, [lr, #4]	@ movhi
	strhne	r0, [lr, #2]	@ movhi
	strheq	r4, [r2, r1]	@ movhi
	cmp	ip, r3
	bne	.L9
	ldr	r1, .L16+24
	mov	r3, #3
	mov	r0, r1
	mov	ip, #324
	mov	r6, #320
	ldr	lr, .L16+28
	strh	r3, [r0, #80]!	@ movhi
	strh	lr, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	ldr	lr, .L16+32
	ldr	ip, .L16+36
	strh	lr, [r1, #84]	@ movhi
	ldr	r5, .L16+40
	strh	r3, [r1]	@ movhi
	ldr	r4, .L16+44
	strh	ip, [r0, #2]	@ movhi
	ldr	r1, .L16+48
	ldr	r0, .L16+52
	sub	lr, lr, #4
	strh	r3, [r2, #80]	@ movhi
	strh	r3, [r2, #88]	@ movhi
	strh	r3, [r2, #168]	@ movhi
	strh	r3, [r2, #248]	@ movhi
	sub	ip, ip, #45
	add	r3, r3, r6
	strh	r6, [r2, #84]	@ movhi
	strh	r5, [r2, #82]	@ movhi
	strh	r4, [r2, #90]	@ movhi
	strh	lr, [r2, #92]	@ movhi
	strh	ip, [r2, #170]	@ movhi
	strh	r0, [r2, #172]	@ movhi
	strh	r1, [r2, #250]	@ movhi
	strh	r3, [r2, #252]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L15:
	ldr	r0, [r1, #40]
	ldr	r5, [r1, #4]
	add	r0, r0, #32
	add	ip, r2, r3
	lsl	r0, r0, #2
	ldr	r7, [r1]
	add	r6, ip, #560
	orr	r0, r0, #4096
	orr	r5, r5, r4
	add	ip, ip, #564
	strh	r5, [r6, #2]	@ movhi
	strh	r7, [r6]	@ movhi
	strh	r0, [ip]	@ movhi
	b	.L5
.L14:
	ldr	r3, [ip, #40]
	ldr	r1, [ip, #4]
	add	r3, r3, #128
	lsl	r3, r3, #1
	ldr	r0, [ip]
	orr	r3, r3, #8192
	orr	r1, r1, #16384
	strh	r3, [r2, #244]	@ movhi
	strh	r1, [r2, #242]	@ movhi
	strh	r0, [r2, #240]	@ movhi
	b	.L3
.L17:
	.align	2
.L16:
	.word	dory
	.word	shells
	.word	shadowOAM
	.word	fish
	.word	-32768
	.word	memory
	.word	shadowOAM+328
	.word	16444
	.word	325
	.word	16459
	.word	16389
	.word	16399
	.word	16429
	.word	322
	.size	drawGame, .-drawGame
	.align	2
	.global	initMemory
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMemory, %function
initMemory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #8
	mov	r1, #1
	mov	r0, #7
	mov	fp, #12
	mov	r10, #2
	mov	r9, #22
	mov	r8, #3
	mov	r7, #37
	mov	r6, #4
	mov	r5, #52
	mov	r4, #67
	mov	ip, #5
	mov	lr, #6
	ldr	r3, .L20
	str	fp, [r3, #32]
	str	r10, [r3, #52]
	str	r9, [r3, #60]
	str	r8, [r3, #80]
	str	r7, [r3, #88]
	str	r6, [r3, #108]
	str	r5, [r3, #116]
	str	r4, [r3, #144]
	str	r0, [r3]
	str	r0, [r3, #28]
	str	r0, [r3, #56]
	str	r0, [r3, #84]
	str	r0, [r3, #112]
	str	r0, [r3, #140]
	str	ip, [r3, #4]
	str	ip, [r3, #136]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #40]
	str	r2, [r3, #36]
	str	r2, [r3, #68]
	str	r2, [r3, #64]
	str	r2, [r3, #96]
	str	r2, [r3, #92]
	str	r2, [r3, #124]
	str	r2, [r3, #120]
	str	r1, [r3, #16]
	str	r1, [r3, #24]
	str	r1, [r3, #44]
	str	r1, [r3, #72]
	str	r1, [r3, #100]
	str	r1, [r3, #128]
	str	lr, [r3, #164]
	str	r2, [r3, #152]
	str	r2, [r3, #148]
	str	r1, [r3, #156]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	memory
	.size	initMemory, .-initMemory
	.align	2
	.global	drawMemory
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMemory, %function
drawMemory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	ldr	r3, [r0, #24]
	bne	.L29
	mov	r1, #512
	ldr	r2, .L30
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L29:
	str	lr, [sp, #-4]!
	mov	lr, #384
	ldr	r2, [r0, #4]
	ldr	ip, .L30
	ldr	r0, [r0]
	lsl	r3, r3, #3
	add	r1, ip, r3
	orr	r2, r2, #16384
	strh	lr, [r1, #4]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	shadowOAM
	.size	drawMemory, .-drawMemory
	.align	2
	.global	updateMemory
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMemory, %function
updateMemory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateMemory, .-updateMemory
	.align	2
	.global	initDory
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDory, %function
initDory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #70
	mov	lr, #40
	mov	r0, #2
	mov	r1, #8
	mov	ip, #3
	ldr	r3, .L35
	stm	r3, {r4, lr}
	str	ip, [r3, #36]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	dory
	.size	initDory, .-initDory
	.align	2
	.global	drawDory
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDory, %function
drawDory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L38
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #24]
	lsl	r3, r3, #23
	ldr	r2, .L38+4
	lsr	r3, r3, #23
	ldrb	r0, [r0]	@ zero_extendqisi2
	orr	r3, r3, #16384
	lsl	r1, r1, #1
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L39:
	.align	2
.L38:
	.word	dory
	.word	shadowOAM
	.size	drawDory, .-drawDory
	.align	2
	.global	updateDory
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDory, %function
updateDory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	ldrh	r3, [r3, #48]
	tst	r3, #64
	push	{r4, r5, r6, lr}
	ldr	r0, .L54+4
	bne	.L41
	ldr	r3, [r0]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r0]
.L41:
	ldr	r3, .L54
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L42
	ldr	r2, [r0]
	ldr	r3, [r0, #20]
	add	r3, r2, r3
	cmp	r3, #159
	addle	r2, r2, #1
	strle	r2, [r0]
.L42:
	ldr	r3, .L54
	ldrh	r3, [r3, #48]
	ldr	r2, .L54+8
	tst	r3, #16
	ldr	r3, [r2]
	bne	.L43
	ldr	r1, [r0, #4]
	cmp	r1, #89
	ldrgt	r1, [r2, #4]
	addgt	r3, r3, #1
	subgt	r1, r1, #1
	addle	r1, r1, #1
	strgt	r3, [r2]
	strgt	r1, [r2, #4]
	strle	r1, [r0, #4]
.L43:
	ldr	r1, .L54
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L45
	ldr	r1, [r0, #4]
	cmp	r1, #2
	subgt	r1, r1, #1
	strgt	r1, [r0, #4]
.L45:
	mov	ip, #67108864
	ldr	r1, [r0, #28]
	ldr	lr, .L54+12
	smull	r4, r5, r1, lr
	ldrh	r6, [r2, #8]
	lsl	lr, r3, #16
	asr	r2, r1, #31
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	rsb	r2, r2, r5, asr #3
	lsl	r3, r3, #16
	add	r2, r2, r2, lsl #2
	lsr	lr, lr, #16
	lsr	r3, r3, #16
	subs	r2, r1, r2, lsl #2
	strh	lr, [ip, #20]	@ movhi
	strh	r6, [ip, #22]	@ movhi
	strh	lr, [ip, #16]	@ movhi
	strh	r3, [ip, #20]	@ movhi
	bne	.L47
	ldr	r3, [r0, #24]
	adds	r3, r3, #1
	moveq	r3, #1
	streq	r3, [r0, #24]
	beq	.L47
	cmp	r3, #3
	moveq	r3, r2
	str	r3, [r0, #24]
.L47:
	add	r1, r1, #1
	str	r1, [r0, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	67109120
	.word	dory
	.word	.LANCHOR0
	.word	1717986919
	.size	updateDory, .-updateDory
	.align	2
	.global	initShells
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShells, %function
initShells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L58
	mov	lr, pc
	bx	r3
	mov	r5, #2
	mov	r1, #0
	mov	ip, #240
	mov	r4, #1
	mov	lr, #13
	ldr	r6, .L58+4
	smull	r2, r3, r0, r6
	asr	r2, r0, #31
	add	r3, r0, r3
	rsb	r2, r2, r3, asr #7
	rsb	r2, r2, r2, lsl #4
	ldr	r3, .L58+8
	sub	r2, r0, r2, lsl #4
	str	r2, [r3]
	str	r2, [r3, #8]
	ldr	r2, .L58+12
	str	r5, [r3, #16]
	str	r5, [r3, #52]
	str	r4, [r3, #20]
	str	r4, [r3, #32]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #4]
	str	ip, [r3, #12]
	str	ip, [r2, #4]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	str	r1, [r3, #48]
	str	r1, [r3, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	rand
	.word	-2004318071
	.word	shells
	.word	.LANCHOR0
	.size	initShells, .-initShells
	.align	2
	.global	drawShells
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShells, %function
drawShells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bne	.L67
	mov	r2, #512
	ldr	r3, .L68
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L67:
	ldr	r3, [r0, #40]
	ldr	r2, [r0, #4]
	ldr	ip, .L68
	add	r3, r3, #128
	str	lr, [sp, #-4]!
	lsl	r1, r1, #3
	ldr	lr, [r0]
	lsl	r3, r3, #1
	add	r0, ip, r1
	orr	r2, r2, #16384
	orr	r3, r3, #8192
	strh	lr, [ip, r1]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L69:
	.align	2
.L68:
	.word	shadowOAM
	.size	drawShells, .-drawShells
	.align	2
	.global	updateShells
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShells, %function
updateShells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	mov	r4, r0
	bne	.L71
	ldr	r5, .L97
.L83:
	mov	r3, #240
	ldr	r7, .L97+4
	str	r3, [r4, #4]
	str	r3, [r5, #4]
	mov	lr, pc
	bx	r7
	mov	r2, #1
	ldr	r6, .L97+8
	smull	r8, r9, r0, r6
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #4
	add	r3, r3, r3, lsl #2
	ldr	r1, [r4, #4]
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl r2
	cmp	r1, #0
	str	r3, [r4]
	str	r2, [r4, #32]
	str	r2, [r4, #36]
	ble	.L95
.L84:
	ldr	r3, [r4, #44]
	add	r3, r3, #1
	str	r3, [r4, #44]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L71:
	ldr	r2, [r0, #44]
	ldr	r3, .L97+12
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r1, r3, r1, asr #1
	add	r1, r1, r1, lsl #2
	cmp	r2, r1
	ldrne	r1, [r4, #4]
	ldrne	r0, [r4, #20]
	ldr	ip, .L97+16
	subne	r1, r1, r0
	strne	r1, [r4, #4]
	smull	r0, r1, r2, ip
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #3
	subs	r3, r2, r3
	bne	.L76
	ldr	r2, [r4, #40]
	adds	r2, r2, #1
	moveq	r3, #1
	streq	r3, [r4, #40]
	beq	.L76
	cmp	r2, #7
	moveq	r2, r3
	str	r2, [r4, #40]
.L76:
	ldr	r5, .L97
	ldr	r0, .L97+20
	ldr	ip, [r5, #4]
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldr	r6, [r4, #24]
	ldm	r0, {r0, r1}
	str	ip, [r4, #4]
	str	ip, [sp, #4]
	ldr	lr, [r4, #28]
	str	r6, [sp, #12]
	ldr	ip, [r4]
	ldr	r6, .L97+24
	str	lr, [sp, #8]
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L80
	ldr	r2, .L97+28
	ldr	r3, [r2]
	cmp	r3, #5
	bgt	.L81
	mov	r0, #1
	ldr	r1, .L97+32
	rsb	ip, r3, r3, lsl #3
	add	r1, r1, ip, lsl #2
	add	r3, r3, r0
	str	r3, [r2]
	str	r0, [r1, #16]
.L81:
	mov	r3, #0
	ldr	ip, [r5, #12]
	str	r3, [r4, #32]
	add	ip, ip, #1
	ldr	r2, .L97+36
	ldr	r1, .L97+40
	ldr	r0, .L97+44
	ldr	r6, .L97+48
	str	ip, [r5, #12]
	mov	lr, pc
	bx	r6
.L80:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L96
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L84
	b	.L83
.L95:
	ldr	r3, [r5, #4]
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r7
	smull	r8, r9, r0, r6
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	b	.L84
.L96:
	mov	r3, #240
	ldr	r2, .L97+4
	str	r3, [r4, #4]
	str	r3, [r5, #4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L97+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L84
	b	.L83
.L98:
	.align	2
.L97:
	.word	.LANCHOR0
	.word	rand
	.word	458129845
	.word	1717986919
	.word	818089009
	.word	dory
	.word	collision
	.word	.LANCHOR1
	.word	memory
	.word	11025
	.word	3316
	.word	shellsound
	.word	playSoundB
	.size	updateShells, .-updateShells
	.align	2
	.global	initFish
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFish, %function
initFish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #2
	ldr	r4, .L103
	ldr	r5, .L103+4
	ldr	r8, .L103+8
	ldr	r7, .L103+12
	add	r6, r4, #280
.L100:
	mov	lr, pc
	bx	r5
	smull	r10, fp, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r10, #3
	mov	r1, #0
	mov	ip, #16
	mov	lr, #1
	smull	r2, r3, r0, r7
	add	r2, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl r10
	ldr	r2, [r4]
	add	r3, r3, r3, lsl #5
	sub	r3, r0, r3
	str	r9, [r4, #16]
	str	r9, [r4, #20]
	str	r3, [r4, #4]
	str	r3, [r4, #12]
	str	ip, [r4, #28]
	str	ip, [r4, #24]
	str	r1, [r4, #40]
	str	r1, [r4, #44]
	str	r1, [r4, #48]
	str	r1, [r4, #36]
	str	r10, [r4, #52]
	str	lr, [r4, #32]
	str	r2, [r4, #8]
	add	r4, r4, #56
	cmp	r4, r6
	bne	.L100
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	fish
	.word	rand
	.word	458129845
	.word	-1915071997
	.size	initFish, .-initFish
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L107
	ldr	r2, .L107+4
	ldr	r1, .L107+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L107+12
	ldr	r1, .L107+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	bl	initMemory
	mov	r4, #70
	mov	r2, #0
	mov	lr, #40
	mov	r0, #2
	mov	r1, #8
	mov	ip, #3
	ldr	r3, .L107+20
	stm	r3, {r4, lr}
	str	ip, [r3, #36]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	bl	initShells
	pop	{r4, lr}
	b	initFish
.L108:
	.align	2
.L107:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	dory
	.size	initGame, .-initGame
	.align	2
	.global	drawFish
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFish, %function
drawFish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bne	.L116
	mov	r2, #512
	ldr	r3, .L117
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L116:
	ldr	r2, [r0, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r0, #40]
	ldr	ip, .L117
	add	r3, r3, #32
	str	lr, [sp, #-4]!
	lsl	r1, r1, #3
	ldr	lr, [r0]
	lsl	r3, r3, #2
	add	r0, ip, r1
	orr	r3, r3, #4096
	strh	lr, [ip, r1]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L118:
	.align	2
.L117:
	.word	shadowOAM
	.size	drawFish, .-drawFish
	.align	2
	.global	updateFish
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFish, %function
updateFish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	mov	r4, r0
	bne	.L120
.L130:
	mov	r7, #240
	ldr	r6, .L142
	str	r7, [r4, #4]
	mov	lr, pc
	bx	r6
	ldr	r5, .L142+4
	smull	r8, r9, r0, r5
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #5
	ldr	r2, [r4, #4]
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #4
	cmp	r2, #0
	str	r3, [r4]
	ble	.L139
.L122:
	mov	r3, #1
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	b	.L131
.L120:
	ldr	r2, [r0, #44]
	ldr	r3, .L142+8
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	ldr	ip, [r4, #4]
	ldr	r1, [r4, #20]
	add	r3, r3, r3, lsl #2
	sub	ip, ip, r1
	subs	r3, r2, r3, lsl #2
	str	ip, [r4, #4]
	bne	.L124
	ldr	r2, [r4, #40]
	adds	r2, r2, #1
	moveq	r3, #1
	streq	r3, [r4, #40]
	beq	.L124
	cmp	r2, #3
	moveq	r2, r3
	str	r2, [r4, #40]
.L124:
	ldr	r0, .L142+12
	ldr	r5, [r4, #28]
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	str	ip, [sp, #4]
	ldr	lr, [r4, #24]
	str	r5, [sp, #12]
	ldr	ip, [r4]
	ldr	r5, .L142+16
	str	lr, [sp, #8]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L140
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L141
.L129:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L130
.L131:
	ldr	r3, [r4, #44]
	add	r3, r3, #1
	str	r3, [r4, #44]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L140:
	mov	r3, #0
	ldr	r0, .L142+20
	ldr	r1, [r0]
	ldr	lr, .L142+24
	sub	r1, r1, #1
	ldr	r2, .L142+28
	rsb	ip, r1, r1, lsl #3
	add	r2, r2, ip, lsl #2
	ldr	ip, [lr, #16]
	str	r3, [r2, #16]
	str	r1, [r0]
	add	ip, ip, #1
	str	r3, [r4, #36]
	str	r3, [r4, #32]
	ldr	r2, .L142+32
	ldr	r1, .L142+36
	ldr	r0, .L142+40
	ldr	r5, .L142+44
	str	ip, [lr, #16]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bgt	.L129
.L141:
	mov	r2, #240
	ldr	r3, .L142
	str	r2, [r4, #4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L142+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #4
	str	r3, [r4]
	b	.L129
.L139:
	str	r7, [r4, #4]
	mov	lr, pc
	bx	r6
	smull	r6, r7, r0, r5
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #4
	str	r3, [r4]
	b	.L122
.L143:
	.align	2
.L142:
	.word	rand
	.word	954437177
	.word	1717986919
	.word	dory
	.word	collision
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	memory
	.word	11025
	.word	1889
	.word	bump
	.word	playSoundB
	.size	updateFish, .-updateFish
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateDory
	ldr	r0, .L150
	bl	updateShells
	ldr	r0, .L150+4
	bl	updateFish
	ldr	r0, .L150+8
	bl	updateFish
	ldr	r0, .L150+12
	bl	updateFish
	ldr	r0, .L150+16
	bl	updateFish
	ldr	r0, .L150+20
	bl	updateFish
	ldr	r3, .L150+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L144
	ldr	r3, .L150+28
	ldrh	ip, [r3]
	ands	ip, ip, #2
	bne	.L144
	mov	r0, #100
	ldr	lr, .L150+32
	ldr	r1, .L150+36
	mov	r3, ip
	str	r0, [r1]
	ldr	r2, .L150+40
	ldr	r1, .L150+44
	ldr	r0, .L150+48
	str	ip, [lr, #16]
	str	ip, [lr, #44]
	str	ip, [lr, #72]
	str	ip, [lr, #100]
	str	ip, [lr, #128]
	str	ip, [lr, #156]
	ldr	r4, .L150+52
	mov	lr, pc
	bx	r4
.L144:
	pop	{r4, lr}
	bx	lr
.L151:
	.align	2
.L150:
	.word	shells
	.word	fish
	.word	fish+56
	.word	fish+112
	.word	fish+168
	.word	fish+224
	.word	oldButtons
	.word	buttons
	.word	memory
	.word	.LANCHOR1
	.word	11025
	.word	10136
	.word	wipe
	.word	playSoundB
	.size	updateGame, .-updateGame
	.comm	shadowOAM,1024,4
	.comm	memory,168,4
	.comm	fish,280,4
	.comm	shells,56,4
	.comm	dory,40,4
	.global	counter
	.global	hOff
	.global	vOff
	.global	cheat
	.global	memoryDown
	.global	fishHit
	.global	shellsCaught
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	memoryDown, %object
	.size	memoryDown, 4
memoryDown:
	.word	6
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	counter, %object
	.size	counter, 4
counter:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	shellsCaught, %object
	.size	shellsCaught, 4
shellsCaught:
	.space	4
	.type	fishHit, %object
	.size	fishHit, 4
fishHit:
	.space	4
	.type	cheat, %object
	.size	cheat, 4
cheat:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
