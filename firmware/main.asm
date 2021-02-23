	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_conf_nextfield
_conf_nextfield:
	stdec	r6
l6: # 
						// allocreg r1

						//main.c, line 39
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 39
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 3
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ld	r0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 40
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 33
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//main.c, line 40
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l7
		add	r7

						//main.c, line 40
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	59
	cmp	r1

						//main.c, line 40
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l6
		add	r7
l7: # 

						//main.c, line 41
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_copytocomma
_copytocomma:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
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
						// allocreg r4
						// allocreg r3
						// allocreg r1

						//main.c, line 49
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//main.c, line 51
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 51
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 3
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ld	r0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 52
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 33
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//main.c, line 52
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l27
		add	r7

						//main.c, line 52
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	44
	cmp	r1

						//main.c, line 52
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l27
		add	r7

						//main.c, line 52
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	59
	cmp	r1

						//main.c, line 52
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l27
		add	r7
l26: # 

						//main.c, line 54
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
	ldidx	r6
	sgn
	cmp	r3

						//main.c, line 54
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l15
		add	r7

						//main.c, line 54
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
	ldidx	r6

						//main.c, line 54
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l15
		add	r7

						//main.c, line 55
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// reg r2 - no need to prep
	mt	r2
	exg	r1
						//sizemod based on type 0x101
	byt
	st	r1
	exg	r1

						//main.c, line 55
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	1
	add	r2
						// (save result) // isreg
l15: # 

						//main.c, line 56
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//main.c, line 56
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l18
		add	r7

						//main.c, line 57
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	add	r3
						// (save result) // isreg
l18: # 

						//main.c, line 58
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 58
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 3
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ld	r0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 52
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 33
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//main.c, line 52
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l27
		add	r7

						//main.c, line 52
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	44
	cmp	r1

						//main.c, line 52
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l27
		add	r7

						//main.c, line 52
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	59
	cmp	r1

						//main.c, line 52
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l26
		add	r7
l27: # 

						//main.c, line 60
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	16
	ldidx	r6

						//main.c, line 60
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7

						//main.c, line 61
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 1
	byt
	st	r2
						//save_temp done
l22: # 

						//main.c, line 62
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	59
	cmp	r1

						//main.c, line 62
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l24
		add	r7

						//main.c, line 62
						// (minus)
						// (obj to r4) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r4
						// matchobj comparing flags 1 with 66
	.liconst	0
	exg r4
	sub r4
						// (save result) // isreg

						//main.c, line 62
						//pcreltotemp
	.lipcrel	l25
	add	r7
l24: # 

						//main.c, line 62
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r4
						//save_temp done
l25: # 

						//main.c, line 62
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
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
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_getdigit
_getdigit:
	stdec	r6
						// allocreg r1

						//main.c, line 68
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 68
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x503
	ld	r0
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//main.c, line 70
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 1
	.liconst	48
	sgn
	cmp	r1

						//main.c, line 70
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l30
		add	r7

						//main.c, line 70
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	57
	sgn
	cmp	r1

						//main.c, line 70
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l30
		add	r7

						//main.c, line 71
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	48
	sub	r1
						// (save result) // isreg
l30: # 

						//main.c, line 72
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	65
	sgn
	cmp	r1

						//main.c, line 72
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l33
		add	r7

						//main.c, line 72
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	70
	sgn
	cmp	r1

						//main.c, line 72
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l33
		add	r7

						//main.c, line 73
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	55
	sub	r1
						// (save result) // isreg
l33: # 

						//main.c, line 74
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_matchextension
_matchextension:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-12
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
						// allocreg r5
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2
						// allocreg r1

						//main.c, line 80
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 81
						// (a/p assign)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r6
						//save_temp done

						//main.c, line 85
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 86
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 86
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 86
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l69
		add	r7
l65: # 

						//main.c, line 86
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 86
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 86
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l65
		add	r7
l69: # 

						//main.c, line 86
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	33
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 87
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	20
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 91
						//call
						//pcreltotemp
	.lipcrel	_conf_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 91
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//main.c, line 91
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r1 - only match against tmp
				// flags 42
	and	r1

						//main.c, line 91
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l70
		add	r7

						//main.c, line 93
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 93
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 130
						// matchobj comparing flags 608 with 130
						// deref 
	ld	r3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 94
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 608
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	59
	cmp	r0

						//main.c, line 94
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l41
		add	r7

						//main.c, line 94
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_romtype
						//extern deref
						//sizemod based on type 0x3
	ldt

						//main.c, line 94
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l70
		add	r7
l41: # 

						//main.c, line 96
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 97
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//main.c, line 97
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l70
		add	r7
l66: # 

						//main.c, line 99
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	59
	cmp	r1

						//main.c, line 99
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l48
		add	r7

						//main.c, line 100
						//call
						//pcreltotemp
	.lipcrel	_conf_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes
l48: # 

						//main.c, line 101
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 101
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 103
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	70
	cmp	r1

						//main.c, line 103
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l50
		add	r7

						//main.c, line 105
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 106
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 106
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 130
						// matchobj comparing flags 608 with 130
						// deref 
	ld	r3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 107
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 108
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r5
						//save_temp done
l50: # 

						//main.c, line 97
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//main.c, line 97
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l66
		add	r7
l70: # 

						//main.c, line 115
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 115
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l71
		add	r7
						// freereg r1
l67: # 

						//main.c, line 117
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 117
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 118
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 118
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 130
						// matchobj comparing flags 608 with 130
						// deref 
	ld	r3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 120
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 608
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
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
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//main.c, line 121
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 121
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 301
						// matchobj comparing flags 106 with 74
						// matchobj comparing flags 106 with 2
						// deref 
	byt
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//main.c, line 121
						// Q2 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 106
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	cmp	r1
						// freereg r1

						//main.c, line 121
	cond	NEQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l55
		add	r7
						// allocreg r1

						//main.c, line 121
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	9
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 121
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 301
						// matchobj comparing flags 106 with 74
						// matchobj comparing flags 106 with 2
						// deref 
	byt
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//main.c, line 121
						// Q2 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	cmp	r2
						// freereg r1

						//main.c, line 121
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l55
		add	r7
						// allocreg r1

						//main.c, line 121
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 2
	.liconst	10
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 121
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 301
						// matchobj comparing flags 106 with 74
						// matchobj comparing flags 106 with 2
						// deref 
	byt
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//main.c, line 121
						// Q2 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 106
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 2
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	cmp	r1
						// freereg r1

						//main.c, line 121
	cond	NEQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l55
		add	r7
						// allocreg r1

						//main.c, line 122
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 123
						//pcreltotemp
	.lipcrel	l60
	add	r7
l55: # 

						//main.c, line 123
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	44
	cmp	r0

						//main.c, line 123
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l59
		add	r7

						//main.c, line 123
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	59
	cmp	r0

						//main.c, line 123
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l60
		add	r7
l59: # 

						//main.c, line 125
						// (a/p assign)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done

						//main.c, line 126
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
l60: # 

						//main.c, line 128
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 128
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 130
						// matchobj comparing flags 608 with 130
						// deref 
	ld	r3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 115
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 608
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 115
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l67
		add	r7
						// freereg r1
l71: # 
						// allocreg r1

						//main.c, line 130
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 130
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 130
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l72
		add	r7
l68: # 

						//main.c, line 130
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 130
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 130
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l68
		add	r7
