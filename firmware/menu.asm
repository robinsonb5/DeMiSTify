	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_Menu_Draw
_Menu_Draw:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r4
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r3

						//menu.c, line 35
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 64
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//menu.c, line 36
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l3,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 37
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//menu.c, line 37
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l7,0
						// static pe is varadr
	stdec	r6

						//menu.c, line 37
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	8
	add	r6
						// allocreg r1

						//menu.c, line 38
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 62 type 101
						// matchobj comparing flags 98 with 1
						// deref 
	byt
	ld	r3
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//menu.c, line 38
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 98
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//menu.c, line 38
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7
l20: # 
						// allocreg r1

						//menu.c, line 42
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//menu.c, line 42
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	cmp	r5

						//menu.c, line 42
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7

						//menu.c, line 42
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 42
						//pcreltotemp
	.lipcrel	l12
	add	r7
l11: # 

						//menu.c, line 42
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l12: # 

						//menu.c, line 42
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//menu.c, line 42
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 10
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 42
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteStart
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//menu.c, line 43
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 43
						//call
						//pcreltotemp
	.lipcrel	_OsdPutChar
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r2

						//menu.c, line 68
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	4
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//menu.c, line 68
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//menu.c, line 68
						//call
						//pcreltotemp
	.lipcrel	_OsdPuts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//menu.c, line 71
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteEnd
	add	r7
						// Flow control - popping 0 + 0 bytes

						//menu.c, line 72
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l3,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//menu.c, line 73
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	12
	add	r3
						// (save result) // isreg
						// allocreg r1

						//menu.c, line 38
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 62 type 101
						// matchobj comparing flags 98 with 1
						// matchobj comparing flags 98 with 2
						// deref 
	byt
	ld	r3
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//menu.c, line 38
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 98
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//menu.c, line 38
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l20
		add	r7
l22: # 
						// allocreg r1

						//menu.c, line 75
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//menu.c, line 76
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	sgn
	cmp	r5

						//menu.c, line 76
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l23
		add	r7
						// freereg r1
l21: # 

						//menu.c, line 78
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//menu.c, line 78
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	stdec	r6
						// allocreg r1

						//menu.c, line 78
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 78
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteStart
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//menu.c, line 79
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteEnd
	add	r7
						// Flow control - popping 0 + 0 bytes

						//menu.c, line 80
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r5
						// (save result) // isreg

						//menu.c, line 76
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	sgn
	cmp	r5

						//menu.c, line 76
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7
l23: # 
						// allocreg r1

						//menu.c, line 82
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
	stdec	r6

						//menu.c, line 82
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l19,0
						// static pe is varadr
	stdec	r6

						//menu.c, line 82
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 8 bytes (8 in total)
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-12
	sub	r6
.functiontail:
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.rodata
l7:
	.byte	72
	.byte	105
	.byte	103
	.byte	104
	.byte	108
	.byte	105
	.byte	103
	.byte	104
	.byte	116
	.byte	32
	.byte	114
	.byte	111
	.byte	119
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
l19:
	.byte	77
	.byte	101
	.byte	110
	.byte	117
	.byte	32
	.byte	104
	.byte	97
	.byte	115
	.byte	32
	.byte	37
	.byte	100
	.byte	32
	.byte	114
	.byte	111
	.byte	119
	.byte	115
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_Menu_Set
_Menu_Set:
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

						//menu.c, line 88
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l1,4
						// static pe not varadr
						//sizemod based on type 0xa
	stmpdec	r2
						// allocreg r1

						//menu.c, line 89
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 89
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//menu.c, line 90
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l4,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r1

						//menu.c, line 91
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 91
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_Menu_SetHotKeys
_Menu_SetHotKeys:
	stdec	r6
						// allocreg r1

						//menu.c, line 97
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l5,4
						// static pe not varadr
						//sizemod based on type 0xa
	stmpdec	r1
						// freereg r1
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_Menu_Hide
_Menu_Hide:
	stdec	r6
						// allocreg r1

						//menu.c, line 102
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	64
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 102
						//call
						//pcreltotemp
	.lipcrel	_spi_osd_cmd
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//menu.c, line 103
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l2,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
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
	.section	.text.4
	.global	_do_joy
