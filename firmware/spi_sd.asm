	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_SPI_PUMP
_SPI_PUMP:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done

						//spi_sd.c, line 39
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
						// allocreg r2

						//spi_sd.c, line 40
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

						//spi_sd.c, line 41
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
						// allocreg r1

						//spi_sd.c, line 42
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

						//spi_sd.c, line 43
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	8
	shl	r2
						// (save result) // isreg

						//spi_sd.c, line 43
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//spi_sd.c, line 44
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r2

						//spi_sd.c, line 45
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

						//spi_sd.c, line 46
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	8
	shl	r1
						// (save result) // isreg

						//spi_sd.c, line 46
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	or	r2
						// (save result) // isreg
						// freereg r1

						//spi_sd.c, line 47
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r1

						//spi_sd.c, line 48
						// Q1 disposable
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

						//spi_sd.c, line 49
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	8
	shl	r2
						// (save result) // isreg

						//spi_sd.c, line 49
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//spi_sd.c, line 50
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
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
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_SPI_PUMP_LE
_SPI_PUMP_LE:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done

						//spi_sd.c, line 57
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
						// allocreg r1

						//spi_sd.c, line 58
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

						//spi_sd.c, line 59
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
						// allocreg r2

						//spi_sd.c, line 60
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r2
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	8
	shl	r2
						// (save result) // isreg

						//spi_sd.c, line 61
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//spi_sd.c, line 62
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r2

						//spi_sd.c, line 63
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r2
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	16
	shl	r2
						// (save result) // isreg

						//spi_sd.c, line 64
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//spi_sd.c, line 65
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r2

						//spi_sd.c, line 66
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r2
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	24
	shl	r2
						// (save result) // isreg

						//spi_sd.c, line 67
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//spi_sd.c, line 68
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
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
	.section	.text.2
	.global	_cmd_write
_cmd_write:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3

						//spi_sd.c, line 79
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						// (obj to r0) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x260
	mt	r0
	st	r4
	// Volatile, or not int - not caching

						//spi_sd.c, line 81
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 608
						// extern
	.liabs	_sd_is_sdhc
						//extern deref
						//sizemod based on type 0x3
	ldt

						//spi_sd.c, line 81
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l5
		add	r7

						//spi_sd.c, line 82
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 104
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	9
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
l5: # 
						// allocreg r1

						//spi_sd.c, line 86
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// var, auto|reg
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	24
	shr	r1
						// (save result) // isreg

						//spi_sd.c, line 86
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x260
	mt	r0
	st	r4
	// Volatile, or not int - not caching
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 87
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// matchobj comparing flags 2 with 608
						// var, auto|reg
						// matchobj comparing flags 1 with 608
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	shr	r1
						// (save result) // isreg

						//spi_sd.c, line 87
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x260
	mt	r0
	st	r4
	// Volatile, or not int - not caching
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 88
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// matchobj comparing flags 2 with 608
						// var, auto|reg
						// matchobj comparing flags 1 with 608
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shr	r1
						// (save result) // isreg

						//spi_sd.c, line 88
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x260
	mt	r0
	st	r4
	// Volatile, or not int - not caching
						// freereg r1

						//spi_sd.c, line 89
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 104
						// matchobj comparing flags 2 with 608
						// var, auto|reg
						// matchobj comparing flags 1 with 608
	.liconst	16
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x260
	mt	r0
	st	r4
	// Volatile, or not int - not caching
						// allocreg r1

						//spi_sd.c, line 93
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// matchobj comparing flags 66 with 608
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	16
	shr	r1
						// (save result) // isreg

						//spi_sd.c, line 93
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x260
	mt	r0
	st	r4
	// Volatile, or not int - not caching
						// freereg r1

						//spi_sd.c, line 97
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 608
						// deref 
	ld	r4
						// (save temp)isreg
	mr	r3
						//save_temp done

						//spi_sd.c, line 98
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	39999
						// (save temp)isreg
	mr	r5
						//save_temp done

						//spi_sd.c, line 98
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	cmp	r3

						//spi_sd.c, line 98
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l12
		add	r7
