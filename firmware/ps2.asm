	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_ps2_ringbuffer_init
_ps2_ringbuffer_init:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//ps2.c, line 9
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)store type 3
	st	r2
						//save_temp done
						// allocreg r1

						//ps2.c, line 10
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//ps2.c, line 10
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1
						// allocreg r1

						//ps2.c, line 11
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//ps2.c, line 11
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1
						// allocreg r1

						//ps2.c, line 12
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//ps2.c, line 12
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_ps2_ringbuffer_write
_ps2_ringbuffer_write:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
	.liconst	-8
	add	r6
						// allocreg r4
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r3
						// allocreg r1

						//ps2.c, line 17
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	8
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//ps2.c, line 17
						// (bitwise/arithmetic) 	//ops: 5, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	12
	addt	r4
						// (save temp)isreg
	mr	r3
						//save_temp done

						//ps2.c, line 17
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 17
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 17
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 10
						// deref 
	ld	r1
	mr	r0
						// (obj to tmp) flags a type 403
						// matchobj comparing flags 10 with 98
						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	4
						//sizemod based on type 0x403
	ldidx	r6
	cmp	r0

						//ps2.c, line 17
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l7
		add	r7
l6: # 

						//ps2.c, line 17
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 62 type 403
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 17
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 17
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 10
						// deref 
	ld	r1
	mr	r0
						// (obj to tmp) flags a type 403
						// matchobj comparing flags 10 with 98
						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	4
						//sizemod based on type 0x403
	ldidx	r6
	cmp	r0

						//ps2.c, line 17
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l6
		add	r7
l7: # 
						// freereg r1

						//ps2.c, line 20
						//call
						//pcreltotemp
	.lipcrel	_DisableInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// allocreg r1

						//ps2.c, line 21
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	80
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//ps2.c, line 21
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 74
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	4
	mul	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 21
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags a type a
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
	add	r1
						// (save result) // isreg

						//ps2.c, line 21
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 10
						// matchobj comparing flags 2 with 10
						// var, auto|reg
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	20
	ldidx	r6
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1

						//ps2.c, line 22
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 2
						// matchobj comparing flags 98 with 10
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 22
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x62
	mt	r0
	st	r3

						//ps2.c, line 23
						//call
						//pcreltotemp
	.lipcrel	_PS2Handler
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//ps2.c, line 24
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
						// freereg r4
	.liconst	-8
	sub	r6
	.lipcrel	.functiontail, 2
	add	r7

.functiontail:
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_ps2_ringbuffer_read
_ps2_ringbuffer_read:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-8
	add	r6
						// allocreg r5
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
						// allocreg r4

						//ps2.c, line 32
						// (bitwise/arithmetic) 	//ops: 6, 0, 5
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	4
	addt	r5
						// (save temp)isreg
	mr	r4
						//save_temp done

						//ps2.c, line 32
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r5
	mr	r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 98
						// deref 
	ld	r4
	cmp	r0

						//ps2.c, line 32
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l10
		add	r7

						//ps2.c, line 33
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	-1
	mr	r0

						//ps2.c, line 34
						//pcreltotemp
	.lipcrel	l8
	add	r7
l10: # 

						//ps2.c, line 34
						//call
						//pcreltotemp
	.lipcrel	_DisableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r3

						//ps2.c, line 35
						// (bitwise/arithmetic) 	//ops: 6, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	16
	addt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done

						//ps2.c, line 35
						// (bitwise/arithmetic) 	//ops: 5, 0, 1
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 74
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	4
	mul	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 35
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags a type a
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
	add	r3
						// (save result) // isreg

						//ps2.c, line 35
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 10
						// matchobj comparing flags 106 with 10
						// deref 
	ld	r3
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 10
	.liconst	255
	and	r3

						//ps2.c, line 36
						// (bitwise/arithmetic) 	//ops: 5, 0, 1
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 1
						// matchobj comparing flags 98 with 10
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 36
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x62
	mt	r0
	st	r4

						//ps2.c, line 37
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//ps2.c, line 38
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 4a type 101
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg
						// freereg r3

						//ps2.c, line 38
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
l8: # 
						// freereg r4
						// freereg r5
	.liconst	-8
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_ps2_ringbuffer_count
_ps2_ringbuffer_count:
	stdec	r6
	.liconst	-8
	add	r6
						// allocreg r2
						// allocreg r1

						//ps2.c, line 43
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//ps2.c, line 43
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r1
	mr	r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 98
						// deref 
	ld	r2
	sgn
	cmp	r0

						//ps2.c, line 43
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l13
		add	r7

						//ps2.c, line 44
						// (bitwise/arithmetic) 	//ops: 2, 3, 1
						// (obj to r0) flags 62 type 403
						// matchobj comparing flags 98 with 98
						// deref 
	ld	r1
	mr	r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 98
						// matchobj comparing flags 98 with 98
						// deref 
	ld	r2
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 44
						//setreturn
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in r0

						//ps2.c, line 45
						//pcreltotemp
	.lipcrel	l11
	add	r7