_do_joy:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r4
						// allocreg r3
						// allocreg r1

						//menu.c, line 109
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-24
						//sizemod based on type 0x503
	ldt
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//menu.c, line 110
						// (bitwise/arithmetic) 	//ops: 2, 0, 4
						// (obj to r3) flags 4a type 3
						// matchobj comparing flags 74 with 33
						// reg r1 - only match against tmp
	mt	r1
	mr	r3
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r3
						// (save result) // isreg

						//menu.c, line 111
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
	sgn
	shr	r4
						// (save result) // isreg

						//menu.c, line 111
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r4
						// (save result) // isreg
						// freereg r1
						// allocreg r1

						//menu.c, line 113
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	90
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 113
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 113
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 113
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l29
		add	r7
						// allocreg r1

						//menu.c, line 114
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	128
	or	r3
						// (save result) // isreg
						// freereg r1
l29: # 
						// allocreg r1

						//menu.c, line 115
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	89
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 115
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 115
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 115
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l31
		add	r7
						// allocreg r1

						//menu.c, line 116
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	64
	or	r3
						// (save result) // isreg
						// freereg r1
l31: # 
						// allocreg r1

						//menu.c, line 117
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	148
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 117
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 117
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 117
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l33
		add	r7
						// allocreg r1

						//menu.c, line 118
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	16
	or	r3
						// (save result) // isreg
						// freereg r1
l33: # 
						// allocreg r1

						//menu.c, line 119
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	145
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 119
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 119
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 119
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l35
		add	r7
						// allocreg r1

						//menu.c, line 120
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	32
	or	r3
						// (save result) // isreg
						// freereg r1
l35: # 
						// allocreg r1

						//menu.c, line 121
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	245
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 121
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 121
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 121
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l37
		add	r7
						// allocreg r1

						//menu.c, line 122
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l37: # 
						// allocreg r1

						//menu.c, line 123
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	242
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 123
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 123
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 123
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7
						// allocreg r1

						//menu.c, line 124
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4
	or	r3
						// (save result) // isreg
						// freereg r1
l39: # 
						// allocreg r1

						//menu.c, line 125
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	235
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 125
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 125
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 125
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l41
		add	r7
						// allocreg r1

						//menu.c, line 126
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	or	r3
						// (save result) // isreg
						// freereg r1
l41: # 
						// allocreg r1

						//menu.c, line 127
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	244
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 127
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 127
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 127
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l43
		add	r7
						// allocreg r1

						//menu.c, line 128
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	or	r3
						// (save result) // isreg
						// freereg r1
l43: # 
						// allocreg r1

						//menu.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	88
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 130
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 130
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 130
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l45
		add	r7
						// allocreg r1

						//menu.c, line 131
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	128
	or	r4
						// (save result) // isreg
						// freereg r1
l45: # 
						// allocreg r1

						//menu.c, line 132
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	18
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 132
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 132
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 132
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l47
		add	r7
						// allocreg r1

						//menu.c, line 133
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	64
	or	r4
						// (save result) // isreg
						// freereg r1
l47: # 
						// allocreg r1

						//menu.c, line 134
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	20
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 134
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 134
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 134
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l49
		add	r7
						// allocreg r1

						//menu.c, line 135
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	16
	or	r4
						// (save result) // isreg
						// freereg r1
l49: # 
						// allocreg r1

						//menu.c, line 136
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	17
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 136
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 136
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 136
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l51
		add	r7
						// allocreg r1

						//menu.c, line 137
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	32
	or	r4
						// (save result) // isreg
						// freereg r1
l51: # 
						// allocreg r1

						//menu.c, line 138
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	29
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 138
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 138
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 138
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l53
		add	r7
						// allocreg r1

						//menu.c, line 139
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
l53: # 
						// allocreg r1

						//menu.c, line 140
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	27
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 140
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 140
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 140
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l55
		add	r7
						// allocreg r1

						//menu.c, line 141
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4
	or	r4
						// (save result) // isreg
						// freereg r1
l55: # 
						// allocreg r1

						//menu.c, line 142
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	28
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 142
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 142
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 142
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//menu.c, line 143
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	or	r4
						// (save result) // isreg
						// freereg r1
l57: # 
						// allocreg r1

						//menu.c, line 144
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	35
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 144
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 144
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//menu.c, line 144
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l59
		add	r7
						// allocreg r1

						//menu.c, line 145
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	or	r4
						// (save result) // isreg
						// freereg r1
