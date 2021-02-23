	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_compare
_compare:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r4

						//minfat.c, line 96
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

						//minfat.c, line 97
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r0

						//minfat.c, line 97
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l9
		add	r7
l8: # 
						// allocreg r2

						//minfat.c, line 98
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 6a type 301
						// deref 
	ldbinc	r3
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg
						// allocreg r1

						//minfat.c, line 98
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2a type 301
						// matchobj comparing flags 42 with 106
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 170 with 106
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 106
	.liconst	12
	ldidx	r6
						//sizemod based on type 0x301
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 98
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 42
						// var, auto|reg
						// matchobj comparing flags 1 with 42
	.liconst	12
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//minfat.c, line 98
						// Q1 disposable
						// Q2 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 4a type 3
						// reg r1 - only match against tmp
	mt	r1
	sgn
	cmp	r2
						// freereg r2
						// freereg r1

						//minfat.c, line 98
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l7
		add	r7

						//minfat.c, line 99
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	mr	r0

						//minfat.c, line 100
						//pcreltotemp
	.lipcrel	l1
	add	r7
l7: # 

						//minfat.c, line 97
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//minfat.c, line 97
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
	sgn
	cmp	r4

						//minfat.c, line 97
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l8
		add	r7
l9: # 

						//minfat.c, line 101
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
l1: # 
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
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_FindDrive
_FindDrive:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2

						//minfat.c, line 110
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_fat32
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 103
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

						//minfat.c, line 112
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
	.liabs	l11,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 112
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//minfat.c, line 114
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 114
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 114
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 114
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 114
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l13
		add	r7
						// allocreg r1

						//minfat.c, line 116
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l14,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 116
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//minfat.c, line 117
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//minfat.c, line 118
						//pcreltotemp
	.lipcrel	l10
	add	r7
l13: # 
						// allocreg r1

						//minfat.c, line 121
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l15,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 121
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//minfat.c, line 123
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//minfat.c, line 124
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_partitioncount
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

						//minfat.c, line 127
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	8
	stdec	r6

						//minfat.c, line 127
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l18,0
						// static pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 127
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						//extern: comparing 54 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						//extern: comparing 54 with 0
						// extern (offset 54)
	.liabs	_sector_buffer, 54
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 127
						//call
						//pcreltotemp
	.lipcrel	_compare
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 127
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 127
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l17
		add	r7
						// allocreg r1

						//minfat.c, line 128
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_partitioncount
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
						// freereg r1
l17: # 

						//minfat.c, line 129
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	8
	stdec	r6

						//minfat.c, line 129
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l21,0
						// static pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 129
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// extern (offset 82)
	.liabs	_sector_buffer, 82
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 129
						//call
						//pcreltotemp
	.lipcrel	_compare
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 129
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 129
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l20
		add	r7
						// allocreg r1

						//minfat.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_partitioncount
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
l20: # 

						//minfat.c, line 132
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_partitioncount
						//extern deref
						//sizemod based on type 0x3
	ldt
	stdec	r6

						//minfat.c, line 132
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l22,0
						// static pe is varadr
	stdec	r6

						//minfat.c, line 132
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6

						//minfat.c, line 134
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_partitioncount
						//extern deref
						//sizemod based on type 0x3
	ldt

						//minfat.c, line 134
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l24
		add	r7
						// freereg r1
						// allocreg r1

						//minfat.c, line 140
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 102
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 510
						//extern deref
						//sizemod based on type 0x102
	hlf
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 140
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 140
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj r1)
 						// matchobj comparing flags 130 with 74
						// extern (offset 510)
	.liabs	_sector_buffer, 510
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 510
						// Fuzzy match found against tmp.
	mr	r0
	.liconst	-510
	addt	r0

			// required value found in tmp
	sub	r1
						// (save result) // isreg

						//minfat.c, line 140
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1

						//minfat.c, line 140
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
	.liconst	16
	stdec	r6

						//minfat.c, line 140
						// (a/p push)
						// a: pushed 12, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	512
	stdec	r6

						//minfat.c, line 140
						// (a/p push)
						// a: pushed 16, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l25,0
						// static pe is varadr
	stdec	r6

						//minfat.c, line 140
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 20 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	20
	add	r6

						//minfat.c, line 142
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 454
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//minfat.c, line 143
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 2 type 102
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 510
						//extern deref
						//sizemod based on type 0x102
	hlf
	ldt
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 143
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	21930
	cmp	r2

						//minfat.c, line 143
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l27
		add	r7
						// allocreg r1

						//minfat.c, line 144
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 454
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//minfat.c, line 145
						//pcreltotemp
	.lipcrel	l30
	add	r7
l27: # 

						//minfat.c, line 145
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	43605
	cmp	r2

						//minfat.c, line 145
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l30
		add	r7
						// freereg r1
						// allocreg r1

						//minfat.c, line 147
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l31,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 147
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//minfat.c, line 148
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//minfat.c, line 149
						//pcreltotemp
	.lipcrel	l10
	add	r7