l11: # 

						//spi_sd.c, line 100
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//spi_sd.c, line 101
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
						// (save temp)isreg
	mr	r3
						//save_temp done

						//spi_sd.c, line 98
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	1
	sub	r5
						// (save result) // isreg

						//spi_sd.c, line 98
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l12
		add	r7

						//spi_sd.c, line 98
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	cmp	r3

						//spi_sd.c, line 98
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7
l12: # 

						//spi_sd.c, line 105
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
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
	.section	.text.3
	.global	_spi_spin
_spi_spin:
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 113
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done
l18: # 

						//spi_sd.c, line 114
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

						//spi_sd.c, line 114
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r1
						// (save result) // isreg

						//spi_sd.c, line 114
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	200
	sgn
	cmp	r1

						//spi_sd.c, line 114
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l18
		add	r7
						// freereg r1
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
	.section	.text.4
	.global	_wait_initV2
_wait_initV2:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1

						//spi_sd.c, line 123
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Flow control - popping 0 + 0 bytes

						//spi_sd.c, line 124
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	19999
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l29: # 

						//spi_sd.c, line 126
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 126
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711799
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 126
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 126
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	cmp	r0
						// freereg r1

						//spi_sd.c, line 126
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l25
		add	r7

						//spi_sd.c, line 128
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

						//spi_sd.c, line 129
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1073741824
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 129
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	8847465
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 129
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 129
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//spi_sd.c, line 129
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l27
		add	r7
						// allocreg r1

						//spi_sd.c, line 131
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 74
						// deref
						// const to r0
						// matchobj comparing flags 1 with 74
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

						//spi_sd.c, line 132
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0

						//spi_sd.c, line 133
						//pcreltotemp
	.lipcrel	l20
	add	r7
l27: # 

						//spi_sd.c, line 134
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Flow control - popping 0 + 0 bytes
l25: # 

						//spi_sd.c, line 124
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r3
						// (save result) // isreg

						//spi_sd.c, line 124
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l29
		add	r7
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 141
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l20: # 
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.global	_wait_init
_wait_init:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3

						//spi_sd.c, line 149
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
						// allocreg r1

						//spi_sd.c, line 150
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
	.liabs	l32,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 150
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//spi_sd.c, line 151
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	19
						// (save temp)isreg
	mr	r3
						//save_temp done
l39: # 

						//spi_sd.c, line 153
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 153
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711745
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 153
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 153
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//spi_sd.c, line 153
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l37
		add	r7
						// allocreg r1

						//spi_sd.c, line 156
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 74
						// deref
						// const to r0
						// matchobj comparing flags 1 with 74
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

						//spi_sd.c, line 157
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0

						//spi_sd.c, line 158
						//pcreltotemp
	.lipcrel	l31
	add	r7
l37: # 

						//spi_sd.c, line 163
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Flow control - popping 0 + 0 bytes

						//spi_sd.c, line 151
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r3
						// (save result) // isreg

						//spi_sd.c, line 151
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 165
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l31: # 
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	.section	.rodata
l32:
	.byte	67
	.byte	77
	.byte	68
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.6
	.global	_is_sdhc
_is_sdhc:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r5
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-44
						// (save temp)isreg
	mr	r5
						//save_temp done
						// allocreg r4

						//spi_sd.c, line 173
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//spi_sd.c, line 175
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	426
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 175
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8847432
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 175
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r3

						//spi_sd.c, line 175
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3

						//spi_sd.c, line 176
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r3 - only match against tmp
	stdec	r6

						//spi_sd.c, line 176
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l42,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 176
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 4 bytes
	.liconst	12
	add	r6

						//spi_sd.c, line 177
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	cmp	r3
						// freereg r3

						//spi_sd.c, line 177
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l44
		add	r7
						// allocreg r3
						// allocreg r1

						//spi_sd.c, line 180
						//call
						//pcreltotemp
	.lipcrel	_wait_init
	add	r7
						// Flow control - popping 0 + 0 bytes

						//spi_sd.c, line 182
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//spi_sd.c, line 183
						//pcreltotemp
	.lipcrel	l41
	add	r7
						// freereg r1