l59: # 

						//menu.c, line 147
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//menu.c, line 147
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 147
						//call
						//pcreltotemp
	.lipcrel	_user_io_digital_joystick_ext
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//menu.c, line 148
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6
						// allocreg r1

						//menu.c, line 148
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 148
						//call
						//pcreltotemp
	.lipcrel	_user_io_digital_joystick_ext
	add	r7
						// Deferred popping of 4 bytes (8 in total)
						// freereg r1
						// freereg r3
						// freereg r4
	.liconst	-8
	sub	r6
	.lipcrel	.functiontail, 2
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.global	_Menu_Run
_Menu_Run:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-16
	add	r6
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2

						//menu.c, line 155
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 156
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 12, 0 with 8, 0
						//Fuzzy match found, offset: 4 (varadr: 1)
	.liconst	4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 157
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 130
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 130
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	-20
						//sizemod based on type 0x503
	ldt
						//Saving to reg r6
						// (save temp)store type 3
	st	r6
						//save_temp done

						//menu.c, line 158
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 33
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 4, 0 with 12, 0
						//Fuzzy match found, offset: -8 (varadr: 1)
	.liconst	-8
	add	r0

						// required value found in r0
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)store type a
	st	r0
						//save_temp done

						//menu.c, line 159
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l5,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//menu.c, line 161
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	7
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 161
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 161
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//menu.c, line 161
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//menu.c, line 161
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l61
		add	r7
						// allocreg r1

						//menu.c, line 161
						//comp
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_prevbuttons
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// matchobj comparing flags 1 with 2
	.liconst	-1
	xor	r1
						// (save result) // isreg

						//menu.c, line 161
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
	and	r1
						// (save result) // isreg

						//menu.c, line 161
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	and	r1
						// (save result) // isreg
						// freereg r1

						//menu.c, line 161
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l62
		add	r7
						// freereg r2
l61: # 
						// allocreg r2

						//menu.c, line 163
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	xor	r2
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l2,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2
						// allocreg r1

						//menu.c, line 163
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	64
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//menu.c, line 163
						//call
						//pcreltotemp
	.lipcrel	_spi_osd_cmd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//menu.c, line 164
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
l62: # 
						// allocreg r2
						// allocreg r1

						//menu.c, line 166
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_prevbuttons
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 168
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//menu.c, line 168
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l65
		add	r7
						// freereg r1

						//menu.c, line 170
						//call
						//pcreltotemp
	.lipcrel	_do_joy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//menu.c, line 172
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	253
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 172
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 173
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	250
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 173
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//menu.c, line 175
						//setreturn
						// (obj to r0) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0

						//menu.c, line 176
						//pcreltotemp
	.lipcrel	l60
	add	r7
l65: # 
						// allocreg r1

						//menu.c, line 178
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	245
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 178
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 178
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//menu.c, line 178
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//menu.c, line 178
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l67
		add	r7
						// allocreg r1

						//menu.c, line 180
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//menu.c, line 180
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l69
		add	r7

						//menu.c, line 181
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l4,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//menu.c, line 182
						//pcreltotemp
	.lipcrel	l72
	add	r7
						// freereg r1
l69: # 
						// allocreg r1

						//menu.c, line 182
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	12
	mul	r1
						// (save result) // isreg

						//menu.c, line 182
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//menu.c, line 182
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1

						//menu.c, line 182
						// (test)
						// (obj to tmp) flags 22 type 4
						// matchobj comparing flags 34 with 2
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x4
	ldt

						//menu.c, line 182
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l72
		add	r7
						// freereg r3
						// allocreg r3

						//menu.c, line 183
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 34

			// required value found in tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//menu.c, line 183
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	-1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 183
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 1
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l72: # 
						// allocreg r3
						// allocreg r1

						//menu.c, line 184
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l67: # 
						// allocreg r1

						//menu.c, line 187
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	242
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 187
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 187
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//menu.c, line 187
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//menu.c, line 187
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l74
		add	r7
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//menu.c, line 189
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	1
	sub	r1
						// (save result) // isreg
						// (a/p assign)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//menu.c, line 189
						// Q2 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
	sgn
	cmp	r1
						// freereg r1

						//menu.c, line 189
	cond	LE
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l76
		add	r7
						// allocreg r1

						//menu.c, line 190
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l4,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//menu.c, line 191
						//pcreltotemp
	.lipcrel	l79
	add	r7
						// freereg r1
l76: # 
						// allocreg r1

						//menu.c, line 191
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	12
	mul	r1
						// (save result) // isreg

						//menu.c, line 191
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//menu.c, line 191
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1

						//menu.c, line 191
						// (test)
						// (obj to tmp) flags 22 type 4
						// matchobj comparing flags 34 with 2
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x4
	ldt

						//menu.c, line 191
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l79
		add	r7
						// freereg r3
						// allocreg r3

						//menu.c, line 192
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 34

			// required value found in tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//menu.c, line 192
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	-2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 192
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 1
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l79: # 
						// allocreg r3
						// allocreg r1

						//menu.c, line 193
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l74: # 
						// allocreg r1

						//menu.c, line 196
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	253
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 196
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 196
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//menu.c, line 196
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//menu.c, line 196
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l81
		add	r7
						// allocreg r1

						//menu.c, line 198
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//menu.c, line 198
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l83
		add	r7

						//menu.c, line 199
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l4,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 200
						//pcreltotemp
	.lipcrel	l86
	add	r7
						// freereg r1
