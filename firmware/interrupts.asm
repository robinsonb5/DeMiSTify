	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
l1:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4

						//interrupts.c, line 6
						//call
						//pcreltotemp
	.lipcrel	_GetInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//interrupts.c, line 6
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
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
	.global	_SetIntHandler
_SetIntHandler:
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

						//interrupts.c, line 12
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 64
						// deref
						// const to r0
						// matchobj comparing flags 1 with 64
	.liconst	-80
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

						//interrupts.c, line 13
						// (a/p assign)
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	13
	exg	r2
						//sizemod based on type 0xa
	st	r2
	exg	r2
						// allocreg r1

						//interrupts.c, line 14
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
	.liabs	l4,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//interrupts.c, line 14
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	.section	.rodata
l4:
	.byte	83
	.byte	101
	.byte	116
	.byte	32
	.byte	104
	.byte	97
	.byte	110
	.byte	100
	.byte	108
	.byte	101
	.byte	114
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
	.ctor .ctor.100.interrupts
	.ref	_intconstructor
	.section	.text.2
	.global	_intconstructor
_intconstructor:
	stdec	r6
						// allocreg r1

						//interrupts.c, line 19
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l6,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//interrupts.c, line 19
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//interrupts.c, line 20
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l1,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//interrupts.c, line 20
						//call
						//pcreltotemp
	.lipcrel	_SetIntHandler
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
	ldinc	r6
	mr	r7

	.section	.rodata
l6:
	.byte	73
	.byte	110
	.byte	32
	.byte	105
	.byte	110
	.byte	116
	.byte	101
	.byte	114
	.byte	114
	.byte	117
	.byte	112
	.byte	116
	.byte	32
	.byte	99
	.byte	111
	.byte	110
	.byte	115
	.byte	116
	.byte	114
	.byte	117
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	10
	.byte	0
	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_GetInterrupts
_GetInterrupts:
	stdec	r6

						//interrupts.c, line 26
						//setreturn
						// (obj to r0) flags 21 type 403
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-80
						//sizemod based on type 0x403
	ldt
	mr	r0
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
	.section	.text.4
	.global	_EnableInterrupts
_EnableInterrupts:
	stdec	r6

						//interrupts.c, line 32
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-80
	mr	r0
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
	.section	.text.5
	.global	_DisableInterrupts
_DisableInterrupts:
	stdec	r6

						//interrupts.c, line 38
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-80
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
	ldinc	r6
	mr	r7