l44: # 

						//spi_sd.c, line 185
						//call
						//pcreltotemp
	.lipcrel	_SPI_PUMP
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//spi_sd.c, line 185
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//spi_sd.c, line 186
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	65535
	and	r1
						// (save result) // isreg

						//spi_sd.c, line 186
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	426
	cmp	r1
						// freereg r1

						//spi_sd.c, line 186
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l46
		add	r7
						// allocreg r1

						//spi_sd.c, line 189
						//call
						//pcreltotemp
	.lipcrel	_wait_init
	add	r7
						// Flow control - popping 0 + 0 bytes

						//spi_sd.c, line 191
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//spi_sd.c, line 192
						//pcreltotemp
	.lipcrel	l41
	add	r7
l46: # 

						//spi_sd.c, line 194
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r5
						//save_temp done

						//spi_sd.c, line 201
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	49
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
l64: # 

						//spi_sd.c, line 203
						//call
						//pcreltotemp
	.lipcrel	_wait_initV2
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//spi_sd.c, line 203
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//spi_sd.c, line 203
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l59
		add	r7

						//spi_sd.c, line 205
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 205
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711802
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 205
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//spi_sd.c, line 205
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3

						//spi_sd.c, line 205
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
				// flags 42
	and	r3

						//spi_sd.c, line 205
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l53
		add	r7

						//spi_sd.c, line 207
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
	stdec	r6

						//spi_sd.c, line 207
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l54,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 207
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 8 bytes (8 in total)

						//spi_sd.c, line 208
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r5
						//save_temp done

						//spi_sd.c, line 209
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r5
						// (save temp)isreg
	mr	r3
						//save_temp done

						//spi_sd.c, line 210
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 608
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//spi_sd.c, line 210
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l55,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 210
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 8 bytes
	.liconst	16
	add	r6

						//spi_sd.c, line 211
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r5
						//save_temp done

						//spi_sd.c, line 212
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r5
						//save_temp done

						//spi_sd.c, line 213
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r5
						//save_temp done

						//spi_sd.c, line 214
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r5
						//save_temp done
						// allocreg r1

						//spi_sd.c, line 215
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	64
	and	r1
						// (save result) // isreg
						// freereg r1

						//spi_sd.c, line 215
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//spi_sd.c, line 218
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0

						//spi_sd.c, line 219
						//pcreltotemp
	.lipcrel	l41
	add	r7
l57: # 

						//spi_sd.c, line 223
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//spi_sd.c, line 224
						//pcreltotemp
	.lipcrel	l41
	add	r7
l53: # 

						//spi_sd.c, line 227
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//spi_sd.c, line 227
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l60,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 227
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
l59: # 

						//spi_sd.c, line 229
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
	cmp	r4

						//spi_sd.c, line 229
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l62
		add	r7

						//spi_sd.c, line 231
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l63,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 231
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//spi_sd.c, line 232
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//spi_sd.c, line 233
						//pcreltotemp
	.lipcrel	l41
	add	r7
l62: # 

						//spi_sd.c, line 201
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r4
						// (save result) // isreg

						//spi_sd.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l64
		add	r7
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 235
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l41: # 
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l54:
	.byte	67
	.byte	77
	.byte	68
	.byte	53
	.byte	56
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	32
	.byte	32
	.byte	0
l55:
	.byte	67
	.byte	77
	.byte	68
	.byte	53
	.byte	56
	.byte	95
	.byte	50
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	32
	.byte	32
	.byte	0
l60:
	.byte	67
	.byte	77
	.byte	68
	.byte	53
	.byte	56
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	32
	.byte	32
	.byte	0
l63:
	.byte	83
	.byte	68
	.byte	72
	.byte	67
	.byte	32
	.byte	73
	.byte	110
	.byte	105
	.byte	116
	.byte	105
	.byte	97
	.byte	108
	.byte	105
	.byte	122
	.byte	97
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	32
	.byte	101
	.byte	114
	.byte	114
	.byte	111
	.byte	114
	.byte	33
	.byte	10
	.byte	0