l30: # 

						//minfat.c, line 150
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//minfat.c, line 150
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l32,0
						// static pe is varadr
	stdec	r6

						//minfat.c, line 150
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 8 bytes (8 in total)

						//minfat.c, line 151
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 151
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 151
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 8 bytes
	.liconst	12
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 151
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 151
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l34
		add	r7
						// allocreg r1

						//minfat.c, line 152
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//minfat.c, line 154
						//pcreltotemp
	.lipcrel	l10
	add	r7
						// freereg r1
l34: # 
						// allocreg r1

						//minfat.c, line 154
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l35,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 154
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l24: # 

						//minfat.c, line 157
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l36,0
						// static pe is varadr
	stdec	r6

						//minfat.c, line 157
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 4 bytes (4 in total)

						//minfat.c, line 159
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	8
	stdec	r6

						//minfat.c, line 159
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l39,0
						// static pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 159
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// extern (offset 82)
	.liabs	_sector_buffer, 82
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 159
						//call
						//pcreltotemp
	.lipcrel	_compare
	add	r7
						// Flow control - popping 8 + 4 bytes
	.liconst	12
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 159
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 159
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l38
		add	r7
						// allocreg r1

						//minfat.c, line 160
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_fat32
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//minfat.c, line 161
						//pcreltotemp
	.lipcrel	l42
	add	r7
						// freereg r1
l38: # 

						//minfat.c, line 161
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	8
	stdec	r6

						//minfat.c, line 161
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l43,0
						// static pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 161
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// extern (offset 54)
	.liabs	_sector_buffer, 54
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 161
						//call
						//pcreltotemp
	.lipcrel	_compare
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 161
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 161
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l42
		add	r7
						// allocreg r1

						//minfat.c, line 163
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l44,0
						// static pe is varadr
	stdec	r6

						//minfat.c, line 163
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//minfat.c, line 164
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//minfat.c, line 165
						//pcreltotemp
	.lipcrel	l10
	add	r7
						// freereg r1
l42: # 
						// allocreg r1

						//minfat.c, line 167
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 510
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 167
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	85
	cmp	r1
						// freereg r1

						//minfat.c, line 167
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l45
		add	r7
						// allocreg r1

						//minfat.c, line 167
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 511
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 167
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	170
	cmp	r1
						// freereg r1

						//minfat.c, line 167
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l46
		add	r7
l45: # 
						// allocreg r1

						//minfat.c, line 168
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//minfat.c, line 171
						//pcreltotemp
	.lipcrel	l10
	add	r7
l46: # 

						//minfat.c, line 171
						//FIXME convert
						//Converting to wider type...
						// (obj to r4) flags 2 type 101
						// extern
	.liabs	_sector_buffer
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r4
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 171
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	233
	cmp	r4

						//minfat.c, line 171
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l49
		add	r7

						//minfat.c, line 171
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	235
	cmp	r4

						//minfat.c, line 171
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l49
		add	r7

						//minfat.c, line 172
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//minfat.c, line 175
						//pcreltotemp
	.lipcrel	l10
	add	r7
						// freereg r1
l49: # 
						// allocreg r1

						//minfat.c, line 175
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 11
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 175
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//minfat.c, line 175
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l51
		add	r7
						// allocreg r1

						//minfat.c, line 175
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sector_buffer, 12
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 175
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	cmp	r1
						// freereg r1

						//minfat.c, line 175
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l52
		add	r7
l51: # 
						// allocreg r1

						//minfat.c, line 176
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//minfat.c, line 179
						//pcreltotemp
	.lipcrel	l10
	add	r7
						// freereg r1
						// freereg r2
