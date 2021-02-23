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
	.global	_spi_osd_cmd_cont
_spi_osd_cmd_cont:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r1

						//osd.c, line 7
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

						//osd.c, line 7
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 7
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l6
		add	r7
l5: # 

						//osd.c, line 7
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

						//osd.c, line 7
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 7
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l5
		add	r7
l6: # 

						//osd.c, line 7
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
	.liconst	265
						// (save temp)store type 3
	st	r0
						//save_temp done

						//osd.c, line 8
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 42 type 101
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1
	ldinc	r6	// shortest way to add 4 to sp
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
	.section	.text.1
	.global	_spi_osd_cmd
_spi_osd_cmd:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r1

						//osd.c, line 12
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 42 type 101
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//osd.c, line 12
						//call
						//pcreltotemp
	.lipcrel	_spi_osd_cmd_cont
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//osd.c, line 13
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

						//osd.c, line 13
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 13
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l12
		add	r7
l11: # 
						// allocreg r1

						//osd.c, line 13
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

						//osd.c, line 13
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 13
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7
l12: # 

						//osd.c, line 13
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
	.liconst	8
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
						// freereg r2
	ldinc	r6	// shortest way to add 4 to sp
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
	.global	_spi_osd_cmd8_cont
_spi_osd_cmd8_cont:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r1

						//osd.c, line 17
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

						//osd.c, line 17
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 17
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l18
		add	r7
l17: # 

						//osd.c, line 17
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

						//osd.c, line 17
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 17
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l17
		add	r7
l18: # 

						//osd.c, line 17
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
	.liconst	265
						// (save temp)store type 3
	st	r0
						//save_temp done

						//osd.c, line 18
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 42 type 101
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//osd.c, line 19
						//FIXME convert
						//Converting to wider type...
						// (obj to r0) flags 2 type 101
						// var, auto|reg
	.liconst	8
	ldidx	r6
	mr	r0
						//But unsigned, so no need to extend
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 2
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 2
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1
	ldinc	r6	// shortest way to add 4 to sp
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
	.section	.text.3
	.global	_spi_osd_cmd8
_spi_osd_cmd8:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r1

						//osd.c, line 23
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 2 type 101
						// matchobj comparing flags 2 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	8
	ldidx	r6
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//osd.c, line 23
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

						//osd.c, line 23
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 42 type 101
						// matchobj comparing flags 66 with 74
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//osd.c, line 23
						//call
						//pcreltotemp
	.lipcrel	_spi_osd_cmd8_cont
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//osd.c, line 24
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

						//osd.c, line 24
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 24
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l24
		add	r7
l23: # 
						// allocreg r1

						//osd.c, line 24
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

						//osd.c, line 24
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 24
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l23
		add	r7
l24: # 

						//osd.c, line 24
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
	.liconst	8
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
						// freereg r2
	ldinc	r6	// shortest way to add 4 to sp
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
	.global	_OsdWriteStart
_OsdWriteStart:
	stdec	r6
	mt	r3
	stdec	r6
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
						// allocreg r2
						// allocreg r1

						//osd.c, line 34
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 64
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l28,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//osd.c, line 34
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l31
		add	r7

						//osd.c, line 35
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteEnd
	add	r7
						// Flow control - popping 0 + 0 bytes
l31: # 

						//osd.c, line 36
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

						//osd.c, line 36
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 36
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l42
		add	r7
l41: # 

						//osd.c, line 36
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

						//osd.c, line 36
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 36
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l41
		add	r7
l42: # 

						//osd.c, line 36
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
	.liconst	265
						// (save temp)store type 3
	st	r0
						//save_temp done

						//osd.c, line 37
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	32
	or	r0
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

						//osd.c, line 38
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l25,0
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

						//osd.c, line 39
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	12
	ldidx	r6

						//osd.c, line 39
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l36
		add	r7

						//osd.c, line 39
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	255
						// (save temp)isreg
	mr	r1
						//save_temp done

						//osd.c, line 39
						//pcreltotemp
	.lipcrel	l37
	add	r7
l36: # 

						//osd.c, line 39
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done
l37: # 

						//osd.c, line 39
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l26,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r1

						//osd.c, line 40
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	16
	ldidx	r6

						//osd.c, line 40
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7

						//osd.c, line 40
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	21845
						// (save temp)isreg
	mr	r2
						//save_temp done

						//osd.c, line 40
						//pcreltotemp
	.lipcrel	l40
	add	r7