l42:
	.byte	99
	.byte	109
	.byte	100
	.byte	95
	.byte	67
	.byte	77
	.byte	68
	.byte	56
	.byte	32
	.byte	114
	.byte	101
	.byte	115
	.byte	112
	.byte	111
	.byte	110
	.byte	115
	.byte	101
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.7
	.global	_spi_init
_spi_init:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r5
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-48
						// (save temp)isreg
	mr	r5
						//save_temp done
						// allocreg r4
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

						//spi_sd.c, line 243
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sd_is_sdhc
						// extern pe not varadr
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
						// allocreg r1

						//spi_sd.c, line 244
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l67,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 244
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//spi_sd.c, line 246
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	7
						// (save temp)isreg
	mr	r4
						//save_temp done
l89: # 
						// allocreg r1

						//spi_sd.c, line 248
						// (bitwise/arithmetic) 	//ops: 6, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r5
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

						//spi_sd.c, line 248
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 248
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l94
		add	r7
l90: # 

						//spi_sd.c, line 248
						// (bitwise/arithmetic) 	//ops: 6, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r5
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

						//spi_sd.c, line 248
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 248
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l90
		add	r7
l94: # 

						//spi_sd.c, line 248
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	2
						// (save temp)store type 3
	st	r5
						//save_temp done

						//spi_sd.c, line 249
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Flow control - popping 0 + 0 bytes

						//spi_sd.c, line 251
						// (bitwise/arithmetic) 	//ops: 6, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r5
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

						//spi_sd.c, line 251
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 251
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l95
		add	r7
l91: # 

						//spi_sd.c, line 251
						// (bitwise/arithmetic) 	//ops: 6, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r5
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

						//spi_sd.c, line 251
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 251
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l91
		add	r7
l95: # 
						// freereg r1

						//spi_sd.c, line 251
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	3
						// (save temp)store type 3
	st	r5
						//save_temp done

						//spi_sd.c, line 252
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 252
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	9764928
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 252
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 252
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	cmp	r0
						// freereg r1

						//spi_sd.c, line 252
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l78
		add	r7
						// allocreg r1

						//spi_sd.c, line 253
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r4
						//save_temp done
l78: # 

						//spi_sd.c, line 255
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
	cmp	r4

						//spi_sd.c, line 255
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l80
		add	r7
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 257
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l81,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 257
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//spi_sd.c, line 259
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//spi_sd.c, line 260
						//pcreltotemp
	.lipcrel	l66
	add	r7
l80: # 
						// allocreg r1

						//spi_sd.c, line 246
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r4
						// (save result) // isreg

						//spi_sd.c, line 246
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l89
		add	r7

						//spi_sd.c, line 263
						//call
						//pcreltotemp
	.lipcrel	_is_sdhc
	add	r7
						// Flow control - popping 0 + 0 bytes

						//spi_sd.c, line 263
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sd_is_sdhc, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//spi_sd.c, line 264
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
				// flags 2
	mr	r0
	and	r0

						//spi_sd.c, line 264
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l84
		add	r7
						// freereg r1

						//spi_sd.c, line 269
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 269
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	16711760
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 269
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r6
						// freereg r1
l84: # 
						// allocreg r1

						//spi_sd.c, line 271
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

						//spi_sd.c, line 273
						//call
						//pcreltotemp
	.lipcrel	_sd_get_size
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//spi_sd.c, line 273
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sd_size, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//spi_sd.c, line 274
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	stdec	r6

						//spi_sd.c, line 274
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l85,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 274
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	8
	add	r6

						//spi_sd.c, line 277
						// (bitwise/arithmetic) 	//ops: 6, 4, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r5
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

						//spi_sd.c, line 277
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 277
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l96
		add	r7
l92: # 

						//spi_sd.c, line 277
						// (bitwise/arithmetic) 	//ops: 6, 4, 1
						// (obj to r0) flags 260 type 503
						// deref 
	ld	r5
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

						//spi_sd.c, line 277
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 277
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l92
		add	r7
l96: # 

						//spi_sd.c, line 277
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	2
						// (save temp)store type 3
	st	r5
						//save_temp done

						//spi_sd.c, line 278
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

						//spi_sd.c, line 281
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0
l66: # 
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l81:
	.byte	73
	.byte	69
	.byte	82
	.byte	82
	.byte	0