l72: # 

						//main.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 132
						//setreturn
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	-12
	sub	r6
	.lipcrel	.functiontail, 0
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
	.section	.text.4
	.global	_VerifyROM
_VerifyROM:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-48
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32768
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 142
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_file, 4
						//extern deref
						//sizemod based on type 0x103
	ldt
						//Saving to reg r5
						// (save temp)isreg
	mr	r5
						//save_temp done
						//No need to mask - same size

						//main.c, line 144
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 2
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 144
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 144
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l109
		add	r7
l101: # 

						//main.c, line 144
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 144
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 144
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l101
		add	r7
l109: # 

						//main.c, line 144
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	5
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 145
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	83
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 146
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 147
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 147
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 147
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l110
		add	r7
l102: # 

						//main.c, line 147
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 147
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 147
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l102
		add	r7
l110: # 

						//main.c, line 147
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 149
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 149
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 149
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7
l103: # 

						//main.c, line 149
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 149
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 149
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l103
		add	r7
l111: # 

						//main.c, line 149
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	273
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 150
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 150
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l112
		add	r7
						// freereg r4
l104: # 

						//main.c, line 152
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	512
	sgn
	cmp	r5

						//main.c, line 152
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7

						//main.c, line 154
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 155
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r5
						// (save result) // isreg

						//main.c, line 158
						//pcreltotemp
	.lipcrel	l88
	add	r7
l87: # 

						//main.c, line 159
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 160
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done
l88: # 
						// allocreg r1

						//main.c, line 162
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 162
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r2
						// (save result) // isreg

						//main.c, line 162
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//main.c, line 162
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l113
		add	r7
l105: # 

						//main.c, line 164
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//main.c, line 162
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 162
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r2
						// (save result) // isreg

						//main.c, line 162
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//main.c, line 162
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l105
		add	r7
l113: # 

						//main.c, line 166
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 167
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 150
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 150
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l104
		add	r7
l112: # 
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	32768
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 169
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 169
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 169
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l114
		add	r7
l106: # 

						//main.c, line 169
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 169
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 169
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l106
		add	r7
l114: # 

						//main.c, line 169
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	16
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 171
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 171
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 171
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l115
		add	r7
l107: # 

						//main.c, line 171
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 171
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 171
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
l115: # 

						//main.c, line 171
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	5
						// (save temp)store type 3
	st	r3
						//save_temp done

						//main.c, line 172
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	83
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 173
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 174
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 174
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 174
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l116
		add	r7
l108: # 

						//main.c, line 174
						// (bitwise/arithmetic) 	//ops: 4, 3, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r2 - only match against tmp
	mt	r2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 174
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 174
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l108
		add	r7
l116: # 

						//main.c, line 174
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	4
						// (save temp)store type 3
	st	r3
						//save_temp done
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
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
	.global	_LoadROM
_LoadROM:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-12
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
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-48
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32768
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//main.c, line 179
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	stdec	r6
						// allocreg r1

						//main.c, line 179
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 179
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//main.c, line 179
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//main.c, line 179
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l119
		add	r7

						//main.c, line 181
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_file, 4
						//extern deref
						//sizemod based on type 0x103
	ldt
						//Saving to reg r6
						// (save temp)store type 3
	st	r6
						//save_temp done
						// allocreg r1

						//main.c, line 183
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 183
						//call
						//pcreltotemp
	.lipcrel	_matchextension
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//main.c, line 183
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 184
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	stdec	r6
						// allocreg r1

						//main.c, line 184
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 184
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	stdec	r6
						// freereg r1

						//main.c, line 184
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l120,0
						// static pe is varadr
	stdec	r6

						//main.c, line 184
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 12 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	12
	add	r6

						//main.c, line 186
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 186
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 186
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l168
		add	r7
l158: # 
						// allocreg r1

						//main.c, line 186
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 186
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 186
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l158
		add	r7
l168: # 
						// freereg r1
						// freereg r2

						//main.c, line 186
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//main.c, line 187
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	85
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//main.c, line 188
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_romtype
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r1
						// (save result) // isreg
						// allocreg r2

						//main.c, line 188
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r2
						// (save result) // isreg

						//main.c, line 188
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	6
	shl	r2
						// (save result) // isreg

						//main.c, line 188
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 74
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 74
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r2
						// freereg r1

						//main.c, line 189
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 189
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 189
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l169
		add	r7
l159: # 
						// allocreg r2
						// allocreg r1

						//main.c, line 189
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 189
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 189
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l159
		add	r7
l169: # 

						//main.c, line 189
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	4
						// (save temp)store type 3
	st	r4
						//save_temp done

						//main.c, line 191
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 193
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 193
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 193
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l170
		add	r7
l160: # 

						//main.c, line 193
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 193
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 193
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l160
		add	r7
l170: # 

						//main.c, line 193
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//main.c, line 194
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	83
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 195
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 196
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 196
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 196
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l171
		add	r7
l161: # 

						//main.c, line 196
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 196
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 196
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l161
		add	r7
l171: # 

						//main.c, line 196
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	4
						// (save temp)store type 3
	st	r4
						//save_temp done

						//main.c, line 198
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6

						//main.c, line 198
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l172
		add	r7
						// freereg r1
l162: # 

						//main.c, line 200
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 202
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130

			// required value found in tmp
	stdec	r6
						// allocreg r1

						//main.c, line 202
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 202
						//call
						//pcreltotemp
	.lipcrel	_FileRead
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//main.c, line 202
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//main.c, line 202
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l137
		add	r7
						// allocreg r1

						//main.c, line 203
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//main.c, line 205
						//pcreltotemp
	.lipcrel	l117
	add	r7
l137: # 

						//main.c, line 205
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	512
	sgn
	cmp	r0

						//main.c, line 205
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l139
		add	r7

						//main.c, line 207
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 208
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	512
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

						//main.c, line 211
						//pcreltotemp
	.lipcrel	l140
	add	r7
l139: # 

						//main.c, line 212
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 213
						// (a/p assign)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done
l140: # 

						//main.c, line 216
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 216
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 216
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l173
		add	r7
l163: # 

						//main.c, line 216
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 216
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 216
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l163
		add	r7
l173: # 
						// freereg r1

						//main.c, line 216
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	13
						// (save temp)store type 3
	st	r4
						//save_temp done

						//main.c, line 217
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	84
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//main.c, line 218
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 218
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r2
						// (save result) // isreg

						//main.c, line 218
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//main.c, line 218
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l174
		add	r7
l164: # 

						//main.c, line 220
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 6a type 101
						// deref 
	ldbinc	r5
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 106
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 106
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// allocreg r1

						//main.c, line 218
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 218
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r2
						// (save result) // isreg

						//main.c, line 218
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//main.c, line 218
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l164
		add	r7
l174: # 
						// allocreg r1

						//main.c, line 222
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 222
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 222
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l175
		add	r7
l165: # 

						//main.c, line 222
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 222
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 222
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l165
		add	r7
l175: # 
						// freereg r1

						//main.c, line 222
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	4
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//main.c, line 224
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 224
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//main.c, line 198
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6

						//main.c, line 198
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l162
		add	r7
l172: # 
						// allocreg r1

						//main.c, line 228
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 228
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 228
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l176
		add	r7
l166: # 

						//main.c, line 228
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 228
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 228
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l166
		add	r7