l52: # 

						//minfat.c, line 179
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 13
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_cluster_size, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//minfat.c, line 182
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r2
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_cluster_mask, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r2

						//minfat.c, line 184
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	stdec	r6
						// freereg r2

						//minfat.c, line 184
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1

						//minfat.c, line 184
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l54,0
						// static pe is varadr
	stdec	r6

						//minfat.c, line 184
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 12 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	12
	add	r6
						// allocreg r1

						//minfat.c, line 186
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 14
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 186
						// (bitwise/arithmetic) 	//ops: 2, 4, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	add	r1
						// (save result) // isreg
						// allocreg r2

						//minfat.c, line 186
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 2 type 101
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_sector_buffer, 15
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 186
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 6
						// (obj to r5) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
	shl	r5
						// (save result) // isreg

						//minfat.c, line 186
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 6, 2, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	add	r5
						// (save result) // isreg
						// freereg r2
						// freereg r1
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_fat_start, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r5

						//minfat.c, line 187
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 16
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_fat_number, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//minfat.c, line 189
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 189
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l56
		add	r7
						// allocreg r2

						//minfat.c, line 191
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	8
	stdec	r6

						//minfat.c, line 191
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l59,0
						// static pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 191
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// extern (offset 82)
	.liabs	_sector_buffer, 82
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 191
						//call
						//pcreltotemp
	.lipcrel	_compare
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 191
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 191
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
						// allocreg r1

						//minfat.c, line 192
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//minfat.c, line 194
						//pcreltotemp
	.lipcrel	l10
	add	r7
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
l58: # 
						// allocreg r2
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 194
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	4
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_dir_entries, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//minfat.c, line 195
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_root_directory_size, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r2
						// allocreg r1

						//minfat.c, line 196
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 37
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 196
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r1
						// (save result) // isreg
						// allocreg r3

						//minfat.c, line 196
						//FIXME convert
						//Converting to wider type...
						// (obj to r3) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 36
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r3
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 196
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	mt	r3
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r3
						// allocreg r3

						//minfat.c, line 196
						//FIXME convert
						//Converting to wider type...
						// (obj to r3) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 38
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r3
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 196
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	16
	shl	r3
						// (save result) // isreg

						//minfat.c, line 196
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	mt	r3
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r3
						// allocreg r3

						//minfat.c, line 196
						//FIXME convert
						//Converting to wider type...
						// (obj to r3) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 39
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r3
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 196
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	24
	shl	r3
						// (save result) // isreg

						//minfat.c, line 196
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	mt	r3
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r3
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_fat_size, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r1

						//minfat.c, line 197
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_fat_number
						//extern deref
						//sizemod based on type 0x103
	ldt
	mul	r1
						// (save result) // isreg

						//minfat.c, line 197
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_fat_start
						//extern deref
						//sizemod based on type 0x103
	ldt
	add	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_data_start, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r1
						// allocreg r3

						//minfat.c, line 198
						//FIXME convert
						//Converting to wider type...
						// (obj to r3) flags 2 type 101
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 45
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r3
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 198
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r3
						// (save result) // isreg
						// allocreg r4

						//minfat.c, line 198
						//FIXME convert
						//Converting to wider type...
						// (obj to r4) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 44
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r4
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 198
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 5, 4, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r4 - only match against tmp
	mt	r4
	addt	r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r4
						// allocreg r4

						//minfat.c, line 198
						//FIXME convert
						//Converting to wider type...
						// (obj to r4) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 46
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r4
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 198
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	16
	shl	r4
						// (save result) // isreg

						//minfat.c, line 198
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 5, 4, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 2
						// reg r4 - only match against tmp
	mt	r4
	addt	r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r4
						// allocreg r4

						//minfat.c, line 198
						//FIXME convert
						//Converting to wider type...
						// (obj to r4) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 47
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r4
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 198
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	15
	and	r4
						// (save result) // isreg

						//minfat.c, line 198
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	24
	shl	r4
						// (save result) // isreg

						//minfat.c, line 198
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 5, 4, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 2
						// reg r4 - only match against tmp
	mt	r4
	addt	r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r4
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_root_directory_cluster, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r3

						//minfat.c, line 199
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	sub	r3
						// (save result) // isreg

						//minfat.c, line 199
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	mt	r3
	mul	r2
						// (save result) // isreg
						// freereg r3

						//minfat.c, line 199
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_root_directory_start
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
						// freereg r1

						//minfat.c, line 202
						//pcreltotemp
	.lipcrel	l60
	add	r7
l56: # 
						// allocreg r4
						// allocreg r1

						//minfat.c, line 204
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 18
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 204
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//minfat.c, line 204
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 17
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 204
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_dir_entries, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r1

						//minfat.c, line 205
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	5
	shl	r1
						// (save result) // isreg

						//minfat.c, line 205
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	511
	add	r1
						// (save result) // isreg

						//minfat.c, line 205
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	9
	shr	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_root_directory_size, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r1
						// allocreg r2

						//minfat.c, line 208
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 23
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 208
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg
						// allocreg r3

						//minfat.c, line 208
						//FIXME convert
						//Converting to wider type...
						// (obj to r3) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 22
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r3
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 208
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	mt	r3
	addt	r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r3
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_fat_size, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2

						//minfat.c, line 211
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_fat_number
						//extern deref
						//sizemod based on type 0x103
	ldt
	mul	r2
						// (save result) // isreg

						//minfat.c, line 211
						// (bitwise/arithmetic) 	//ops: 3, 6, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// reg r5 - only match against tmp
	mt	r5
	add	r2
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_root_directory_start, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r2

						//minfat.c, line 212
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_root_directory_cluster
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//minfat.c, line 215
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_data_start
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
						// freereg r1
l60: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//minfat.c, line 218
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 218
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//minfat.c, line 220
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	1
	mr	r0
l10: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l14:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	77
	.byte	66
	.byte	82
	.byte	32
	.byte	102
	.byte	97
	.byte	105
	.byte	108
	.byte	101
	.byte	100
	.byte	10
	.byte	0
l31:
	.byte	78
	.byte	111
	.byte	32
	.byte	112
	.byte	97
	.byte	114
	.byte	116
	.byte	105
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	32
	.byte	115
	.byte	105
	.byte	103
	.byte	110
	.byte	97
	.byte	116
	.byte	117
	.byte	114
	.byte	101
	.byte	32
	.byte	102
	.byte	111
	.byte	117
	.byte	110
	.byte	100
	.byte	10
	.byte	0
l25:
	.byte	77
	.byte	66
	.byte	82
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	112
	.byte	97
	.byte	114
	.byte	116
	.byte	105
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	111
	.byte	102
	.byte	102
	.byte	115
	.byte	101
	.byte	116
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	115
	.byte	105
	.byte	103
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	115
	.byte	105
	.byte	103
	.byte	32
	.byte	48
	.byte	120
	.byte	37
	.byte	120
	.byte	10
	.byte	0