l67:
	.byte	83
	.byte	80
	.byte	73
	.byte	0
l85:
	.byte	83
	.byte	68
	.byte	32
	.byte	99
	.byte	97
	.byte	114
	.byte	100
	.byte	32
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	32
	.byte	105
	.byte	115
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
	.global	_sd_write_sector
_sd_write_sector:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	255
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//spi_sd.c, line 289
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 290
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 576
						// const/deref
						// matchobj comparing flags 1 with 576
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 576
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 576
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

						//spi_sd.c, line 290
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 290
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l119
		add	r7
l115: # 

						//spi_sd.c, line 290
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

						//spi_sd.c, line 290
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 290
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l115
		add	r7
l119: # 
						// freereg r1

						//spi_sd.c, line 290
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
	.liconst	259
						// (save temp)store type 3
	st	r0
						//save_temp done

						//spi_sd.c, line 291
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 1
						// matchobj comparing flags 576 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 293
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 576
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 293
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	16711768
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 293
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 294
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//spi_sd.c, line 294
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l102
		add	r7
						// allocreg r1

						//spi_sd.c, line 296
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l103,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 296
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//spi_sd.c, line 298
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	1
	mr	r0

						//spi_sd.c, line 299
						//pcreltotemp
	.lipcrel	l97
	add	r7
l102: # 
						// allocreg r1

						//spi_sd.c, line 301
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 240 type 503
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 302
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 576
						// const
						// matchobj comparing flags 1 with 576
	.liconst	254
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 305
						// (a/p assign)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done
						// freereg r1
						// freereg r2
l116: # 
						// allocreg r1

						//spi_sd.c, line 307
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 22 type 3
						// deref 
						// (prepobj tmp)
 						// deref
						// var FIXME - deref?
						// reg - auto
	.liconst	20
	ldidx	r6
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//spi_sd.c, line 308
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 3
						// matchobj comparing flags 74 with 34
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	24
	sgn
	shr	r2
						// (save result) // isreg

						//spi_sd.c, line 308
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 5, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 240 type 3
						// matchobj comparing flags 576 with 74
						// matchobj comparing flags 576 with 74
						// reg r4 - only match against tmp
	mt	r4
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x260
	mt	r0
	st	r3
						// freereg r2
						// allocreg r2

						//spi_sd.c, line 309
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 3
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 608
	.liconst	16
	sgn
	shr	r2
						// (save result) // isreg

						//spi_sd.c, line 309
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 5, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 608
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 240 type 3
						// matchobj comparing flags 576 with 74
						// matchobj comparing flags 576 with 74
						// reg r4 - only match against tmp
	mt	r4
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x260
	mt	r0
	st	r3
						// freereg r2
						// allocreg r2

						//spi_sd.c, line 310
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 3
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 608
	.liconst	8
	sgn
	shr	r2
						// (save result) // isreg

						//spi_sd.c, line 310
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 5, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 608
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 240 type 3
						// matchobj comparing flags 576 with 74
						// matchobj comparing flags 576 with 74
						// reg r4 - only match against tmp
	mt	r4
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x260
	mt	r0
	st	r3
						// freereg r2

						//spi_sd.c, line 311
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 5, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 240 type 3
						// matchobj comparing flags 576 with 74
						// matchobj comparing flags 576 with 74
						// reg r4 - only match against tmp
	mt	r4
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x260
	mt	r0
	st	r3
						// freereg r1

						//spi_sd.c, line 312
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 608
						// matchobj comparing flags 2 with 608
						// var, auto|reg
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
	.liconst	20
	ldidx	r6
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
	.liconst	24
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//spi_sd.c, line 306
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
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

						//spi_sd.c, line 306
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	128
	sgn
	cmp	r0

						//spi_sd.c, line 306
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l116
		add	r7
						// allocreg r2
						// allocreg r1

						//spi_sd.c, line 315
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 316
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 576
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 317
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 576
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 319
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 576
						// const
						// matchobj comparing flags 1 with 576
	.liconst	100000
						// (save temp)isreg
	mr	r5
						//save_temp done