l176: # 

						//main.c, line 228
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//main.c, line 229
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	83
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 230
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 231
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 231
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 231
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l177
		add	r7
l167: # 

						//main.c, line 231
						// (bitwise/arithmetic) 	//ops: 5, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 608
						// matchobj comparing flags 576 with 608
						// reg r3 - only match against tmp
	mt	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 576
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 231
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 231
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l167
		add	r7
l177: # 

						//main.c, line 231
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	4
						// (save temp)store type 3
	st	r4
						//save_temp done

						//main.c, line 234
						//pcreltotemp
	.lipcrel	l156
	add	r7
l119: # 

						//main.c, line 235
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// reg r5 - only match against tmp
	mt	r5
	stdec	r6

						//main.c, line 235
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l157,0
						// static pe is varadr
	stdec	r6

						//main.c, line 235
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6

						//main.c, line 236
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//main.c, line 237
						//pcreltotemp
	.lipcrel	l117
	add	r7
l156: # 

						//main.c, line 238
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	1
	mr	r0
l117: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-12
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l120:
	.byte	79
	.byte	112
	.byte	101
	.byte	110
	.byte	101
	.byte	100
	.byte	32
	.byte	102
	.byte	105
	.byte	108
	.byte	101
	.byte	44
	.byte	32
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	37
	.byte	115
	.byte	44
	.byte	32
	.byte	40
	.byte	105
	.byte	100
	.byte	120
	.byte	32
	.byte	37
	.byte	100
	.byte	41
	.byte	46
	.byte	46
	.byte	46
	.byte	10
	.byte	0
l157:
	.byte	67
	.byte	97
	.byte	110
	.byte	39
	.byte	116
	.byte	32
	.byte	111
	.byte	112
	.byte	101
	.byte	110
	.byte	32
	.byte	37
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
	.section	.text.6
	.global	_spin
_spin:
	stdec	r6
						// allocreg r2
						// allocreg r1

						//main.c, line 245
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done
l183: # 

						//main.c, line 246
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 21 type 3
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 246
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
	.liconst	1
	add	r1
						// (save result) // isreg

						//main.c, line 246
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1024
	sgn
	cmp	r1

						//main.c, line 246
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l183
		add	r7
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.7
l190:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r2
						// allocreg r1

						//main.c, line 274
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//main.c, line 276
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//main.c, line 276
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l192,0
						// static pe is varadr
	stdec	r6

						//main.c, line 276
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6

						//main.c, line 277
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 278
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sgn
	cmp	r3

						//main.c, line 278
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l203
		add	r7
l202: # 

						//main.c, line 279
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_matchextension
						// extern pe is varadr
	stdec	r6

						//main.c, line 279
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 279
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l197
		add	r7

						//main.c, line 279
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 279
						//pcreltotemp
	.lipcrel	l198
	add	r7
l197: # 

						//main.c, line 279
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
l198: # 
						// allocreg r1

						//main.c, line 279
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 279
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//main.c, line 279
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//main.c, line 280
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//main.c, line 281
						// (test)
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6

						//main.c, line 281
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l201
		add	r7
						// allocreg r1

						//main.c, line 282
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r4
						//save_temp done
l201: # 

						//main.c, line 278
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r5
						// (save result) // isreg

						//main.c, line 278
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	sgn
	cmp	r4

						//main.c, line 278
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l202
		add	r7
l203: # 

						//main.c, line 284
						//setreturn
						// (obj to r0) flags 2 type a
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l192:
	.byte	76
	.byte	111
	.byte	111
	.byte	107
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	102
	.byte	111
	.byte	114
	.byte	32
	.byte	102
	.byte	105
	.byte	108
	.byte	101
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.8
	.global	_selectrom
_selectrom:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
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
						// allocreg r2

						//main.c, line 290
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//main.c, line 290
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	stdec	r6

						//main.c, line 290
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l205,0
						// static pe is varadr
	stdec	r6

						//main.c, line 290
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 12 bytes (12 in total)
						// allocreg r1

						//main.c, line 292
						// (bitwise/arithmetic) 	//ops: 0, 5, 2
						// (obj to r1) flags 2 type 3
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	add	r1
						// (save result) // isreg

						//main.c, line 292
						//call
						//pcreltotemp
	.lipcrel	l190
	add	r7
						// Deferred popping of 0 bytes (12 in total)
						// freereg r1

						//main.c, line 292
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//main.c, line 293
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r5 - only match against tmp
	stdec	r6

						//main.c, line 293
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l206,0
						// static pe is varadr
	stdec	r6

						//main.c, line 293
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 12 bytes
	.liconst	20
	add	r6

						//main.c, line 294
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 294
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l208
		add	r7
						// freereg r2
						// freereg r3
						// allocreg r3

						//main.c, line 296
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//main.c, line 296
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//main.c, line 296
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	11
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 296
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1
						// allocreg r1

						//main.c, line 297
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 297
						//call
						//pcreltotemp
	.lipcrel	_LoadROM
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l208: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//main.c, line 300
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l189,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 300
						//call
						//pcreltotemp
	.lipcrel	_Menu_Set
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//main.c, line 301
						//call
						//pcreltotemp
	.lipcrel	_Menu_Hide
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l206:
	.byte	70
	.byte	105
	.byte	108
	.byte	101
	.byte	32
	.byte	37
	.byte	115
	.byte	10
	.byte	0
l205:
	.byte	83
	.byte	101
	.byte	108
	.byte	101
	.byte	99
	.byte	116
	.byte	101
	.byte	100
	.byte	32
	.byte	102
	.byte	114
	.byte	111
	.byte	109
	.byte	32
	.byte	37
	.byte	100
	.byte	32
	.byte	43
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.9
l209:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r2
						// allocreg r1

						//main.c, line 308
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	add	r1
						// (save result) // isreg

						//main.c, line 308
						//call
						//pcreltotemp
	.lipcrel	l190
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//main.c, line 308
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2

						//main.c, line 309
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r2 - only match against tmp
				// flags 42
	and	r2

						//main.c, line 309
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l212
		add	r7
						// allocreg r1

						//main.c, line 310
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r2 - only match against tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 310
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l212: # 

						//main.c, line 311
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_romindex
						// extern pe not varadr
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
						// allocreg r1

						//main.c, line 312
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 312
						//call
						//pcreltotemp
	.lipcrel	l185
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.a
l186:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r2
						// allocreg r1
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	4
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l222
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l218
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
	.lipcrel	l221
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
	.lipcrel	l214
		add	r7

						//main.c, line 321
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt

						//main.c, line 321
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l214
		add	r7

						//main.c, line 322
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
 						// extern (offset 0)
	.liabs	_romindex, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 323
						//pcreltotemp
	.lipcrel	l214
	add	r7
						// freereg r1
l218: # 
						// allocreg r1

						//main.c, line 325
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	sub	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_romindex, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r1

						//main.c, line 326
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r1
						// freereg r1

						//main.c, line 326
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l214
		add	r7
						// allocreg r1

						//main.c, line 327
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_romindex
						// extern pe not varadr
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

						//main.c, line 328
						//pcreltotemp
	.lipcrel	l214
	add	r7
l221: # 

						//main.c, line 330
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// extern
	.liabs	_romindex
						//extern deref
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
 						// extern (offset 0)
	.liabs	_romindex, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 331
						//pcreltotemp
	.lipcrel	l214
	add	r7