l83: # 
						// allocreg r1

						//menu.c, line 200
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	12
	mul	r1
						// (save result) // isreg

						//menu.c, line 200
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//menu.c, line 200
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1

						//menu.c, line 200
						// (test)
						// (obj to tmp) flags 22 type 4
						// matchobj comparing flags 34 with 2
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x4
	ldt

						//menu.c, line 200
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l86
		add	r7
						// freereg r3
						// allocreg r3

						//menu.c, line 201
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 34

			// required value found in tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//menu.c, line 201
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	-3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 201
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 1
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l86: # 
						// allocreg r3
						// allocreg r1

						//menu.c, line 202
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l81: # 
						// allocreg r1

						//menu.c, line 205
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	250
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 205
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 205
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//menu.c, line 205
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//menu.c, line 205
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l88
		add	r7
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 207
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//menu.c, line 207
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
	sgn
	cmp	r0

						//menu.c, line 207
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l90
		add	r7
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l4,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 209
						//pcreltotemp
	.lipcrel	l93
	add	r7
						// freereg r1
l90: # 
						// allocreg r1

						//menu.c, line 209
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	12
	mul	r1
						// (save result) // isreg

						//menu.c, line 209
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//menu.c, line 209
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1

						//menu.c, line 209
						// (test)
						// (obj to tmp) flags 22 type 4
						// matchobj comparing flags 34 with 2
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x4
	ldt

						//menu.c, line 209
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l93
		add	r7
						// freereg r3
						// allocreg r3

						//menu.c, line 210
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 34

			// required value found in tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//menu.c, line 210
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	-4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 210
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 1
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l93: # 
						// allocreg r3
						// allocreg r1

						//menu.c, line 211
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
l88: # 

						//menu.c, line 215
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//menu.c, line 216
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r3

						//menu.c, line 216
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l124
		add	r7
l121: # 

						//menu.c, line 219
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r3
						// (save result) // isreg

						//menu.c, line 216
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	sgn
	cmp	r3

						//menu.c, line 216
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l121
		add	r7
l124: # 
						// freereg r1
						// allocreg r1

						//menu.c, line 254
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	90
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 254
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 254
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//menu.c, line 254
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 4
						// (obj to r3) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mr	r3
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r3
						// (save result) // isreg
						// freereg r1

						//menu.c, line 254
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//menu.c, line 254
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7
						// allocreg r1

						//menu.c, line 256
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 66
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//menu.c, line 257
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
	stdec	r6

						//menu.c, line 257
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//menu.c, line 257
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l99,0
						// static pe is varadr
	stdec	r6

						//menu.c, line 257
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 12 + 0 bytes
	.liconst	12
	add	r6

						//menu.c, line 258
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//menu.c, line 259
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r3

						//menu.c, line 259
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l125
		add	r7
l122: # 

						//menu.c, line 261
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	12
	add	r5
						// (save result) // isreg

						//menu.c, line 262
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r3
						// (save result) // isreg

						//menu.c, line 259
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	sgn
	cmp	r3

						//menu.c, line 259
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l122
		add	r7
l125: # 

						//menu.c, line 265
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 62 type 101
						// deref 
	byt
	ld	r5
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	1
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l105
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l108
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r2
						// (save result) // isreg
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r2

						//menu.c, line 267
						// (bitwise/arithmetic) 	//ops: 6, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r5
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//menu.c, line 267
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//menu.c, line 267
						//call
						//pcreltotemp
	.lipcrel	_Menu_Set
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//menu.c, line 268
						//pcreltotemp
	.lipcrel	l111
	add	r7
						// freereg r3
l105: # 
						// allocreg r2
						// allocreg r3

						//menu.c, line 270
						// (bitwise/arithmetic) 	//ops: 6, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	8
	addt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done

						//menu.c, line 270
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 6a type 4
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r3
	stdec	r6

						//menu.c, line 270
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 106
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 106
						// static
	.liabs	l106,0
						// static pe is varadr
	stdec	r6

						//menu.c, line 270
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6

						//menu.c, line 271
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//menu.c, line 271
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 106
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 271
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 2
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1

						//menu.c, line 272
						//pcreltotemp
	.lipcrel	l111
	add	r7