l117: # 

						//spi_sd.c, line 322
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 240 type 503
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 325
						// (test)
						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 576
						// deref 
	ld	r3

						//spi_sd.c, line 325
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l121
		add	r7

						//spi_sd.c, line 325
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	1
	sub	r5
						// (save result) // isreg

						//spi_sd.c, line 325
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l117
		add	r7
l121: # 

						//spi_sd.c, line 326
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 240 type 503
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r3
						//save_temp done

						//spi_sd.c, line 327
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 576
						// const/deref
						// matchobj comparing flags 1 with 576
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 576
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 576
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

						//spi_sd.c, line 327
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 327
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l122
		add	r7
l118: # 

						//spi_sd.c, line 327
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

						//spi_sd.c, line 327
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 327
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l118
		add	r7
l122: # 

						//spi_sd.c, line 327
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
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done

						//spi_sd.c, line 328
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l97: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l103:
	.byte	87
	.byte	114
	.byte	105
	.byte	116
	.byte	101
	.byte	32
	.byte	102
	.byte	97
	.byte	105
	.byte	108
	.byte	101
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
	.section	.text.9
l123:
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
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	32768
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2
						// allocreg r1

						//spi_sd.c, line 336
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//spi_sd.c, line 338
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1499999
						// (save temp)isreg
	mr	r2
						//save_temp done
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
l125: # 

						//spi_sd.c, line 341
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//spi_sd.c, line 343
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 260 type 3
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	254
	cmp	r0

						//spi_sd.c, line 343
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l129
		add	r7

						//spi_sd.c, line 345
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//spi_sd.c, line 345
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l131
		add	r7

						//spi_sd.c, line 346
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 66
						// const/deref
						// matchobj comparing flags 1 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 33
						// matchobj comparing flags 576 with 33
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

						//spi_sd.c, line 346
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 346
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l151
		add	r7
l147: # 

						//spi_sd.c, line 346
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 33
						// matchobj comparing flags 576 with 33
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

						//spi_sd.c, line 346
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 346
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l147
		add	r7
l151: # 

						//spi_sd.c, line 346
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
	.liconst	273
						// (save temp)store type 3
	st	r0
						//save_temp done
l131: # 

						//spi_sd.c, line 348
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	20
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r0

						//spi_sd.c, line 348
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l152
		add	r7
						// freereg r5
l148: # 

						//spi_sd.c, line 351
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//spi_sd.c, line 351
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 260 type 3
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
						// (save temp)isreg
	mr	r2
						//save_temp done

						//spi_sd.c, line 352
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 608
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//spi_sd.c, line 352
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l140
		add	r7

						//spi_sd.c, line 353
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// reg r1 - no need to prep
	mt	r1
	exg	r2
						//sizemod based on type 0x101
	byt
	st	r2
	exg	r2

						//spi_sd.c, line 353
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	1
	add	r1
						// (save result) // isreg
l140: # 

						//spi_sd.c, line 348
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	20
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
	.liconst	24
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//spi_sd.c, line 348
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r0

						//spi_sd.c, line 348
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l148
		add	r7
l152: # 
						// allocreg r5

						//spi_sd.c, line 355
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//spi_sd.c, line 356
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//spi_sd.c, line 357
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//spi_sd.c, line 357
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l142
		add	r7

						//spi_sd.c, line 358
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 66
						// const/deref
						// matchobj comparing flags 1 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 33
						// matchobj comparing flags 576 with 33
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

						//spi_sd.c, line 358
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 358
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l153
		add	r7
l149: # 

						//spi_sd.c, line 358
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 33
						// matchobj comparing flags 576 with 33
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

						//spi_sd.c, line 358
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 358
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l149
		add	r7
l153: # 

						//spi_sd.c, line 358
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
	.liconst	16
						// (save temp)store type 3
	st	r0
						//save_temp done
l142: # 

						//spi_sd.c, line 360
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//spi_sd.c, line 361
						// (a/p assign)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r6
						//save_temp done
l129: # 

						//spi_sd.c, line 338
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r2
						// (save result) // isreg

						//spi_sd.c, line 338
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l125
		add	r7
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 102 type 3
						// matchobj comparing flags 258 with 1
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
						// (save temp)isreg
	mr	r0
						//save_temp done
						// freereg r1
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
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.a
	.global	_sd_read_sector