l222: # 

						//main.c, line 333
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	16
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_romindex, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
l214: # 
						// allocreg r1

						//main.c, line 336
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 336
						//call
						//pcreltotemp
	.lipcrel	l185
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
						// freereg r3
	.lipcrel	.functiontail, 4
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
	.section	.text.b
l185:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-16
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r1
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//main.c, line 342
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 344
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//main.c, line 345
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_dir_entries
						//extern deref
						//sizemod based on type 0x103
	ldt
	stdec	r6

						//main.c, line 345
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	stdec	r6

						//main.c, line 345
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l224,0
						// static pe is varadr
	stdec	r6

						//main.c, line 345
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 12 + 0 bytes
	.liconst	12
	add	r6

						//main.c, line 346
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
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

						//main.c, line 347
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r0

						//main.c, line 347
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l262
		add	r7

						//main.c, line 347
						// (test)
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
				// flags 82
	mr	r0
	and	r0

						//main.c, line 347
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l262
		add	r7
l259: # 

						//main.c, line 348
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_matchextension
						// extern pe is varadr
	stdec	r6

						//main.c, line 348
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6

						//main.c, line 348
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l230
		add	r7

						//main.c, line 348
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
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

						//main.c, line 348
						//pcreltotemp
	.lipcrel	l231
	add	r7
l230: # 

						//main.c, line 348
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
l231: # 
						// allocreg r1

						//main.c, line 348
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 348
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//main.c, line 348
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//main.c, line 349
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	add	r4
						// (save result) // isreg

						//main.c, line 347
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 347
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_romindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r4

						//main.c, line 347
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l262
		add	r7
						// allocreg r1

						//main.c, line 347
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 347
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l259
		add	r7
l262: # 

						//main.c, line 352
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//main.c, line 353
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 353
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l263
		add	r7
l260: # 

						//main.c, line 354
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_matchextension
						// extern pe is varadr
	stdec	r6

						//main.c, line 354
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6

						//main.c, line 354
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l239
		add	r7

						//main.c, line 354
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
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

						//main.c, line 354
						//pcreltotemp
	.lipcrel	l240
	add	r7
l239: # 

						//main.c, line 354
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
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
l240: # 
						// allocreg r1

						//main.c, line 354
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 354
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//main.c, line 354
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//main.c, line 355
						// (test)
						// (obj to tmp) flags 2 type a
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6

						//main.c, line 355
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l252
		add	r7
						// allocreg r1

						//main.c, line 358
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r1
				//return 0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
	add	r1
						// (save result) // isreg

						//main.c, line 358
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	byt
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//main.c, line 358
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	16
	and	r1
						// (save result) // isreg
						// freereg r1

						//main.c, line 358
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l245
		add	r7
						// freereg r2
						// freereg r3
						// allocreg r3

						//main.c, line 360
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l209,0
						// static pe is varadr
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//main.c, line 360
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	12
	mul	r1
						// (save result) // isreg

						//main.c, line 360
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l189,0
						// static pe is varadr
	add	r1
						// (save result) // isreg
						// allocreg r2

						//main.c, line 360
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	8
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 360
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 4
						// matchobj comparing flags 74 with 74
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 4
	st	r2
						//save_temp done
						// freereg r3
						// freereg r2

						//main.c, line 361
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	add	r1
						// (save result) // isreg

						//main.c, line 361
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//main.c, line 362
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	30
	mul	r1
						// (save result) // isreg

						//main.c, line 362
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 6
						// (obj to r5) flags 82 type a
						// (prepobj r5)
 						// static
	.liabs	l188,0
						// static pe is varadr
	mr	r5
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r5
						// (save result) // isreg
						// freereg r1

						//main.c, line 362
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	129
						// (save temp)store type 1
	byt
	st	r5
						//save_temp done
						// allocreg r1

						//main.c, line 363
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	addt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 363
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	32
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//main.c, line 364
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_longfilename
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//main.c, line 364
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l247
		add	r7

						//main.c, line 365
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r3

						//main.c, line 365
						// (bitwise/arithmetic) 	//ops: 6, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	addt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//main.c, line 365
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//main.c, line 365
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	27
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 365
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//main.c, line 367
						//pcreltotemp
	.lipcrel	l252
	add	r7
l247: # 
						// allocreg r1

						//main.c, line 368
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	13
	addt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 368
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//main.c, line 369
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r3

						//main.c, line 369
						// (bitwise/arithmetic) 	//ops: 6, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	addt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//main.c, line 369
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//main.c, line 369
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 369
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//main.c, line 373
						//pcreltotemp
	.lipcrel	l252
	add	r7
l245: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//main.c, line 374
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	12
	mul	r1
						// (save result) // isreg

						//main.c, line 374
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l189,0
						// static pe is varadr
	add	r1
						// (save result) // isreg

						//main.c, line 374
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	8
	add	r1
						// (save result) // isreg

						//main.c, line 374
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_selectrom
						// extern pe is varadr
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1

						//main.c, line 375
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_longfilename
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//main.c, line 375
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l251
		add	r7
						// freereg r2
						// freereg r3
						// allocreg r1

						//main.c, line 376
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	30
	mul	r1
						// (save result) // isreg

						//main.c, line 376
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r3

						//main.c, line 376
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 4
						// (obj to r3) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj r3)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l188,0
						// static pe is varadr
	mr	r3
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r3
						// (save result) // isreg
						// freereg r1
						// allocreg r2

						//main.c, line 376
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//main.c, line 376
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	29
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 376
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//main.c, line 378
						//pcreltotemp
	.lipcrel	l252
	add	r7
l251: # 
						// allocreg r3

						//main.c, line 379
						// (bitwise/arithmetic) 	//ops: 5, 0, 4
						// (obj to r3) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r3
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	30
	mul	r3
						// (save result) // isreg

						//main.c, line 379
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l188,0
						// static pe is varadr
	add	r3
						// (save result) // isreg
						// allocreg r1

						//main.c, line 379
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	11
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 379
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//main.c, line 380
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r4
						// (save result) // isreg

						//main.c, line 380
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//main.c, line 380
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//main.c, line 380
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 380
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1
l252: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//main.c, line 353
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	4
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 353
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	7
	sgn
	cmp	r4

						//main.c, line 353
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l263
		add	r7

						//main.c, line 353
						// (test)
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6

						//main.c, line 353
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l260
		add	r7
l263: # 

						//main.c, line 386
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	7
	sgn
	cmp	r4

						//main.c, line 386
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l264
		add	r7
						// freereg r1
l261: # 
						// allocreg r1

						//main.c, line 386
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	30
	mul	r1
						// (save result) // isreg

						//main.c, line 386
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l188,0
						// static pe is varadr
	add	r1
						// (save result) // isreg

						//main.c, line 386
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//main.c, line 386
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r4
						// (save result) // isreg

						//main.c, line 386
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	7
	sgn
	cmp	r4

						//main.c, line 386
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l261
		add	r7