l39: # 

						//osd.c, line 40
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	65535
						// (save temp)isreg
	mr	r2
						//save_temp done
l40: # 

						//osd.c, line 40
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l27,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2

						//osd.c, line 41
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l28,0
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
						// freereg r1
						// freereg r2
						// freereg r3
	ldinc	r6	// shortest way to add 4 to sp
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
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.global	_OsdPutChar
_OsdPutChar:
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
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3

						//osd.c, line 46
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 64
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l27,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r4
						//save_temp done

						//osd.c, line 49
						// (test)
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 2
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//osd.c, line 49
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l45
		add	r7
						// allocreg r1

						//osd.c, line 50
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 42 type 101
						// matchobj comparing flags 66 with 66
						// reg r2 - only match against tmp
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//osd.c, line 50
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r1
						// (save result) // isreg

						//osd.c, line 50
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 4
						// (obj to r3) flags 82 type a
						// (prepobj r3)
 						// extern (offset -256)
	.liabs	_font, -256
						// extern pe is varadr
	mr	r3
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r3
						// (save result) // isreg
						// freereg r1

						//osd.c, line 52
						//pcreltotemp
	.lipcrel	l46
	add	r7
l45: # 

						//osd.c, line 52
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_font
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
l46: # 

						//osd.c, line 53
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done
l51: # 
						// allocreg r1

						//osd.c, line 55
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 6a type 301
						// deref 
	ldbinc	r3
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//osd.c, line 55
						// (bitwise/arithmetic) 	//ops: 2, 5, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 106
						// reg r4 - only match against tmp
	mt	r4
	and	r1
						// (save result) // isreg

						//osd.c, line 55
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 66
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l26,0
						//static deref
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
						// freereg r1

						//osd.c, line 56
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sgn
	shr	r4
						// (save result) // isreg

						//osd.c, line 54
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	add	r5
						// (save result) // isreg

						//osd.c, line 54
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	sgn
	cmp	r5

						//osd.c, line 54
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l51
		add	r7

						//osd.c, line 58
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l25,0
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
	.liconst	8
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l25,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
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
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.6
	.global	_OsdPuts
_OsdPuts:
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
						// allocreg r2
						// allocreg r1

						//osd.c, line 64
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 64
						// deref 
	ldbinc	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//osd.c, line 64
						// (test)
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 106
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//osd.c, line 64
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
						// freereg r1
l57: # 
						// allocreg r1

						//osd.c, line 65
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 42 type 101
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//osd.c, line 65
						//call
						//pcreltotemp
	.lipcrel	_OsdPutChar
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//osd.c, line 64
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// deref 
	ldbinc	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//osd.c, line 64
						// (test)
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 106
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//osd.c, line 64
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
l58: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
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
	.section	.text.7
	.global	_OsdWriteEnd
_OsdWriteEnd:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r1

						//osd.c, line 71
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l25,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//osd.c, line 71
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l25,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//osd.c, line 71
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	256
	sgn
	cmp	r1
						// freereg r1

						//osd.c, line 71
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l68
		add	r7
l66: # 

						//osd.c, line 72
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 2 type 503
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l26,0
						//static deref
						//sizemod based on type 0x503
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//osd.c, line 71
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l25,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//osd.c, line 71
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l25,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//osd.c, line 71
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	256
	sgn
	cmp	r1
						// freereg r1

						//osd.c, line 71
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l66
		add	r7
l68: # 

						//osd.c, line 73
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

						//osd.c, line 73
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 73
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l69
		add	r7
l67: # 

						//osd.c, line 73
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

						//osd.c, line 73
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//osd.c, line 73
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l67
		add	r7
l69: # 

						//osd.c, line 73
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
	.liconst	8
						// (save temp)store type 3
	st	r0
						//save_temp done

						//osd.c, line 74
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l28,0
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
	ldinc	r6	// shortest way to add 4 to sp
	ldinc	r6
	mr	r7

	.section	.bss
	.lcomm	l25,4
	.lcomm	l26,4
	.lcomm	l27,4
	.lcomm	l28,4