_sd_read_sector:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r4
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	32768
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//spi_sd.c, line 369
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//spi_sd.c, line 373
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

						//spi_sd.c, line 374
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
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
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 33
						// matchobj comparing flags 576 with 33
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

						//spi_sd.c, line 374
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 374
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l165
		add	r7
l163: # 

						//spi_sd.c, line 374
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 33
						// matchobj comparing flags 576 with 33
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

						//spi_sd.c, line 374
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 374
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l163
		add	r7
l165: # 
						// freereg r1

						//spi_sd.c, line 374
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
	.liconst	259
						// (save temp)store type 3
	st	r0
						//save_temp done

						//spi_sd.c, line 375
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
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//spi_sd.c, line 377
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 377
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	16711761
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 377
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 378
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//spi_sd.c, line 378
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l154
		add	r7

						//spi_sd.c, line 384
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	512
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 384
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 384
						//call
						//pcreltotemp
	.lipcrel	l123
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//spi_sd.c, line 384
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//spi_sd.c, line 386
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 66
						// const/deref
						// matchobj comparing flags 1 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 33
						// matchobj comparing flags 576 with 33
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

						//spi_sd.c, line 386
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 386
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l166
		add	r7
l164: # 
						// allocreg r1

						//spi_sd.c, line 386
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
						// (obj to r0) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-48
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 33
						// matchobj comparing flags 576 with 33
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

						//spi_sd.c, line 386
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//spi_sd.c, line 386
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l164
		add	r7
l166: # 

						//spi_sd.c, line 386
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
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done
l154: # 

						//spi_sd.c, line 387
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
	ldinc	r6	// shortest way to add 4 to sp
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
	.section	.text.b
	.global	_sd_get_size
_sd_get_size:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r5

						//spi_sd.c, line 395
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 395
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711753
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 395
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//spi_sd.c, line 397
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	18
	stdec	r6
						// allocreg r1

						//spi_sd.c, line 397
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sizebuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//spi_sd.c, line 397
						//call
						//pcreltotemp
	.lipcrel	l123
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1

						//spi_sd.c, line 398
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
l182: # 
						// allocreg r1

						//spi_sd.c, line 399
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r5
						// (save result) // isreg

						//spi_sd.c, line 399
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	18
	sgn
	cmp	r5

						//spi_sd.c, line 399
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l182
		add	r7
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 404
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 404
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	192
	and	r1
						// (save result) // isreg

						//spi_sd.c, line 404
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	64
	cmp	r1
						// freereg r1

						//spi_sd.c, line 404
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l173
		add	r7
						// allocreg r1

						//spi_sd.c, line 406
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf, 7
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 406
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//spi_sd.c, line 406
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf, 8
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 406
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg

						//spi_sd.c, line 406
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2
						// allocreg r2

						//spi_sd.c, line 406
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sizebuf, 9
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 406
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//spi_sd.c, line 406
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 6
						// (obj to r5) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4194303
	and	r5
						// (save result) // isreg

						//spi_sd.c, line 406
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r5
						// (save result) // isreg
						// freereg r1

						//spi_sd.c, line 407
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	10
	shl	r5
						// (save result) // isreg

						//spi_sd.c, line 410
						//pcreltotemp
	.lipcrel	l174
	add	r7