l264: # 

						//main.c, line 387
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l189,85
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//main.c, line 388
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l189,84
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//main.c, line 389
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l189,92
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l187,0
						// static pe is varadr
						// (save temp)store type 4
	st	r0
						//save_temp done

						//main.c, line 390
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l189,88
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l258,0
						// static pe is varadr
						// (save temp)store type a
	st	r0
						//save_temp done

						//main.c, line 391
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l189,104
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l186,0
						// static pe is varadr
						// (save temp)store type 4
	st	r0
						//save_temp done
						// allocreg r1

						//main.c, line 392
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 392
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Deferred popping of 0 bytes (0 in total)
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
l224:
	.byte	108
	.byte	105
	.byte	115
	.byte	116
	.byte	114
	.byte	111
	.byte	109
	.byte	32
	.byte	115
	.byte	107
	.byte	105
	.byte	112
	.byte	112
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	100
	.byte	105
	.byte	114
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	105
	.byte	101
	.byte	115
	.byte	32
	.byte	37
	.byte	100
	.byte	32
	.byte	10
	.byte	0
l258:
	.byte	-128
	.byte	32
	.byte	66
	.byte	97
	.byte	99
	.byte	107
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
	.section	.text.c
l265:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//main.c, line 397
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_romtype, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2
						// allocreg r1

						//main.c, line 398
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 398
						//call
						//pcreltotemp
	.lipcrel	l185
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.d
l267:
	stdec	r6

						//main.c, line 404
						//call
						//pcreltotemp
	.lipcrel	_Menu_Hide
	add	r7
						// Deferred popping of 0 bytes (0 in total)
	ldinc	r6
	mr	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.e
l269:
	stdec	r6

						//main.c, line 411
						//call
						//pcreltotemp
	.lipcrel	_Menu_Hide
	add	r7
						// Deferred popping of 0 bytes (0 in total)
	ldinc	r6
	mr	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.f
l271:
	stdec	r6

						//main.c, line 417
						//call
						//pcreltotemp
	.lipcrel	_Menu_Hide
	add	r7
						// Deferred popping of 0 bytes (0 in total)
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.10
l273:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//main.c, line 422
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 64
						// extern (offset 0)
	.liabs	_romindex
						// extern pe not varadr
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
						// allocreg r1

						//main.c, line 423
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 423
						//call
						//pcreltotemp
	.lipcrel	l185
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//main.c, line 424
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l189,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 424
						//call
						//pcreltotemp
	.lipcrel	_Menu_Set
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.11
l187:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//main.c, line 430
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	12
	mul	r1
						// (save result) // isreg

						//main.c, line 430
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l189,0
						// static pe is varadr
	add	r1
						// (save result) // isreg

						//main.c, line 430
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	1
	add	r1
						// (save result) // isreg

						//main.c, line 430
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menupage, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
						// allocreg r1

						//main.c, line 431
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l276,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 431
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//main.c, line 432
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	48
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 432
						//call
						//pcreltotemp
	.lipcrel	_putchar
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//main.c, line 433
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 433
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	.section	.rodata
l276:
	.byte	115
	.byte	117
	.byte	98
	.byte	109
	.byte	101
	.byte	110
	.byte	117
	.byte	32
	.byte	99
	.byte	97
	.byte	108
	.byte	108
	.byte	98
	.byte	97
	.byte	99
	.byte	107
	.byte	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.12
l277:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-16
	add	r6
						// allocreg r4
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type 3
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r3
						// allocreg r1

						//main.c, line 440
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	12
	mul	r1
						// (save result) // isreg

						//main.c, line 440
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l189,0
						// static pe is varadr
	add	r1
						// (save result) // isreg

						//main.c, line 441
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	3
	addt	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r2
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 22 type 101
						// matchobj comparing flags 34 with 2
						// matchobj comparing flags 34 with 130
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 2
						// matchobj comparing flags 162 with 130
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 441
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 4
						// (obj to r3) flags 2 type 3
						// matchobj comparing flags 2 with 34
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 34
						// matchobj comparing flags 1 with 130
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r3
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	shr	r3
						// (save result) // isreg
						// freereg r2
						// allocreg r2

						//main.c, line 442
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 442
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 106
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2

						//main.c, line 442
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	and	r3
						// (save result) // isreg

						//main.c, line 443
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r3
						// (save result) // isreg

						//main.c, line 444
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	2
	add	r1
						// (save result) // isreg

						//main.c, line 444
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// matchobj comparing flags 106 with 2
						// deref 
	byt
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//main.c, line 444
						// Q2 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	sgn
	cmp	r3
						// freereg r1

						//main.c, line 444
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l280
		add	r7
						// allocreg r1

						//main.c, line 445
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l280: # 
						// allocreg r2

						//main.c, line 446
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 22 type 101
						// deref 
						// (prepobj tmp)
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
						// allocreg r1

						//main.c, line 446
						// (bitwise/arithmetic) 	//ops: 0, 3, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 34
						// var, auto|reg
						// matchobj comparing flags 1 with 34
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	shl	r1
						// (save result) // isreg

						//main.c, line 446
						//comp
						// (obj to r1) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						// matchobj comparing flags 1 with 74
	.liconst	-1
	xor	r1
						// (save result) // isreg

						//main.c, line 446
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	and	r1
						// (save result) // isreg

						//main.c, line 447
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 6
						// (obj to r5) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	mr	r5
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 66
						// reg r2 - only match against tmp
	mt	r2
	shl	r5
						// (save result) // isreg

						//main.c, line 447
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 6, 2, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	or	r5
						// (save result) // isreg
						// freereg r2
						// freereg r1
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r5

						//main.c, line 449
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 450
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 450
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 450
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l289
		add	r7
l287: # 
						// allocreg r1

						//main.c, line 450
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 450
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 450
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l287
		add	r7
l289: # 

						//main.c, line 450
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	33
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 451
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	30
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 452
						// (a/p assign)
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	mt	r0
	exg	r5
						//sizemod based on type 0x503
	st	r5
	exg	r5

						//main.c, line 453
						// (bitwise/arithmetic) 	//ops: 6, 0, 1
						// (obj to r0) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	8
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//main.c, line 454
						// (bitwise/arithmetic) 	//ops: 6, 0, 1
						// (obj to r0) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	16
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//main.c, line 455
						// (bitwise/arithmetic) 	//ops: 6, 0, 1
						// (obj to r0) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	24
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//main.c, line 456
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 456
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 456
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l290
		add	r7
l288: # 

						//main.c, line 456
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 456
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 456
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l288
		add	r7
l290: # 
						// freereg r1

						//main.c, line 456
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 458
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	7
	stdec	r6

						//main.c, line 458
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
	stdec	r6

						//main.c, line 458
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l189,0
						// static pe is varadr
	stdec	r6
						// allocreg r1

						//main.c, line 458
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_menupage
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 458
						//call
						//pcreltotemp
	.lipcrel	_parseconf
	add	r7
						// Deferred popping of 12 bytes (12 in total)
						// freereg r1
						// allocreg r1

						//main.c, line 459
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 459
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Deferred popping of 0 bytes (12 in total)
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-28
	sub	r6
	.lipcrel	.functiontail, 0
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
	.section	.text.13
	.global	_parseconf
_parseconf:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-40
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	24
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r1
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//main.c, line 466
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
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

						//main.c, line 467
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

						//main.c, line 468
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 16, 0 with 12, 0
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

						//main.c, line 471
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 130
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 472
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 472
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 472
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l363
		add	r7
l357: # 

						//main.c, line 472
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 472
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 472
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l357
		add	r7
