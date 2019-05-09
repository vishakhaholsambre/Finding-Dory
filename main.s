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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #7680
	ldr	r3, .L4+8
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L4+12
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #0
	mov	r3, #256
	ldr	r2, .L4+32
	str	r1, [r2]
	strh	r3, [r5]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startPal
	.word	8624
	.word	startTiles
	.word	100724736
	.word	startMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #1
	ldr	r2, .L8
	ldr	r1, .L8+4
	ldr	r0, .L8+8
	ldr	r4, .L8+12
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r4, .L8+16
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	ldr	r2, .L8+20
	ldr	r1, .L8+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L8+28
	ldr	r1, .L8+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #6
	ldr	r0, .L8+36
	ldr	lr, .L8+40
	str	r3, [r0]
	ldr	r2, .L8+44
	ldr	ip, .L8+48
	ldr	r0, .L8+52
	str	r3, [r2]
	str	r3, [lr]
	ldr	r2, .L8+56
	str	r3, [ip]
	str	r3, [r0]
	ldr	r3, .L8+60
	str	r1, [r2]
	ldrh	r1, [r3, #48]
	ldr	r2, .L8+64
	ldr	r3, .L8+68
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	11025
	.word	581872
	.word	TitleSong
	.word	playSoundA
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	vOff
	.word	shellsCaught
	.word	hOff
	.word	fishHit
	.word	cheat
	.word	memoryDown
	.word	67109120
	.word	buttons
	.word	hideSprites
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #7680
	ldr	r3, .L12+8
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L12+12
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L12+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r3, #256
	ldr	r2, .L12+32
	str	r1, [r2]
	strh	r3, [r5]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionsPal
	.word	9424
	.word	instructionsTiles
	.word	100724736
	.word	instructionsMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L15:
	ldr	r3, .L21+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	bl	goToInstructions
	b	.L15
.L22:
	.align	2
.L21:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r2, #4864
	ldr	r3, .L25+4
	ldr	r5, .L25+8
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L25+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #6784
	ldr	r2, .L25+16
	ldr	r1, .L25+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	ldr	r2, .L25+24
	ldr	r1, .L25+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #7680
	ldr	r7, .L25+32
	ldr	r6, .L25+36
	ldrh	r3, [r7]
	ldrh	r2, [r6]
	strh	r3, [r4, #22]	@ movhi
	mov	r0, #3
	strh	r2, [r4, #20]	@ movhi
	mov	r3, #880
	strh	r1, [r4, #8]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L25+40
	mov	lr, pc
	bx	r5
	ldr	r1, .L25+44
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L25+48
	mov	lr, pc
	bx	r5
	ldrh	r3, [r7]
	ldrh	r2, [r6]
	strh	r3, [r4, #18]	@ movhi
	strh	r2, [r4, #16]	@ movhi
	ldr	r3, .L25+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L25+56
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #5
	ldr	r3, .L25+60
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	waitForVBlank
	.word	7172
	.word	DMANow
	.word	oceanPal
	.word	100679680
	.word	oceanTiles
	.word	100720640
	.word	oceanMap
	.word	vOff
	.word	hOff
	.word	oceanfrontTiles
	.word	oceanfrontMap
	.word	100724736
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
.L27:
	pop	{r4, lr}
	bx	lr
.L33:
	bl	goToGame
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r5, #67108864
	ldr	r2, .L38
	ldr	r4, .L38+4
	str	r1, [r2]
	mov	r3, #256
	strh	r1, [r5, #16]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L38+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #7680
	ldr	r3, .L38+12
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L38+16
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L38+20
	ldr	r1, .L38+24
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L38+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #6
	mov	r3, #4352
	ldr	r2, .L38+36
	str	r1, [r2]
	strh	r3, [r5]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	hOff
	.word	DMANow
	.word	pausePal
	.word	9360
	.word	pauseTiles
	.word	100724736
	.word	pauseMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L52
	ldr	r3, .L52+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L52+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L50
.L41:
	tst	r3, #2
	beq	.L40
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L51
.L40:
	pop	{r4, lr}
	bx	lr
.L51:
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	initialize
.L50:
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L41
.L53:
	.align	2
.L52:
	.word	oldButtons
	.word	hideSprites
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r5, #67108864
	ldr	r2, .L56
	ldr	r4, .L56+4
	str	r1, [r2]
	mov	r3, #256
	strh	r1, [r5, #16]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L56+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #7680
	ldr	r3, .L56+12
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L56+16
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L56+20
	ldr	r1, .L56+24
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L56+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #7
	mov	r3, #256
	ldr	r2, .L56+36
	str	r1, [r2]
	strh	r3, [r5]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	hOff
	.word	DMANow
	.word	winPal
	.word	8928
	.word	winTiles
	.word	100724736
	.word	winMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L65
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
	ldr	r3, .L65+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
.L58:
	pop	{r4, lr}
	bx	lr
.L64:
	ldr	r3, .L65+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	initialize
.L66:
	.align	2
.L65:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r5, #67108864
	ldr	r2, .L69
	ldr	r4, .L69+4
	str	r1, [r2]
	mov	r3, #256
	strh	r1, [r5, #16]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L69+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #7680
	ldr	r3, .L69+12
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L69+16
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L69+20
	ldr	r1, .L69+24
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L69+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #8
	mov	r3, #256
	ldr	r2, .L69+36
	str	r1, [r2]
	strh	r3, [r5]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	hOff
	.word	DMANow
	.word	losePal
	.word	9120
	.word	loseTiles
	.word	100724736
	.word	loseMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L81
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L72
	ldr	r3, .L81+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L79
.L72:
	ldr	r3, .L81+8
	ldr	r3, [r3]
	cmp	r3, #15
	beq	.L80
.L73:
	ldr	r3, .L81+12
	ldr	r3, [r3]
	cmp	r3, #0
	bleq	goToLose
.L74:
	ldr	r3, .L81+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L81+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L81+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L80:
	bl	goToWin
	b	.L73
.L79:
	ldr	r3, .L81+36
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L72
.L82:
	.align	2
.L81:
	.word	oldButtons
	.word	buttons
	.word	shellsCaught
	.word	memoryDown
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	DMANow
	.word	shadowOAM
	.word	pauseSound
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L95
	mov	lr, pc
	bx	r3
	ldr	r3, .L95+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L95+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L95+12
	ldr	r9, .L95+16
	ldr	r5, .L95+20
	ldr	fp, .L95+24
	ldr	r10, .L95+28
	ldr	r7, .L95+32
	ldr	r8, .L95+36
	ldr	r4, .L95+40
.L84:
	ldr	r2, [r6]
	ldrh	r3, [r9]
.L85:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
	cmp	r2, #8
	ldrls	pc, [pc, r2, asl #2]
	b	.L85
.L87:
	.word	.L86
	.word	.L88
	.word	.L89
	.word	.L89
	.word	.L89
	.word	.L89
	.word	.L90
	.word	.L91
	.word	.L91
.L89:
	mov	lr, pc
	bx	r7
	b	.L84
.L91:
	mov	lr, pc
	bx	r8
	b	.L84
.L90:
	ldr	r3, .L95+44
	mov	lr, pc
	bx	r3
	b	.L84
.L88:
	mov	lr, pc
	bx	r10
	b	.L84
.L86:
	mov	lr, pc
	bx	fp
	b	.L84
.L96:
	.align	2
.L95:
	.word	setupSounds
	.word	setupInterrupts
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	cheat,4,4
	.comm	memoryDown,4,4
	.comm	fishHit,4,4
	.comm	shellsCaught,4,4
	.comm	shadowOAM,1024,4
	.comm	scroll,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
