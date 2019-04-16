.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
_start:
	//
	//mov # to reg
	//
	movs	r0,	#100
	movs	r1,	#0x11000000
	mov	r2,	#102
	movw	r3,	#103
	
	//
	//push
	//
	push	{r3, r1, r0, r2}

	//
	//pop
	//
	pop	{r6, r5, r7, r4}
	
	//
	//branch w/o link
	//
	b	label01

label01:
	nop

	//
	//branch w/ link
	//
	bl	sleep

sleep:
	nop
	b	.