l363: # 

						//main.c, line 472
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	33
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 473
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	20
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 475
						//call
						//pcreltotemp
	.lipcrel	_conf_nextfield
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//main.c, line 476
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 476
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 21 type 3
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ld	r0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 477
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 33
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	stdec	r6

						//main.c, line 477
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l295,0
						// static pe is varadr
	stdec	r6

						//main.c, line 477
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	8
	add	r6

						//main.c, line 478
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	59
	cmp	r5

						//main.c, line 478
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l297
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r2

						//main.c, line 480
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	56
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r2
						// (save result) // isreg

						//main.c, line 480
						// (a/p assign)
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r2
						// (save temp)store type a
	st	r6
						//save_temp done

						//main.c, line 480
						// (a/p assign)
	mt	r2
	stdec	r6
					// (char with size!=1 -> array of unknown type)
						// (obj to r0) flags 2 type b
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l298,0
	mr	r0
						// (prepobj r1)
 						// matchobj comparing flags 170 with 2
						// matchobj comparing flags 170 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	ldidx	r6
	mr	r1
					// Copying 2 words and 1 bytes to 
					// Copying 2 words to 
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r1
	mr	r2
.cpywordloop0:
	ldinc	r0
	stinc	r1
	mt	r1
	cmp	r2
	cond	NEQ
		.lipcrel	.cpywordloop0
		add	r7
					// Copying 1 byte tail to 
	ldbinc	r0
	stbinc	r1
	ldinc	r6
	mr	r2
						// allocreg r1

						//main.c, line 481
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// var, auto|reg
	.liconst	56
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	add	r1
						// (save result) // isreg

						//main.c, line 481
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l265,0
						// static pe is varadr
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1
						// allocreg r1

						//main.c, line 482
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 6a type a
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r2
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	8
	add	r1
						// (save result) // isreg

						//main.c, line 482
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// reg r1 - no need to prep
	mt	r1
	exg	r5
						//sizemod based on type 0x101
	byt
	st	r5
	exg	r5
						// freereg r1

						//main.c, line 483
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6

						//main.c, line 483
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	24
	stdec	r6
						// allocreg r1

						//main.c, line 483
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 6a type a
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r2
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	8
	add	r1
						// (save result) // isreg
						// freereg r2

						//main.c, line 483
						//call
						//pcreltotemp
	.lipcrel	_copytocomma
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//main.c, line 484
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
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
l297: # 
						// allocreg r2
						// allocreg r1

						//main.c, line 486
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 486
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l364
		add	r7

						//main.c, line 486
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	16
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	64
	ldidx	r6
	sgn
	cmp	r0

						//main.c, line 486
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l364
		add	r7
l358: # 

						//main.c, line 488
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 3
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ld	r0
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	70
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l304
		add	r7
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	9
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l313
		add	r7
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l308
		add	r7
						//pcreltotemp
	.lipcrel	l342
	add	r7
l304: # 

						//main.c, line 492
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//main.c, line 492
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l306
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//main.c, line 494
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
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

						//main.c, line 494
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	56
	ldidx	r6
	add	r1
						// (save result) // isreg
						// allocreg r2

						//main.c, line 494
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 494
						// Q1 disposable
						// (a/p assign)
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r2

						//main.c, line 494
						// (a/p assign)
	mt	r1
	stdec	r6
					// (char with size!=1 -> array of unknown type)
						// (obj to r0) flags 2 type b
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l307,0
	mr	r0
						// (prepobj r1)
 						// matchobj comparing flags 170 with 2
						// matchobj comparing flags 170 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	ldidx	r6
	mr	r1
					// Copying 1 words and 1 bytes to 
					// Copying 1 words to 
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r1
	mr	r2
.cpywordloop1:
	ldinc	r0
	stinc	r1
	mt	r1
	cmp	r2
	cond	NEQ
		.lipcrel	.cpywordloop1
		add	r7
					// Copying 1 byte tail to 
	ldbinc	r0
	stbinc	r1
	ldinc	r6
	mr	r1

						//main.c, line 495
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	8
	add	r1
						// (save result) // isreg

						//main.c, line 495
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l265,0
						// static pe is varadr
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1

						//main.c, line 496
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l306: # 
						// allocreg r2
						// allocreg r1

						//main.c, line 498
						//call
						//pcreltotemp
	.lipcrel	_conf_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 498
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//main.c, line 499
						//pcreltotemp
	.lipcrel	l303
	add	r7
l308: # 

						//main.c, line 501
						//call
						//pcreltotemp
	.lipcrel	_getdigit
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//main.c, line 501
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 502
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	stdec	r6

						//main.c, line 502
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l309,0
						// static pe is varadr
	stdec	r6

						//main.c, line 502
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	8
	add	r6

						//main.c, line 504
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	sgn
	cmp	r0

						//main.c, line 504
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l311
		add	r7

						//main.c, line 505
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l311: # 

						//main.c, line 506
						//call
						//pcreltotemp
	.lipcrel	_getdigit
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//main.c, line 507
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	44
	cmp	r0
						// freereg r1

						//main.c, line 507
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l313
		add	r7
						// allocreg r1

						//main.c, line 510
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//main.c, line 510
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l315
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//main.c, line 512
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
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

						//main.c, line 512
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	56
	ldidx	r6
	add	r1
						// (save result) // isreg
						// allocreg r2

						//main.c, line 512
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 512
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r2
						// allocreg r2

						//main.c, line 513
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	1
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 513
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r2
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2

						//main.c, line 514
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
						// (save temp)store type 1
	byt
	st	r1
						//save_temp done

						//main.c, line 515
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	add	r1
						// (save result) // isreg

						//main.c, line 515
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l187,0
						// static pe is varadr
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1

						//main.c, line 516
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 130
						// deref
						// const to r0
						// matchobj comparing flags 1 with 130
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 516
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 21 type 3
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ld	r0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 517
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 33
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 517
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l365
		add	r7
						// allocreg r2
						// allocreg r1

						//main.c, line 517
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	59
	cmp	r5

						//main.c, line 517
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l365
		add	r7
l359: # 

						//main.c, line 519
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// reg r4 - no need to prep
	mt	r4
	exg	r5
						//sizemod based on type 0x101
	byt
	st	r5
	exg	r5

						//main.c, line 519
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//main.c, line 520
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 520
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 21 type 3
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ld	r0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//main.c, line 517
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 33
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 517
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l365
		add	r7

						//main.c, line 517
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	59
	cmp	r5

						//main.c, line 517
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l359
		add	r7
l365: # 

						//main.c, line 522
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 101
						// const
	.liconst	32
						// (save temp)store type 1
	stbinc	r4
						//save_temp done

						//main.c, line 523
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	129
						// (save temp)store type 1
	stbinc	r4
						//save_temp done

						//main.c, line 524
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 1
	byt
	st	r4
						//save_temp done

						//main.c, line 525
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 528
						//pcreltotemp
	.lipcrel	l303
	add	r7
l315: # 

						//main.c, line 528
						//call
						//pcreltotemp
	.lipcrel	_conf_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 528
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//main.c, line 529
						//pcreltotemp
	.lipcrel	l303
	add	r7
l313: # 

						//main.c, line 533
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6
	cmp	r0

						//main.c, line 533
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l324
		add	r7

						//main.c, line 537
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	24
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

						//main.c, line 541
						//call
						//pcreltotemp
	.lipcrel	_getdigit
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 541
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	32
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 542
						//call
						//pcreltotemp
	.lipcrel	_getdigit
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 542
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 544
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	44
	cmp	r0

						//main.c, line 544
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l326
		add	r7

						//main.c, line 545
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	32
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 547
						//pcreltotemp
	.lipcrel	l327
	add	r7