l32:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	98
	.byte	111
	.byte	111
	.byte	116
	.byte	32
	.byte	115
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
l35:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	32
	.byte	98
	.byte	111
	.byte	111
	.byte	116
	.byte	32
	.byte	115
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	32
	.byte	102
	.byte	114
	.byte	111
	.byte	109
	.byte	32
	.byte	102
	.byte	105
	.byte	114
	.byte	115
	.byte	116
	.byte	32
	.byte	112
	.byte	97
	.byte	114
	.byte	116
	.byte	105
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	10
	.byte	0
l44:
	.byte	85
	.byte	110
	.byte	115
	.byte	117
	.byte	112
	.byte	112
	.byte	111
	.byte	114
	.byte	116
	.byte	101
	.byte	100
	.byte	32
	.byte	112
	.byte	97
	.byte	114
	.byte	116
	.byte	105
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	32
	.byte	116
	.byte	121
	.byte	112
	.byte	101
	.byte	33
	.byte	13
	.byte	0
l59:
	.byte	70
	.byte	65
	.byte	84
	.byte	51
	.byte	50
	.byte	32
	.byte	32
	.byte	32
	.byte	0
l11:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	77
	.byte	66
	.byte	82
	.byte	10
	.byte	0
l15:
	.byte	77
	.byte	66
	.byte	82
	.byte	32
	.byte	115
	.byte	117
	.byte	99
	.byte	99
	.byte	101
	.byte	115
	.byte	115
	.byte	102
	.byte	117
	.byte	108
	.byte	108
	.byte	121
	.byte	32
	.byte	114
	.byte	101
	.byte	97
	.byte	100
	.byte	10
	.byte	0
l18:
	.byte	70
	.byte	65
	.byte	84
	.byte	49
	.byte	54
	.byte	32
	.byte	32
	.byte	32
	.byte	0
l21:
	.byte	70
	.byte	65
	.byte	84
	.byte	51
	.byte	50
	.byte	32
	.byte	32
	.byte	32
	.byte	0
l22:
	.byte	80
	.byte	97
	.byte	114
	.byte	116
	.byte	105
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	99
	.byte	111
	.byte	117
	.byte	110
	.byte	116
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
l36:
	.byte	72
	.byte	117
	.byte	110
	.byte	116
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
	.byte	115
	.byte	121
	.byte	115
	.byte	116
	.byte	101
	.byte	109
	.byte	10
	.byte	0
l39:
	.byte	70
	.byte	65
	.byte	84
	.byte	51
	.byte	50
	.byte	32
	.byte	32
	.byte	32
	.byte	0
l43:
	.byte	70
	.byte	65
	.byte	84
	.byte	49
	.byte	54
	.byte	32
	.byte	32
	.byte	32
	.byte	0
l54:
	.byte	67
	.byte	108
	.byte	117
	.byte	115
	.byte	116
	.byte	101
	.byte	114
	.byte	32
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	67
	.byte	108
	.byte	117
	.byte	115
	.byte	116
	.byte	101
	.byte	114
	.byte	32
	.byte	109
	.byte	97
	.byte	115
	.byte	107
	.byte	44
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
	.section	.text.2
	.global	_GetCluster
_GetCluster:
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
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r1

						//minfat.c, line 228
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 64
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 228
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l63
		add	r7

						//minfat.c, line 230
						// (bitwise/arithmetic) 	//ops: 3, 0, 4
						// (obj to r3) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r2 - only match against tmp
	mt	r2
	mr	r3
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	7
	sgn
	shr	r3
						// (save result) // isreg

						//minfat.c, line 231
						// (bitwise/arithmetic) 	//ops: 3, 0, 6
						// (obj to r5) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	127
	and	r5
						// (save result) // isreg

						//minfat.c, line 234
						//pcreltotemp
	.lipcrel	l64
	add	r7
l63: # 

						//minfat.c, line 235
						// (bitwise/arithmetic) 	//ops: 3, 0, 4
						// (obj to r3) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
	mr	r3
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	sgn
	shr	r3
						// (save result) // isreg

						//minfat.c, line 236
						// (bitwise/arithmetic) 	//ops: 3, 0, 6
						// (obj to r5) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r5
						// (save result) // isreg
						// freereg r1
l64: # 

						//minfat.c, line 244
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 244
						// (bitwise/arithmetic) 	//ops: 0, 4, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_fat_start
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r1
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	add	r1
						// (save result) // isreg

						//minfat.c, line 244
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 66
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 244
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 244
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 244
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l66
		add	r7
						// allocreg r1

						//minfat.c, line 245
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//minfat.c, line 251
						//pcreltotemp
	.lipcrel	l61
	add	r7
l66: # 

						//minfat.c, line 251
						// (test)
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 251
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l68
		add	r7
						// freereg r1
						// allocreg r1

						//minfat.c, line 251
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	mul	r1
						// (save result) // isreg

						//minfat.c, line 251
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//minfat.c, line 251
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 6a type 103
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r1
	mr	r4
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	268435455
	and	r4
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 251
						//pcreltotemp
	.lipcrel	l69
	add	r7