l107: # 
						// allocreg r3
						// allocreg r1

						//menu.c, line 274
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	8
	addt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 274
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	mr	r0
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 1
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r1
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//menu.c, line 275
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_menu_toggle_bits
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	xor	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menu_toggle_bits, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//menu.c, line 276
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 277
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 8, 0 with 12, 0
						//Fuzzy match found, offset: -4 (varadr: 1)
	.liconst	-4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 278
						//pcreltotemp
	.lipcrel	l111
	add	r7
						// freereg r2
l108: # 
						// allocreg r1

						//menu.c, line 280
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	8
	addt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 280
						// (bitwise/arithmetic) 	//ops: 6, 0, 1
						//Special case - addt
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	11
	addt	r5
						// (save temp)store type a
	st	r6
						//save_temp done
						// allocreg r2

						//menu.c, line 280
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 22 type 101
						// matchobj comparing flags 34 with 2
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x101
	byt
	ldt
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//menu.c, line 280
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	1
	addt	r2
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r2

						//menu.c, line 281
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 101
						// matchobj comparing flags 106 with 66
						// deref 
	byt
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//menu.c, line 281
						// Q2 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	mt	r1
	sgn
	cmp	r3
						// freereg r1

						//menu.c, line 281
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l110
		add	r7
						// allocreg r2
						// allocreg r1

						//menu.c, line 282
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l110: # 

						//menu.c, line 283
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
	exg	r3
						//sizemod based on type 0x101
	byt
	st	r3
	exg	r3

						//menu.c, line 284
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//menu.c, line 285
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 8, 0 with 12, 0
						//Fuzzy match found, offset: -4 (varadr: 1)
	.liconst	-4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
l111: # 

						//menu.c, line 293
						// (test)
						// (obj to tmp) flags 42 type a
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//menu.c, line 293
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l126
		add	r7

						//menu.c, line 293
						// (test)
						// (obj to tmp) flags 62 type 3
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r4

						//menu.c, line 293
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l126
		add	r7
						// freereg r1
l123: # 
						// allocreg r1

						//menu.c, line 295
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 3
						// deref 
	ld	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 295
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//menu.c, line 295
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//menu.c, line 295
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	and	r1
						// (save result) // isreg
						// freereg r1

						//menu.c, line 295
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l117
		add	r7
						// freereg r3
						// allocreg r3

						//menu.c, line 296
						// (bitwise/arithmetic) 	//ops: 5, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r4
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//menu.c, line 296
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 296
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 2
						// deref 
	ld	r3
						// (save temp)isreg
	mr	r3
						//save_temp done

						//menu.c, line 296
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 106
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l117: # 
						// allocreg r3
						// allocreg r1

						//menu.c, line 297
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	8
	add	r4
						// (save result) // isreg

						//menu.c, line 293
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l126
		add	r7

						//menu.c, line 293
						// (test)
						// (obj to tmp) flags 62 type 3
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r4

						//menu.c, line 293
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l123
		add	r7
						// freereg r1
l126: # 
						// allocreg r1

						//menu.c, line 307
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6

						//menu.c, line 307
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l120
		add	r7
						// freereg r1
						// allocreg r1

						//menu.c, line 308
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//menu.c, line 308
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l120: # 
						// allocreg r1

						//menu.c, line 309
						//setreturn
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
l60: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-16
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l106:
	.byte	67
	.byte	97
	.byte	108
	.byte	108
	.byte	98
	.byte	97
	.byte	99
	.byte	107
	.byte	32
	.byte	37
	.byte	120
	.byte	10
	.byte	0
l99:
	.byte	69
	.byte	110
	.byte	116
	.byte	101
	.byte	114
	.byte	32
	.byte	100
	.byte	101
	.byte	116
	.byte	101
	.byte	99
	.byte	116
	.byte	101
	.byte	100
	.byte	32
	.byte	37
	.byte	100
	.byte	32
	.byte	45
	.byte	32
	.byte	99
	.byte	117
	.byte	114
	.byte	114
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	111
	.byte	119
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	.section	.data
	.global	_prevbuttons
_prevbuttons:
	.int	0
	.section	.bss
	.global	_menu_toggle_bits
	.comm	_menu_toggle_bits,4
	.section	.data
l2:
	.int	0
	.section	.bss
	.lcomm	l1,4
	.lcomm	l3,4
	.lcomm	l4,4
	.lcomm	l5,4