l326: # 

						//main.c, line 547
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
						// freereg r2
l327: # 
						// allocreg r1

						//main.c, line 550
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	16
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

						//main.c, line 550
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type a
						// var, auto|reg
	.liconst	56
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
						// freereg r1
						// allocreg r1

						//main.c, line 550
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	3
	add	r1
						// (save result) // isreg

						//main.c, line 550
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//main.c, line 551
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	32
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r1
						// (save result) // isreg

						//main.c, line 551
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
	sub	r1
						// (save result) // isreg

						//main.c, line 551
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//main.c, line 551
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	sub	r1
						// (save result) // isreg
						// allocreg r2

						//main.c, line 551
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r2
						// (save result) // isreg

						//main.c, line 551
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// reg r2 - no need to prep
	mt	r2
	exg	r1
						//sizemod based on type 0x101
	byt
	st	r1
	exg	r1
						// freereg r1

						//main.c, line 552
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 101
						// const
	.liconst	2
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//main.c, line 553
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	add	r1
						// (save result) // isreg

						//main.c, line 553
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l277,0
						// static pe is varadr
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1
						// allocreg r1

						//main.c, line 554
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
	sgn
	shr	r1
						// (save result) // isreg

						//main.c, line 554
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 6a type 101
						// matchobj comparing flags 106 with 2
						// deref 
	byt
	ld	r2
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//main.c, line 554
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	40
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2
						// freereg r1

						//main.c, line 557
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//main.c, line 557
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 22 type a
						// deref 
						// (prepobj tmp)
 						// deref
						// var FIXME - deref?
						// reg - auto
	.liconst	4
	ldidx	r6
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r4
						//save_temp done

						//main.c, line 559
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 34
						// var, auto|reg
						// matchobj comparing flags 1 with 34
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	cmp	r0

						//main.c, line 559
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l330
		add	r7
						// allocreg r2
						// allocreg r1

						//main.c, line 559
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	28
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

						//main.c, line 559
						//pcreltotemp
	.lipcrel	l331
	add	r7
l330: # 

						//main.c, line 559
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	28
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
l331: # 

						//main.c, line 559
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6

						//main.c, line 559
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	32
	stdec	r6
						// allocreg r1

						//main.c, line 559
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 559
						//call
						//pcreltotemp
	.lipcrel	_copytocomma
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//main.c, line 559
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//main.c, line 559
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
	sgn
	cmp	r5

						//main.c, line 559
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l366
		add	r7
						// freereg r2
						// freereg r3

						//main.c, line 561
						// (bitwise/arithmetic) 	//ops: 5, 6, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	add	r4
						// (save result) // isreg
						// allocreg r1

						//main.c, line 562
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 22 type a
						// matchobj comparing flags 34 with 66
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 66
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 66
	.liconst	4
	ldidx	r6
						//sizemod based on type 0xa
	ldt
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	32
	add	r1
						// (save result) // isreg

						//main.c, line 562
						// (bitwise/arithmetic) 	//ops: 2, 5, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	sub	r1
						// (save result) // isreg
						// allocreg r3

						//main.c, line 562
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//main.c, line 562
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l333,0
						// static pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 562
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 562
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//main.c, line 563
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	2
	add	r4
						// (save result) // isreg
l360: # 
						// allocreg r3
						// allocreg r2

						//main.c, line 566
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	24
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//main.c, line 567
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	36
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r1
						// (save result) // isreg

						//main.c, line 567
						// Q2 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	cmp	r1
						// freereg r1

						//main.c, line 567
	cond	EQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l337
		add	r7
						// allocreg r1

						//main.c, line 567
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	28
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

						//main.c, line 567
						//pcreltotemp
	.lipcrel	l338
	add	r7
l337: # 

						//main.c, line 567
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	28
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
l338: # 

						//main.c, line 567
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//main.c, line 567
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 22 type a
						// matchobj comparing flags 34 with 10
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 10
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 10
	.liconst	8
	ldidx	r6
						//sizemod based on type 0xa
	ldt
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	32
	add	r1
						// (save result) // isreg

						//main.c, line 567
						// (bitwise/arithmetic) 	//ops: 2, 5, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	sub	r1
						// (save result) // isreg

						//main.c, line 567
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 66
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//main.c, line 567
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 567
						//call
						//pcreltotemp
	.lipcrel	_copytocomma
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//main.c, line 567
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	sgn
	cmp	r0
						// freereg r1

						//main.c, line 567
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l360
		add	r7
l366: # 

						//main.c, line 569
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6

						//main.c, line 569
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l340,0
						// static pe is varadr
	stdec	r6

						//main.c, line 569
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// allocreg r1

						//main.c, line 570
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						//sizemod based on type 0xa
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	add	r1
						// (save result) // isreg

						//main.c, line 570
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//main.c, line 571
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 574
						//pcreltotemp
	.lipcrel	l303
	add	r7
l324: # 
						// allocreg r1

						//main.c, line 574
						//call
						//pcreltotemp
	.lipcrel	_conf_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 574
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//main.c, line 575
						//pcreltotemp
	.lipcrel	l303
	add	r7
l342: # 

						//main.c, line 577
						//call
						//pcreltotemp
	.lipcrel	_conf_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 577
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5
l303: # 

						//main.c, line 486
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//main.c, line 486
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l364
		add	r7

						//main.c, line 486
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	16
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	64
	ldidx	r6
	sgn
	cmp	r0

						//main.c, line 486
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l358
		add	r7
l364: # 

						//main.c, line 582
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	16
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	7
	sgn
	cmp	r0

						//main.c, line 582
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l367
		add	r7
						// freereg r1
						// freereg r2
l361: # 
						// allocreg r1

						//main.c, line 583
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	16
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

						//main.c, line 583
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	56
	ldidx	r6
	add	r1
						// (save result) // isreg
						// allocreg r2

						//main.c, line 583
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 583
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r2
						//save_temp done

						//main.c, line 583
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	0
						// (save temp)store type 1
	stbinc	r2
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2

						//main.c, line 584
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	add	r1
						// (save result) // isreg

						//main.c, line 584
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 4
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1

						//main.c, line 582
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 582
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	7
	sgn
	cmp	r0

						//main.c, line 582
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l361
		add	r7
l367: # 
						// allocreg r2
						// allocreg r1

						//main.c, line 586
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//main.c, line 586
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l349
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//main.c, line 588
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	56
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	84
	add	r1
						// (save result) // isreg
						// allocreg r2

						//main.c, line 588
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	56
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	85
	add	r2
						// (save result) // isreg

						//main.c, line 588
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 1
	stbinc	r2
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2

						//main.c, line 589
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//main.c, line 590
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	56
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	92
	add	r1
						// (save result) // isreg

						//main.c, line 590
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l187,0
						// static pe is varadr
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1
						// allocreg r1

						//main.c, line 591
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	56
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	88
	add	r1
						// (save result) // isreg

						//main.c, line 591
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l350,0
						// static pe is varadr
						// (save temp)store type a
	st	r1
						//save_temp done
						// freereg r1

						//main.c, line 594
						//pcreltotemp
	.lipcrel	l351
	add	r7
