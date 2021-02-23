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
	.global	_spi_uio_cmd_cont
_spi_uio_cmd_cont:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r1

						//userio.c, line 6
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

						//userio.c, line 6
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//userio.c, line 6
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l6
		add	r7
l5: # 

						//userio.c, line 6
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

						//userio.c, line 6
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//userio.c, line 6
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l5
		add	r7
l6: # 

						//userio.c, line 6
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
	.liconst	289
						// (save temp)store type 3
	st	r0
						//save_temp done

						//userio.c, line 7
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
	.global	_spi_uio_cmd
_spi_uio_cmd:
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

						//userio.c, line 11
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 42 type 101
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//userio.c, line 11
						//call
						//pcreltotemp
	.lipcrel	_spi_uio_cmd_cont
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//userio.c, line 12
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

						//userio.c, line 12
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//userio.c, line 12
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l12
		add	r7
l11: # 
						// allocreg r1

						//userio.c, line 12
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

						//userio.c, line 12
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//userio.c, line 12
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7
l12: # 

						//userio.c, line 12
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
	.global	_spi_uio_cmd8_cont
_spi_uio_cmd8_cont:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r1

						//userio.c, line 16
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

						//userio.c, line 16
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//userio.c, line 16
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l18
		add	r7
l17: # 

						//userio.c, line 16
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

						//userio.c, line 16
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//userio.c, line 16
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l17
		add	r7
l18: # 

						//userio.c, line 16
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
	.liconst	289
						// (save temp)store type 3
	st	r0
						//save_temp done

						//userio.c, line 17
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

						//userio.c, line 18
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
	.global	_spi_uio_cmd8
_spi_uio_cmd8:
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

						//userio.c, line 22
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

						//userio.c, line 22
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

						//userio.c, line 22
						//FIXME convert
						//Converting to wider type...
						// (obj to r1) flags 42 type 101
						// matchobj comparing flags 66 with 74
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						//But unsigned, so no need to extend
						// (save result) // isreg

						//userio.c, line 22
						//call
						//pcreltotemp
	.lipcrel	_spi_uio_cmd8_cont
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//userio.c, line 23
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

						//userio.c, line 23
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//userio.c, line 23
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l24
		add	r7
l23: # 
						// allocreg r1

						//userio.c, line 23
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

						//userio.c, line 23
						// (test)
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	mr	r0
	and	r0

						//userio.c, line 23
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l23
		add	r7
l24: # 

						//userio.c, line 23
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
	.global	_user_io_digital_joystick_ext
_user_io_digital_joystick_ext:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//userio.c, line 39
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	8
	ldidx	r6
	stdec	r6
						// allocreg r2

						//userio.c, line 39
						//FIXME convert
						//Converting to wider type...
						// (obj to r2) flags 42 type 101
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	mr	r2
						//But unsigned, so no need to extend
						// (save result) // isreg
						// allocreg r1

						//userio.c, line 39
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	96
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//userio.c, line 39
						//call
						//pcreltotemp
	.lipcrel	_spi_uio_cmd8
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
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