l68: # 
						// allocreg r1

						//minfat.c, line 251
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	2
	mul	r1
						// (save result) // isreg

						//minfat.c, line 251
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//minfat.c, line 251
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r4) flags 6a type 102
						// matchobj comparing flags 106 with 130
						// deref 
	hlf
	ld	r1
	mr	r4
						//But unsigned, so no need to extend
						// (save result) // isreg
						// freereg r1
l69: # 
						// allocreg r1

						//minfat.c, line 252
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
l61: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
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
	.section	.text.3
	.global	_FileOpen
_FileOpen:
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
						// allocreg r2
						// allocreg r1

						//minfat.c, line 258
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//minfat.c, line 265
						// (a/p assign)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_current_directory_cluster
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//minfat.c, line 266
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_current_directory_start
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
l96: # 

						//minfat.c, line 270
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//minfat.c, line 271
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_dir_entries
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	cmp	r0

						//minfat.c, line 271
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l99
		add	r7
						// freereg r1
l97: # 
						// allocreg r1

						//minfat.c, line 272
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	15
	and	r1
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 272
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l79
		add	r7

						//minfat.c, line 275
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 275
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x104
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 275
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//minfat.c, line 275
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r6
						// freereg r1

						//minfat.c, line 277
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done

						//minfat.c, line 280
						//pcreltotemp
	.lipcrel	l80
	add	r7
l79: # 
						// allocreg r1

						//minfat.c, line 280
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	32
	add	r3
						// (save result) // isreg
l80: # 

						//minfat.c, line 283
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 62 type 101
						// deref 
	byt
	ld	r3
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 283
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 98
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//minfat.c, line 283
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7

						//minfat.c, line 283
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	229
	cmp	r2

						//minfat.c, line 283
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7
						// freereg r1
						// allocreg r1

						//minfat.c, line 285
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	11
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 285
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	byt
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 285
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	24
	and	r1
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 285
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7
						// allocreg r1

						//minfat.c, line 287
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 287
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//minfat.c, line 288
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	11
	stdec	r6

						//minfat.c, line 288
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	32
	ldidx	r6
	stdec	r6
						// allocreg r1

						//minfat.c, line 288
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 288
						//call
						//pcreltotemp
	.lipcrel	_compare
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 288
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 288
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7
						// freereg r2
						// allocreg r2

						//minfat.c, line 290
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	28
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//minfat.c, line 290
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 290
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r2
						// freereg r1
						// allocreg r1

						//minfat.c, line 291
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	26
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 291
						// (bitwise/arithmetic) 	//ops: 5, 0, 6
						//Special case - addt
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
	addt	r4
						// (save temp)isreg
	mr	r5
						//save_temp done

						//minfat.c, line 291
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 6a type 102
						// matchobj comparing flags 106 with 66
						// deref 
	hlf
	ld	r1
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r5
						// freereg r1

						//minfat.c, line 292
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 98
						// matchobj comparing flags 2 with 98
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 292
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l89
		add	r7
						// allocreg r2
						// allocreg r1

						//minfat.c, line 292
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 98
	.liconst	20
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 292
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// matchobj comparing flags 106 with 98
						// deref 
	hlf
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 292
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 98
	.liconst	4095
	and	r1
						// (save result) // isreg

						//minfat.c, line 292
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 98
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	16
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//minfat.c, line 292
						//pcreltotemp
	.lipcrel	l90
	add	r7
l89: # 
						// allocreg r1

						//minfat.c, line 292
						// (a/p assign)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done
l90: # 

						//minfat.c, line 292
						// (bitwise/arithmetic) 	//ops: 0, 6, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
						//sizemod based on type 0x103
	ld	r6
	mr	r0
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r5
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r5

						//minfat.c, line 293
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	0
						// (save temp)store type 3
	st	r4
						//save_temp done

						//minfat.c, line 295
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 98
	.liconst	1
	mr	r0

						//minfat.c, line 296
						//pcreltotemp
	.lipcrel	l70
	add	r7
l87: # 

						//minfat.c, line 271
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//minfat.c, line 271
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_dir_entries
						//extern deref
						//sizemod based on type 0x103
	ldt
	cmp	r0

						//minfat.c, line 271
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l97
		add	r7
						// freereg r1
l99: # 
						// allocreg r1

						//minfat.c, line 301
						// (test)
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 301
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l98
		add	r7
						// freereg r1
						// allocreg r1

						//minfat.c, line 303
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 303
						//call
						//pcreltotemp
	.lipcrel	_GetCluster
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//minfat.c, line 303
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//minfat.c, line 307
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
	mr	r1
				//return 0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	268435448
	and	r1
						// (save result) // isreg

						//minfat.c, line 307
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	cmp	r1
						// freereg r1

						//minfat.c, line 307
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l98
		add	r7
						// allocreg r1

						//minfat.c, line 310
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
	mr	r1
				//return 0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	2
	sub	r1
						// (save result) // isreg

						//minfat.c, line 310
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mul	r1
						// (save result) // isreg

						//minfat.c, line 310
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//minfat.c, line 313
						//pcreltotemp
	.lipcrel	l96
	add	r7
l98: # 
						// allocreg r1

						//minfat.c, line 316
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0
l70: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-12
	sub	r6
	.lipcrel	.functiontail, 0
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
	.section	.text.4
	.global	_FileNextSector