l13: # 

						//ps2.c, line 45
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 62 type 403
						// deref 
	ld	r1
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	16
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 45
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 10
						// deref 
	ld	r2
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 45
						//setreturn
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in r0
l11: # 
						// freereg r1
						// freereg r2
	.liconst	-8
	sub	r6
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.4
	.global	_PS2Handler
_PS2Handler:
	stdec	r6
	mt	r3
	stdec	r6
	.liconst	-8
	add	r6
						// allocreg r3

						//ps2.c, line 59
						//call
						//pcreltotemp
	.lipcrel	_DisableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes

						//ps2.c, line 61
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 21 type 3
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-32
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//ps2.c, line 62
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 33
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	2048
	and	r1
						// (save result) // isreg
						// freereg r1

						//ps2.c, line 62
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l16
		add	r7
						// allocreg r2

						//ps2.c, line 65
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r2
						// (save result) // isreg

						//ps2.c, line 65
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 403
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_kbbuffer
						//extern deref
						//sizemod based on type 0x403
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	mul	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//ps2.c, line 65
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// matchobj comparing flags 130 with 10
						// (prepobj r1)
 						// matchobj comparing flags 130 with 10
						// extern (offset 16)
	.liabs	_kbbuffer, 16
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags a type a
						// matchobj comparing flags 10 with 130
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
	add	r1
						// (save result) // isreg

						//ps2.c, line 65
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 10
						// matchobj comparing flags 74 with 10
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r2
						// freereg r1

						//ps2.c, line 66
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 403
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 10
						// extern
	.liabs	_kbbuffer
						//extern deref
						//sizemod based on type 0x403
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 66
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_kbbuffer, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l16: # 
						// allocreg r1

						//ps2.c, line 68
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1024
	and	r1
						// (save result) // isreg
						// freereg r1

						//ps2.c, line 68
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l20
		add	r7

						//ps2.c, line 70
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 403
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_kbbuffer, 8
						//extern deref
						//sizemod based on type 0x403
	ldt
	mr	r0
						// (obj to tmp) flags 2 type 403
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_kbbuffer, 12
						//extern deref
						//sizemod based on type 0x403
	ldt
	cmp	r0

						//ps2.c, line 70
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l20
		add	r7

						//ps2.c, line 72
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 403
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_kbbuffer, 8
						//extern deref
						//sizemod based on type 0x403
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	mul	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//ps2.c, line 72
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// matchobj comparing flags 130 with 10
						// (prepobj r1)
 						// matchobj comparing flags 130 with 10
						// extern (offset 80)
	.liabs	_kbbuffer, 80
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags a type a
						// matchobj comparing flags 10 with 130
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
	add	r1
						// (save result) // isreg

						//ps2.c, line 72
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 10
						// matchobj comparing flags 161 with 10
						// deref
						// const to r0
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	-32
	mr	r0
						// (obj to tmp) flags 6a type 503
						// matchobj comparing flags 106 with 1
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1

						//ps2.c, line 73
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 403
						// matchobj comparing flags 2 with 106
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_kbbuffer, 8
						//extern deref
						//sizemod based on type 0x403
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 73
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x2
						// (prepobj tmp)
 						// extern (offset 8)
	.liabs	_kbbuffer, 12
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l20: # 

						//ps2.c, line 92
						//call
						//pcreltotemp
	.lipcrel	_GetInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//ps2.c, line 92
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//ps2.c, line 93
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
	.liconst	-8
	sub	r6
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.global	_PS2Init
_PS2Init:
	stdec	r6
						// allocreg r1

						//ps2.c, line 98
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_kbbuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//ps2.c, line 98
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_init
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//ps2.c, line 102
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_PS2Handler
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//ps2.c, line 102
						//call
						//pcreltotemp
	.lipcrel	_SetIntHandler
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//ps2.c, line 103
						//call
						//pcreltotemp
	.lipcrel	_ClearKeyboard
	add	r7
						// Deferred popping of 0 bytes (0 in total)
	ldinc	r6
	mr	r7

	.section	.bss
	.global	_kbbuffer
	.comm	_kbbuffer,144