l349: # 
						// allocreg r2
						// allocreg r1

						//main.c, line 595
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// var, auto|reg
	.liconst	56
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	88
	add	r1
						// (save result) // isreg

						//main.c, line 595
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l352,0
						// static pe is varadr
						// (save temp)store type a
	st	r1
						//save_temp done
						// freereg r1
						// allocreg r1

						//main.c, line 596
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	56
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	92
	add	r1
						// (save result) // isreg

						//main.c, line 596
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type 4
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_Menu_Hide
						// extern pe is varadr
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1
l351: # 
						// allocreg r1

						//main.c, line 599
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6

						//main.c, line 599
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l353,0
						// static pe is varadr
	stdec	r6

						//main.c, line 599
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6

						//main.c, line 600
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 600
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 600
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l368
		add	r7
l362: # 

						//main.c, line 600
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	32768
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//main.c, line 600
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//main.c, line 600
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l362
		add	r7
l368: # 

						//main.c, line 600
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done

						//main.c, line 601
						//setreturn
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	-40
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l298:
	.byte	76
	.byte	111
	.byte	97
	.byte	100
	.byte	32
	.byte	42
	.byte	46
	.byte	32
	.byte	0
l307:
	.byte	76
	.byte	111
	.byte	97
	.byte	100
	.byte	0
l333:
	.byte	58
	.byte	32
	.byte	0
l340:
	.byte	68
	.byte	101
	.byte	99
	.byte	111
	.byte	100
	.byte	101
	.byte	100
	.byte	32
	.byte	37
	.byte	100
	.byte	32
	.byte	111
	.byte	112
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	115
	.byte	10
	.byte	0
l309:
	.byte	80
	.byte	97
	.byte	103
	.byte	101
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
l350:
	.byte	-128
	.byte	32
	.byte	66
	.byte	97
	.byte	99
	.byte	107
	.byte	0
l352:
	.byte	-128
	.byte	32
	.byte	69
	.byte	120
	.byte	105
	.byte	116
	.byte	0
l295:
	.byte	78
	.byte	101
	.byte	120
	.byte	116
	.byte	32
	.byte	99
	.byte	104
	.byte	97
	.byte	114
	.byte	32
	.byte	37
	.byte	99
	.byte	10
	.byte	0
l353:
	.byte	77
	.byte	97
	.byte	120
	.byte	112
	.byte	97
	.byte	103
	.byte	101
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.14
	.global	_buildmenu
_buildmenu:
	stdec	r6

						//main.c, line 607
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	7
	stdec	r6

						//main.c, line 607
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	stdec	r6

						//main.c, line 607
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l189,0
						// static pe is varadr
	stdec	r6
						// allocreg r1

						//main.c, line 607
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_menupage
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 607
						//call
						//pcreltotemp
	.lipcrel	_parseconf
	add	r7
						// Deferred popping of 12 bytes (12 in total)
						// freereg r1
						// allocreg r1

						//main.c, line 608
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l189,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 608
						//call
						//pcreltotemp
	.lipcrel	_Menu_Set
	add	r7
						// Deferred popping of 0 bytes (12 in total)
						// freereg r1
	.liconst	-12
	sub	r6
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.15
	.global	_main
_main:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3

						//main.c, line 619
						//call
						//pcreltotemp
	.lipcrel	_PS2Init
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 621
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_filename
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//main.c, line 623
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//main.c, line 624
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l371,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 624
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//main.c, line 625
						//call
						//pcreltotemp
	.lipcrel	_spi_init
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//main.c, line 625
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//main.c, line 625
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l376
		add	r7

						//main.c, line 625
						//call
						//pcreltotemp
	.lipcrel	_FindDrive
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//main.c, line 625
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//main.c, line 625
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l376
		add	r7
						// allocreg r1

						//main.c, line 625
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
						// (save temp)isreg
	mr	r3
						//save_temp done

						//main.c, line 625
						//pcreltotemp
	.lipcrel	l377
	add	r7
l376: # 

						//main.c, line 625
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l377: # 

						//main.c, line 625
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//main.c, line 625
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l373
		add	r7
						// freereg r1
						// allocreg r1

						//main.c, line 626
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l378,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 626
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l373: # 

						//main.c, line 628
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menupage
						// extern pe not varadr
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
						// allocreg r1

						//main.c, line 629
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 629
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//main.c, line 631
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes
l394: # 

						//main.c, line 634
						//call
						//pcreltotemp
	.lipcrel	_HandlePS2RawCodes
	add	r7
						// Flow control - popping 0 + 0 bytes

						//main.c, line 636
						//call
						//pcreltotemp
	.lipcrel	_Menu_Run
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//main.c, line 641
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 641
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//main.c, line 641
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//main.c, line 641
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l385
		add	r7
						// allocreg r1

						//main.c, line 643
						//call
						//pcreltotemp
	.lipcrel	_VerifyROM
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l385: # 
						// allocreg r1

						//main.c, line 646
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	120
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 646
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//main.c, line 646
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//main.c, line 646
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l394
		add	r7
						// allocreg r1

						//main.c, line 648
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//main.c, line 648
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l389
		add	r7
						// freereg r1
						// allocreg r1

						//main.c, line 648
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_filename
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 648
						//call
						//pcreltotemp
	.lipcrel	_LoadROM
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//main.c, line 648
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//main.c, line 648
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l389
		add	r7
						// allocreg r1

						//main.c, line 650
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l391,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 650
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//main.c, line 653
						//pcreltotemp
	.lipcrel	l394
	add	r7
l389: # 
						// allocreg r1

						//main.c, line 653
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l393,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//main.c, line 653
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//main.c, line 632
						//pcreltotemp
	.lipcrel	l394
	add	r7
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	.section	.rodata
l391:
	.byte	82
	.byte	79
	.byte	77
	.byte	32
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	101
	.byte	100
	.byte	10
	.byte	0
l393:
	.byte	82
	.byte	79
	.byte	77
	.byte	32
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	32
	.byte	102
	.byte	97
	.byte	105
	.byte	108
	.byte	101
	.byte	100
	.byte	10
	.byte	0
l371:
	.byte	73
	.byte	110
	.byte	105
	.byte	116
	.byte	105
	.byte	97
	.byte	108
	.byte	105
	.byte	122
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	83
	.byte	68
	.byte	32
	.byte	99
	.byte	97
	.byte	114
	.byte	100
	.byte	10
	.byte	0
l378:
	.byte	72
	.byte	97
	.byte	118
	.byte	101
	.byte	32
	.byte	83
	.byte	68
	.byte	10
	.byte	0
	.section	.bss
	.global	_statusword
	.comm	_statusword,4
	.global	_menupage
	.comm	_menupage,4
	.global	_romtype
	.comm	_romtype,4
	.global	_file
	.comm	_file,12
	.global	_romindex
	.comm	_romindex,4
	.global	_filename
	.comm	_filename,16
	.section	.data
l189:
	.byte	2
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l188
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
	.byte	2
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l188,30
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
	.byte	2
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l188,60
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
	.byte	2
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l188,90
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
	.byte	2
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l188,120
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
	.byte	2
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l188,150
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
	.byte	2
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l188,180
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.int	0
						// Declaring from tree
						// static
	.ref	l187
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.int	0
						// Declaring from tree
						// static
	.ref	l186
	.section	.bss
	.lcomm	l188,210