_FileNextSector:
	stdec	r6
	mt	r3
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
						// allocreg r1

						//minfat.c, line 325
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 62 type 103
						// matchobj comparing flags 98 with 64
						// deref 
	ld	r2
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r2
						//save_temp done

						//minfat.c, line 328
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_cluster_mask
						//extern deref
						//sizemod based on type 0x103
	ldt
	and	r1
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 328
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l102
		add	r7
						// allocreg r3

						//minfat.c, line 329
						// (bitwise/arithmetic) 	//ops: 3, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r2
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//minfat.c, line 329
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 329
						//call
						//pcreltotemp
	.lipcrel	_GetCluster
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//minfat.c, line 329
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//minfat.c, line 329
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						// (save temp)store type 3
	st	r3
						//save_temp done
						// freereg r1
						// freereg r3
l102: # 
						// allocreg r1

						//minfat.c, line 331
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	1
	mr	r0
						// freereg r1
						// freereg r2
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
	.section	.text.5
	.global	_FileRead
_FileRead:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//minfat.c, line 338
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 64
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//minfat.c, line 339
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 339
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to r2) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	2
	sub	r2
						// (save result) // isreg

						//minfat.c, line 339
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mul	r2
						// (save result) // isreg

						//minfat.c, line 339
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 340
						// (bitwise/arithmetic) 	//ops: 0, 4, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_cluster_mask
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r2
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r3
	and	r2
						// (save result) // isreg

						//minfat.c, line 340
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 98
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//minfat.c, line 342
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
	ldidx	r6
	stdec	r6

						//minfat.c, line 342
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 342
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 342
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 342
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l105
		add	r7
						// allocreg r1

						//minfat.c, line 343
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//minfat.c, line 344
						//pcreltotemp
	.lipcrel	l106
	add	r7
l105: # 

						//minfat.c, line 345
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	1
	mr	r0
l106: # 
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

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
	.global	_LoadFile
_LoadFile:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4

						//minfat.c, line 352
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//minfat.c, line 352
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

						//minfat.c, line 352
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 352
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 352
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l109
		add	r7
						// allocreg r1

						//minfat.c, line 354
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_file, 4
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	511
	add	r1
						// (save result) // isreg

						//minfat.c, line 354
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	9
	shr	r1
						// (save result) // isreg

						//minfat.c, line 354
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						//Saving to reg r5
						// (save temp)isreg
	mr	r5
						//save_temp done
						//No need to mask - same size
						// freereg r1

						//minfat.c, line 355
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//minfat.c, line 357
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l110,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 357
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//minfat.c, line 359
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r5

						//minfat.c, line 359
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l116
		add	r7
l118: # 

						//minfat.c, line 361
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	16
	ldidx	r6
	stdec	r6
						// allocreg r1

						//minfat.c, line 361
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 361
						//call
						//pcreltotemp
	.lipcrel	_FileRead
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//minfat.c, line 361
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 361
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l115
		add	r7
						// allocreg r1

						//minfat.c, line 362
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//minfat.c, line 363
						//pcreltotemp
	.lipcrel	l107
	add	r7
						// freereg r1
l115: # 
						// allocreg r1

						//minfat.c, line 363
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 363
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//minfat.c, line 365
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// var, auto|reg
	.liconst	16
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	512
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//minfat.c, line 366
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//minfat.c, line 359
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	sgn
	cmp	r4

						//minfat.c, line 359
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l118
		add	r7
						// allocreg r1

						//minfat.c, line 370
						//pcreltotemp
	.lipcrel	l116
	add	r7
l109: # 

						//minfat.c, line 371
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//minfat.c, line 371
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l117,0
						// static pe is varadr
	stdec	r6

						//minfat.c, line 371
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6

						//minfat.c, line 372
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//minfat.c, line 373
						//pcreltotemp
	.lipcrel	l107
	add	r7
l116: # 

						//minfat.c, line 374
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	1
	mr	r0
l107: # 
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata
l110:
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
	.byte	46
	.byte	46
	.byte	46
	.byte	10
	.byte	0
l117:
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
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.7
	.global	_ChangeDirectory
_ChangeDirectory:
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

						//minfat.c, line 380
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//minfat.c, line 381
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//minfat.c, line 381
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l122
		add	r7
						// freereg r1
						// allocreg r1

						//minfat.c, line 383
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	26
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 383
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r3) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// deref 
	hlf
	ld	r1
	mr	r3
						//But unsigned, so no need to extend
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 384
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 106
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 384
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l124
		add	r7
						// allocreg r1

						//minfat.c, line 384
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 384
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// deref 
	hlf
	ld	r1
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 384
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	mt	r1
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4095
	and	r4
						// (save result) // isreg

						//minfat.c, line 384
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16
	shl	r4
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 384
						//pcreltotemp
	.lipcrel	l125
	add	r7
l124: # 
						// allocreg r1

						//minfat.c, line 384
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
l125: # 

						//minfat.c, line 384
						// (bitwise/arithmetic) 	//ops: 4, 5, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
	or	r3
						// (save result) // isreg