l173: # 
						// allocreg r3

						//spi_sd.c, line 411
						//FIXME convert
						//Converting to wider type...
						// (obj to r3) flags 2 type 101
						// extern
	.liabs	_sizebuf, 9
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r3
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 411
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	shl	r3
						// (save result) // isreg

						//spi_sd.c, line 411
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	and	r3
						// (save result) // isreg
						// allocreg r1

						//spi_sd.c, line 411
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf, 10
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 411
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	7
	sgn
	shr	r1
						// (save result) // isreg

						//spi_sd.c, line 411
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	or	r3
						// (save result) // isreg
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 412
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sizebuf, 5
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 412
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
						// allocreg r4

						//spi_sd.c, line 413
						//FIXME convert
						//Converting to wider type...
						// (obj to r4) flags 2 type 101
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sizebuf, 6
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r4
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 413
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	3
	and	r4
						// (save result) // isreg

						//spi_sd.c, line 413
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	10
	shl	r4
						// (save result) // isreg
						// allocreg r1

						//spi_sd.c, line 413
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sizebuf, 7
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 413
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	2
	shl	r1
						// (save result) // isreg

						//spi_sd.c, line 413
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 5, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	or	r4
						// (save result) // isreg
						// freereg r1
						// allocreg r1

						//spi_sd.c, line 413
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sizebuf, 8
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//spi_sd.c, line 413
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	192
	and	r1
						// (save result) // isreg

						//spi_sd.c, line 413
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	6
	sgn
	shr	r1
						// (save result) // isreg

						//spi_sd.c, line 413
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 5, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	or	r4
						// (save result) // isreg
						// freereg r1

						//spi_sd.c, line 414
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 2
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//spi_sd.c, line 414
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	stdec	r6

						//spi_sd.c, line 414
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//spi_sd.c, line 414
						// (a/p push)
						// a: pushed 12, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l175,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 414
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 16 bytes (16 in total)

						//spi_sd.c, line 415
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
	add	r3
						// (save result) // isreg

						//spi_sd.c, line 415
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r3 - only match against tmp
	mt	r3
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r3

						//spi_sd.c, line 416
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r3 - only match against tmp
	stdec	r6

						//spi_sd.c, line 416
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l176,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 416
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 8 bytes (24 in total)

						//spi_sd.c, line 417
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 1 type 3
						// const
	.liconst	1
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	28
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//spi_sd.c, line 418
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r4

						//spi_sd.c, line 418
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 2, 4, 6
						// (obj to r5) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mr	r5
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	mt	r3
	mul	r5
						// (save result) // isreg
						// freereg r1
						// freereg r3

						//spi_sd.c, line 419
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	stdec	r6

						//spi_sd.c, line 419
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
	stdec	r6

						//spi_sd.c, line 419
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l177,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 419
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 12 + 24 bytes
						// matchobj comparing flags 1 with 2
	.liconst	36
	add	r6

						//spi_sd.c, line 420
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
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

						//spi_sd.c, line 420
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l185
		add	r7
l183: # 
						// allocreg r1

						//spi_sd.c, line 422
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	shl	r5
						// (save result) // isreg

						//spi_sd.c, line 423
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
	.liconst	1
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//spi_sd.c, line 420
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	512
	sgn
	cmp	r0

						//spi_sd.c, line 420
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l183
		add	r7
l185: # 

						//spi_sd.c, line 425
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	stdec	r6

						//spi_sd.c, line 425
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l181,0
						// static pe is varadr
	stdec	r6

						//spi_sd.c, line 425
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
l174: # 

						//spi_sd.c, line 427
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	mr	r0
						// freereg r1
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l175:
	.byte	99
	.byte	95
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	95
	.byte	109
	.byte	117
	.byte	108
	.byte	116
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	114
	.byte	101
	.byte	97
	.byte	100
	.byte	95
	.byte	98
	.byte	108
	.byte	95
	.byte	108
	.byte	101
	.byte	110
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	99
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
l176:
	.byte	77
	.byte	117
	.byte	108
	.byte	116
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
l177:
	.byte	37
	.byte	100
	.byte	32
	.byte	98
	.byte	108
	.byte	111
	.byte	99
	.byte	107
	.byte	115
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
l181:
	.byte	37
	.byte	100
	.byte	32
	.byte	98
	.byte	108
	.byte	111
	.byte	99
	.byte	107
	.byte	115
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	53
	.byte	49
	.byte	50
	.byte	32
	.byte	98
	.byte	121
	.byte	116
	.byte	101
	.byte	115
	.byte	10
	.byte	0
	.section	.bss
	.global	_sd_is_sdhc
	.comm	_sd_is_sdhc,4
	.global	_sd_size
	.comm	_sd_size,4
	.global	_SPI_R1
	.comm	_SPI_R1,6
	.global	_sizebuf
	.comm	_sizebuf,18