l122: # 

						//minfat.c, line 386
						// (test)
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//minfat.c, line 386
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l127
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r2

						//minfat.c, line 388
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 103
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	2
	sub	r2
						// (save result) // isreg
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 388
						// (bitwise/arithmetic) 	//ops: 2, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	mul	r2
						// (save result) // isreg

						//minfat.c, line 388
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 1
						// (obj to r0) flags 2 type 103
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_current_directory_start, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2

						//minfat.c, line 389
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	4
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_dir_entries, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//minfat.c, line 392
						//pcreltotemp
	.lipcrel	l128
	add	r7
l127: # 
						// allocreg r2
						// allocreg r1

						//minfat.c, line 393
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_root_directory_cluster
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//minfat.c, line 394
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_current_directory_start
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_root_directory_start
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//minfat.c, line 395
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 395
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l130
		add	r7

						//minfat.c, line 395
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	4
	shl	r1
						// (save result) // isreg

						//minfat.c, line 395
						//pcreltotemp
	.lipcrel	l131
	add	r7
l130: # 

						//minfat.c, line 395
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// extern
	.liabs	_root_directory_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	shl	r1
						// (save result) // isreg
l131: # 

						//minfat.c, line 395
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_dir_entries, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r1
l128: # 
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_current_directory_cluster, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r3
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
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
	.section	.text.8
	.global	_NextDirEntry
_NextDirEntry:
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
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r1

						//minfat.c, line 408
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//minfat.c, line 408
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l175
		add	r7

						//minfat.c, line 410
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l136,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 4
	st	r0
						//save_temp done

						//minfat.c, line 411
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l134,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_current_directory_start
						//extern deref
						//sizemod based on type 0x104
	ldt
						// (save temp)store type 4
	st	r0
						//save_temp done

						//minfat.c, line 412
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l135,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_current_directory_cluster
						//extern deref
						//sizemod based on type 0x104
	ldt
						// (save temp)store type 4
	st	r0
						//save_temp done

						//minfat.c, line 413
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l137,0
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
						// freereg r1
l175: # 
						// allocreg r1

						//minfat.c, line 418
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 104
						// extern
	.liabs	_dir_entries
						//extern deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l136,0
						//static deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 418
						// Q2 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	cmp	r2
						// freereg r1

						//minfat.c, line 418
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l178
		add	r7
l176: # 
						// allocreg r1

						//minfat.c, line 420
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	15
	and	r1
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 420
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l147
		add	r7

						//minfat.c, line 422
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//minfat.c, line 422
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l134,0
						//static deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 422
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l134,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 4
	st	r0
						//save_temp done

						//minfat.c, line 422
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 422
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1

						//minfat.c, line 423
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l133,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)store type a
	st	r0
						//save_temp done

						//minfat.c, line 426
						//pcreltotemp
	.lipcrel	l148
	add	r7
l147: # 
						// allocreg r1

						//minfat.c, line 426
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l133,0
						//static deref
						//sizemod based on type 0xa
	ldt
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	32
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l133,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
						// freereg r1
l148: # 

						//minfat.c, line 427
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 104
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l136,0
						//static deref
						//sizemod based on type 0x104
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l136,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type a
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l133,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//minfat.c, line 430
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 430
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r4) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
	mr	r4
						//But unsigned, so no need to extend
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 430
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	15
	cmp	r4

						//minfat.c, line 430
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l150
		add	r7
						// freereg r2
						// allocreg r1

						//minfat.c, line 433
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 22 type 101
						// matchobj comparing flags 34 with 1
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// static
	ldinc	r7
	.ref	l133,0
	ldt
						//sizemod based on type 0x101
	byt
	ldt
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//minfat.c, line 434
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	31
	and	r1
						// (save result) // isreg

						//minfat.c, line 434
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r1
						// (save result) // isreg

						//minfat.c, line 434
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	13
	mul	r1
						// (save result) // isreg

						//minfat.c, line 435
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
	add	r1
						// (save result) // isreg
						// allocreg r2

						//minfat.c, line 436
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 436
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 437
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	3
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 437
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 438
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	5
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 438
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 439
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	7
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 439
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 440
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	9
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 440
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 442
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	14
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 442
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 443
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	16
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 443
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 444
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	18
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 444
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 445
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	20
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 445
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 446
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	22
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 446
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 447
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	24
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 447
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 449
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	28
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 449
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//minfat.c, line 450
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	30
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 450
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2
						// freereg r1

						//minfat.c, line 451
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 106
						// static
	.liabs	l137,0
						// static pe not varadr
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

						//minfat.c, line 454
						//pcreltotemp
	.lipcrel	l159
	add	r7
l150: # 
						// allocreg r2
						// allocreg r1

						//minfat.c, line 455
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	and	r1
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 455
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l153
		add	r7
						// allocreg r1

						//minfat.c, line 455
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
	.liconst	16
	and	r1
						// (save result) // isreg
						// freereg r1

						//minfat.c, line 455
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l152
		add	r7
						// allocreg r1

						//minfat.c, line 455
						// (test)
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6

						//minfat.c, line 455
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l152
		add	r7
						// freereg r1
						// allocreg r1

						//minfat.c, line 455
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 455
						//call
						// (obj to tmp) flags 22 type f
						// matchobj comparing flags 34 with 66
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 66
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 66
	.liconst	20
	ldidx	r6
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//minfat.c, line 455
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//minfat.c, line 455
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l153
		add	r7
l152: # 
						// allocreg r1

						//minfat.c, line 457
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l137,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//minfat.c, line 457
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l158
		add	r7

						//minfat.c, line 458
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_longfilename
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
l158: # 

						//minfat.c, line 459
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l137,0
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

						//minfat.c, line 461
						//setreturn
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l133,0
						//static deref
						//sizemod based on type 0xa
	ldt
	mr	r0

						//minfat.c, line 462
						//pcreltotemp
	.lipcrel	l132
	add	r7
l153: # 

						//minfat.c, line 464
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l137,0
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
						// freereg r1
l159: # 
						// allocreg r1

						//minfat.c, line 418
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 104
						// extern
	.liabs	_dir_entries
						//extern deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l136,0
						//static deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//minfat.c, line 418
						// Q2 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	cmp	r2
						// freereg r1

						//minfat.c, line 418
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l176
		add	r7
l178: # 
						// allocreg r1

						//minfat.c, line 468
						// (test)
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_current_directory_start
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 468
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l160
		add	r7

						//minfat.c, line 468
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 468
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l177
		add	r7
						// freereg r1
l160: # 
						// allocreg r1

						//minfat.c, line 470
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l135,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//minfat.c, line 470
						//call
						//pcreltotemp
	.lipcrel	_GetCluster
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//minfat.c, line 470
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l135,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//minfat.c, line 472
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//minfat.c, line 472
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l166
		add	r7
						// allocreg r1

						//minfat.c, line 472
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 104
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 2
	.liconst	268435448
	and	r1
						// (save result) // isreg

						//minfat.c, line 472
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	cmp	r1
						// freereg r1

						//minfat.c, line 472
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l168
		add	r7
						// allocreg r1

						//minfat.c, line 472
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//minfat.c, line 472
						//pcreltotemp
	.lipcrel	l167
	add	r7
l168: # 

						//minfat.c, line 472
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r4
						//save_temp done

						//minfat.c, line 472
						//pcreltotemp
	.lipcrel	l167
	add	r7
						// freereg r1
l166: # 
						// allocreg r1

						//minfat.c, line 472
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 104
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	65528
	and	r1
						// (save result) // isreg

						//minfat.c, line 472
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	cmp	r1
						// freereg r1

						//minfat.c, line 472
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l171
		add	r7
						// allocreg r1

						//minfat.c, line 472
						// (a/p assign)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done

						//minfat.c, line 472
						//pcreltotemp
	.lipcrel	l172
	add	r7
l171: # 

						//minfat.c, line 472
						// (a/p assign)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)store type 3
	st	r6
						//save_temp done
l172: # 

						//minfat.c, line 472
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags a type 3
						// var, auto|reg
						//sizemod based on type 0x3
	ld	r6
						// (save temp)isreg
	mr	r4
						//save_temp done
l167: # 

						//minfat.c, line 472
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r4 - only match against tmp
	mt	r4
				// flags 4a
	and	r4

						//minfat.c, line 472
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l177
		add	r7
						// freereg r1
						// allocreg r1

						//minfat.c, line 475
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 104
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	2
	sub	r1
						// (save result) // isreg

						//minfat.c, line 475
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x104
	ldt
	mul	r1
						// (save result) // isreg

						//minfat.c, line 475
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 104
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x104
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l134,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
						// freereg r1

						//minfat.c, line 476
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l136,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 4
	st	r0
						//save_temp done

						//minfat.c, line 479
						//pcreltotemp
	.lipcrel	l175
	add	r7
l177: # 
						// allocreg r1

						//minfat.c, line 481
						//setreturn
						// (obj to r0) flags 1 type a
						// const
	.liconst	0
	mr	r0
l132: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
	add	r7

	.section	.data
l133:
	.int	0
l137:
	.int	0
	.section	.bss
	.lcomm	l134,4
	.lcomm	l135,4
	.lcomm	l136,4
	.global	_sector_buffer
	.comm	_sector_buffer,512
	.global	_cluster_size
	.comm	_cluster_size,4
	.global	_cluster_mask
	.comm	_cluster_mask,4
	.global	_fat32
	.comm	_fat32,4
	.global	_dir_entries
	.comm	_dir_entries,4
	.global	_longfilename
	.comm	_longfilename,260
	.global	_directory_cluster
	.comm	_directory_cluster,4
	.global	_entries_per_cluster
	.comm	_entries_per_cluster,4
	.global	_fat_start
	.comm	_fat_start,4
	.global	_data_start
	.comm	_data_start,4
	.global	_root_directory_cluster
	.comm	_root_directory_cluster,4
	.global	_root_directory_start
	.comm	_root_directory_start,4
	.global	_root_directory_size
	.comm	_root_directory_size,4
	.global	_fat_number
	.comm	_fat_number,4
	.global	_fat_size
	.comm	_fat_size,4
	.global	_current_directory_cluster
	.comm	_current_directory_cluster,4
	.global	_current_directory_start
	.comm	_current_directory_start,4
	.global	_partitioncount
	.comm	_partitioncount,4
	.global	_file
	.comm	_file,12
