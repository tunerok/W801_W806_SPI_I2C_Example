
.//Obj/W806.elf:     file format elf32-csky-little


Disassembly of section .text:

08010400 <__Vectors>:
 8010400:	00 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010410:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010420:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010430:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010440:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010450:	d0 05 01 08 d0 05 01 08 18 06 01 08 d0 05 01 08     ................
 8010460:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010470:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010480:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010490:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104a0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104b0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104c0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 cc 5c 01 08 d0 05 01 08 d0 05 01 08     .....\..........
 80104f0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................

08010500 <Reset_Handler>:
    .align  2
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
#ifdef CONFIG_KERNEL_NONE
    lrw     r0, 0xe0000200
 8010500:	1019      	lrw      	r0, 0xe0000200	// 8010564 <__exit+0x4>
#else
    lrw     r0, 0x80000200
    mtcr    r0, psr
#endif
    mtcr    r0, psr
 8010502:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
 8010506:	1019      	lrw      	r0, 0x2000117c	// 8010568 <__exit+0x8>
    mov     sp, r0
 8010508:	6f83      	mov      	r14, r0

/*
 *	move __Vectors to irq_vectors
 */
    lrw     r1, __Vectors
 801050a:	1039      	lrw      	r1, 0x8010400	// 801056c <__exit+0xc>
    lrw     r2, __vdata_start__
 801050c:	1059      	lrw      	r2, 0x20000000	// 8010570 <__exit+0x10>
    lrw     r3, __vdata_end__
 801050e:	107a      	lrw      	r3, 0x20000100	// 8010574 <__exit+0x14>

    subu    r3, r2
 8010510:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 8010512:	3b40      	cmpnei      	r3, 0
    bf      .L_loopv0_done
 8010514:	0c08      	bf      	0x8010524	// 8010524 <Reset_Handler+0x24>

.L_loopv0:
    ldw     r0, (r1, 0)
 8010516:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010518:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 801051a:	2103      	addi      	r1, 4
    addi    r2, 4
 801051c:	2203      	addi      	r2, 4
    subi    r3, 4
 801051e:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 8010520:	3b40      	cmpnei      	r3, 0
    bt      .L_loopv0
 8010522:	0bfa      	bt      	0x8010516	// 8010516 <Reset_Handler+0x16>
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
 8010524:	1035      	lrw      	r1, 0x80538cc	// 8010578 <__exit+0x18>
    lrw     r2, __data_start__
 8010526:	1056      	lrw      	r2, 0x20000100	// 801057c <__exit+0x1c>
    lrw     r3, __data_end__
 8010528:	1076      	lrw      	r3, 0x2000017c	// 8010580 <__exit+0x20>

    subu    r3, r2
 801052a:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 801052c:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
 801052e:	0c08      	bf      	0x801053e	// 801053e <Reset_Handler+0x3e>

.L_loop0:
    ldw     r0, (r1, 0)
 8010530:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010532:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 8010534:	2103      	addi      	r1, 4
    addi    r2, 4
 8010536:	2203      	addi      	r2, 4
    subi    r3, 4
 8010538:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 801053a:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
 801053c:	0bfa      	bt      	0x8010530	// 8010530 <Reset_Handler+0x30>
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
 #if 1
    lrw     r1, __bss_start__
 801053e:	1032      	lrw      	r1, 0x2000017c	// 8010584 <__exit+0x24>
    lrw     r2, __bss_end__
 8010540:	1052      	lrw      	r2, 0x200018fc	// 8010588 <__exit+0x28>

    movi    r0, 0
 8010542:	3000      	movi      	r0, 0

    subu    r2, r1
 8010544:	6086      	subu      	r2, r1
    cmpnei  r2, 0
 8010546:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
 8010548:	0c06      	bf      	0x8010554	// 8010554 <Reset_Handler+0x54>

.L_loop1:
    stw     r0, (r1, 0)
 801054a:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
 801054c:	2103      	addi      	r1, 4
    subi    r2, 4
 801054e:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
 8010550:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
 8010552:	0bfc      	bt      	0x801054a	// 801054a <Reset_Handler+0x4a>
.L_loop1_done:
#endif

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
 8010554:	e0002c5a 	bsr      	0x8015e08	// 8015e08 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e0002cae 	bsr      	0x8015eb4	// 8015eb4 <board_init>
#endif

    jbsr    main
 801055c:	e0002a3c 	bsr      	0x80159d4	// 80159d4 <main>

08010560 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010560:	0400      	br      	0x8010560	// 8010560 <__exit>
 8010562:	0000      	.short	0x0000
 8010564:	e0000200 	.long	0xe0000200
 8010568:	2000117c 	.long	0x2000117c
 801056c:	08010400 	.long	0x08010400
 8010570:	20000000 	.long	0x20000000
 8010574:	20000100 	.long	0x20000100
 8010578:	080538cc 	.long	0x080538cc
 801057c:	20000100 	.long	0x20000100
 8010580:	2000017c 	.long	0x2000017c
 8010584:	2000017c 	.long	0x2000017c
 8010588:	200018fc 	.long	0x200018fc

0801058c <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 801058c:	c1007420 	psrset      	ee

    subi    sp, 4
 8010590:	1421      	subi      	r14, r14, 4
    stw     r13, (sp)
 8010592:	ddae2000 	st.w      	r13, (r14, 0x0)
    addi    sp, 4
 8010596:	1401      	addi      	r14, r14, 4

    lrw     r13, g_trap_sp
 8010598:	ea8d000f 	lrw      	r13, 0x2000137c	// 80105d4 <ADC_IRQHandler+0x4>
    stw     sp, (r13)
 801059c:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 80105a0:	ea8e000e 	lrw      	r14, 0x2000137c	// 80105d8 <ADC_IRQHandler+0x8>

    subi    sp, 72
 80105a4:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 80105a6:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 80105aa:	100b      	lrw      	r0, 0x2000137c	// 80105d4 <ADC_IRQHandler+0x4>
    ldw     r0, (r0)
 80105ac:	9000      	ld.w      	r0, (r0, 0x0)

    stw     r0, (sp, 56) /* save r14 */
 80105ae:	b80e      	st.w      	r0, (r14, 0x38)

    subi    r0, 4
 80105b0:	2803      	subi      	r0, 4
    ldw     r13, (r0)
 80105b2:	d9a02000 	ld.w      	r13, (r0, 0x0)
    stw     r13, (sp, 52)
 80105b6:	ddae200d 	st.w      	r13, (r14, 0x34)

    stw     r15, (sp, 60)
 80105ba:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
 80105be:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 80105c2:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
 80105c4:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 80105c8:	b811      	st.w      	r0, (r14, 0x44)

    mov     r0, sp
 80105ca:	6c3b      	mov      	r0, r14

    jbsr    trap_c
 80105cc:	e0002c36 	bsr      	0x8015e38	// 8015e38 <trap_c>

080105d0 <ADC_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 80105d0:	07de      	br      	0x801058c	// 801058c <trap>
 80105d2:	0000      	.short	0x0000
 80105d4:	2000137c 	.long	0x2000137c
 80105d8:	2000137c 	.long	0x2000137c

080105dc <cpu_yeild>:
 *
 ********************************************************************/
.global cpu_yeild
.type   cpu_yeild, %function
cpu_yeild:
    lrw    r0, VIC_TSPDR
 80105dc:	1106      	lrw      	r0, 0xe000ec08	// 8010674 <tspend_handler+0x5c>
    bgeni  r1, 0
 80105de:	ea010001 	movi      	r1, 1
    stw    r1, (r0)
 80105e2:	b020      	st.w      	r1, (r0, 0x0)
    rts
 80105e4:	783c      	jmp      	r15

080105e6 <vPortStartTask>:
 *
 ********************************************************************/
.global vPortStartTask
.type   vPortStartTask, %function
vPortStartTask:
    psrclr   ie
 80105e6:	c0807020 	psrclr      	ie
    lrw      r4, pxCurrentTCB
 80105ea:	1184      	lrw      	r4, 0x20001380	// 8010678 <tspend_handler+0x60>
    ld.w     r4, (r4)
 80105ec:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 80105ee:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 80105f2:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 80105f4:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 80105f8:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 80105fa:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 80105fe:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 8010602:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010606:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010608:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 801060c:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801060e:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 8010612:	1412      	addi      	r14, r14, 72

    rte
 8010614:	c0004020 	rte

08010618 <tspend_handler>:
 *
 ********************************************************************/
.global tspend_handler
.type   tspend_handler, %function
tspend_handler:
    subi     sp, 196
 8010618:	1531      	subi      	r14, r14, 196
    stm      r0-r13, (sp)
 801061a:	d40e1c2d 	stm      	r0-r13, (r14)
    stw      r15, (sp, 56)
 801061e:	ddee200e 	st.w      	r15, (r14, 0x38)
    addi     r0, sp, 60
 8010622:	180f      	addi      	r0, r14, 60
    stm      r16-r31, (r0)
 8010624:	d6001c2f 	stm      	r16-r31, (r0)
    addi     r0, 64
 8010628:	203f      	addi      	r0, 64
    fstms    vr0-vr15, (r0)
 801062a:	f5e03400 	fstms      	fr0-fr15, (r0)
    mfcr     r1, epsr
 801062e:	c0026021 	mfcr      	r1, cr<2, 0>
    stw      r1, (r0, 64)
 8010632:	b030      	st.w      	r1, (r0, 0x40)
    mfcr     r1, epc
 8010634:	c0046021 	mfcr      	r1, cr<4, 0>
    stw      r1, (r0, 68)
 8010638:	b031      	st.w      	r1, (r0, 0x44)

    lrw      r2, pxCurrentTCB
 801063a:	1050      	lrw      	r2, 0x20001380	// 8010678 <tspend_handler+0x60>
    ld.w     r3, (r2)
 801063c:	9260      	ld.w      	r3, (r2, 0x0)
    st.w     sp, (r3)
 801063e:	ddc32000 	st.w      	r14, (r3, 0x0)

    jbsr     vTaskSwitchContext
 8010642:	e0004093 	bsr      	0x8018768	// 8018768 <vTaskSwitchContext>

    lrw      r4, pxCurrentTCB
 8010646:	108d      	lrw      	r4, 0x20001380	// 8010678 <tspend_handler+0x60>
    ld.w     r4, (r4)
 8010648:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 801064a:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 801064e:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 8010650:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 8010654:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 8010656:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 801065a:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 801065e:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010662:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010664:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 8010668:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801066a:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 801066e:	1412      	addi      	r14, r14, 72

    rte
 8010670:	c0004020 	rte
 8010674:	e000ec08 	.long	0xe000ec08
 8010678:	20001380 	.long	0x20001380

0801067c <__fixunsdfsi>:
 801067c:	14d2      	push      	r4-r5, r15
 801067e:	3200      	movi      	r2, 0
 8010680:	ea2341e0 	movih      	r3, 16864
 8010684:	6d03      	mov      	r4, r0
 8010686:	6d47      	mov      	r5, r1
 8010688:	e00006b8 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 801068c:	e9a00007 	bhsz      	r0, 0x801069a	// 801069a <__fixunsdfsi+0x1e>
 8010690:	6c13      	mov      	r0, r4
 8010692:	6c57      	mov      	r1, r5
 8010694:	e0000722 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 8010698:	1492      	pop      	r4-r5, r15
 801069a:	3200      	movi      	r2, 0
 801069c:	ea2341e0 	movih      	r3, 16864
 80106a0:	6c13      	mov      	r0, r4
 80106a2:	6c57      	mov      	r1, r5
 80106a4:	e00004c4 	bsr      	0x801102c	// 801102c <__subdf3>
 80106a8:	e0000718 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 80106ac:	ea238000 	movih      	r3, 32768
 80106b0:	600c      	addu      	r0, r3
 80106b2:	1492      	pop      	r4-r5, r15

080106b4 <__udivdi3>:
 80106b4:	14c5      	push      	r4-r8
 80106b6:	6f4b      	mov      	r13, r2
 80106b8:	6d4f      	mov      	r5, r3
 80106ba:	6d03      	mov      	r4, r0
 80106bc:	6f07      	mov      	r12, r1
 80106be:	e9230054 	bnez      	r3, 0x8010766	// 8010766 <__udivdi3+0xb2>
 80106c2:	6484      	cmphs      	r1, r2
 80106c4:	0870      	bt      	0x80107a4	// 80107a4 <__udivdi3+0xf0>
 80106c6:	eb02ffff 	cmphsi      	r2, 65536
 80106ca:	0cc4      	bf      	0x8010852	// 8010852 <__udivdi3+0x19e>
 80106cc:	c6e05023 	bmaski      	r3, 24
 80106d0:	648c      	cmphs      	r3, r2
 80106d2:	3518      	movi      	r5, 24
 80106d4:	3310      	movi      	r3, 16
 80106d6:	c4a30c40 	inct      	r5, r3, 0
 80106da:	01dc      	lrw      	r6, 0x8018824	// 80109e4 <__udivdi3+0x330>
 80106dc:	c4a24043 	lsr      	r3, r2, r5
 80106e0:	d0660023 	ldr.b      	r3, (r6, r3 << 0)
 80106e4:	614c      	addu      	r5, r3
 80106e6:	3320      	movi      	r3, 32
 80106e8:	60d6      	subu      	r3, r5
 80106ea:	e903000c 	bez      	r3, 0x8010702	// 8010702 <__udivdi3+0x4e>
 80106ee:	c462402d 	lsl      	r13, r2, r3
 80106f2:	c4a04045 	lsr      	r5, r0, r5
 80106f6:	c4614022 	lsl      	r2, r1, r3
 80106fa:	c445242c 	or      	r12, r5, r2
 80106fe:	c4604024 	lsl      	r4, r0, r3
 8010702:	c60d4841 	lsri      	r1, r13, 16
 8010706:	c42c8022 	divu      	r2, r12, r1
 801070a:	c4228423 	mult      	r3, r2, r1
 801070e:	630e      	subu      	r12, r3
 8010710:	c60c4823 	lsli      	r3, r12, 16
 8010714:	c40d55e5 	zext      	r5, r13, 15, 0
 8010718:	c604484c 	lsri      	r12, r4, 16
 801071c:	c4458420 	mult      	r0, r5, r2
 8010720:	6f0c      	or      	r12, r3
 8010722:	6430      	cmphs      	r12, r0
 8010724:	0808      	bt      	0x8010734	// 8010734 <__udivdi3+0x80>
 8010726:	6334      	addu      	r12, r13
 8010728:	6770      	cmphs      	r12, r13
 801072a:	5a63      	subi      	r3, r2, 1
 801072c:	0c03      	bf      	0x8010732	// 8010732 <__udivdi3+0x7e>
 801072e:	6430      	cmphs      	r12, r0
 8010730:	0d56      	bf      	0x80109dc	// 80109dc <__udivdi3+0x328>
 8010732:	6c8f      	mov      	r2, r3
 8010734:	6302      	subu      	r12, r0
 8010736:	c42c8020 	divu      	r0, r12, r1
 801073a:	7c40      	mult      	r1, r0
 801073c:	6306      	subu      	r12, r1
 801073e:	c60c482c 	lsli      	r12, r12, 16
 8010742:	c40455e4 	zext      	r4, r4, 15, 0
 8010746:	7d40      	mult      	r5, r0
 8010748:	6d30      	or      	r4, r12
 801074a:	6550      	cmphs      	r4, r5
 801074c:	6c43      	mov      	r1, r0
 801074e:	0808      	bt      	0x801075e	// 801075e <__udivdi3+0xaa>
 8010750:	6134      	addu      	r4, r13
 8010752:	6750      	cmphs      	r4, r13
 8010754:	5863      	subi      	r3, r0, 1
 8010756:	0d21      	bf      	0x8010998	// 8010998 <__udivdi3+0x2e4>
 8010758:	6550      	cmphs      	r4, r5
 801075a:	091f      	bt      	0x8010998	// 8010998 <__udivdi3+0x2e4>
 801075c:	2901      	subi      	r1, 2
 801075e:	4210      	lsli      	r0, r2, 16
 8010760:	6c04      	or      	r0, r1
 8010762:	3100      	movi      	r1, 0
 8010764:	1485      	pop      	r4-r8
 8010766:	64c4      	cmphs      	r1, r3
 8010768:	0c6b      	bf      	0x801083e	// 801083e <__udivdi3+0x18a>
 801076a:	eb03ffff 	cmphsi      	r3, 65536
 801076e:	0c6b      	bf      	0x8010844	// 8010844 <__udivdi3+0x190>
 8010770:	c6e0502c 	bmaski      	r12, 24
 8010774:	64f0      	cmphs      	r12, r3
 8010776:	ea0d0018 	movi      	r13, 24
 801077a:	ea0c0010 	movi      	r12, 16
 801077e:	c58d0c20 	incf      	r12, r13, 0
 8010782:	0386      	lrw      	r4, 0x8018824	// 80109e4 <__udivdi3+0x330>
 8010784:	c583404d 	lsr      	r13, r3, r12
 8010788:	d1a4002d 	ldr.b      	r13, (r4, r13 << 0)
 801078c:	6370      	addu      	r13, r12
 801078e:	3520      	movi      	r5, 32
 8010790:	6176      	subu      	r5, r13
 8010792:	e925006c 	bnez      	r5, 0x801086a	// 801086a <__udivdi3+0x1b6>
 8010796:	644c      	cmphs      	r3, r1
 8010798:	0d0d      	bf      	0x80109b2	// 80109b2 <__udivdi3+0x2fe>
 801079a:	6480      	cmphs      	r0, r2
 801079c:	c4000500 	mvc      	r0
 80107a0:	6c57      	mov      	r1, r5
 80107a2:	1485      	pop      	r4-r8
 80107a4:	e9220006 	bnez      	r2, 0x80107b0	// 80107b0 <__udivdi3+0xfc>
 80107a8:	ea0d0001 	movi      	r13, 1
 80107ac:	c44d802d 	divu      	r13, r13, r2
 80107b0:	eb0dffff 	cmphsi      	r13, 65536
 80107b4:	0c55      	bf      	0x801085e	// 801085e <__udivdi3+0x1aa>
 80107b6:	c6e05023 	bmaski      	r3, 24
 80107ba:	674c      	cmphs      	r3, r13
 80107bc:	3518      	movi      	r5, 24
 80107be:	3310      	movi      	r3, 16
 80107c0:	c4a30c40 	inct      	r5, r3, 0
 80107c4:	0357      	lrw      	r2, 0x8018824	// 80109e4 <__udivdi3+0x330>
 80107c6:	c4ad4043 	lsr      	r3, r13, r5
 80107ca:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 80107ce:	614c      	addu      	r5, r3
 80107d0:	3620      	movi      	r6, 32
 80107d2:	6196      	subu      	r6, r5
 80107d4:	e926009f 	bnez      	r6, 0x8010912	// 8010912 <__udivdi3+0x25e>
 80107d8:	c5a10082 	subu      	r2, r1, r13
 80107dc:	c60d4846 	lsri      	r6, r13, 16
 80107e0:	c40d55e5 	zext      	r5, r13, 15, 0
 80107e4:	3101      	movi      	r1, 1
 80107e6:	c4c2802c 	divu      	r12, r2, r6
 80107ea:	c4cc8423 	mult      	r3, r12, r6
 80107ee:	608e      	subu      	r2, r3
 80107f0:	4250      	lsli      	r2, r2, 16
 80107f2:	4c70      	lsri      	r3, r4, 16
 80107f4:	c4ac8420 	mult      	r0, r12, r5
 80107f8:	6cc8      	or      	r3, r2
 80107fa:	640c      	cmphs      	r3, r0
 80107fc:	0809      	bt      	0x801080e	// 801080e <__udivdi3+0x15a>
 80107fe:	60f4      	addu      	r3, r13
 8010800:	674c      	cmphs      	r3, r13
 8010802:	e44c1000 	subi      	r2, r12, 1
 8010806:	0c03      	bf      	0x801080c	// 801080c <__udivdi3+0x158>
 8010808:	640c      	cmphs      	r3, r0
 801080a:	0ce5      	bf      	0x80109d4	// 80109d4 <__udivdi3+0x320>
 801080c:	6f0b      	mov      	r12, r2
 801080e:	60c2      	subu      	r3, r0
 8010810:	c4c38020 	divu      	r0, r3, r6
 8010814:	7d80      	mult      	r6, r0
 8010816:	60da      	subu      	r3, r6
 8010818:	4370      	lsli      	r3, r3, 16
 801081a:	c40455e4 	zext      	r4, r4, 15, 0
 801081e:	7d40      	mult      	r5, r0
 8010820:	6cd0      	or      	r3, r4
 8010822:	654c      	cmphs      	r3, r5
 8010824:	6c83      	mov      	r2, r0
 8010826:	0808      	bt      	0x8010836	// 8010836 <__udivdi3+0x182>
 8010828:	60f4      	addu      	r3, r13
 801082a:	674c      	cmphs      	r3, r13
 801082c:	2800      	subi      	r0, 1
 801082e:	0cb3      	bf      	0x8010994	// 8010994 <__udivdi3+0x2e0>
 8010830:	654c      	cmphs      	r3, r5
 8010832:	08b1      	bt      	0x8010994	// 8010994 <__udivdi3+0x2e0>
 8010834:	2a01      	subi      	r2, 2
 8010836:	c60c4820 	lsli      	r0, r12, 16
 801083a:	6c08      	or      	r0, r2
 801083c:	1485      	pop      	r4-r8
 801083e:	3100      	movi      	r1, 0
 8010840:	6c07      	mov      	r0, r1
 8010842:	1485      	pop      	r4-r8
 8010844:	eb0300ff 	cmphsi      	r3, 256
 8010848:	c400050d 	mvc      	r13
 801084c:	c46d482c 	lsli      	r12, r13, 3
 8010850:	0799      	br      	0x8010782	// 8010782 <__udivdi3+0xce>
 8010852:	eb0200ff 	cmphsi      	r2, 256
 8010856:	3308      	movi      	r3, 8
 8010858:	c4a30c40 	inct      	r5, r3, 0
 801085c:	073f      	br      	0x80106da	// 80106da <__udivdi3+0x26>
 801085e:	eb0d00ff 	cmphsi      	r13, 256
 8010862:	3308      	movi      	r3, 8
 8010864:	c4a30c40 	inct      	r5, r3, 0
 8010868:	07ae      	br      	0x80107c4	// 80107c4 <__udivdi3+0x110>
 801086a:	c5a24046 	lsr      	r6, r2, r13
 801086e:	70d4      	lsl      	r3, r5
 8010870:	6d8c      	or      	r6, r3
 8010872:	c5a14044 	lsr      	r4, r1, r13
 8010876:	4ef0      	lsri      	r7, r6, 16
 8010878:	c4e48023 	divu      	r3, r4, r7
 801087c:	c4a1402c 	lsl      	r12, r1, r5
 8010880:	c5a04041 	lsr      	r1, r0, r13
 8010884:	c4e3842d 	mult      	r13, r3, r7
 8010888:	6c70      	or      	r1, r12
 801088a:	6136      	subu      	r4, r13
 801088c:	c40655ec 	zext      	r12, r6, 15, 0
 8010890:	4490      	lsli      	r4, r4, 16
 8010892:	c601484d 	lsri      	r13, r1, 16
 8010896:	c46c8428 	mult      	r8, r12, r3
 801089a:	6f50      	or      	r13, r4
 801089c:	6634      	cmphs      	r13, r8
 801089e:	7094      	lsl      	r2, r5
 80108a0:	0806      	bt      	0x80108ac	// 80108ac <__udivdi3+0x1f8>
 80108a2:	6358      	addu      	r13, r6
 80108a4:	65b4      	cmphs      	r13, r6
 80108a6:	5b83      	subi      	r4, r3, 1
 80108a8:	088d      	bt      	0x80109c2	// 80109c2 <__udivdi3+0x30e>
 80108aa:	6cd3      	mov      	r3, r4
 80108ac:	6362      	subu      	r13, r8
 80108ae:	c4ed8024 	divu      	r4, r13, r7
 80108b2:	7dd0      	mult      	r7, r4
 80108b4:	635e      	subu      	r13, r7
 80108b6:	c60d482d 	lsli      	r13, r13, 16
 80108ba:	c48c8427 	mult      	r7, r12, r4
 80108be:	c40155ec 	zext      	r12, r1, 15, 0
 80108c2:	6f34      	or      	r12, r13
 80108c4:	65f0      	cmphs      	r12, r7
 80108c6:	0806      	bt      	0x80108d2	// 80108d2 <__udivdi3+0x21e>
 80108c8:	6318      	addu      	r12, r6
 80108ca:	65b0      	cmphs      	r12, r6
 80108cc:	5c23      	subi      	r1, r4, 1
 80108ce:	0875      	bt      	0x80109b8	// 80109b8 <__udivdi3+0x304>
 80108d0:	6d07      	mov      	r4, r1
 80108d2:	4370      	lsli      	r3, r3, 16
 80108d4:	6cd0      	or      	r3, r4
 80108d6:	c40355e1 	zext      	r1, r3, 15, 0
 80108da:	c40255e4 	zext      	r4, r2, 15, 0
 80108de:	c603484d 	lsri      	r13, r3, 16
 80108e2:	4a50      	lsri      	r2, r2, 16
 80108e4:	c4818426 	mult      	r6, r1, r4
 80108e8:	7d34      	mult      	r4, r13
 80108ea:	7c48      	mult      	r1, r2
 80108ec:	7f48      	mult      	r13, r2
 80108ee:	6050      	addu      	r1, r4
 80108f0:	4e50      	lsri      	r2, r6, 16
 80108f2:	6084      	addu      	r2, r1
 80108f4:	6508      	cmphs      	r2, r4
 80108f6:	631e      	subu      	r12, r7
 80108f8:	0804      	bt      	0x8010900	// 8010900 <__udivdi3+0x24c>
 80108fa:	ea210001 	movih      	r1, 1
 80108fe:	6344      	addu      	r13, r1
 8010900:	4a30      	lsri      	r1, r2, 16
 8010902:	6344      	addu      	r13, r1
 8010904:	6770      	cmphs      	r12, r13
 8010906:	0c53      	bf      	0x80109ac	// 80109ac <__udivdi3+0x2f8>
 8010908:	6772      	cmpne      	r12, r13
 801090a:	0c49      	bf      	0x801099c	// 801099c <__udivdi3+0x2e8>
 801090c:	6c0f      	mov      	r0, r3
 801090e:	3100      	movi      	r1, 0
 8010910:	1485      	pop      	r4-r8
 8010912:	7358      	lsl      	r13, r6
 8010914:	c4a1404c 	lsr      	r12, r1, r5
 8010918:	c4c14022 	lsl      	r2, r1, r6
 801091c:	c4c04024 	lsl      	r4, r0, r6
 8010920:	c60d4846 	lsri      	r6, r13, 16
 8010924:	c4a04045 	lsr      	r5, r0, r5
 8010928:	c4cc8020 	divu      	r0, r12, r6
 801092c:	c4c08421 	mult      	r1, r0, r6
 8010930:	c4452423 	or      	r3, r5, r2
 8010934:	6306      	subu      	r12, r1
 8010936:	c40d55e5 	zext      	r5, r13, 15, 0
 801093a:	c60c482c 	lsli      	r12, r12, 16
 801093e:	4b30      	lsri      	r1, r3, 16
 8010940:	c4058422 	mult      	r2, r5, r0
 8010944:	6c70      	or      	r1, r12
 8010946:	6484      	cmphs      	r1, r2
 8010948:	080a      	bt      	0x801095c	// 801095c <__udivdi3+0x2a8>
 801094a:	6074      	addu      	r1, r13
 801094c:	6744      	cmphs      	r1, r13
 801094e:	e5801000 	subi      	r12, r0, 1
 8010952:	0c3f      	bf      	0x80109d0	// 80109d0 <__udivdi3+0x31c>
 8010954:	6484      	cmphs      	r1, r2
 8010956:	083d      	bt      	0x80109d0	// 80109d0 <__udivdi3+0x31c>
 8010958:	2801      	subi      	r0, 2
 801095a:	6074      	addu      	r1, r13
 801095c:	604a      	subu      	r1, r2
 801095e:	c4c1802c 	divu      	r12, r1, r6
 8010962:	c4cc8422 	mult      	r2, r12, r6
 8010966:	5949      	subu      	r2, r1, r2
 8010968:	4250      	lsli      	r2, r2, 16
 801096a:	c40355e3 	zext      	r3, r3, 15, 0
 801096e:	c5858421 	mult      	r1, r5, r12
 8010972:	6c8c      	or      	r2, r3
 8010974:	6448      	cmphs      	r2, r1
 8010976:	080b      	bt      	0x801098c	// 801098c <__udivdi3+0x2d8>
 8010978:	60b4      	addu      	r2, r13
 801097a:	6748      	cmphs      	r2, r13
 801097c:	e46c1000 	subi      	r3, r12, 1
 8010980:	0c26      	bf      	0x80109cc	// 80109cc <__udivdi3+0x318>
 8010982:	6448      	cmphs      	r2, r1
 8010984:	0824      	bt      	0x80109cc	// 80109cc <__udivdi3+0x318>
 8010986:	e58c1001 	subi      	r12, r12, 2
 801098a:	60b4      	addu      	r2, r13
 801098c:	6086      	subu      	r2, r1
 801098e:	4030      	lsli      	r1, r0, 16
 8010990:	6c70      	or      	r1, r12
 8010992:	072a      	br      	0x80107e6	// 80107e6 <__udivdi3+0x132>
 8010994:	6c83      	mov      	r2, r0
 8010996:	0750      	br      	0x8010836	// 8010836 <__udivdi3+0x182>
 8010998:	6c4f      	mov      	r1, r3
 801099a:	06e2      	br      	0x801075e	// 801075e <__udivdi3+0xaa>
 801099c:	4250      	lsli      	r2, r2, 16
 801099e:	c40655e6 	zext      	r6, r6, 15, 0
 80109a2:	c4a04021 	lsl      	r1, r0, r5
 80109a6:	6098      	addu      	r2, r6
 80109a8:	6484      	cmphs      	r1, r2
 80109aa:	0bb1      	bt      	0x801090c	// 801090c <__udivdi3+0x258>
 80109ac:	5b03      	subi      	r0, r3, 1
 80109ae:	3100      	movi      	r1, 0
 80109b0:	1485      	pop      	r4-r8
 80109b2:	6c57      	mov      	r1, r5
 80109b4:	3001      	movi      	r0, 1
 80109b6:	1485      	pop      	r4-r8
 80109b8:	65f0      	cmphs      	r12, r7
 80109ba:	0b8b      	bt      	0x80108d0	// 80108d0 <__udivdi3+0x21c>
 80109bc:	2c01      	subi      	r4, 2
 80109be:	6318      	addu      	r12, r6
 80109c0:	0789      	br      	0x80108d2	// 80108d2 <__udivdi3+0x21e>
 80109c2:	6634      	cmphs      	r13, r8
 80109c4:	0b73      	bt      	0x80108aa	// 80108aa <__udivdi3+0x1f6>
 80109c6:	2b01      	subi      	r3, 2
 80109c8:	6358      	addu      	r13, r6
 80109ca:	0771      	br      	0x80108ac	// 80108ac <__udivdi3+0x1f8>
 80109cc:	6f0f      	mov      	r12, r3
 80109ce:	07df      	br      	0x801098c	// 801098c <__udivdi3+0x2d8>
 80109d0:	6c33      	mov      	r0, r12
 80109d2:	07c5      	br      	0x801095c	// 801095c <__udivdi3+0x2a8>
 80109d4:	e58c1001 	subi      	r12, r12, 2
 80109d8:	60f4      	addu      	r3, r13
 80109da:	071a      	br      	0x801080e	// 801080e <__udivdi3+0x15a>
 80109dc:	2a01      	subi      	r2, 2
 80109de:	6334      	addu      	r12, r13
 80109e0:	06aa      	br      	0x8010734	// 8010734 <__udivdi3+0x80>
 80109e2:	0000      	.short	0x0000
 80109e4:	08018824 	.long	0x08018824

080109e8 <__umoddi3>:
 80109e8:	14c6      	push      	r4-r9
 80109ea:	6d4b      	mov      	r5, r2
 80109ec:	6f4f      	mov      	r13, r3
 80109ee:	6d83      	mov      	r6, r0
 80109f0:	6f07      	mov      	r12, r1
 80109f2:	e923004a 	bnez      	r3, 0x8010a86	// 8010a86 <__umoddi3+0x9e>
 80109f6:	6484      	cmphs      	r1, r2
 80109f8:	086b      	bt      	0x8010ace	// 8010ace <__umoddi3+0xe6>
 80109fa:	eb02ffff 	cmphsi      	r2, 65536
 80109fe:	0cc0      	bf      	0x8010b7e	// 8010b7e <__umoddi3+0x196>
 8010a00:	c6e05023 	bmaski      	r3, 24
 8010a04:	648c      	cmphs      	r3, r2
 8010a06:	ea0d0018 	movi      	r13, 24
 8010a0a:	3310      	movi      	r3, 16
 8010a0c:	c5a30c40 	inct      	r13, r3, 0
 8010a10:	0281      	lrw      	r4, 0x8018824	// 8010d08 <__umoddi3+0x320>
 8010a12:	c5a24043 	lsr      	r3, r2, r13
 8010a16:	d0640023 	ldr.b      	r3, (r4, r3 << 0)
 8010a1a:	634c      	addu      	r13, r3
 8010a1c:	3420      	movi      	r4, 32
 8010a1e:	6136      	subu      	r4, r13
 8010a20:	e904000b 	bez      	r4, 0x8010a36	// 8010a36 <__umoddi3+0x4e>
 8010a24:	7050      	lsl      	r1, r4
 8010a26:	c5a0404d 	lsr      	r13, r0, r13
 8010a2a:	c4824025 	lsl      	r5, r2, r4
 8010a2e:	c42d242c 	or      	r12, r13, r1
 8010a32:	c4804026 	lsl      	r6, r0, r4
 8010a36:	c605484d 	lsri      	r13, r5, 16
 8010a3a:	c5ac8021 	divu      	r1, r12, r13
 8010a3e:	c5a18422 	mult      	r2, r1, r13
 8010a42:	c40555e0 	zext      	r0, r5, 15, 0
 8010a46:	c44c0082 	subu      	r2, r12, r2
 8010a4a:	c4208423 	mult      	r3, r0, r1
 8010a4e:	4250      	lsli      	r2, r2, 16
 8010a50:	4e30      	lsri      	r1, r6, 16
 8010a52:	6c48      	or      	r1, r2
 8010a54:	64c4      	cmphs      	r1, r3
 8010a56:	0808      	bt      	0x8010a66	// 8010a66 <__umoddi3+0x7e>
 8010a58:	6054      	addu      	r1, r5
 8010a5a:	6544      	cmphs      	r1, r5
 8010a5c:	0c05      	bf      	0x8010a66	// 8010a66 <__umoddi3+0x7e>
 8010a5e:	5954      	addu      	r2, r1, r5
 8010a60:	64c4      	cmphs      	r1, r3
 8010a62:	c4220c20 	incf      	r1, r2, 0
 8010a66:	604e      	subu      	r1, r3
 8010a68:	c5a18023 	divu      	r3, r1, r13
 8010a6c:	7f4c      	mult      	r13, r3
 8010a6e:	6076      	subu      	r1, r13
 8010a70:	7c0c      	mult      	r0, r3
 8010a72:	4130      	lsli      	r1, r1, 16
 8010a74:	c40655e3 	zext      	r3, r6, 15, 0
 8010a78:	6cc4      	or      	r3, r1
 8010a7a:	640c      	cmphs      	r3, r0
 8010a7c:	0c69      	bf      	0x8010b4e	// 8010b4e <__umoddi3+0x166>
 8010a7e:	5b01      	subu      	r0, r3, r0
 8010a80:	7011      	lsr      	r0, r4
 8010a82:	3100      	movi      	r1, 0
 8010a84:	1486      	pop      	r4-r9
 8010a86:	64c4      	cmphs      	r1, r3
 8010a88:	0ffe      	bf      	0x8010a84	// 8010a84 <__umoddi3+0x9c>
 8010a8a:	eb03ffff 	cmphsi      	r3, 65536
 8010a8e:	0c6b      	bf      	0x8010b64	// 8010b64 <__umoddi3+0x17c>
 8010a90:	c6e0502d 	bmaski      	r13, 24
 8010a94:	64f4      	cmphs      	r13, r3
 8010a96:	3518      	movi      	r5, 24
 8010a98:	ea0d0010 	movi      	r13, 16
 8010a9c:	c5a50c20 	incf      	r13, r5, 0
 8010aa0:	03a5      	lrw      	r5, 0x8018824	// 8010d08 <__umoddi3+0x320>
 8010aa2:	c5a34044 	lsr      	r4, r3, r13
 8010aa6:	d0850025 	ldr.b      	r5, (r5, r4 << 0)
 8010aaa:	6174      	addu      	r5, r13
 8010aac:	3420      	movi      	r4, 32
 8010aae:	6116      	subu      	r4, r5
 8010ab0:	e924006d 	bnez      	r4, 0x8010b8a	// 8010b8a <__umoddi3+0x1a2>
 8010ab4:	644c      	cmphs      	r3, r1
 8010ab6:	0c03      	bf      	0x8010abc	// 8010abc <__umoddi3+0xd4>
 8010ab8:	6480      	cmphs      	r0, r2
 8010aba:	0d20      	bf      	0x8010cfa	// 8010cfa <__umoddi3+0x312>
 8010abc:	5889      	subu      	r4, r0, r2
 8010abe:	6500      	cmphs      	r0, r4
 8010ac0:	c461008c 	subu      	r12, r1, r3
 8010ac4:	6443      	mvcv      	r1
 8010ac6:	6306      	subu      	r12, r1
 8010ac8:	6c13      	mov      	r0, r4
 8010aca:	6c73      	mov      	r1, r12
 8010acc:	1486      	pop      	r4-r9
 8010ace:	e9220005 	bnez      	r2, 0x8010ad8	// 8010ad8 <__umoddi3+0xf0>
 8010ad2:	3501      	movi      	r5, 1
 8010ad4:	c4458025 	divu      	r5, r5, r2
 8010ad8:	eb05ffff 	cmphsi      	r5, 65536
 8010adc:	0c4b      	bf      	0x8010b72	// 8010b72 <__umoddi3+0x18a>
 8010ade:	c6e05023 	bmaski      	r3, 24
 8010ae2:	654c      	cmphs      	r3, r5
 8010ae4:	ea0d0018 	movi      	r13, 24
 8010ae8:	3310      	movi      	r3, 16
 8010aea:	c5a30c40 	inct      	r13, r3, 0
 8010aee:	0358      	lrw      	r2, 0x8018824	// 8010d08 <__umoddi3+0x320>
 8010af0:	c5a54043 	lsr      	r3, r5, r13
 8010af4:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 8010af8:	634c      	addu      	r13, r3
 8010afa:	3420      	movi      	r4, 32
 8010afc:	6136      	subu      	r4, r13
 8010afe:	e92400af 	bnez      	r4, 0x8010c5c	// 8010c5c <__umoddi3+0x274>
 8010b02:	c4a1008c 	subu      	r12, r1, r5
 8010b06:	4df0      	lsri      	r7, r5, 16
 8010b08:	c40555e2 	zext      	r2, r5, 15, 0
 8010b0c:	c4ec8021 	divu      	r1, r12, r7
 8010b10:	c4e18423 	mult      	r3, r1, r7
 8010b14:	630e      	subu      	r12, r3
 8010b16:	c60c482c 	lsli      	r12, r12, 16
 8010b1a:	c4418423 	mult      	r3, r1, r2
 8010b1e:	4e30      	lsri      	r1, r6, 16
 8010b20:	6c70      	or      	r1, r12
 8010b22:	64c4      	cmphs      	r1, r3
 8010b24:	0808      	bt      	0x8010b34	// 8010b34 <__umoddi3+0x14c>
 8010b26:	6054      	addu      	r1, r5
 8010b28:	6544      	cmphs      	r1, r5
 8010b2a:	0c05      	bf      	0x8010b34	// 8010b34 <__umoddi3+0x14c>
 8010b2c:	5914      	addu      	r0, r1, r5
 8010b2e:	64c4      	cmphs      	r1, r3
 8010b30:	c4200c20 	incf      	r1, r0, 0
 8010b34:	604e      	subu      	r1, r3
 8010b36:	c4e18020 	divu      	r0, r1, r7
 8010b3a:	7dc0      	mult      	r7, r0
 8010b3c:	605e      	subu      	r1, r7
 8010b3e:	4130      	lsli      	r1, r1, 16
 8010b40:	c40655e6 	zext      	r6, r6, 15, 0
 8010b44:	7c08      	mult      	r0, r2
 8010b46:	c4c12423 	or      	r3, r1, r6
 8010b4a:	640c      	cmphs      	r3, r0
 8010b4c:	0808      	bt      	0x8010b5c	// 8010b5c <__umoddi3+0x174>
 8010b4e:	60d4      	addu      	r3, r5
 8010b50:	654c      	cmphs      	r3, r5
 8010b52:	0c05      	bf      	0x8010b5c	// 8010b5c <__umoddi3+0x174>
 8010b54:	614c      	addu      	r5, r3
 8010b56:	640c      	cmphs      	r3, r0
 8010b58:	c4650c20 	incf      	r3, r5, 0
 8010b5c:	5b01      	subu      	r0, r3, r0
 8010b5e:	7011      	lsr      	r0, r4
 8010b60:	3100      	movi      	r1, 0
 8010b62:	1486      	pop      	r4-r9
 8010b64:	eb0300ff 	cmphsi      	r3, 256
 8010b68:	c4000505 	mvc      	r5
 8010b6c:	c465482d 	lsli      	r13, r5, 3
 8010b70:	0798      	br      	0x8010aa0	// 8010aa0 <__umoddi3+0xb8>
 8010b72:	eb0500ff 	cmphsi      	r5, 256
 8010b76:	3308      	movi      	r3, 8
 8010b78:	c5a30c40 	inct      	r13, r3, 0
 8010b7c:	07b9      	br      	0x8010aee	// 8010aee <__umoddi3+0x106>
 8010b7e:	eb0200ff 	cmphsi      	r2, 256
 8010b82:	3308      	movi      	r3, 8
 8010b84:	c5a30c40 	inct      	r13, r3, 0
 8010b88:	0744      	br      	0x8010a10	// 8010a10 <__umoddi3+0x28>
 8010b8a:	70d0      	lsl      	r3, r4
 8010b8c:	c4a24047 	lsr      	r7, r2, r5
 8010b90:	6dcc      	or      	r7, r3
 8010b92:	c4a14046 	lsr      	r6, r1, r5
 8010b96:	c481402c 	lsl      	r12, r1, r4
 8010b9a:	c4a04041 	lsr      	r1, r0, r5
 8010b9e:	6c70      	or      	r1, r12
 8010ba0:	c607484c 	lsri      	r12, r7, 16
 8010ba4:	c5868028 	divu      	r8, r6, r12
 8010ba8:	c4824023 	lsl      	r3, r2, r4
 8010bac:	c5888422 	mult      	r2, r8, r12
 8010bb0:	618a      	subu      	r6, r2
 8010bb2:	c40755ed 	zext      	r13, r7, 15, 0
 8010bb6:	46d0      	lsli      	r6, r6, 16
 8010bb8:	4950      	lsri      	r2, r1, 16
 8010bba:	c50d8429 	mult      	r9, r13, r8
 8010bbe:	6c98      	or      	r2, r6
 8010bc0:	6648      	cmphs      	r2, r9
 8010bc2:	7010      	lsl      	r0, r4
 8010bc4:	0807      	bt      	0x8010bd2	// 8010bd2 <__umoddi3+0x1ea>
 8010bc6:	609c      	addu      	r2, r7
 8010bc8:	65c8      	cmphs      	r2, r7
 8010bca:	e4c81000 	subi      	r6, r8, 1
 8010bce:	088a      	bt      	0x8010ce2	// 8010ce2 <__umoddi3+0x2fa>
 8010bd0:	6e1b      	mov      	r8, r6
 8010bd2:	60a6      	subu      	r2, r9
 8010bd4:	c5828026 	divu      	r6, r2, r12
 8010bd8:	7f18      	mult      	r12, r6
 8010bda:	60b2      	subu      	r2, r12
 8010bdc:	4250      	lsli      	r2, r2, 16
 8010bde:	c40155e1 	zext      	r1, r1, 15, 0
 8010be2:	7f58      	mult      	r13, r6
 8010be4:	6c48      	or      	r1, r2
 8010be6:	6744      	cmphs      	r1, r13
 8010be8:	0806      	bt      	0x8010bf4	// 8010bf4 <__umoddi3+0x20c>
 8010bea:	605c      	addu      	r1, r7
 8010bec:	65c4      	cmphs      	r1, r7
 8010bee:	5e43      	subi      	r2, r6, 1
 8010bf0:	0874      	bt      	0x8010cd8	// 8010cd8 <__umoddi3+0x2f0>
 8010bf2:	6d8b      	mov      	r6, r2
 8010bf4:	c6084822 	lsli      	r2, r8, 16
 8010bf8:	6c98      	or      	r2, r6
 8010bfa:	c40255e8 	zext      	r8, r2, 15, 0
 8010bfe:	c603484c 	lsri      	r12, r3, 16
 8010c02:	4a50      	lsri      	r2, r2, 16
 8010c04:	c5a1008d 	subu      	r13, r1, r13
 8010c08:	c40355e1 	zext      	r1, r3, 15, 0
 8010c0c:	c4288426 	mult      	r6, r8, r1
 8010c10:	7c48      	mult      	r1, r2
 8010c12:	7e30      	mult      	r8, r12
 8010c14:	7cb0      	mult      	r2, r12
 8010c16:	6204      	addu      	r8, r1
 8010c18:	c606484c 	lsri      	r12, r6, 16
 8010c1c:	6320      	addu      	r12, r8
 8010c1e:	6470      	cmphs      	r12, r1
 8010c20:	0804      	bt      	0x8010c28	// 8010c28 <__umoddi3+0x240>
 8010c22:	ea210001 	movih      	r1, 1
 8010c26:	6084      	addu      	r2, r1
 8010c28:	c60c4841 	lsri      	r1, r12, 16
 8010c2c:	6048      	addu      	r1, r2
 8010c2e:	6474      	cmphs      	r13, r1
 8010c30:	c60c482c 	lsli      	r12, r12, 16
 8010c34:	c40655e6 	zext      	r6, r6, 15, 0
 8010c38:	6318      	addu      	r12, r6
 8010c3a:	0c46      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2de>
 8010c3c:	6476      	cmpne      	r13, r1
 8010c3e:	0c60      	bf      	0x8010cfe	// 8010cfe <__umoddi3+0x316>
 8010c40:	c42d0081 	subu      	r1, r13, r1
 8010c44:	6cf3      	mov      	r3, r12
 8010c46:	586d      	subu      	r3, r0, r3
 8010c48:	64c0      	cmphs      	r0, r3
 8010c4a:	6743      	mvcv      	r13
 8010c4c:	6076      	subu      	r1, r13
 8010c4e:	c4a14025 	lsl      	r5, r1, r5
 8010c52:	c4834040 	lsr      	r0, r3, r4
 8010c56:	6c14      	or      	r0, r5
 8010c58:	7051      	lsr      	r1, r4
 8010c5a:	1486      	pop      	r4-r9
 8010c5c:	7150      	lsl      	r5, r4
 8010c5e:	c5a14048 	lsr      	r8, r1, r13
 8010c62:	4df0      	lsri      	r7, r5, 16
 8010c64:	c5a0404d 	lsr      	r13, r0, r13
 8010c68:	7050      	lsl      	r1, r4
 8010c6a:	6c74      	or      	r1, r13
 8010c6c:	c4e8802d 	divu      	r13, r8, r7
 8010c70:	c4ed8423 	mult      	r3, r13, r7
 8010c74:	c40555e2 	zext      	r2, r5, 15, 0
 8010c78:	620e      	subu      	r8, r3
 8010c7a:	c5a2842c 	mult      	r12, r2, r13
 8010c7e:	c6084828 	lsli      	r8, r8, 16
 8010c82:	c601484d 	lsri      	r13, r1, 16
 8010c86:	6f60      	or      	r13, r8
 8010c88:	6734      	cmphs      	r13, r12
 8010c8a:	c4804026 	lsl      	r6, r0, r4
 8010c8e:	0804      	bt      	0x8010c96	// 8010c96 <__umoddi3+0x2ae>
 8010c90:	6354      	addu      	r13, r5
 8010c92:	6574      	cmphs      	r13, r5
 8010c94:	082d      	bt      	0x8010cee	// 8010cee <__umoddi3+0x306>
 8010c96:	6372      	subu      	r13, r12
 8010c98:	c4ed8023 	divu      	r3, r13, r7
 8010c9c:	c4e3842c 	mult      	r12, r3, r7
 8010ca0:	6372      	subu      	r13, r12
 8010ca2:	c60d482c 	lsli      	r12, r13, 16
 8010ca6:	c40155e1 	zext      	r1, r1, 15, 0
 8010caa:	7cc8      	mult      	r3, r2
 8010cac:	6f04      	or      	r12, r1
 8010cae:	64f0      	cmphs      	r12, r3
 8010cb0:	0809      	bt      	0x8010cc2	// 8010cc2 <__umoddi3+0x2da>
 8010cb2:	6314      	addu      	r12, r5
 8010cb4:	6570      	cmphs      	r12, r5
 8010cb6:	0c06      	bf      	0x8010cc2	// 8010cc2 <__umoddi3+0x2da>
 8010cb8:	c4ac0021 	addu      	r1, r12, r5
 8010cbc:	64f0      	cmphs      	r12, r3
 8010cbe:	c5810c20 	incf      	r12, r1, 0
 8010cc2:	630e      	subu      	r12, r3
 8010cc4:	0724      	br      	0x8010b0c	// 8010b0c <__umoddi3+0x124>
 8010cc6:	c46c0083 	subu      	r3, r12, r3
 8010cca:	64f0      	cmphs      	r12, r3
 8010ccc:	605e      	subu      	r1, r7
 8010cce:	65c3      	mvcv      	r7
 8010cd0:	605e      	subu      	r1, r7
 8010cd2:	c42d0081 	subu      	r1, r13, r1
 8010cd6:	07b8      	br      	0x8010c46	// 8010c46 <__umoddi3+0x25e>
 8010cd8:	6744      	cmphs      	r1, r13
 8010cda:	0b8c      	bt      	0x8010bf2	// 8010bf2 <__umoddi3+0x20a>
 8010cdc:	2e01      	subi      	r6, 2
 8010cde:	605c      	addu      	r1, r7
 8010ce0:	078a      	br      	0x8010bf4	// 8010bf4 <__umoddi3+0x20c>
 8010ce2:	6648      	cmphs      	r2, r9
 8010ce4:	0b76      	bt      	0x8010bd0	// 8010bd0 <__umoddi3+0x1e8>
 8010ce6:	e5081001 	subi      	r8, r8, 2
 8010cea:	609c      	addu      	r2, r7
 8010cec:	0773      	br      	0x8010bd2	// 8010bd2 <__umoddi3+0x1ea>
 8010cee:	c4ad0023 	addu      	r3, r13, r5
 8010cf2:	6734      	cmphs      	r13, r12
 8010cf4:	c5a30c20 	incf      	r13, r3, 0
 8010cf8:	07cf      	br      	0x8010c96	// 8010c96 <__umoddi3+0x2ae>
 8010cfa:	6d03      	mov      	r4, r0
 8010cfc:	06e6      	br      	0x8010ac8	// 8010ac8 <__umoddi3+0xe0>
 8010cfe:	6700      	cmphs      	r0, r12
 8010d00:	0fe3      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2de>
 8010d02:	6cf3      	mov      	r3, r12
 8010d04:	3100      	movi      	r1, 0
 8010d06:	07a0      	br      	0x8010c46	// 8010c46 <__umoddi3+0x25e>
 8010d08:	08018824 	.long	0x08018824

08010d0c <__extendsfdf2>:
 8010d0c:	14d0      	push      	r15
 8010d0e:	1426      	subi      	r14, r14, 24
 8010d10:	1902      	addi      	r1, r14, 8
 8010d12:	1801      	addi      	r0, r14, 4
 8010d14:	f40e2410 	fsts      	fr0, (r14, 0x4)
 8010d18:	e000049c 	bsr      	0x8011650	// 8011650 <__unpack_f>
 8010d1c:	9865      	ld.w      	r3, (r14, 0x14)
 8010d1e:	9824      	ld.w      	r1, (r14, 0x10)
 8010d20:	6f07      	mov      	r12, r1
 8010d22:	4b42      	lsri      	r2, r3, 2
 8010d24:	b840      	st.w      	r2, (r14, 0x0)
 8010d26:	9823      	ld.w      	r1, (r14, 0xc)
 8010d28:	437e      	lsli      	r3, r3, 30
 8010d2a:	6cb3      	mov      	r2, r12
 8010d2c:	9802      	ld.w      	r0, (r14, 0x8)
 8010d2e:	e000040d 	bsr      	0x8011548	// 8011548 <__make_dp>
 8010d32:	1406      	addi      	r14, r14, 24
 8010d34:	1490      	pop      	r15
	...

08010d38 <_fpadd_parts>:
 8010d38:	14c8      	push      	r4-r11
 8010d3a:	1423      	subi      	r14, r14, 12
 8010d3c:	9060      	ld.w      	r3, (r0, 0x0)
 8010d3e:	3501      	movi      	r5, 1
 8010d40:	64d4      	cmphs      	r5, r3
 8010d42:	0871      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010d44:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010d48:	6714      	cmphs      	r5, r12
 8010d4a:	086f      	bt      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d4c:	3b44      	cmpnei      	r3, 4
 8010d4e:	0cef      	bf      	0x8010f2c	// 8010f2c <_fpadd_parts+0x1f4>
 8010d50:	eb4c0004 	cmpnei      	r12, 4
 8010d54:	0c6a      	bf      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d56:	eb4c0002 	cmpnei      	r12, 2
 8010d5a:	0cc7      	bf      	0x8010ee8	// 8010ee8 <_fpadd_parts+0x1b0>
 8010d5c:	3b42      	cmpnei      	r3, 2
 8010d5e:	0c65      	bf      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d60:	9062      	ld.w      	r3, (r0, 0x8)
 8010d62:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010d66:	c583008d 	subu      	r13, r3, r12
 8010d6a:	c40d0208 	abs      	r8, r13
 8010d6e:	eb28003f 	cmplti      	r8, 64
 8010d72:	90c3      	ld.w      	r6, (r0, 0xc)
 8010d74:	90e4      	ld.w      	r7, (r0, 0x10)
 8010d76:	b8c0      	st.w      	r6, (r14, 0x0)
 8010d78:	b8e1      	st.w      	r7, (r14, 0x4)
 8010d7a:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010d7e:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010d82:	0856      	bt      	0x8010e2e	// 8010e2e <_fpadd_parts+0xf6>
 8010d84:	64f1      	cmplt      	r12, r3
 8010d86:	0cc9      	bf      	0x8010f18	// 8010f18 <_fpadd_parts+0x1e0>
 8010d88:	ea0a0000 	movi      	r10, 0
 8010d8c:	ea0b0000 	movi      	r11, 0
 8010d90:	9001      	ld.w      	r0, (r0, 0x4)
 8010d92:	9121      	ld.w      	r1, (r1, 0x4)
 8010d94:	6442      	cmpne      	r0, r1
 8010d96:	0c82      	bf      	0x8010e9a	// 8010e9a <_fpadd_parts+0x162>
 8010d98:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010d9c:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010da0:	e90000b8 	bez      	r0, 0x8010f10	// 8010f10 <_fpadd_parts+0x1d8>
 8010da4:	6730      	cmphs      	r12, r12
 8010da6:	c58a010c 	subc      	r12, r10, r12
 8010daa:	c5ab010d 	subc      	r13, r11, r13
 8010dae:	e98d00c9 	blz      	r13, 0x8010f40	// 8010f40 <_fpadd_parts+0x208>
 8010db2:	3100      	movi      	r1, 0
 8010db4:	b221      	st.w      	r1, (r2, 0x4)
 8010db6:	b262      	st.w      	r3, (r2, 0x8)
 8010db8:	dd822003 	st.w      	r12, (r2, 0xc)
 8010dbc:	dda22004 	st.w      	r13, (r2, 0x10)
 8010dc0:	6c33      	mov      	r0, r12
 8010dc2:	6c77      	mov      	r1, r13
 8010dc4:	3840      	cmpnei      	r0, 0
 8010dc6:	c4210c81 	decf      	r1, r1, 1
 8010dca:	2800      	subi      	r0, 1
 8010dcc:	c7605023 	bmaski      	r3, 28
 8010dd0:	644c      	cmphs      	r3, r1
 8010dd2:	0c71      	bf      	0x8010eb4	// 8010eb4 <_fpadd_parts+0x17c>
 8010dd4:	64c6      	cmpne      	r1, r3
 8010dd6:	0d0d      	bf      	0x8010ff0	// 8010ff0 <_fpadd_parts+0x2b8>
 8010dd8:	9262      	ld.w      	r3, (r2, 0x8)
 8010dda:	3600      	movi      	r6, 0
 8010ddc:	3700      	movi      	r7, 0
 8010dde:	ea0a0000 	movi      	r10, 0
 8010de2:	2b00      	subi      	r3, 1
 8010de4:	2e00      	subi      	r6, 1
 8010de6:	2f00      	subi      	r7, 1
 8010de8:	c7605028 	bmaski      	r8, 28
 8010dec:	e54a1001 	subi      	r10, r10, 2
 8010df0:	0403      	br      	0x8010df6	// 8010df6 <_fpadd_parts+0xbe>
 8010df2:	6606      	cmpne      	r1, r8
 8010df4:	0c8b      	bf      	0x8010f0a	// 8010f0a <_fpadd_parts+0x1d2>
 8010df6:	6511      	cmplt      	r4, r4
 8010df8:	c58c0044 	addc      	r4, r12, r12
 8010dfc:	c5ad0045 	addc      	r5, r13, r13
 8010e00:	6401      	cmplt      	r0, r0
 8010e02:	c4c40040 	addc      	r0, r4, r6
 8010e06:	c4e50041 	addc      	r1, r5, r7
 8010e0a:	6460      	cmphs      	r8, r1
 8010e0c:	6e4f      	mov      	r9, r3
 8010e0e:	6f13      	mov      	r12, r4
 8010e10:	6f57      	mov      	r13, r5
 8010e12:	2b00      	subi      	r3, 1
 8010e14:	0bef      	bt      	0x8010df2	// 8010df2 <_fpadd_parts+0xba>
 8010e16:	3303      	movi      	r3, 3
 8010e18:	b283      	st.w      	r4, (r2, 0xc)
 8010e1a:	b2a4      	st.w      	r5, (r2, 0x10)
 8010e1c:	dd222002 	st.w      	r9, (r2, 0x8)
 8010e20:	b260      	st.w      	r3, (r2, 0x0)
 8010e22:	6c0b      	mov      	r0, r2
 8010e24:	1403      	addi      	r14, r14, 12
 8010e26:	1488      	pop      	r4-r11
 8010e28:	6c07      	mov      	r0, r1
 8010e2a:	1403      	addi      	r14, r14, 12
 8010e2c:	1488      	pop      	r4-r11
 8010e2e:	e96d009a 	blsz      	r13, 0x8010f62	// 8010f62 <_fpadd_parts+0x22a>
 8010e32:	ea0d001f 	movi      	r13, 31
 8010e36:	c42b4826 	lsli      	r6, r11, 1
 8010e3a:	6362      	subu      	r13, r8
 8010e3c:	e588101f 	subi      	r12, r8, 32
 8010e40:	c5a6402d 	lsl      	r13, r6, r13
 8010e44:	c50a4046 	lsr      	r6, r10, r8
 8010e48:	c7ec2880 	btsti      	r12, 31
 8010e4c:	c58b4049 	lsr      	r9, r11, r12
 8010e50:	3400      	movi      	r4, 0
 8010e52:	6db4      	or      	r6, r13
 8010e54:	c4c90c20 	incf      	r6, r9, 0
 8010e58:	6f53      	mov      	r13, r4
 8010e5a:	c5854029 	lsl      	r9, r5, r12
 8010e5e:	c505402c 	lsl      	r12, r5, r8
 8010e62:	c50b4047 	lsr      	r7, r11, r8
 8010e66:	c5a90c20 	incf      	r13, r9, 0
 8010e6a:	c5840c20 	incf      	r12, r4, 0
 8010e6e:	c4e40c20 	incf      	r7, r4, 0
 8010e72:	eb4c0000 	cmpnei      	r12, 0
 8010e76:	c5ad0c81 	decf      	r13, r13, 1
 8010e7a:	e58c1000 	subi      	r12, r12, 1
 8010e7e:	6b28      	and      	r12, r10
 8010e80:	6b6c      	and      	r13, r11
 8010e82:	6f34      	or      	r12, r13
 8010e84:	eb4c0000 	cmpnei      	r12, 0
 8010e88:	9001      	ld.w      	r0, (r0, 0x4)
 8010e8a:	9121      	ld.w      	r1, (r1, 0x4)
 8010e8c:	c400050a 	mvc      	r10
 8010e90:	6442      	cmpne      	r0, r1
 8010e92:	6ed3      	mov      	r11, r4
 8010e94:	6e98      	or      	r10, r6
 8010e96:	6edc      	or      	r11, r7
 8010e98:	0b80      	bt      	0x8010d98	// 8010d98 <_fpadd_parts+0x60>
 8010e9a:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010e9e:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010ea2:	6731      	cmplt      	r12, r12
 8010ea4:	6329      	addc      	r12, r10
 8010ea6:	636d      	addc      	r13, r11
 8010ea8:	b201      	st.w      	r0, (r2, 0x4)
 8010eaa:	b262      	st.w      	r3, (r2, 0x8)
 8010eac:	dd822003 	st.w      	r12, (r2, 0xc)
 8010eb0:	dda22004 	st.w      	r13, (r2, 0x10)
 8010eb4:	3303      	movi      	r3, 3
 8010eb6:	b260      	st.w      	r3, (r2, 0x0)
 8010eb8:	c7805023 	bmaski      	r3, 29
 8010ebc:	674c      	cmphs      	r3, r13
 8010ebe:	0812      	bt      	0x8010ee2	// 8010ee2 <_fpadd_parts+0x1aa>
 8010ec0:	c7ed4823 	lsli      	r3, r13, 31
 8010ec4:	c42c4840 	lsri      	r0, r12, 1
 8010ec8:	6c0c      	or      	r0, r3
 8010eca:	c42d4841 	lsri      	r1, r13, 1
 8010ece:	9262      	ld.w      	r3, (r2, 0x8)
 8010ed0:	e48c2001 	andi      	r4, r12, 1
 8010ed4:	3500      	movi      	r5, 0
 8010ed6:	6c10      	or      	r0, r4
 8010ed8:	6c54      	or      	r1, r5
 8010eda:	2300      	addi      	r3, 1
 8010edc:	b203      	st.w      	r0, (r2, 0xc)
 8010ede:	b224      	st.w      	r1, (r2, 0x10)
 8010ee0:	b262      	st.w      	r3, (r2, 0x8)
 8010ee2:	6c0b      	mov      	r0, r2
 8010ee4:	1403      	addi      	r14, r14, 12
 8010ee6:	1488      	pop      	r4-r11
 8010ee8:	3b42      	cmpnei      	r3, 2
 8010eea:	0b9d      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010eec:	b260      	st.w      	r3, (r2, 0x0)
 8010eee:	9061      	ld.w      	r3, (r0, 0x4)
 8010ef0:	b261      	st.w      	r3, (r2, 0x4)
 8010ef2:	9062      	ld.w      	r3, (r0, 0x8)
 8010ef4:	b262      	st.w      	r3, (r2, 0x8)
 8010ef6:	9063      	ld.w      	r3, (r0, 0xc)
 8010ef8:	b263      	st.w      	r3, (r2, 0xc)
 8010efa:	9064      	ld.w      	r3, (r0, 0x10)
 8010efc:	9121      	ld.w      	r1, (r1, 0x4)
 8010efe:	b264      	st.w      	r3, (r2, 0x10)
 8010f00:	9061      	ld.w      	r3, (r0, 0x4)
 8010f02:	68c4      	and      	r3, r1
 8010f04:	b261      	st.w      	r3, (r2, 0x4)
 8010f06:	6c0b      	mov      	r0, r2
 8010f08:	078e      	br      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f0a:	6428      	cmphs      	r10, r0
 8010f0c:	0b75      	bt      	0x8010df6	// 8010df6 <_fpadd_parts+0xbe>
 8010f0e:	0784      	br      	0x8010e16	// 8010e16 <_fpadd_parts+0xde>
 8010f10:	6730      	cmphs      	r12, r12
 8010f12:	632b      	subc      	r12, r10
 8010f14:	636f      	subc      	r13, r11
 8010f16:	074c      	br      	0x8010dae	// 8010dae <_fpadd_parts+0x76>
 8010f18:	6cf3      	mov      	r3, r12
 8010f1a:	ea0d0000 	movi      	r13, 0
 8010f1e:	ea0c0000 	movi      	r12, 0
 8010f22:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010f26:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010f2a:	0733      	br      	0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010f2c:	eb4c0004 	cmpnei      	r12, 4
 8010f30:	0b7a      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f32:	9041      	ld.w      	r2, (r0, 0x4)
 8010f34:	9161      	ld.w      	r3, (r1, 0x4)
 8010f36:	64ca      	cmpne      	r2, r3
 8010f38:	124b      	lrw      	r2, 0x8018810	// 8011064 <__subdf3+0x38>
 8010f3a:	c4020c40 	inct      	r0, r2, 0
 8010f3e:	0773      	br      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f40:	ea0a0000 	movi      	r10, 0
 8010f44:	ea0b0000 	movi      	r11, 0
 8010f48:	3101      	movi      	r1, 1
 8010f4a:	6730      	cmphs      	r12, r12
 8010f4c:	c58a010c 	subc      	r12, r10, r12
 8010f50:	c5ab010d 	subc      	r13, r11, r13
 8010f54:	b221      	st.w      	r1, (r2, 0x4)
 8010f56:	b262      	st.w      	r3, (r2, 0x8)
 8010f58:	dd822003 	st.w      	r12, (r2, 0xc)
 8010f5c:	dda22004 	st.w      	r13, (r2, 0x10)
 8010f60:	0730      	br      	0x8010dc0	// 8010dc0 <_fpadd_parts+0x88>
 8010f62:	e90dff17 	bez      	r13, 0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010f66:	98c0      	ld.w      	r6, (r14, 0x0)
 8010f68:	98e1      	ld.w      	r7, (r14, 0x4)
 8010f6a:	ea0d001f 	movi      	r13, 31
 8010f6e:	47c1      	lsli      	r6, r7, 1
 8010f70:	6362      	subu      	r13, r8
 8010f72:	c5a6402d 	lsl      	r13, r6, r13
 8010f76:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010f7a:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010f7e:	e588101f 	subi      	r12, r8, 32
 8010f82:	c50d4046 	lsr      	r6, r13, r8
 8010f86:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010f8a:	c7ec2880 	btsti      	r12, 31
 8010f8e:	3400      	movi      	r4, 0
 8010f90:	c5874049 	lsr      	r9, r7, r12
 8010f94:	6db4      	or      	r6, r13
 8010f96:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010f9a:	c4c90c20 	incf      	r6, r9, 0
 8010f9e:	c50d4047 	lsr      	r7, r13, r8
 8010fa2:	c5854029 	lsl      	r9, r5, r12
 8010fa6:	6f53      	mov      	r13, r4
 8010fa8:	c505402c 	lsl      	r12, r5, r8
 8010fac:	c5a90c20 	incf      	r13, r9, 0
 8010fb0:	c5840c20 	incf      	r12, r4, 0
 8010fb4:	c4e40c20 	incf      	r7, r4, 0
 8010fb8:	60e0      	addu      	r3, r8
 8010fba:	eb4c0000 	cmpnei      	r12, 0
 8010fbe:	c5ad0c81 	decf      	r13, r13, 1
 8010fc2:	e58c1000 	subi      	r12, r12, 1
 8010fc6:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8010fca:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8010fce:	6a30      	and      	r8, r12
 8010fd0:	6a74      	and      	r9, r13
 8010fd2:	6f23      	mov      	r12, r8
 8010fd4:	6f67      	mov      	r13, r9
 8010fd6:	6f34      	or      	r12, r13
 8010fd8:	eb4c0000 	cmpnei      	r12, 0
 8010fdc:	c400050c 	mvc      	r12
 8010fe0:	6f53      	mov      	r13, r4
 8010fe2:	c5862424 	or      	r4, r6, r12
 8010fe6:	c5a72425 	or      	r5, r7, r13
 8010fea:	b880      	st.w      	r4, (r14, 0x0)
 8010fec:	b8a1      	st.w      	r5, (r14, 0x4)
 8010fee:	06d1      	br      	0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010ff0:	3300      	movi      	r3, 0
 8010ff2:	2b01      	subi      	r3, 2
 8010ff4:	640c      	cmphs      	r3, r0
 8010ff6:	0af1      	bt      	0x8010dd8	// 8010dd8 <_fpadd_parts+0xa0>
 8010ff8:	075e      	br      	0x8010eb4	// 8010eb4 <_fpadd_parts+0x17c>
	...

08010ffc <__adddf3>:
 8010ffc:	14d2      	push      	r4-r5, r15
 8010ffe:	1433      	subi      	r14, r14, 76
 8011000:	b800      	st.w      	r0, (r14, 0x0)
 8011002:	b821      	st.w      	r1, (r14, 0x4)
 8011004:	6c3b      	mov      	r0, r14
 8011006:	6d47      	mov      	r5, r1
 8011008:	1904      	addi      	r1, r14, 16
 801100a:	b863      	st.w      	r3, (r14, 0xc)
 801100c:	b842      	st.w      	r2, (r14, 0x8)
 801100e:	e0000433 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011012:	1909      	addi      	r1, r14, 36
 8011014:	1802      	addi      	r0, r14, 8
 8011016:	e000042f 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801101a:	1a0e      	addi      	r2, r14, 56
 801101c:	1909      	addi      	r1, r14, 36
 801101e:	1804      	addi      	r0, r14, 16
 8011020:	e3fffe8c 	bsr      	0x8010d38	// 8010d38 <_fpadd_parts>
 8011024:	e0000360 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011028:	1413      	addi      	r14, r14, 76
 801102a:	1492      	pop      	r4-r5, r15

0801102c <__subdf3>:
 801102c:	14d2      	push      	r4-r5, r15
 801102e:	1433      	subi      	r14, r14, 76
 8011030:	b800      	st.w      	r0, (r14, 0x0)
 8011032:	b821      	st.w      	r1, (r14, 0x4)
 8011034:	6c3b      	mov      	r0, r14
 8011036:	6d47      	mov      	r5, r1
 8011038:	1904      	addi      	r1, r14, 16
 801103a:	b842      	st.w      	r2, (r14, 0x8)
 801103c:	b863      	st.w      	r3, (r14, 0xc)
 801103e:	e000041b 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011042:	1909      	addi      	r1, r14, 36
 8011044:	1802      	addi      	r0, r14, 8
 8011046:	e0000417 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801104a:	986a      	ld.w      	r3, (r14, 0x28)
 801104c:	e4634001 	xori      	r3, r3, 1
 8011050:	1a0e      	addi      	r2, r14, 56
 8011052:	1909      	addi      	r1, r14, 36
 8011054:	1804      	addi      	r0, r14, 16
 8011056:	b86a      	st.w      	r3, (r14, 0x28)
 8011058:	e3fffe70 	bsr      	0x8010d38	// 8010d38 <_fpadd_parts>
 801105c:	e0000344 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011060:	1413      	addi      	r14, r14, 76
 8011062:	1492      	pop      	r4-r5, r15
 8011064:	08018810 	.long	0x08018810

08011068 <__muldf3>:
 8011068:	14d8      	push      	r4-r11, r15
 801106a:	1436      	subi      	r14, r14, 88
 801106c:	b803      	st.w      	r0, (r14, 0xc)
 801106e:	b824      	st.w      	r1, (r14, 0x10)
 8011070:	1803      	addi      	r0, r14, 12
 8011072:	1907      	addi      	r1, r14, 28
 8011074:	b866      	st.w      	r3, (r14, 0x18)
 8011076:	b845      	st.w      	r2, (r14, 0x14)
 8011078:	e00003fe 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801107c:	190c      	addi      	r1, r14, 48
 801107e:	1805      	addi      	r0, r14, 20
 8011080:	e00003fa 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011084:	9867      	ld.w      	r3, (r14, 0x1c)
 8011086:	3b01      	cmphsi      	r3, 2
 8011088:	0ca4      	bf      	0x80111d0	// 80111d0 <__muldf3+0x168>
 801108a:	984c      	ld.w      	r2, (r14, 0x30)
 801108c:	3a01      	cmphsi      	r2, 2
 801108e:	0c94      	bf      	0x80111b6	// 80111b6 <__muldf3+0x14e>
 8011090:	3b44      	cmpnei      	r3, 4
 8011092:	0c9d      	bf      	0x80111cc	// 80111cc <__muldf3+0x164>
 8011094:	3a44      	cmpnei      	r2, 4
 8011096:	0c8e      	bf      	0x80111b2	// 80111b2 <__muldf3+0x14a>
 8011098:	3b42      	cmpnei      	r3, 2
 801109a:	0c9b      	bf      	0x80111d0	// 80111d0 <__muldf3+0x168>
 801109c:	3a42      	cmpnei      	r2, 2
 801109e:	0c8c      	bf      	0x80111b6	// 80111b6 <__muldf3+0x14e>
 80110a0:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 80110a4:	d90e200a 	ld.w      	r8, (r14, 0x28)
 80110a8:	3300      	movi      	r3, 0
 80110aa:	6c33      	mov      	r0, r12
 80110ac:	6ca3      	mov      	r2, r8
 80110ae:	6c4f      	mov      	r1, r3
 80110b0:	dd8e2002 	st.w      	r12, (r14, 0x8)
 80110b4:	d96e2010 	ld.w      	r11, (r14, 0x40)
 80110b8:	e00002a6 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110bc:	3300      	movi      	r3, 0
 80110be:	6ca3      	mov      	r2, r8
 80110c0:	6d83      	mov      	r6, r0
 80110c2:	6dc7      	mov      	r7, r1
 80110c4:	6c4f      	mov      	r1, r3
 80110c6:	6c2f      	mov      	r0, r11
 80110c8:	e000029e 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110cc:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 80110d0:	3300      	movi      	r3, 0
 80110d2:	6e03      	mov      	r8, r0
 80110d4:	6e47      	mov      	r9, r1
 80110d6:	6caf      	mov      	r2, r11
 80110d8:	6c4f      	mov      	r1, r3
 80110da:	6c2b      	mov      	r0, r10
 80110dc:	e0000294 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110e0:	d98e2002 	ld.w      	r12, (r14, 0x8)
 80110e4:	3300      	movi      	r3, 0
 80110e6:	b800      	st.w      	r0, (r14, 0x0)
 80110e8:	b821      	st.w      	r1, (r14, 0x4)
 80110ea:	6cb3      	mov      	r2, r12
 80110ec:	6c2b      	mov      	r0, r10
 80110ee:	6c4f      	mov      	r1, r3
 80110f0:	e000028a 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110f4:	6401      	cmplt      	r0, r0
 80110f6:	6021      	addc      	r0, r8
 80110f8:	6065      	addc      	r1, r9
 80110fa:	6644      	cmphs      	r1, r9
 80110fc:	0c80      	bf      	0x80111fc	// 80111fc <__muldf3+0x194>
 80110fe:	6466      	cmpne      	r9, r1
 8011100:	0c7c      	bf      	0x80111f8	// 80111f8 <__muldf3+0x190>
 8011102:	ea080000 	movi      	r8, 0
 8011106:	ea090000 	movi      	r9, 0
 801110a:	3200      	movi      	r2, 0
 801110c:	6cc3      	mov      	r3, r0
 801110e:	6489      	cmplt      	r2, r2
 8011110:	6099      	addc      	r2, r6
 8011112:	60dd      	addc      	r3, r7
 8011114:	65cc      	cmphs      	r3, r7
 8011116:	0c6a      	bf      	0x80111ea	// 80111ea <__muldf3+0x182>
 8011118:	64de      	cmpne      	r7, r3
 801111a:	0c66      	bf      	0x80111e6	// 80111e6 <__muldf3+0x17e>
 801111c:	6f07      	mov      	r12, r1
 801111e:	ea0d0000 	movi      	r13, 0
 8011122:	9800      	ld.w      	r0, (r14, 0x0)
 8011124:	9821      	ld.w      	r1, (r14, 0x4)
 8011126:	6401      	cmplt      	r0, r0
 8011128:	6031      	addc      	r0, r12
 801112a:	6075      	addc      	r1, r13
 801112c:	6621      	cmplt      	r8, r8
 801112e:	6201      	addc      	r8, r0
 8011130:	6245      	addc      	r9, r1
 8011132:	980e      	ld.w      	r0, (r14, 0x38)
 8011134:	9829      	ld.w      	r1, (r14, 0x24)
 8011136:	6040      	addu      	r1, r0
 8011138:	590e      	addi      	r0, r1, 4
 801113a:	b813      	st.w      	r0, (r14, 0x4c)
 801113c:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011140:	980d      	ld.w      	r0, (r14, 0x34)
 8011142:	6432      	cmpne      	r12, r0
 8011144:	c780502a 	bmaski      	r10, 29
 8011148:	c4000500 	mvc      	r0
 801114c:	6668      	cmphs      	r10, r9
 801114e:	b812      	st.w      	r0, (r14, 0x48)
 8011150:	086f      	bt      	0x801122e	// 801122e <__muldf3+0x1c6>
 8011152:	2104      	addi      	r1, 5
 8011154:	ea0c0000 	movi      	r12, 0
 8011158:	ea2d8000 	movih      	r13, 32768
 801115c:	e4082001 	andi      	r0, r8, 1
 8011160:	6ec7      	mov      	r11, r1
 8011162:	e900000a 	bez      	r0, 0x8011176	// 8011176 <__muldf3+0x10e>
 8011166:	431f      	lsli      	r0, r3, 31
 8011168:	4a81      	lsri      	r4, r2, 1
 801116a:	6d00      	or      	r4, r0
 801116c:	4ba1      	lsri      	r5, r3, 1
 801116e:	c5842422 	or      	r2, r4, r12
 8011172:	c5a52423 	or      	r3, r5, r13
 8011176:	c4294840 	lsri      	r0, r9, 1
 801117a:	6428      	cmphs      	r10, r0
 801117c:	c7e94827 	lsli      	r7, r9, 31
 8011180:	c4284846 	lsri      	r6, r8, 1
 8011184:	c4c72428 	or      	r8, r7, r6
 8011188:	6e43      	mov      	r9, r0
 801118a:	2100      	addi      	r1, 1
 801118c:	0fe8      	bf      	0x801115c	// 801115c <__muldf3+0xf4>
 801118e:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 8011192:	e42820ff 	andi      	r1, r8, 255
 8011196:	eb410080 	cmpnei      	r1, 128
 801119a:	0c36      	bf      	0x8011206	// 8011206 <__muldf3+0x19e>
 801119c:	3303      	movi      	r3, 3
 801119e:	dd0e2014 	st.w      	r8, (r14, 0x50)
 80111a2:	dd2e2015 	st.w      	r9, (r14, 0x54)
 80111a6:	b871      	st.w      	r3, (r14, 0x44)
 80111a8:	1811      	addi      	r0, r14, 68
 80111aa:	e000029d 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111ae:	1416      	addi      	r14, r14, 88
 80111b0:	1498      	pop      	r4-r11, r15
 80111b2:	3b42      	cmpnei      	r3, 2
 80111b4:	0c3b      	bf      	0x801122a	// 801122a <__muldf3+0x1c2>
 80111b6:	986d      	ld.w      	r3, (r14, 0x34)
 80111b8:	9848      	ld.w      	r2, (r14, 0x20)
 80111ba:	64ca      	cmpne      	r2, r3
 80111bc:	c4000503 	mvc      	r3
 80111c0:	180c      	addi      	r0, r14, 48
 80111c2:	b86d      	st.w      	r3, (r14, 0x34)
 80111c4:	e0000290 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111c8:	1416      	addi      	r14, r14, 88
 80111ca:	1498      	pop      	r4-r11, r15
 80111cc:	3a42      	cmpnei      	r2, 2
 80111ce:	0c2e      	bf      	0x801122a	// 801122a <__muldf3+0x1c2>
 80111d0:	9848      	ld.w      	r2, (r14, 0x20)
 80111d2:	986d      	ld.w      	r3, (r14, 0x34)
 80111d4:	64ca      	cmpne      	r2, r3
 80111d6:	c4000503 	mvc      	r3
 80111da:	1807      	addi      	r0, r14, 28
 80111dc:	b868      	st.w      	r3, (r14, 0x20)
 80111de:	e0000283 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111e2:	1416      	addi      	r14, r14, 88
 80111e4:	1498      	pop      	r4-r11, r15
 80111e6:	6588      	cmphs      	r2, r6
 80111e8:	0b9a      	bt      	0x801111c	// 801111c <__muldf3+0xb4>
 80111ea:	e5080000 	addi      	r8, r8, 1
 80111ee:	eb480000 	cmpnei      	r8, 0
 80111f2:	c5290c21 	incf      	r9, r9, 1
 80111f6:	0793      	br      	0x801111c	// 801111c <__muldf3+0xb4>
 80111f8:	6600      	cmphs      	r0, r8
 80111fa:	0b84      	bt      	0x8011102	// 8011102 <__muldf3+0x9a>
 80111fc:	ea080000 	movi      	r8, 0
 8011200:	ea090001 	movi      	r9, 1
 8011204:	0783      	br      	0x801110a	// 801110a <__muldf3+0xa2>
 8011206:	e4282100 	andi      	r1, r8, 256
 801120a:	e921ffc9 	bnez      	r1, 0x801119c	// 801119c <__muldf3+0x134>
 801120e:	6c8c      	or      	r2, r3
 8011210:	e902ffc6 	bez      	r2, 0x801119c	// 801119c <__muldf3+0x134>
 8011214:	3280      	movi      	r2, 128
 8011216:	3300      	movi      	r3, 0
 8011218:	3100      	movi      	r1, 0
 801121a:	6489      	cmplt      	r2, r2
 801121c:	60a1      	addc      	r2, r8
 801121e:	60e5      	addc      	r3, r9
 8011220:	29ff      	subi      	r1, 256
 8011222:	c4222028 	and      	r8, r2, r1
 8011226:	6e4f      	mov      	r9, r3
 8011228:	07ba      	br      	0x801119c	// 801119c <__muldf3+0x134>
 801122a:	100f      	lrw      	r0, 0x8018810	// 8011264 <__muldf3+0x1fc>
 801122c:	07bf      	br      	0x80111aa	// 80111aa <__muldf3+0x142>
 801122e:	c760502c 	bmaski      	r12, 28
 8011232:	6670      	cmphs      	r12, r9
 8011234:	0faf      	bf      	0x8011192	// 8011192 <__muldf3+0x12a>
 8011236:	2102      	addi      	r1, 3
 8011238:	3401      	movi      	r4, 1
 801123a:	3500      	movi      	r5, 0
 801123c:	6da3      	mov      	r6, r8
 801123e:	6de7      	mov      	r7, r9
 8011240:	6c07      	mov      	r0, r1
 8011242:	6621      	cmplt      	r8, r8
 8011244:	6219      	addc      	r8, r6
 8011246:	625d      	addc      	r9, r7
 8011248:	e9a30004 	bhsz      	r3, 0x8011250	// 8011250 <__muldf3+0x1e8>
 801124c:	6e10      	or      	r8, r4
 801124e:	6e54      	or      	r9, r5
 8011250:	6d8b      	mov      	r6, r2
 8011252:	6dcf      	mov      	r7, r3
 8011254:	6489      	cmplt      	r2, r2
 8011256:	6099      	addc      	r2, r6
 8011258:	60dd      	addc      	r3, r7
 801125a:	6670      	cmphs      	r12, r9
 801125c:	2900      	subi      	r1, 1
 801125e:	0bef      	bt      	0x801123c	// 801123c <__muldf3+0x1d4>
 8011260:	b813      	st.w      	r0, (r14, 0x4c)
 8011262:	0798      	br      	0x8011192	// 8011192 <__muldf3+0x12a>
 8011264:	08018810 	.long	0x08018810

08011268 <__divdf3>:
 8011268:	14d6      	push      	r4-r9, r15
 801126a:	142e      	subi      	r14, r14, 56
 801126c:	b800      	st.w      	r0, (r14, 0x0)
 801126e:	b821      	st.w      	r1, (r14, 0x4)
 8011270:	6c3b      	mov      	r0, r14
 8011272:	1904      	addi      	r1, r14, 16
 8011274:	b863      	st.w      	r3, (r14, 0xc)
 8011276:	b842      	st.w      	r2, (r14, 0x8)
 8011278:	e00002fe 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801127c:	1909      	addi      	r1, r14, 36
 801127e:	1802      	addi      	r0, r14, 8
 8011280:	e00002fa 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011284:	9864      	ld.w      	r3, (r14, 0x10)
 8011286:	3b01      	cmphsi      	r3, 2
 8011288:	0c51      	bf      	0x801132a	// 801132a <__divdf3+0xc2>
 801128a:	9829      	ld.w      	r1, (r14, 0x24)
 801128c:	3201      	movi      	r2, 1
 801128e:	6448      	cmphs      	r2, r1
 8011290:	0873      	bt      	0x8011376	// 8011376 <__divdf3+0x10e>
 8011292:	9845      	ld.w      	r2, (r14, 0x14)
 8011294:	980a      	ld.w      	r0, (r14, 0x28)
 8011296:	3b44      	cmpnei      	r3, 4
 8011298:	6c81      	xor      	r2, r0
 801129a:	b845      	st.w      	r2, (r14, 0x14)
 801129c:	0c4c      	bf      	0x8011334	// 8011334 <__divdf3+0xcc>
 801129e:	3b42      	cmpnei      	r3, 2
 80112a0:	0c4a      	bf      	0x8011334	// 8011334 <__divdf3+0xcc>
 80112a2:	3944      	cmpnei      	r1, 4
 80112a4:	0c4c      	bf      	0x801133c	// 801133c <__divdf3+0xd4>
 80112a6:	3942      	cmpnei      	r1, 2
 80112a8:	0c63      	bf      	0x801136e	// 801136e <__divdf3+0x106>
 80112aa:	9807      	ld.w      	r0, (r14, 0x1c)
 80112ac:	9828      	ld.w      	r1, (r14, 0x20)
 80112ae:	98cc      	ld.w      	r6, (r14, 0x30)
 80112b0:	98ed      	ld.w      	r7, (r14, 0x34)
 80112b2:	9866      	ld.w      	r3, (r14, 0x18)
 80112b4:	984b      	ld.w      	r2, (r14, 0x2c)
 80112b6:	65c4      	cmphs      	r1, r7
 80112b8:	60ca      	subu      	r3, r2
 80112ba:	b866      	st.w      	r3, (r14, 0x18)
 80112bc:	0c05      	bf      	0x80112c6	// 80112c6 <__divdf3+0x5e>
 80112be:	645e      	cmpne      	r7, r1
 80112c0:	080a      	bt      	0x80112d4	// 80112d4 <__divdf3+0x6c>
 80112c2:	6580      	cmphs      	r0, r6
 80112c4:	0808      	bt      	0x80112d4	// 80112d4 <__divdf3+0x6c>
 80112c6:	6f03      	mov      	r12, r0
 80112c8:	6f47      	mov      	r13, r1
 80112ca:	2b00      	subi      	r3, 1
 80112cc:	6401      	cmplt      	r0, r0
 80112ce:	6031      	addc      	r0, r12
 80112d0:	6075      	addc      	r1, r13
 80112d2:	b866      	st.w      	r3, (r14, 0x18)
 80112d4:	ea0c003d 	movi      	r12, 61
 80112d8:	3400      	movi      	r4, 0
 80112da:	3500      	movi      	r5, 0
 80112dc:	3200      	movi      	r2, 0
 80112de:	ea231000 	movih      	r3, 4096
 80112e2:	65c4      	cmphs      	r1, r7
 80112e4:	0c0a      	bf      	0x80112f8	// 80112f8 <__divdf3+0x90>
 80112e6:	645e      	cmpne      	r7, r1
 80112e8:	0803      	bt      	0x80112ee	// 80112ee <__divdf3+0x86>
 80112ea:	6580      	cmphs      	r0, r6
 80112ec:	0c06      	bf      	0x80112f8	// 80112f8 <__divdf3+0x90>
 80112ee:	6d08      	or      	r4, r2
 80112f0:	6d4c      	or      	r5, r3
 80112f2:	6400      	cmphs      	r0, r0
 80112f4:	601b      	subc      	r0, r6
 80112f6:	605f      	subc      	r1, r7
 80112f8:	c7e34829 	lsli      	r9, r3, 31
 80112fc:	c4224848 	lsri      	r8, r2, 1
 8011300:	c423484d 	lsri      	r13, r3, 1
 8011304:	c5092422 	or      	r2, r9, r8
 8011308:	e58c1000 	subi      	r12, r12, 1
 801130c:	6e03      	mov      	r8, r0
 801130e:	6e47      	mov      	r9, r1
 8011310:	6cf7      	mov      	r3, r13
 8011312:	6401      	cmplt      	r0, r0
 8011314:	6021      	addc      	r0, r8
 8011316:	6065      	addc      	r1, r9
 8011318:	e92cffe5 	bnez      	r12, 0x80112e2	// 80112e2 <__divdf3+0x7a>
 801131c:	e46420ff 	andi      	r3, r4, 255
 8011320:	eb430080 	cmpnei      	r3, 128
 8011324:	0c13      	bf      	0x801134a	// 801134a <__divdf3+0xe2>
 8011326:	b887      	st.w      	r4, (r14, 0x1c)
 8011328:	b8a8      	st.w      	r5, (r14, 0x20)
 801132a:	1804      	addi      	r0, r14, 16
 801132c:	e00001dc 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011330:	140e      	addi      	r14, r14, 56
 8011332:	1496      	pop      	r4-r9, r15
 8011334:	644e      	cmpne      	r3, r1
 8011336:	0bfa      	bt      	0x801132a	// 801132a <__divdf3+0xc2>
 8011338:	1011      	lrw      	r0, 0x8018810	// 801137c <__divdf3+0x114>
 801133a:	07f9      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801133c:	3300      	movi      	r3, 0
 801133e:	3400      	movi      	r4, 0
 8011340:	b867      	st.w      	r3, (r14, 0x1c)
 8011342:	b888      	st.w      	r4, (r14, 0x20)
 8011344:	b866      	st.w      	r3, (r14, 0x18)
 8011346:	1804      	addi      	r0, r14, 16
 8011348:	07f2      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801134a:	e4642100 	andi      	r3, r4, 256
 801134e:	e923ffec 	bnez      	r3, 0x8011326	// 8011326 <__divdf3+0xbe>
 8011352:	6c04      	or      	r0, r1
 8011354:	e900ffe9 	bez      	r0, 0x8011326	// 8011326 <__divdf3+0xbe>
 8011358:	3280      	movi      	r2, 128
 801135a:	3300      	movi      	r3, 0
 801135c:	3100      	movi      	r1, 0
 801135e:	6489      	cmplt      	r2, r2
 8011360:	6091      	addc      	r2, r4
 8011362:	60d5      	addc      	r3, r5
 8011364:	29ff      	subi      	r1, 256
 8011366:	c4222024 	and      	r4, r2, r1
 801136a:	6d4f      	mov      	r5, r3
 801136c:	07dd      	br      	0x8011326	// 8011326 <__divdf3+0xbe>
 801136e:	3304      	movi      	r3, 4
 8011370:	b864      	st.w      	r3, (r14, 0x10)
 8011372:	1804      	addi      	r0, r14, 16
 8011374:	07dc      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 8011376:	1809      	addi      	r0, r14, 36
 8011378:	07da      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801137a:	0000      	.short	0x0000
 801137c:	08018810 	.long	0x08018810

08011380 <__nedf2>:
 8011380:	14d2      	push      	r4-r5, r15
 8011382:	142e      	subi      	r14, r14, 56
 8011384:	b800      	st.w      	r0, (r14, 0x0)
 8011386:	b821      	st.w      	r1, (r14, 0x4)
 8011388:	6c3b      	mov      	r0, r14
 801138a:	6d47      	mov      	r5, r1
 801138c:	1904      	addi      	r1, r14, 16
 801138e:	b863      	st.w      	r3, (r14, 0xc)
 8011390:	b842      	st.w      	r2, (r14, 0x8)
 8011392:	e0000271 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011396:	1802      	addi      	r0, r14, 8
 8011398:	1909      	addi      	r1, r14, 36
 801139a:	e000026d 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801139e:	9864      	ld.w      	r3, (r14, 0x10)
 80113a0:	3001      	movi      	r0, 1
 80113a2:	64c0      	cmphs      	r0, r3
 80113a4:	0808      	bt      	0x80113b4	// 80113b4 <__nedf2+0x34>
 80113a6:	9869      	ld.w      	r3, (r14, 0x24)
 80113a8:	64c0      	cmphs      	r0, r3
 80113aa:	0805      	bt      	0x80113b4	// 80113b4 <__nedf2+0x34>
 80113ac:	1909      	addi      	r1, r14, 36
 80113ae:	1804      	addi      	r0, r14, 16
 80113b0:	e00002d4 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 80113b4:	140e      	addi      	r14, r14, 56
 80113b6:	1492      	pop      	r4-r5, r15

080113b8 <__gtdf2>:
 80113b8:	14d2      	push      	r4-r5, r15
 80113ba:	142e      	subi      	r14, r14, 56
 80113bc:	b800      	st.w      	r0, (r14, 0x0)
 80113be:	b821      	st.w      	r1, (r14, 0x4)
 80113c0:	6c3b      	mov      	r0, r14
 80113c2:	6d47      	mov      	r5, r1
 80113c4:	1904      	addi      	r1, r14, 16
 80113c6:	b842      	st.w      	r2, (r14, 0x8)
 80113c8:	b863      	st.w      	r3, (r14, 0xc)
 80113ca:	e0000255 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80113ce:	1909      	addi      	r1, r14, 36
 80113d0:	1802      	addi      	r0, r14, 8
 80113d2:	e0000251 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80113d6:	9844      	ld.w      	r2, (r14, 0x10)
 80113d8:	3301      	movi      	r3, 1
 80113da:	648c      	cmphs      	r3, r2
 80113dc:	080a      	bt      	0x80113f0	// 80113f0 <__gtdf2+0x38>
 80113de:	9849      	ld.w      	r2, (r14, 0x24)
 80113e0:	648c      	cmphs      	r3, r2
 80113e2:	0807      	bt      	0x80113f0	// 80113f0 <__gtdf2+0x38>
 80113e4:	1909      	addi      	r1, r14, 36
 80113e6:	1804      	addi      	r0, r14, 16
 80113e8:	e00002b8 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 80113ec:	140e      	addi      	r14, r14, 56
 80113ee:	1492      	pop      	r4-r5, r15
 80113f0:	3000      	movi      	r0, 0
 80113f2:	2800      	subi      	r0, 1
 80113f4:	140e      	addi      	r14, r14, 56
 80113f6:	1492      	pop      	r4-r5, r15

080113f8 <__gedf2>:
 80113f8:	14d2      	push      	r4-r5, r15
 80113fa:	142e      	subi      	r14, r14, 56
 80113fc:	b800      	st.w      	r0, (r14, 0x0)
 80113fe:	b821      	st.w      	r1, (r14, 0x4)
 8011400:	6c3b      	mov      	r0, r14
 8011402:	6d47      	mov      	r5, r1
 8011404:	1904      	addi      	r1, r14, 16
 8011406:	b842      	st.w      	r2, (r14, 0x8)
 8011408:	b863      	st.w      	r3, (r14, 0xc)
 801140a:	e0000235 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801140e:	1909      	addi      	r1, r14, 36
 8011410:	1802      	addi      	r0, r14, 8
 8011412:	e0000231 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011416:	9844      	ld.w      	r2, (r14, 0x10)
 8011418:	3301      	movi      	r3, 1
 801141a:	648c      	cmphs      	r3, r2
 801141c:	080a      	bt      	0x8011430	// 8011430 <__gedf2+0x38>
 801141e:	9849      	ld.w      	r2, (r14, 0x24)
 8011420:	648c      	cmphs      	r3, r2
 8011422:	0807      	bt      	0x8011430	// 8011430 <__gedf2+0x38>
 8011424:	1909      	addi      	r1, r14, 36
 8011426:	1804      	addi      	r0, r14, 16
 8011428:	e0000298 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 801142c:	140e      	addi      	r14, r14, 56
 801142e:	1492      	pop      	r4-r5, r15
 8011430:	3000      	movi      	r0, 0
 8011432:	2800      	subi      	r0, 1
 8011434:	140e      	addi      	r14, r14, 56
 8011436:	1492      	pop      	r4-r5, r15

08011438 <__ltdf2>:
 8011438:	14d2      	push      	r4-r5, r15
 801143a:	142e      	subi      	r14, r14, 56
 801143c:	b800      	st.w      	r0, (r14, 0x0)
 801143e:	b821      	st.w      	r1, (r14, 0x4)
 8011440:	6c3b      	mov      	r0, r14
 8011442:	6d47      	mov      	r5, r1
 8011444:	1904      	addi      	r1, r14, 16
 8011446:	b863      	st.w      	r3, (r14, 0xc)
 8011448:	b842      	st.w      	r2, (r14, 0x8)
 801144a:	e0000215 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801144e:	1802      	addi      	r0, r14, 8
 8011450:	1909      	addi      	r1, r14, 36
 8011452:	e0000211 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011456:	9864      	ld.w      	r3, (r14, 0x10)
 8011458:	3001      	movi      	r0, 1
 801145a:	64c0      	cmphs      	r0, r3
 801145c:	0808      	bt      	0x801146c	// 801146c <__ltdf2+0x34>
 801145e:	9869      	ld.w      	r3, (r14, 0x24)
 8011460:	64c0      	cmphs      	r0, r3
 8011462:	0805      	bt      	0x801146c	// 801146c <__ltdf2+0x34>
 8011464:	1909      	addi      	r1, r14, 36
 8011466:	1804      	addi      	r0, r14, 16
 8011468:	e0000278 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 801146c:	140e      	addi      	r14, r14, 56
 801146e:	1492      	pop      	r4-r5, r15

08011470 <__floatsidf>:
 8011470:	14d0      	push      	r15
 8011472:	1425      	subi      	r14, r14, 20
 8011474:	3303      	movi      	r3, 3
 8011476:	b860      	st.w      	r3, (r14, 0x0)
 8011478:	487f      	lsri      	r3, r0, 31
 801147a:	b861      	st.w      	r3, (r14, 0x4)
 801147c:	e9200009 	bnez      	r0, 0x801148e	// 801148e <__floatsidf+0x1e>
 8011480:	3302      	movi      	r3, 2
 8011482:	b860      	st.w      	r3, (r14, 0x0)
 8011484:	6c3b      	mov      	r0, r14
 8011486:	e000012f 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 801148a:	1405      	addi      	r14, r14, 20
 801148c:	1490      	pop      	r15
 801148e:	e9a00008 	bhsz      	r0, 0x801149e	// 801149e <__floatsidf+0x2e>
 8011492:	ea238000 	movih      	r3, 32768
 8011496:	64c2      	cmpne      	r0, r3
 8011498:	0c1c      	bf      	0x80114d0	// 80114d0 <__floatsidf+0x60>
 801149a:	3300      	movi      	r3, 0
 801149c:	5b01      	subu      	r0, r3, r0
 801149e:	c4007c42 	ff1      	r2, r0
 80114a2:	e422001c 	addi      	r1, r2, 29
 80114a6:	ea0c001f 	movi      	r12, 31
 80114aa:	2a02      	subi      	r2, 3
 80114ac:	4861      	lsri      	r3, r0, 1
 80114ae:	6306      	subu      	r12, r1
 80114b0:	c440402d 	lsl      	r13, r0, r2
 80114b4:	3adf      	btsti      	r2, 31
 80114b6:	70f1      	lsr      	r3, r12
 80114b8:	c46d0c20 	incf      	r3, r13, 0
 80114bc:	7004      	lsl      	r0, r1
 80114be:	b864      	st.w      	r3, (r14, 0x10)
 80114c0:	3300      	movi      	r3, 0
 80114c2:	c4030c20 	incf      	r0, r3, 0
 80114c6:	333c      	movi      	r3, 60
 80114c8:	60c6      	subu      	r3, r1
 80114ca:	b803      	st.w      	r0, (r14, 0xc)
 80114cc:	b862      	st.w      	r3, (r14, 0x8)
 80114ce:	07db      	br      	0x8011484	// 8011484 <__floatsidf+0x14>
 80114d0:	3000      	movi      	r0, 0
 80114d2:	ea21c1e0 	movih      	r1, 49632
 80114d6:	07da      	br      	0x801148a	// 801148a <__floatsidf+0x1a>

080114d8 <__fixdfsi>:
 80114d8:	14d0      	push      	r15
 80114da:	1427      	subi      	r14, r14, 28
 80114dc:	b800      	st.w      	r0, (r14, 0x0)
 80114de:	b821      	st.w      	r1, (r14, 0x4)
 80114e0:	6c3b      	mov      	r0, r14
 80114e2:	1902      	addi      	r1, r14, 8
 80114e4:	e00001c8 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80114e8:	9862      	ld.w      	r3, (r14, 0x8)
 80114ea:	3202      	movi      	r2, 2
 80114ec:	64c8      	cmphs      	r2, r3
 80114ee:	082a      	bt      	0x8011542	// 8011542 <__fixdfsi+0x6a>
 80114f0:	3b44      	cmpnei      	r3, 4
 80114f2:	0c06      	bf      	0x80114fe	// 80114fe <__fixdfsi+0x26>
 80114f4:	9804      	ld.w      	r0, (r14, 0x10)
 80114f6:	e9800026 	blz      	r0, 0x8011542	// 8011542 <__fixdfsi+0x6a>
 80114fa:	383e      	cmplti      	r0, 31
 80114fc:	080a      	bt      	0x8011510	// 8011510 <__fixdfsi+0x38>
 80114fe:	9863      	ld.w      	r3, (r14, 0xc)
 8011500:	3b40      	cmpnei      	r3, 0
 8011502:	c4000500 	mvc      	r0
 8011506:	c7c05023 	bmaski      	r3, 31
 801150a:	600c      	addu      	r0, r3
 801150c:	1407      	addi      	r14, r14, 28
 801150e:	1490      	pop      	r15
 8011510:	323c      	movi      	r2, 60
 8011512:	5a21      	subu      	r1, r2, r0
 8011514:	e581101f 	subi      	r12, r1, 32
 8011518:	9866      	ld.w      	r3, (r14, 0x18)
 801151a:	321f      	movi      	r2, 31
 801151c:	c5834040 	lsr      	r0, r3, r12
 8011520:	6086      	subu      	r2, r1
 8011522:	4361      	lsli      	r3, r3, 1
 8011524:	70c8      	lsl      	r3, r2
 8011526:	9845      	ld.w      	r2, (r14, 0x14)
 8011528:	7085      	lsr      	r2, r1
 801152a:	6c8c      	or      	r2, r3
 801152c:	9863      	ld.w      	r3, (r14, 0xc)
 801152e:	c7ec2880 	btsti      	r12, 31
 8011532:	c4020c40 	inct      	r0, r2, 0
 8011536:	e903ffeb 	bez      	r3, 0x801150c	// 801150c <__fixdfsi+0x34>
 801153a:	3300      	movi      	r3, 0
 801153c:	5b01      	subu      	r0, r3, r0
 801153e:	1407      	addi      	r14, r14, 28
 8011540:	1490      	pop      	r15
 8011542:	3000      	movi      	r0, 0
 8011544:	1407      	addi      	r14, r14, 28
 8011546:	1490      	pop      	r15

08011548 <__make_dp>:
 8011548:	1421      	subi      	r14, r14, 4
 801154a:	14d0      	push      	r15
 801154c:	1425      	subi      	r14, r14, 20
 801154e:	b866      	st.w      	r3, (r14, 0x18)
 8011550:	d98e2006 	ld.w      	r12, (r14, 0x18)
 8011554:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 8011558:	b800      	st.w      	r0, (r14, 0x0)
 801155a:	6c3b      	mov      	r0, r14
 801155c:	b821      	st.w      	r1, (r14, 0x4)
 801155e:	b842      	st.w      	r2, (r14, 0x8)
 8011560:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8011564:	ddae2004 	st.w      	r13, (r14, 0x10)
 8011568:	e00000be 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 801156c:	1405      	addi      	r14, r14, 20
 801156e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011572:	1402      	addi      	r14, r14, 8
 8011574:	783c      	jmp      	r15
	...

08011578 <__truncdfsf2>:
 8011578:	14d0      	push      	r15
 801157a:	1427      	subi      	r14, r14, 28
 801157c:	b800      	st.w      	r0, (r14, 0x0)
 801157e:	b821      	st.w      	r1, (r14, 0x4)
 8011580:	6c3b      	mov      	r0, r14
 8011582:	1902      	addi      	r1, r14, 8
 8011584:	e0000178 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011588:	9845      	ld.w      	r2, (r14, 0x14)
 801158a:	4a3e      	lsri      	r1, r2, 30
 801158c:	9866      	ld.w      	r3, (r14, 0x18)
 801158e:	c40257a2 	zext      	r2, r2, 29, 0
 8011592:	4362      	lsli      	r3, r3, 2
 8011594:	6cc4      	or      	r3, r1
 8011596:	e9020004 	bez      	r2, 0x801159e	// 801159e <__truncdfsf2+0x26>
 801159a:	ec630001 	ori      	r3, r3, 1
 801159e:	9844      	ld.w      	r2, (r14, 0x10)
 80115a0:	9823      	ld.w      	r1, (r14, 0xc)
 80115a2:	9802      	ld.w      	r0, (r14, 0x8)
 80115a4:	e0000094 	bsr      	0x80116cc	// 80116cc <__make_fp>
 80115a8:	1407      	addi      	r14, r14, 28
 80115aa:	1490      	pop      	r15

080115ac <__floatunsidf>:
 80115ac:	14d1      	push      	r4, r15
 80115ae:	1425      	subi      	r14, r14, 20
 80115b0:	3100      	movi      	r1, 0
 80115b2:	b821      	st.w      	r1, (r14, 0x4)
 80115b4:	e9000020 	bez      	r0, 0x80115f4	// 80115f4 <__floatunsidf+0x48>
 80115b8:	c4007c42 	ff1      	r2, r0
 80115bc:	e582001c 	addi      	r12, r2, 29
 80115c0:	3303      	movi      	r3, 3
 80115c2:	ea0d001f 	movi      	r13, 31
 80115c6:	2a02      	subi      	r2, 3
 80115c8:	b860      	st.w      	r3, (r14, 0x0)
 80115ca:	6372      	subu      	r13, r12
 80115cc:	4861      	lsri      	r3, r0, 1
 80115ce:	c4404024 	lsl      	r4, r0, r2
 80115d2:	3adf      	btsti      	r2, 31
 80115d4:	70f5      	lsr      	r3, r13
 80115d6:	c4640c20 	incf      	r3, r4, 0
 80115da:	7030      	lsl      	r0, r12
 80115dc:	c4010c20 	incf      	r0, r1, 0
 80115e0:	b864      	st.w      	r3, (r14, 0x10)
 80115e2:	333c      	movi      	r3, 60
 80115e4:	b803      	st.w      	r0, (r14, 0xc)
 80115e6:	60f2      	subu      	r3, r12
 80115e8:	6c3b      	mov      	r0, r14
 80115ea:	b862      	st.w      	r3, (r14, 0x8)
 80115ec:	e000007c 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80115f0:	1405      	addi      	r14, r14, 20
 80115f2:	1491      	pop      	r4, r15
 80115f4:	3302      	movi      	r3, 2
 80115f6:	6c3b      	mov      	r0, r14
 80115f8:	b860      	st.w      	r3, (r14, 0x0)
 80115fa:	e0000075 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80115fe:	1405      	addi      	r14, r14, 20
 8011600:	1491      	pop      	r4, r15
	...

08011604 <__muldi3>:
 8011604:	14c3      	push      	r4-r6
 8011606:	c602484d 	lsri      	r13, r2, 16
 801160a:	c40055ec 	zext      	r12, r0, 15, 0
 801160e:	4890      	lsri      	r4, r0, 16
 8011610:	c40255e5 	zext      	r5, r2, 15, 0
 8011614:	c4ac8426 	mult      	r6, r12, r5
 8011618:	7d50      	mult      	r5, r4
 801161a:	7f34      	mult      	r12, r13
 801161c:	7d34      	mult      	r4, r13
 801161e:	c4ac002d 	addu      	r13, r12, r5
 8011622:	c606484c 	lsri      	r12, r6, 16
 8011626:	6334      	addu      	r12, r13
 8011628:	6570      	cmphs      	r12, r5
 801162a:	0804      	bt      	0x8011632	// 8011632 <__muldi3+0x2e>
 801162c:	ea2d0001 	movih      	r13, 1
 8011630:	6134      	addu      	r4, r13
 8011632:	c60c484d 	lsri      	r13, r12, 16
 8011636:	7cc0      	mult      	r3, r0
 8011638:	7c48      	mult      	r1, r2
 801163a:	6134      	addu      	r4, r13
 801163c:	c60c482c 	lsli      	r12, r12, 16
 8011640:	c40655e6 	zext      	r6, r6, 15, 0
 8011644:	604c      	addu      	r1, r3
 8011646:	c4cc0020 	addu      	r0, r12, r6
 801164a:	6050      	addu      	r1, r4
 801164c:	1483      	pop      	r4-r6
	...

08011650 <__unpack_f>:
 8011650:	8841      	ld.h      	r2, (r0, 0x2)
 8011652:	9060      	ld.w      	r3, (r0, 0x0)
 8011654:	c4e255c2 	zext      	r2, r2, 14, 7
 8011658:	8003      	ld.b      	r0, (r0, 0x3)
 801165a:	4807      	lsri      	r0, r0, 7
 801165c:	c40356c3 	zext      	r3, r3, 22, 0
 8011660:	b101      	st.w      	r0, (r1, 0x4)
 8011662:	e9220013 	bnez      	r2, 0x8011688	// 8011688 <__unpack_f+0x38>
 8011666:	e903001c 	bez      	r3, 0x801169e	// 801169e <__unpack_f+0x4e>
 801166a:	3203      	movi      	r2, 3
 801166c:	b140      	st.w      	r2, (r1, 0x0)
 801166e:	3200      	movi      	r2, 0
 8011670:	4367      	lsli      	r3, r3, 7
 8011672:	2a7e      	subi      	r2, 127
 8011674:	c7a0502c 	bmaski      	r12, 30
 8011678:	60cc      	addu      	r3, r3
 801167a:	64f0      	cmphs      	r12, r3
 801167c:	6c0b      	mov      	r0, r2
 801167e:	2a00      	subi      	r2, 1
 8011680:	0bfc      	bt      	0x8011678	// 8011678 <__unpack_f+0x28>
 8011682:	b102      	st.w      	r0, (r1, 0x8)
 8011684:	b163      	st.w      	r3, (r1, 0xc)
 8011686:	783c      	jmp      	r15
 8011688:	eb4200ff 	cmpnei      	r2, 255
 801168c:	0c0c      	bf      	0x80116a4	// 80116a4 <__unpack_f+0x54>
 801168e:	2a7e      	subi      	r2, 127
 8011690:	4367      	lsli      	r3, r3, 7
 8011692:	b142      	st.w      	r2, (r1, 0x8)
 8011694:	3bbe      	bseti      	r3, 30
 8011696:	3203      	movi      	r2, 3
 8011698:	b140      	st.w      	r2, (r1, 0x0)
 801169a:	b163      	st.w      	r3, (r1, 0xc)
 801169c:	783c      	jmp      	r15
 801169e:	3302      	movi      	r3, 2
 80116a0:	b160      	st.w      	r3, (r1, 0x0)
 80116a2:	783c      	jmp      	r15
 80116a4:	e903000f 	bez      	r3, 0x80116c2	// 80116c2 <__unpack_f+0x72>
 80116a8:	ea220040 	movih      	r2, 64
 80116ac:	688c      	and      	r2, r3
 80116ae:	3a40      	cmpnei      	r2, 0
 80116b0:	3001      	movi      	r0, 1
 80116b2:	c4400c40 	inct      	r2, r0, 0
 80116b6:	b140      	st.w      	r2, (r1, 0x0)
 80116b8:	4367      	lsli      	r3, r3, 7
 80116ba:	1044      	lrw      	r2, 0xdfffff80	// 80116c8 <__unpack_f+0x78>
 80116bc:	68c8      	and      	r3, r2
 80116be:	b163      	st.w      	r3, (r1, 0xc)
 80116c0:	07ee      	br      	0x801169c	// 801169c <__unpack_f+0x4c>
 80116c2:	3304      	movi      	r3, 4
 80116c4:	b160      	st.w      	r3, (r1, 0x0)
 80116c6:	07eb      	br      	0x801169c	// 801169c <__unpack_f+0x4c>
 80116c8:	dfffff80 	.long	0xdfffff80

080116cc <__make_fp>:
 80116cc:	14d0      	push      	r15
 80116ce:	1424      	subi      	r14, r14, 16
 80116d0:	b800      	st.w      	r0, (r14, 0x0)
 80116d2:	6c3b      	mov      	r0, r14
 80116d4:	b821      	st.w      	r1, (r14, 0x4)
 80116d6:	b842      	st.w      	r2, (r14, 0x8)
 80116d8:	b863      	st.w      	r3, (r14, 0xc)
 80116da:	e00001a1 	bsr      	0x8011a1c	// 8011a1c <__pack_f>
 80116de:	1404      	addi      	r14, r14, 16
 80116e0:	1490      	pop      	r15
	...

080116e4 <__pack_d>:
 80116e4:	14c5      	push      	r4-r8
 80116e6:	9020      	ld.w      	r1, (r0, 0x0)
 80116e8:	3901      	cmphsi      	r1, 2
 80116ea:	9043      	ld.w      	r2, (r0, 0xc)
 80116ec:	9064      	ld.w      	r3, (r0, 0x10)
 80116ee:	d9a02001 	ld.w      	r13, (r0, 0x4)
 80116f2:	0c47      	bf      	0x8011780	// 8011780 <__pack_d+0x9c>
 80116f4:	3944      	cmpnei      	r1, 4
 80116f6:	0c40      	bf      	0x8011776	// 8011776 <__pack_d+0x92>
 80116f8:	3942      	cmpnei      	r1, 2
 80116fa:	0c28      	bf      	0x801174a	// 801174a <__pack_d+0x66>
 80116fc:	c4622421 	or      	r1, r2, r3
 8011700:	e9010025 	bez      	r1, 0x801174a	// 801174a <__pack_d+0x66>
 8011704:	9022      	ld.w      	r1, (r0, 0x8)
 8011706:	ea0003fd 	movi      	r0, 1021
 801170a:	6c02      	nor      	r0, r0
 801170c:	6405      	cmplt      	r1, r0
 801170e:	0855      	bt      	0x80117b8	// 80117b8 <__pack_d+0xd4>
 8011710:	eb2103ff 	cmplti      	r1, 1024
 8011714:	0c31      	bf      	0x8011776	// 8011776 <__pack_d+0x92>
 8011716:	e40220ff 	andi      	r0, r2, 255
 801171a:	eb400080 	cmpnei      	r0, 128
 801171e:	0c43      	bf      	0x80117a4	// 80117a4 <__pack_d+0xc0>
 8011720:	347f      	movi      	r4, 127
 8011722:	3500      	movi      	r5, 0
 8011724:	6489      	cmplt      	r2, r2
 8011726:	6091      	addc      	r2, r4
 8011728:	60d5      	addc      	r3, r5
 801172a:	c7805020 	bmaski      	r0, 29
 801172e:	64c0      	cmphs      	r0, r3
 8011730:	0c19      	bf      	0x8011762	// 8011762 <__pack_d+0x7e>
 8011732:	e58103fe 	addi      	r12, r1, 1023
 8011736:	4b28      	lsri      	r1, r3, 8
 8011738:	4398      	lsli      	r4, r3, 24
 801173a:	4a08      	lsri      	r0, r2, 8
 801173c:	c4015663 	zext      	r3, r1, 19, 0
 8011740:	6c4f      	mov      	r1, r3
 8011742:	6c10      	or      	r0, r4
 8011744:	e46c27ff 	andi      	r3, r12, 2047
 8011748:	0404      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 801174a:	3300      	movi      	r3, 0
 801174c:	3000      	movi      	r0, 0
 801174e:	3100      	movi      	r1, 0
 8011750:	3200      	movi      	r2, 0
 8011752:	c4415e60 	ins      	r2, r1, 19, 0
 8011756:	c4435d54 	ins      	r2, r3, 30, 20
 801175a:	c44d5c1f 	ins      	r2, r13, 31, 31
 801175e:	6c4b      	mov      	r1, r2
 8011760:	1485      	pop      	r4-r8
 8011762:	439f      	lsli      	r4, r3, 31
 8011764:	c422484c 	lsri      	r12, r2, 1
 8011768:	4b01      	lsri      	r0, r3, 1
 801176a:	c5842422 	or      	r2, r4, r12
 801176e:	6cc3      	mov      	r3, r0
 8011770:	e58103ff 	addi      	r12, r1, 1024
 8011774:	07e1      	br      	0x8011736	// 8011736 <__pack_d+0x52>
 8011776:	ea0307ff 	movi      	r3, 2047
 801177a:	3000      	movi      	r0, 0
 801177c:	3100      	movi      	r1, 0
 801177e:	07e9      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 8011780:	c703482c 	lsli      	r12, r3, 24
 8011784:	4a48      	lsri      	r2, r2, 8
 8011786:	c44c2420 	or      	r0, r12, r2
 801178a:	c5035741 	zext      	r1, r3, 26, 8
 801178e:	3200      	movi      	r2, 0
 8011790:	ea230008 	movih      	r3, 8
 8011794:	6c08      	or      	r0, r2
 8011796:	6c4c      	or      	r1, r3
 8011798:	c4015663 	zext      	r3, r1, 19, 0
 801179c:	6c4f      	mov      	r1, r3
 801179e:	ea0307ff 	movi      	r3, 2047
 80117a2:	07d7      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 80117a4:	e4022100 	andi      	r0, r2, 256
 80117a8:	e900ffc1 	bez      	r0, 0x801172a	// 801172a <__pack_d+0x46>
 80117ac:	3480      	movi      	r4, 128
 80117ae:	3500      	movi      	r5, 0
 80117b0:	6489      	cmplt      	r2, r2
 80117b2:	6091      	addc      	r2, r4
 80117b4:	60d5      	addc      	r3, r5
 80117b6:	07ba      	br      	0x801172a	// 801172a <__pack_d+0x46>
 80117b8:	5825      	subu      	r1, r0, r1
 80117ba:	eb210038 	cmplti      	r1, 57
 80117be:	0fc6      	bf      	0x801174a	// 801174a <__pack_d+0x66>
 80117c0:	341f      	movi      	r4, 31
 80117c2:	c423482c 	lsli      	r12, r3, 1
 80117c6:	6106      	subu      	r4, r1
 80117c8:	e401101f 	subi      	r0, r1, 32
 80117cc:	7310      	lsl      	r12, r4
 80117ce:	c4224046 	lsr      	r6, r2, r1
 80117d2:	38df      	btsti      	r0, 31
 80117d4:	c4034045 	lsr      	r5, r3, r0
 80117d8:	ea080000 	movi      	r8, 0
 80117dc:	6db0      	or      	r6, r12
 80117de:	ea0c0001 	movi      	r12, 1
 80117e2:	c4c50c20 	incf      	r6, r5, 0
 80117e6:	c40c4020 	lsl      	r0, r12, r0
 80117ea:	6d63      	mov      	r5, r8
 80117ec:	c42c4024 	lsl      	r4, r12, r1
 80117f0:	c4234047 	lsr      	r7, r3, r1
 80117f4:	c4a00c20 	incf      	r5, r0, 0
 80117f8:	c4880c20 	incf      	r4, r8, 0
 80117fc:	c4e80c20 	incf      	r7, r8, 0
 8011800:	3c40      	cmpnei      	r4, 0
 8011802:	c4a50c81 	decf      	r5, r5, 1
 8011806:	2c00      	subi      	r4, 1
 8011808:	6890      	and      	r2, r4
 801180a:	68d4      	and      	r3, r5
 801180c:	6c8c      	or      	r2, r3
 801180e:	3a40      	cmpnei      	r2, 0
 8011810:	c4000502 	mvc      	r2
 8011814:	6ce3      	mov      	r3, r8
 8011816:	6d88      	or      	r6, r2
 8011818:	6dcc      	or      	r7, r3
 801181a:	e46620ff 	andi      	r3, r6, 255
 801181e:	eb430080 	cmpnei      	r3, 128
 8011822:	0814      	bt      	0x801184a	// 801184a <__pack_d+0x166>
 8011824:	e4662100 	andi      	r3, r6, 256
 8011828:	e9230023 	bnez      	r3, 0x801186e	// 801186e <__pack_d+0x18a>
 801182c:	4758      	lsli      	r2, r7, 24
 801182e:	4f28      	lsri      	r1, r7, 8
 8011830:	4e08      	lsri      	r0, r6, 8
 8011832:	6c08      	or      	r0, r2
 8011834:	c4015662 	zext      	r2, r1, 19, 0
 8011838:	6c4b      	mov      	r1, r2
 801183a:	c7605022 	bmaski      	r2, 28
 801183e:	65c8      	cmphs      	r2, r7
 8011840:	0c02      	bf      	0x8011844	// 8011844 <__pack_d+0x160>
 8011842:	6f0f      	mov      	r12, r3
 8011844:	e46c2001 	andi      	r3, r12, 1
 8011848:	0784      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 801184a:	327f      	movi      	r2, 127
 801184c:	3300      	movi      	r3, 0
 801184e:	6599      	cmplt      	r6, r6
 8011850:	6189      	addc      	r6, r2
 8011852:	61cd      	addc      	r7, r3
 8011854:	4778      	lsli      	r3, r7, 24
 8011856:	4f28      	lsri      	r1, r7, 8
 8011858:	4e08      	lsri      	r0, r6, 8
 801185a:	6c0c      	or      	r0, r3
 801185c:	c4015663 	zext      	r3, r1, 19, 0
 8011860:	6c4f      	mov      	r1, r3
 8011862:	c7605023 	bmaski      	r3, 28
 8011866:	65cc      	cmphs      	r3, r7
 8011868:	0fee      	bf      	0x8011844	// 8011844 <__pack_d+0x160>
 801186a:	6f23      	mov      	r12, r8
 801186c:	07ec      	br      	0x8011844	// 8011844 <__pack_d+0x160>
 801186e:	3280      	movi      	r2, 128
 8011870:	07ee      	br      	0x801184c	// 801184c <__pack_d+0x168>
	...

08011874 <__unpack_d>:
 8011874:	1421      	subi      	r14, r14, 4
 8011876:	dd6e2000 	st.w      	r11, (r14, 0x0)
 801187a:	8863      	ld.h      	r3, (r0, 0x6)
 801187c:	8047      	ld.b      	r2, (r0, 0x7)
 801187e:	c48355c3 	zext      	r3, r3, 14, 4
 8011882:	d9802001 	ld.w      	r12, (r0, 0x4)
 8011886:	4a47      	lsri      	r2, r2, 7
 8011888:	d9a02000 	ld.w      	r13, (r0, 0x0)
 801188c:	c40c566c 	zext      	r12, r12, 19, 0
 8011890:	b141      	st.w      	r2, (r1, 0x4)
 8011892:	e9230025 	bnez      	r3, 0x80118dc	// 80118dc <__unpack_d+0x68>
 8011896:	c58d2423 	or      	r3, r13, r12
 801189a:	e903003c 	bez      	r3, 0x8011912	// 8011912 <__unpack_d+0x9e>
 801189e:	c70d4840 	lsri      	r0, r13, 24
 80118a2:	c50c4823 	lsli      	r3, r12, 8
 80118a6:	6cc0      	or      	r3, r0
 80118a8:	3003      	movi      	r0, 3
 80118aa:	c50d4822 	lsli      	r2, r13, 8
 80118ae:	b100      	st.w      	r0, (r1, 0x0)
 80118b0:	c760502d 	bmaski      	r13, 28
 80118b4:	ea0003fe 	movi      	r0, 1022
 80118b8:	6c02      	nor      	r0, r0
 80118ba:	6ecb      	mov      	r11, r2
 80118bc:	6f0f      	mov      	r12, r3
 80118be:	6489      	cmplt      	r2, r2
 80118c0:	60ad      	addc      	r2, r11
 80118c2:	60f1      	addc      	r3, r12
 80118c4:	64f4      	cmphs      	r13, r3
 80118c6:	6f03      	mov      	r12, r0
 80118c8:	2800      	subi      	r0, 1
 80118ca:	0bf8      	bt      	0x80118ba	// 80118ba <__unpack_d+0x46>
 80118cc:	dd812002 	st.w      	r12, (r1, 0x8)
 80118d0:	b143      	st.w      	r2, (r1, 0xc)
 80118d2:	b164      	st.w      	r3, (r1, 0x10)
 80118d4:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80118d8:	1401      	addi      	r14, r14, 4
 80118da:	783c      	jmp      	r15
 80118dc:	eb4307ff 	cmpnei      	r3, 2047
 80118e0:	0c1f      	bf      	0x801191e	// 801191e <__unpack_d+0xaa>
 80118e2:	e46313fe 	subi      	r3, r3, 1023
 80118e6:	b162      	st.w      	r3, (r1, 0x8)
 80118e8:	3303      	movi      	r3, 3
 80118ea:	c70d4840 	lsri      	r0, r13, 24
 80118ee:	b160      	st.w      	r3, (r1, 0x0)
 80118f0:	c50c4823 	lsli      	r3, r12, 8
 80118f4:	c50d4822 	lsli      	r2, r13, 8
 80118f8:	6cc0      	or      	r3, r0
 80118fa:	ea0c0000 	movi      	r12, 0
 80118fe:	ea2d1000 	movih      	r13, 4096
 8011902:	6cb0      	or      	r2, r12
 8011904:	6cf4      	or      	r3, r13
 8011906:	b143      	st.w      	r2, (r1, 0xc)
 8011908:	b164      	st.w      	r3, (r1, 0x10)
 801190a:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801190e:	1401      	addi      	r14, r14, 4
 8011910:	783c      	jmp      	r15
 8011912:	3302      	movi      	r3, 2
 8011914:	b160      	st.w      	r3, (r1, 0x0)
 8011916:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801191a:	1401      	addi      	r14, r14, 4
 801191c:	783c      	jmp      	r15
 801191e:	c58d2423 	or      	r3, r13, r12
 8011922:	e9030018 	bez      	r3, 0x8011952	// 8011952 <__unpack_d+0xde>
 8011926:	ea230008 	movih      	r3, 8
 801192a:	68f0      	and      	r3, r12
 801192c:	3b40      	cmpnei      	r3, 0
 801192e:	3201      	movi      	r2, 1
 8011930:	c4620c40 	inct      	r3, r2, 0
 8011934:	b160      	st.w      	r3, (r1, 0x0)
 8011936:	c50c482c 	lsli      	r12, r12, 8
 801193a:	c70d4843 	lsri      	r3, r13, 24
 801193e:	6f0c      	or      	r12, r3
 8011940:	c50d482d 	lsli      	r13, r13, 8
 8011944:	c76c282c 	bclri      	r12, r12, 27
 8011948:	dda12003 	st.w      	r13, (r1, 0xc)
 801194c:	dd812004 	st.w      	r12, (r1, 0x10)
 8011950:	07dd      	br      	0x801190a	// 801190a <__unpack_d+0x96>
 8011952:	3304      	movi      	r3, 4
 8011954:	b160      	st.w      	r3, (r1, 0x0)
 8011956:	07da      	br      	0x801190a	// 801190a <__unpack_d+0x96>

08011958 <__fpcmp_parts_d>:
 8011958:	9040      	ld.w      	r2, (r0, 0x0)
 801195a:	3301      	movi      	r3, 1
 801195c:	648c      	cmphs      	r3, r2
 801195e:	0830      	bt      	0x80119be	// 80119be <__fpcmp_parts_d+0x66>
 8011960:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011964:	670c      	cmphs      	r3, r12
 8011966:	082c      	bt      	0x80119be	// 80119be <__fpcmp_parts_d+0x66>
 8011968:	3a44      	cmpnei      	r2, 4
 801196a:	0c1f      	bf      	0x80119a8	// 80119a8 <__fpcmp_parts_d+0x50>
 801196c:	eb4c0004 	cmpnei      	r12, 4
 8011970:	0c14      	bf      	0x8011998	// 8011998 <__fpcmp_parts_d+0x40>
 8011972:	3a42      	cmpnei      	r2, 2
 8011974:	0c0f      	bf      	0x8011992	// 8011992 <__fpcmp_parts_d+0x3a>
 8011976:	eb4c0002 	cmpnei      	r12, 2
 801197a:	0c1a      	bf      	0x80119ae	// 80119ae <__fpcmp_parts_d+0x56>
 801197c:	9041      	ld.w      	r2, (r0, 0x4)
 801197e:	d9812001 	ld.w      	r12, (r1, 0x4)
 8011982:	670a      	cmpne      	r2, r12
 8011984:	0c1f      	bf      	0x80119c2	// 80119c2 <__fpcmp_parts_d+0x6a>
 8011986:	3000      	movi      	r0, 0
 8011988:	2800      	subi      	r0, 1
 801198a:	3a40      	cmpnei      	r2, 0
 801198c:	c4030c20 	incf      	r0, r3, 0
 8011990:	783c      	jmp      	r15
 8011992:	eb4c0002 	cmpnei      	r12, 2
 8011996:	0c2a      	bf      	0x80119ea	// 80119ea <__fpcmp_parts_d+0x92>
 8011998:	9141      	ld.w      	r2, (r1, 0x4)
 801199a:	3300      	movi      	r3, 0
 801199c:	2b00      	subi      	r3, 1
 801199e:	3a40      	cmpnei      	r2, 0
 80119a0:	3001      	movi      	r0, 1
 80119a2:	c4030c20 	incf      	r0, r3, 0
 80119a6:	783c      	jmp      	r15
 80119a8:	eb4c0004 	cmpnei      	r12, 4
 80119ac:	0c21      	bf      	0x80119ee	// 80119ee <__fpcmp_parts_d+0x96>
 80119ae:	9061      	ld.w      	r3, (r0, 0x4)
 80119b0:	3000      	movi      	r0, 0
 80119b2:	3b40      	cmpnei      	r3, 0
 80119b4:	2800      	subi      	r0, 1
 80119b6:	3301      	movi      	r3, 1
 80119b8:	c4030c20 	incf      	r0, r3, 0
 80119bc:	783c      	jmp      	r15
 80119be:	6c0f      	mov      	r0, r3
 80119c0:	783c      	jmp      	r15
 80119c2:	d9a02002 	ld.w      	r13, (r0, 0x8)
 80119c6:	d9812002 	ld.w      	r12, (r1, 0x8)
 80119ca:	6771      	cmplt      	r12, r13
 80119cc:	0bdd      	bt      	0x8011986	// 8011986 <__fpcmp_parts_d+0x2e>
 80119ce:	6735      	cmplt      	r13, r12
 80119d0:	0c13      	bf      	0x80119f6	// 80119f6 <__fpcmp_parts_d+0x9e>
 80119d2:	3000      	movi      	r0, 0
 80119d4:	2800      	subi      	r0, 1
 80119d6:	3a40      	cmpnei      	r2, 0
 80119d8:	c4030c40 	inct      	r0, r3, 0
 80119dc:	07da      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119de:	644c      	cmphs      	r3, r1
 80119e0:	0fdd      	bf      	0x801199a	// 801199a <__fpcmp_parts_d+0x42>
 80119e2:	64c6      	cmpne      	r1, r3
 80119e4:	0803      	bt      	0x80119ea	// 80119ea <__fpcmp_parts_d+0x92>
 80119e6:	6430      	cmphs      	r12, r0
 80119e8:	0fd9      	bf      	0x801199a	// 801199a <__fpcmp_parts_d+0x42>
 80119ea:	3000      	movi      	r0, 0
 80119ec:	07d2      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119ee:	9161      	ld.w      	r3, (r1, 0x4)
 80119f0:	9001      	ld.w      	r0, (r0, 0x4)
 80119f2:	5b01      	subu      	r0, r3, r0
 80119f4:	07ce      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119f6:	9064      	ld.w      	r3, (r0, 0x10)
 80119f8:	d9802003 	ld.w      	r12, (r0, 0xc)
 80119fc:	9103      	ld.w      	r0, (r1, 0xc)
 80119fe:	9124      	ld.w      	r1, (r1, 0x10)
 8011a00:	64c4      	cmphs      	r1, r3
 8011a02:	0c05      	bf      	0x8011a0c	// 8011a0c <__fpcmp_parts_d+0xb4>
 8011a04:	644e      	cmpne      	r3, r1
 8011a06:	0bec      	bt      	0x80119de	// 80119de <__fpcmp_parts_d+0x86>
 8011a08:	6700      	cmphs      	r0, r12
 8011a0a:	0bea      	bt      	0x80119de	// 80119de <__fpcmp_parts_d+0x86>
 8011a0c:	3000      	movi      	r0, 0
 8011a0e:	2800      	subi      	r0, 1
 8011a10:	3a40      	cmpnei      	r2, 0
 8011a12:	3301      	movi      	r3, 1
 8011a14:	c4030c20 	incf      	r0, r3, 0
 8011a18:	07bc      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
	...

08011a1c <__pack_f>:
 8011a1c:	9040      	ld.w      	r2, (r0, 0x0)
 8011a1e:	3a01      	cmphsi      	r2, 2
 8011a20:	9063      	ld.w      	r3, (r0, 0xc)
 8011a22:	9021      	ld.w      	r1, (r0, 0x4)
 8011a24:	0c2b      	bf      	0x8011a7a	// 8011a7a <__pack_f+0x5e>
 8011a26:	3a44      	cmpnei      	r2, 4
 8011a28:	0c23      	bf      	0x8011a6e	// 8011a6e <__pack_f+0x52>
 8011a2a:	3a42      	cmpnei      	r2, 2
 8011a2c:	0c24      	bf      	0x8011a74	// 8011a74 <__pack_f+0x58>
 8011a2e:	e9030021 	bez      	r3, 0x8011a70	// 8011a70 <__pack_f+0x54>
 8011a32:	9042      	ld.w      	r2, (r0, 0x8)
 8011a34:	3000      	movi      	r0, 0
 8011a36:	287d      	subi      	r0, 126
 8011a38:	6409      	cmplt      	r2, r0
 8011a3a:	082f      	bt      	0x8011a98	// 8011a98 <__pack_f+0x7c>
 8011a3c:	eb22007f 	cmplti      	r2, 128
 8011a40:	0c17      	bf      	0x8011a6e	// 8011a6e <__pack_f+0x52>
 8011a42:	e403207f 	andi      	r0, r3, 127
 8011a46:	eb400040 	cmpnei      	r0, 64
 8011a4a:	0c1e      	bf      	0x8011a86	// 8011a86 <__pack_f+0x6a>
 8011a4c:	233e      	addi      	r3, 63
 8011a4e:	e9830022 	blz      	r3, 0x8011a92	// 8011a92 <__pack_f+0x76>
 8011a52:	227e      	addi      	r2, 127
 8011a54:	c4e357a0 	zext      	r0, r3, 29, 7
 8011a58:	74c8      	zextb      	r3, r2
 8011a5a:	3200      	movi      	r2, 0
 8011a5c:	c4405ec0 	ins      	r2, r0, 22, 0
 8011a60:	c4435cf7 	ins      	r2, r3, 30, 23
 8011a64:	c4415c1f 	ins      	r2, r1, 31, 31
 8011a68:	f4021b60 	fmtvrl      	fr0, r2
 8011a6c:	783c      	jmp      	r15
 8011a6e:	33ff      	movi      	r3, 255
 8011a70:	3000      	movi      	r0, 0
 8011a72:	07f4      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a74:	3300      	movi      	r3, 0
 8011a76:	6c0f      	mov      	r0, r3
 8011a78:	07f1      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a7a:	c4e35783 	zext      	r3, r3, 28, 7
 8011a7e:	c6c32840 	bseti      	r0, r3, 22
 8011a82:	33ff      	movi      	r3, 255
 8011a84:	07eb      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a86:	e4032080 	andi      	r0, r3, 128
 8011a8a:	e900ffe2 	bez      	r0, 0x8011a4e	// 8011a4e <__pack_f+0x32>
 8011a8e:	233f      	addi      	r3, 64
 8011a90:	07df      	br      	0x8011a4e	// 8011a4e <__pack_f+0x32>
 8011a92:	4b61      	lsri      	r3, r3, 1
 8011a94:	227f      	addi      	r2, 128
 8011a96:	07df      	br      	0x8011a54	// 8011a54 <__pack_f+0x38>
 8011a98:	5849      	subu      	r2, r0, r2
 8011a9a:	3a39      	cmplti      	r2, 26
 8011a9c:	0fec      	bf      	0x8011a74	// 8011a74 <__pack_f+0x58>
 8011a9e:	3001      	movi      	r0, 1
 8011aa0:	c443404c 	lsr      	r12, r3, r2
 8011aa4:	c4404022 	lsl      	r2, r0, r2
 8011aa8:	2a00      	subi      	r2, 1
 8011aaa:	68c8      	and      	r3, r2
 8011aac:	3b40      	cmpnei      	r3, 0
 8011aae:	c4000503 	mvc      	r3
 8011ab2:	6cf0      	or      	r3, r12
 8011ab4:	e443207f 	andi      	r2, r3, 127
 8011ab8:	eb420040 	cmpnei      	r2, 64
 8011abc:	080e      	bt      	0x8011ad8	// 8011ad8 <__pack_f+0xbc>
 8011abe:	e4432080 	andi      	r2, r3, 128
 8011ac2:	e9020003 	bez      	r2, 0x8011ac8	// 8011ac8 <__pack_f+0xac>
 8011ac6:	233f      	addi      	r3, 64
 8011ac8:	c7a05022 	bmaski      	r2, 30
 8011acc:	64c8      	cmphs      	r2, r3
 8011ace:	6483      	mvcv      	r2
 8011ad0:	c4e357a0 	zext      	r0, r3, 29, 7
 8011ad4:	74c8      	zextb      	r3, r2
 8011ad6:	07c2      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011ad8:	233e      	addi      	r3, 63
 8011ada:	07f7      	br      	0x8011ac8	// 8011ac8 <__pack_f+0xac>

08011adc <__GI_putchar>:
 8011adc:	14d0      	push      	r15
 8011ade:	1063      	lrw      	r3, 0x20000120	// 8011ae8 <__GI_putchar+0xc>
 8011ae0:	9320      	ld.w      	r1, (r3, 0x0)
 8011ae2:	e000003f 	bsr      	0x8011b60	// 8011b60 <__GI_putc>
 8011ae6:	1490      	pop      	r15
 8011ae8:	20000120 	.long	0x20000120

08011aec <__GI_puts>:
 8011aec:	14d1      	push      	r4, r15
 8011aee:	1085      	lrw      	r4, 0x20000120	// 8011b00 <__GI_puts+0x14>
 8011af0:	9420      	ld.w      	r1, (r4, 0x0)
 8011af2:	e0000009 	bsr      	0x8011b04	// 8011b04 <__GI_fputs>
 8011af6:	9420      	ld.w      	r1, (r4, 0x0)
 8011af8:	300a      	movi      	r0, 10
 8011afa:	e00035eb 	bsr      	0x80186d0	// 80186d0 <fputc>
 8011afe:	1491      	pop      	r4, r15
 8011b00:	20000120 	.long	0x20000120

08011b04 <__GI_fputs>:
 8011b04:	14d5      	push      	r4-r8, r15
 8011b06:	6d03      	mov      	r4, r0
 8011b08:	6d87      	mov      	r6, r1
 8011b0a:	e9010018 	bez      	r1, 0x8011b3a	// 8011b3a <__GI_fputs+0x36>
 8011b0e:	e5010017 	addi      	r8, r1, 24
 8011b12:	6c23      	mov      	r0, r8
 8011b14:	e0000020 	bsr      	0x8011b54	// 8011b54 <__GI_os_critical_enter>
 8011b18:	8400      	ld.b      	r0, (r4, 0x0)
 8011b1a:	e9000014 	bez      	r0, 0x8011b42	// 8011b42 <__GI_fputs+0x3e>
 8011b1e:	3500      	movi      	r5, 0
 8011b20:	6dd7      	mov      	r7, r5
 8011b22:	2f00      	subi      	r7, 1
 8011b24:	0406      	br      	0x8011b30	// 8011b30 <__GI_fputs+0x2c>
 8011b26:	2400      	addi      	r4, 1
 8011b28:	8400      	ld.b      	r0, (r4, 0x0)
 8011b2a:	2500      	addi      	r5, 1
 8011b2c:	e900000c 	bez      	r0, 0x8011b44	// 8011b44 <__GI_fputs+0x40>
 8011b30:	6c5b      	mov      	r1, r6
 8011b32:	e00035cf 	bsr      	0x80186d0	// 80186d0 <fputc>
 8011b36:	65c2      	cmpne      	r0, r7
 8011b38:	0bf7      	bt      	0x8011b26	// 8011b26 <__GI_fputs+0x22>
 8011b3a:	3500      	movi      	r5, 0
 8011b3c:	2d00      	subi      	r5, 1
 8011b3e:	6c17      	mov      	r0, r5
 8011b40:	1495      	pop      	r4-r8, r15
 8011b42:	6d43      	mov      	r5, r0
 8011b44:	6c23      	mov      	r0, r8
 8011b46:	e0000009 	bsr      	0x8011b58	// 8011b58 <__GI_os_critical_exit>
 8011b4a:	6c17      	mov      	r0, r5
 8011b4c:	1495      	pop      	r4-r8, r15
	...

08011b50 <__GI_os_critical_open>:
 8011b50:	3000      	movi      	r0, 0
 8011b52:	783c      	jmp      	r15

08011b54 <__GI_os_critical_enter>:
 8011b54:	3000      	movi      	r0, 0
 8011b56:	783c      	jmp      	r15

08011b58 <__GI_os_critical_exit>:
 8011b58:	3000      	movi      	r0, 0
 8011b5a:	783c      	jmp      	r15

08011b5c <__GI_os_critical_close>:
 8011b5c:	3000      	movi      	r0, 0
 8011b5e:	783c      	jmp      	r15

08011b60 <__GI_putc>:
 8011b60:	14d0      	push      	r15
 8011b62:	e00035b7 	bsr      	0x80186d0	// 80186d0 <fputc>
 8011b66:	1490      	pop      	r15

08011b68 <HAL_GPIO_Init>:
    
    assert_param(IS_GPIO_ALL_INSTANCE(GPIOx));
    assert_param(IS_GPIO_PIN(GPIO_Init->Pin));
    assert_param(IS_GPIO_MODE(GPIO_Init->Mode));

    while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011b68:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011b6c:	e90c0044 	bez      	r12, 0x8011bf4	// 8011bf4 <HAL_GPIO_Init+0x8c>
 8011b70:	3200      	movi      	r2, 0
    {
        ioposition = (0x01 << position);
 8011b72:	ea140001 	movi      	r20, 1
            {
                    SET_BIT(GPIOx->PULLUP_EN, ioposition);
                    SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
            }
            
            switch (GPIO_Init->Mode)
 8011b76:	ea96001f 	lrw      	r22, 0x8018924	// 8011bf0 <HAL_GPIO_Init+0x88>
 8011b7a:	0406      	br      	0x8011b86	// 8011b86 <HAL_GPIO_Init+0x1e>
            {
                SET_BIT(GPIOx->IE, ioposition);
            }
        }
        
        position++;
 8011b7c:	2200      	addi      	r2, 1
    while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011b7e:	c44c4043 	lsr      	r3, r12, r2
 8011b82:	e9030039 	bez      	r3, 0x8011bf4	// 8011bf4 <HAL_GPIO_Init+0x8c>
        ioposition = (0x01 << position);
 8011b86:	c4544023 	lsl      	r3, r20, r2
        iocurrent = (uint32_t)(GPIO_Init->Pin) & ioposition;
 8011b8a:	c583202d 	and      	r13, r3, r12
        if (iocurrent == ioposition)
 8011b8e:	674e      	cmpne      	r3, r13
 8011b90:	0bf6      	bt      	0x8011b7c	// 8011b7c <HAL_GPIO_Init+0x14>
            switch (GPIO_Init->Mode)
 8011b92:	da612001 	ld.w      	r19, (r1, 0x4)
            __AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8011b96:	da402004 	ld.w      	r18, (r0, 0x10)
 8011b9a:	c463248d 	nor      	r13, r3, r3
            switch (GPIO_Init->Mode)
 8011b9e:	eb530002 	cmpnei      	r19, 2
            __AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8011ba2:	c5b22032 	and      	r18, r18, r13
 8011ba6:	de402004 	st.w      	r18, (r0, 0x10)
            switch (GPIO_Init->Mode)
 8011baa:	0c44      	bf      	0x8011c32	// 8011c32 <HAL_GPIO_Init+0xca>
 8011bac:	eb130002 	cmphsi      	r19, 3
 8011bb0:	0823      	bt      	0x8011bf6	// 8011bf6 <HAL_GPIO_Init+0x8e>
 8011bb2:	eb530001 	cmpnei      	r19, 1
 8011bb6:	08a3      	bt      	0x8011cfc	// 8011cfc <HAL_GPIO_Init+0x194>
 8011bb8:	ea120000 	movi      	r18, 0
 8011bbc:	e6521085 	subi      	r18, r18, 134
                    CLEAR_BIT(GPIOx->DIR, ioposition);
 8011bc0:	daa02002 	ld.w      	r21, (r0, 0x8)
 8011bc4:	c6ad2035 	and      	r21, r13, r21
 8011bc8:	dea02002 	st.w      	r21, (r0, 0x8)
            if (GPIO_Init->Pull == GPIO_NOPULL)
 8011bcc:	daa12002 	ld.w      	r21, (r1, 0x8)
 8011bd0:	eb550012 	cmpnei      	r21, 18
 8011bd4:	0c1b      	bf      	0x8011c0a	// 8011c0a <HAL_GPIO_Init+0xa2>
            else if (GPIO_Init->Pull == GPIO_PULLUP)
 8011bd6:	eb550013 	cmpnei      	r21, 19
 8011bda:	0c37      	bf      	0x8011c48	// 8011c48 <HAL_GPIO_Init+0xe0>
            else if(GPIO_Init->Pull == GPIO_PULLDOWN)
 8011bdc:	eb550014 	cmpnei      	r21, 20
 8011be0:	0c91      	bf      	0x8011d02	// 8011d02 <HAL_GPIO_Init+0x19a>
            switch (GPIO_Init->Mode)
 8011be2:	eb120004 	cmphsi      	r18, 5
 8011be6:	0821      	bt      	0x8011c28	// 8011c28 <HAL_GPIO_Init+0xc0>
 8011be8:	d2560892 	ldr.w      	r18, (r22, r18 << 2)
 8011bec:	e8d20000 	jmp      	r18
 8011bf0:	08018924 	.long	0x08018924
    }
}
 8011bf4:	783c      	jmp      	r15
            switch (GPIO_Init->Mode)
 8011bf6:	e6531086 	subi      	r18, r19, 135
 8011bfa:	eb120004 	cmphsi      	r18, 5
 8011bfe:	0fe1      	bf      	0x8011bc0	// 8011bc0 <HAL_GPIO_Init+0x58>
            if (GPIO_Init->Pull == GPIO_NOPULL)
 8011c00:	daa12002 	ld.w      	r21, (r1, 0x8)
 8011c04:	eb550012 	cmpnei      	r21, 18
 8011c08:	0be7      	bt      	0x8011bd6	// 8011bd6 <HAL_GPIO_Init+0x6e>
                    SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011c0a:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011c0e:	c6a32435 	or      	r21, r3, r21
 8011c12:	dea02003 	st.w      	r21, (r0, 0xc)
                    CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011c16:	daa02007 	ld.w      	r21, (r0, 0x1c)
            switch (GPIO_Init->Mode)
 8011c1a:	eb120004 	cmphsi      	r18, 5
                    CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011c1e:	c6ad2035 	and      	r21, r13, r21
 8011c22:	dea02007 	st.w      	r21, (r0, 0x1c)
            switch (GPIO_Init->Mode)
 8011c26:	0fe1      	bf      	0x8011be8	// 8011be8 <HAL_GPIO_Init+0x80>
            if ((GPIO_Init->Mode & EXTI_MODE) == EXTI_MODE)
 8011c28:	e6732080 	andi      	r19, r19, 128
 8011c2c:	e913ffa8 	bez      	r19, 0x8011b7c	// 8011b7c <HAL_GPIO_Init+0x14>
 8011c30:	0423      	br      	0x8011c76	// 8011c76 <HAL_GPIO_Init+0x10e>
                    SET_BIT(GPIOx->DIR, ioposition);
 8011c32:	da402002 	ld.w      	r18, (r0, 0x8)
 8011c36:	c6432432 	or      	r18, r3, r18
 8011c3a:	de402002 	st.w      	r18, (r0, 0x8)
 8011c3e:	ea120000 	movi      	r18, 0
 8011c42:	e6521084 	subi      	r18, r18, 133
                    break;
 8011c46:	07c3      	br      	0x8011bcc	// 8011bcc <HAL_GPIO_Init+0x64>
                    CLEAR_BIT(GPIOx->PULLUP_EN, ioposition);
 8011c48:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011c4c:	c6ad2035 	and      	r21, r13, r21
 8011c50:	dea02003 	st.w      	r21, (r0, 0xc)
                    CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011c54:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011c58:	c6ad2035 	and      	r21, r13, r21
 8011c5c:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011c60:	07c1      	br      	0x8011be2	// 8011be2 <HAL_GPIO_Init+0x7a>
                    SET_BIT(GPIOx->IS, ioposition);
 8011c62:	d9a02008 	ld.w      	r13, (r0, 0x20)
 8011c66:	6f4c      	or      	r13, r3
 8011c68:	dda02008 	st.w      	r13, (r0, 0x20)
                    SET_BIT(GPIOx->IEV, ioposition);
 8011c6c:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011c70:	6f4c      	or      	r13, r3
 8011c72:	dda0200a 	st.w      	r13, (r0, 0x28)
                SET_BIT(GPIOx->IE, ioposition);
 8011c76:	d9a0200b 	ld.w      	r13, (r0, 0x2c)
 8011c7a:	6cf4      	or      	r3, r13
 8011c7c:	b06b      	st.w      	r3, (r0, 0x2c)
 8011c7e:	077f      	br      	0x8011b7c	// 8011b7c <HAL_GPIO_Init+0x14>
                    CLEAR_BIT(GPIOx->IS, ioposition);
 8011c80:	da402008 	ld.w      	r18, (r0, 0x20)
 8011c84:	c64d202d 	and      	r13, r13, r18
 8011c88:	dda02008 	st.w      	r13, (r0, 0x20)
                    SET_BIT(GPIOx->IBE, ioposition);
 8011c8c:	d9a02009 	ld.w      	r13, (r0, 0x24)
 8011c90:	6f4c      	or      	r13, r3
 8011c92:	dda02009 	st.w      	r13, (r0, 0x24)
                    break;
 8011c96:	07f0      	br      	0x8011c76	// 8011c76 <HAL_GPIO_Init+0x10e>
                    CLEAR_BIT(GPIOx->IS, ioposition);
 8011c98:	da402008 	ld.w      	r18, (r0, 0x20)
 8011c9c:	c64d2032 	and      	r18, r13, r18
 8011ca0:	de402008 	st.w      	r18, (r0, 0x20)
                    CLEAR_BIT(GPIOx->IBE, ioposition);
 8011ca4:	da402009 	ld.w      	r18, (r0, 0x24)
 8011ca8:	c64d2032 	and      	r18, r13, r18
 8011cac:	de402009 	st.w      	r18, (r0, 0x24)
                    CLEAR_BIT(GPIOx->IEV, ioposition);
 8011cb0:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011cb4:	c64d202d 	and      	r13, r13, r18
 8011cb8:	dda0200a 	st.w      	r13, (r0, 0x28)
                    break;
 8011cbc:	07dd      	br      	0x8011c76	// 8011c76 <HAL_GPIO_Init+0x10e>
                    CLEAR_BIT(GPIOx->IS, ioposition);
 8011cbe:	da402008 	ld.w      	r18, (r0, 0x20)
 8011cc2:	c64d2032 	and      	r18, r13, r18
 8011cc6:	de402008 	st.w      	r18, (r0, 0x20)
                    CLEAR_BIT(GPIOx->IBE, ioposition);
 8011cca:	da402009 	ld.w      	r18, (r0, 0x24)
 8011cce:	c64d202d 	and      	r13, r13, r18
 8011cd2:	dda02009 	st.w      	r13, (r0, 0x24)
                    SET_BIT(GPIOx->IEV, ioposition);
 8011cd6:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011cda:	6f4c      	or      	r13, r3
 8011cdc:	dda0200a 	st.w      	r13, (r0, 0x28)
                    break;
 8011ce0:	07cb      	br      	0x8011c76	// 8011c76 <HAL_GPIO_Init+0x10e>
                    SET_BIT(GPIOx->IS, ioposition);
 8011ce2:	da402008 	ld.w      	r18, (r0, 0x20)
 8011ce6:	c6432432 	or      	r18, r3, r18
 8011cea:	de402008 	st.w      	r18, (r0, 0x20)
                    CLEAR_BIT(GPIOx->IEV, ioposition);
 8011cee:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011cf2:	c64d202d 	and      	r13, r13, r18
 8011cf6:	dda0200a 	st.w      	r13, (r0, 0x28)
                    break;
 8011cfa:	07be      	br      	0x8011c76	// 8011c76 <HAL_GPIO_Init+0x10e>
 8011cfc:	e6531086 	subi      	r18, r19, 135
 8011d00:	0766      	br      	0x8011bcc	// 8011bcc <HAL_GPIO_Init+0x64>
                    SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011d02:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011d06:	c6a32435 	or      	r21, r3, r21
 8011d0a:	dea02003 	st.w      	r21, (r0, 0xc)
                    SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011d0e:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011d12:	c6a32435 	or      	r21, r3, r21
 8011d16:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011d1a:	0764      	br      	0x8011be2	// 8011be2 <HAL_GPIO_Init+0x7a>

08011d1c <HAL_GPIO_WritePin>:
    uint32_t data_en;
    
    assert_param(IS_GPIO_PIN(GPIO_Pin));
    assert_param(IS_GPIO_PIN_ACTION(PinState));

    data_en = READ_REG(GPIOx->DATA_B_EN);
 8011d1c:	d9802001 	ld.w      	r12, (r0, 0x4)
    SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011d20:	9061      	ld.w      	r3, (r0, 0x4)
 8011d22:	6cc4      	or      	r3, r1
 8011d24:	b061      	st.w      	r3, (r0, 0x4)
    if (PinState != GPIO_PIN_RESET)
    {
        SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011d26:	9060      	ld.w      	r3, (r0, 0x0)
    if (PinState != GPIO_PIN_RESET)
 8011d28:	e9220008 	bnez      	r2, 0x8011d38	// 8011d38 <HAL_GPIO_WritePin+0x1c>
    }
    else
    {
        CLEAR_BIT(GPIOx->DATA, GPIO_Pin);
 8011d2c:	c4232041 	andn      	r1, r3, r1
 8011d30:	b020      	st.w      	r1, (r0, 0x0)
    }
    WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011d32:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011d36:	783c      	jmp      	r15
        SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011d38:	6c4c      	or      	r1, r3
 8011d3a:	b020      	st.w      	r1, (r0, 0x0)
    WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011d3c:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011d40:	783c      	jmp      	r15
	...

08011d44 <SystemClock_Get>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
    clk_div_reg clk_div;

    clk_div.w = READ_REG(RCC->CLK_DIV);
 8011d44:	ea234000 	movih      	r3, 16384
 8011d48:	e4630dff 	addi      	r3, r3, 3584
    sysclk->cpuclk = W806_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011d4c:	ea0101e0 	movi      	r1, 480
    clk_div.w = READ_REG(RCC->CLK_DIV);
 8011d50:	9344      	ld.w      	r2, (r3, 0x10)
    sysclk->cpuclk = W806_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011d52:	74c8      	zextb      	r3, r2
 8011d54:	c4618043 	divs      	r3, r1, r3
    sysclk->wlanclk = W806_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011d58:	c50255ec 	zext      	r12, r2, 15, 8
    sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011d5c:	c60256e2 	zext      	r2, r2, 23, 16
    sysclk->cpuclk = W806_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011d60:	b061      	st.w      	r3, (r0, 0x4)
    sysclk->wlanclk = W806_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011d62:	c5818041 	divs      	r1, r1, r12
    sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011d66:	c4438023 	divu      	r3, r3, r2
    sysclk->wlanclk = W806_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011d6a:	b022      	st.w      	r1, (r0, 0x8)
    sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011d6c:	b060      	st.w      	r3, (r0, 0x0)
}
 8011d6e:	783c      	jmp      	r15

08011d70 <HAL_InitTick>:
    clk_div.w = READ_REG(RCC->CLK_DIV);
 8011d70:	ea234000 	movih      	r3, 16384
 8011d74:	e4630dff 	addi      	r3, r3, 3584


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 8011d78:	6f03      	mov      	r12, r0
    clk_div.w = READ_REG(RCC->CLK_DIV);
 8011d7a:	9364      	ld.w      	r3, (r3, 0x10)
    sysclk->cpuclk = W806_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011d7c:	748c      	zextb      	r2, r3
 8011d7e:	ea0301e0 	movi      	r3, 480
 8011d82:	c4438043 	divs      	r3, r3, r2
    wm_sys_clk sysclk;
    
    SystemClock_Get(&sysclk);
    SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 8011d86:	ea02f424 	movi      	r2, 62500
 8011d8a:	c4824902 	rotli      	r2, r2, 4
 8011d8e:	7cc8      	mult      	r3, r2
 8011d90:	ea0203e8 	movi      	r2, 1000
 8011d94:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011d98:	104f      	lrw      	r2, 0xe000e010	// 8011dd4 <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8011d9a:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011d9c:	b261      	st.w      	r3, (r2, 0x4)
    clk_div.w = READ_REG(RCC->CLK_DIV);
 8011d9e:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011da0:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8011da2:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011da4:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011da6:	104d      	lrw      	r2, 0xe000e100	// 8011dd8 <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011da8:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011dac:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8011db0:	ea0dff00 	movi      	r13, 65280
 8011db4:	6f76      	nor      	r13, r13
 8011db6:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011db8:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011dbc:	6cc4      	or      	r3, r1
 8011dbe:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011dc2:	ea230200 	movih      	r3, 512
 8011dc6:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011dc8:	dc622050 	st.w      	r3, (r2, 0x140)
    HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
    HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
    uwTickPrio = TickPriority;
 8011dcc:	1064      	lrw      	r3, 0x20001880	// 8011ddc <HAL_InitTick+0x6c>
 8011dce:	dd832000 	st.w      	r12, (r3, 0x0)
    return HAL_OK;
}
 8011dd2:	783c      	jmp      	r15
 8011dd4:	e000e010 	.long	0xe000e010
 8011dd8:	e000e100 	.long	0xe000e100
 8011ddc:	20001880 	.long	0x20001880

08011de0 <SystemClock_Config>:
{
 8011de0:	14d0      	push      	r15
    if ((clk < 2) || (clk > 240))
 8011de2:	5867      	subi      	r3, r0, 2
 8011de4:	eb0300ee 	cmphsi      	r3, 239
 8011de8:	0826      	bt      	0x8011e34	// 8011e34 <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 8011dea:	ea224000 	movih      	r2, 16384
 8011dee:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011df2:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8011df6:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8011df8:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8011dfa:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011dfe:	b260      	st.w      	r3, (r2, 0x0)
    WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011e00:	330f      	movi      	r3, 15
 8011e02:	b262      	st.w      	r3, (r2, 0x8)
    RegValue = READ_REG(RCC->CLK_DIV);
 8011e04:	9264      	ld.w      	r3, (r2, 0x10)
    RegValue &= 0xFF000000;
 8011e06:	ea22ff00 	movih      	r2, 65280
 8011e0a:	68c8      	and      	r3, r2
    if(cpuDiv > 12)
 8011e0c:	320c      	movi      	r2, 12
 8011e0e:	6408      	cmphs      	r2, r0
    RegValue |= 0x80000000;
 8011e10:	3bbf      	bseti      	r3, 31
    if(cpuDiv > 12)
 8011e12:	0c12      	bf      	0x8011e36	// 8011e36 <SystemClock_Config+0x56>
        bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011e14:	c4028022 	divu      	r2, r2, r0
 8011e18:	4250      	lsli      	r2, r2, 16
 8011e1a:	ea010300 	movi      	r1, 768
 8011e1e:	6c0c      	or      	r0, r3
 8011e20:	6c08      	or      	r0, r2
    WRITE_REG(RCC->CLK_DIV, RegValue);
 8011e22:	ea234000 	movih      	r3, 16384
 8011e26:	e4630dff 	addi      	r3, r3, 3584
    RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8011e2a:	6c04      	or      	r0, r1
    WRITE_REG(RCC->CLK_DIV, RegValue);
 8011e2c:	b304      	st.w      	r0, (r3, 0x10)
    HAL_InitTick(TICK_INT_PRIORITY);
 8011e2e:	3007      	movi      	r0, 7
 8011e30:	e3ffffa0 	bsr      	0x8011d70	// 8011d70 <HAL_InitTick>
}
 8011e34:	1490      	pop      	r15
        wlanDiv = cpuDiv/4;
 8011e36:	4822      	lsri      	r1, r0, 2
 8011e38:	4128      	lsli      	r1, r1, 8
 8011e3a:	ea220001 	movih      	r2, 1
 8011e3e:	07f0      	br      	0x8011e1e	// 8011e1e <SystemClock_Config+0x3e>

08011e40 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
    uwTick += 1;
 8011e40:	1043      	lrw      	r2, 0x2000187c	// 8011e4c <HAL_IncTick+0xc>
 8011e42:	9260      	ld.w      	r3, (r2, 0x0)
 8011e44:	2300      	addi      	r3, 1
 8011e46:	b260      	st.w      	r3, (r2, 0x0)
}
 8011e48:	783c      	jmp      	r15
 8011e4a:	0000      	.short	0x0000
 8011e4c:	2000187c 	.long	0x2000187c

08011e50 <HAL_GetTick>:

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
    return uwTick;
 8011e50:	1062      	lrw      	r3, 0x2000187c	// 8011e58 <HAL_GetTick+0x8>
 8011e52:	9300      	ld.w      	r0, (r3, 0x0)
}
 8011e54:	783c      	jmp      	r15
 8011e56:	0000      	.short	0x0000
 8011e58:	2000187c 	.long	0x2000187c

08011e5c <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 8011e5c:	14d2      	push      	r4-r5, r15
 8011e5e:	6d43      	mov      	r5, r0
    uint32_t tickstart = HAL_GetTick();
 8011e60:	e3fffff8 	bsr      	0x8011e50	// 8011e50 <HAL_GetTick>
 8011e64:	6d03      	mov      	r4, r0
    uint32_t wait = Delay;

    while ((HAL_GetTick() - tickstart) < wait)
 8011e66:	e3fffff5 	bsr      	0x8011e50	// 8011e50 <HAL_GetTick>
 8011e6a:	6012      	subu      	r0, r4
 8011e6c:	6540      	cmphs      	r0, r5
 8011e6e:	0ffc      	bf      	0x8011e66	// 8011e66 <HAL_Delay+0xa>
    {
    }
}
 8011e70:	1492      	pop      	r4-r5, r15
	...

08011e74 <HAL_NVIC_SetPriority>:

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8011e74:	c4002822 	bclri      	r2, r0, 0
 8011e78:	3a81      	bclri      	r2, 1
 8011e7a:	106b      	lrw      	r3, 0xe000e100	// 8011ea4 <HAL_NVIC_SetPriority+0x30>
 8011e7c:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011e7e:	e4002003 	andi      	r0, r0, 3
 8011e82:	4003      	lsli      	r0, r0, 3
 8011e84:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011e86:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011e88:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8011e8c:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011e8e:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011e92:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011e96:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011e9a:	6cc0      	or      	r3, r0
 8011e9c:	dc6220c0 	st.w      	r3, (r2, 0x300)
    NVIC_SetPriority(IRQn, Priority);
}
 8011ea0:	783c      	jmp      	r15
 8011ea2:	0000      	.short	0x0000
 8011ea4:	e000e100 	.long	0xe000e100

08011ea8 <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011ea8:	e440201f 	andi      	r2, r0, 31
 8011eac:	3301      	movi      	r3, 1
 8011eae:	c4a054c0 	zext      	r0, r0, 6, 5
 8011eb2:	70c8      	lsl      	r3, r2
 8011eb4:	4002      	lsli      	r0, r0, 2
 8011eb6:	1044      	lrw      	r2, 0xe000e100	// 8011ec4 <HAL_NVIC_EnableIRQ+0x1c>
 8011eb8:	6008      	addu      	r0, r2
 8011eba:	b060      	st.w      	r3, (r0, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011ebc:	dc602050 	st.w      	r3, (r0, 0x140)
    /* Check the parameters */
    assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

    /* Enable interrupt */
    NVIC_EnableIRQ(IRQn);
}
 8011ec0:	783c      	jmp      	r15
 8011ec2:	0000      	.short	0x0000
 8011ec4:	e000e100 	.long	0xe000e100

08011ec8 <HAL_SPI_MspInit>:
 8011ec8:	783c      	jmp      	r15
	...

08011ecc <HAL_SPI_Init>:
  * @param  hspi pointer to a SPI_HandleTypeDef structure that contains
  *               the configuration information for SPI module.
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_SPI_Init(SPI_HandleTypeDef *hspi)
{
 8011ecc:	14d1      	push      	r4, r15
 8011ece:	6d03      	mov      	r4, r0
    if (hspi == NULL)
 8011ed0:	e9000026 	bez      	r0, 0x8011f1c	// 8011f1c <HAL_SPI_Init+0x50>
    assert_param(IS_SPI_BAUDRATE_PRESCALER(hspi->Init.BaudRatePrescaler));
    assert_param(IS_SPI_CPOL(hspi->Init.CLKPolarity));
    assert_param(IS_SPI_CPHA(hspi->Init.CLKPhase));
    assert_param(IS_SPI_BIG_OR_LITTLE(hspi->Init.FirstByte));

    if (hspi->State == HAL_SPI_STATE_RESET)
 8011ed4:	9070      	ld.w      	r3, (r0, 0x40)
 8011ed6:	e903001f 	bez      	r3, 0x8011f14	// 8011f14 <HAL_SPI_Init+0x48>
    {
        hspi->Lock = HAL_UNLOCKED;
        HAL_SPI_MspInit(hspi);
    }
    hspi->State = HAL_SPI_STATE_BUSY;
 8011eda:	3302      	movi      	r3, 2
 8011edc:	b470      	st.w      	r3, (r4, 0x40)

    __HAL_SPI_DISABLE_TXRX(hspi);
 8011ede:	9460      	ld.w      	r3, (r4, 0x0)

    WRITE_REG(hspi->Instance->CH_CFG, (hspi->Init.NSS | SPI_CH_CFG_CLEARFIFOS));
    WRITE_REG(hspi->Instance->SPI_CFG, (hspi->Init.Mode | hspi->Init.CLKPolarity | hspi->Init.CLKPhase | hspi->Init.FirstByte));
 8011ee0:	9422      	ld.w      	r1, (r4, 0x8)
    __HAL_SPI_DISABLE_TXRX(hspi);
 8011ee2:	9340      	ld.w      	r2, (r3, 0x0)
 8011ee4:	3a93      	bclri      	r2, 19
 8011ee6:	3a94      	bclri      	r2, 20
 8011ee8:	b340      	st.w      	r2, (r3, 0x0)
    WRITE_REG(hspi->Instance->CH_CFG, (hspi->Init.NSS | SPI_CH_CFG_CLEARFIFOS));
 8011eea:	9444      	ld.w      	r2, (r4, 0x10)
 8011eec:	3ab6      	bseti      	r2, 22
 8011eee:	b340      	st.w      	r2, (r3, 0x0)
    WRITE_REG(hspi->Instance->SPI_CFG, (hspi->Init.Mode | hspi->Init.CLKPolarity | hspi->Init.CLKPhase | hspi->Init.FirstByte));
 8011ef0:	9441      	ld.w      	r2, (r4, 0x4)
 8011ef2:	6c84      	or      	r2, r1
 8011ef4:	9423      	ld.w      	r1, (r4, 0xc)
 8011ef6:	6c84      	or      	r2, r1
 8011ef8:	9426      	ld.w      	r1, (r4, 0x18)
 8011efa:	6c84      	or      	r2, r1
 8011efc:	b341      	st.w      	r2, (r3, 0x4)
    WRITE_REG(hspi->Instance->CLK_CFG, hspi->Init.BaudRatePrescaler);
 8011efe:	9445      	ld.w      	r2, (r4, 0x14)
 8011f00:	b342      	st.w      	r2, (r3, 0x8)

    __HAL_SPI_SET_CS_HIGH(hspi);
 8011f02:	9340      	ld.w      	r2, (r3, 0x0)
 8011f04:	ec420004 	ori      	r2, r2, 4
 8011f08:	b340      	st.w      	r2, (r3, 0x0)

    hspi->ErrorCode = HAL_SPI_ERROR_NONE;
 8011f0a:	3000      	movi      	r0, 0
    hspi->State     = HAL_SPI_STATE_READY;
 8011f0c:	3301      	movi      	r3, 1
    hspi->ErrorCode = HAL_SPI_ERROR_NONE;
 8011f0e:	b411      	st.w      	r0, (r4, 0x44)
    hspi->State     = HAL_SPI_STATE_READY;
 8011f10:	b470      	st.w      	r3, (r4, 0x40)

    return HAL_OK;
}
 8011f12:	1491      	pop      	r4, r15
        hspi->Lock = HAL_UNLOCKED;
 8011f14:	b06f      	st.w      	r3, (r0, 0x3c)
        HAL_SPI_MspInit(hspi);
 8011f16:	e3ffffd9 	bsr      	0x8011ec8	// 8011ec8 <HAL_SPI_MspInit>
 8011f1a:	07e0      	br      	0x8011eda	// 8011eda <HAL_SPI_Init+0xe>
        return HAL_ERROR;
 8011f1c:	3001      	movi      	r0, 1
}
 8011f1e:	1491      	pop      	r4, r15

08011f20 <HAL_SPI_Transmit>:
  * @param  Size amount of data to be sent
  * @param  Timeout Timeout duration
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_SPI_Transmit(SPI_HandleTypeDef *hspi, const uint8_t *pData, uint32_t Size, uint32_t Timeout)
{
 8011f20:	ebe00058 	push      	r4-r11, r15, r16-r17
 8011f24:	6ecf      	mov      	r11, r3
    uint32_t tickstart, data = 0, i = 0;
    HAL_StatusTypeDef errorcode = HAL_OK;
    uint32_t fifo_count = 0, block_cnt = 0, tx_block_cnt = 0, tx_size = 0;
    
    __HAL_LOCK(hspi);
 8011f26:	906f      	ld.w      	r3, (r0, 0x3c)
 8011f28:	3b41      	cmpnei      	r3, 1
{
 8011f2a:	c4004830 	lsli      	r16, r0, 0
    __HAL_LOCK(hspi);
 8011f2e:	0804      	bt      	0x8011f36	// 8011f36 <HAL_SPI_Transmit+0x16>
 8011f30:	3002      	movi      	r0, 2
    __HAL_SPI_DISABLE_TX(hspi);
    hspi->State = HAL_SPI_STATE_READY;
    
    __HAL_UNLOCK(hspi);
    return errorcode;
}
 8011f32:	ebc00058 	pop      	r4-r11, r15, r16-r17
    __HAL_LOCK(hspi);
 8011f36:	3301      	movi      	r3, 1
 8011f38:	b06f      	st.w      	r3, (r0, 0x3c)
 8011f3a:	6d4b      	mov      	r5, r2
 8011f3c:	6d07      	mov      	r4, r1
    tickstart = HAL_GetTick();
 8011f3e:	e3ffff89 	bsr      	0x8011e50	// 8011e50 <HAL_GetTick>
    if (hspi->State != HAL_SPI_STATE_READY)
 8011f42:	d8702010 	ld.w      	r3, (r16, 0x40)
 8011f46:	3b41      	cmpnei      	r3, 1
    tickstart = HAL_GetTick();
 8011f48:	6dc3      	mov      	r7, r0
 8011f4a:	d9b02000 	ld.w      	r13, (r16, 0x0)
    if (hspi->State != HAL_SPI_STATE_READY)
 8011f4e:	6c53      	mov      	r1, r4
 8011f50:	6c97      	mov      	r2, r5
 8011f52:	0c0f      	bf      	0x8011f70	// 8011f70 <HAL_SPI_Transmit+0x50>
        errorcode = HAL_BUSY;
 8011f54:	3002      	movi      	r0, 2
    __HAL_SPI_DISABLE_TX(hspi);
 8011f56:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8011f5a:	3b93      	bclri      	r3, 19
 8011f5c:	dc6d2000 	st.w      	r3, (r13, 0x0)
    hspi->State = HAL_SPI_STATE_READY;
 8011f60:	3301      	movi      	r3, 1
 8011f62:	dc702010 	st.w      	r3, (r16, 0x40)
    __HAL_UNLOCK(hspi);
 8011f66:	3300      	movi      	r3, 0
 8011f68:	dc70200f 	st.w      	r3, (r16, 0x3c)
}
 8011f6c:	ebc00058 	pop      	r4-r11, r15, r16-r17
    if ((pData == NULL) || (Size == 0U))
 8011f70:	e9040099 	bez      	r4, 0x80120a2	// 80120a2 <HAL_SPI_Transmit+0x182>
 8011f74:	e9050097 	bez      	r5, 0x80120a2	// 80120a2 <HAL_SPI_Transmit+0x182>
    __HAL_SPI_CLEAR_FIFO(hspi);
 8011f78:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8011f7c:	3bb6      	bseti      	r3, 22
 8011f7e:	dc6d2000 	st.w      	r3, (r13, 0x0)
 8011f82:	ea230040 	movih      	r3, 64
 8011f86:	d88d2000 	ld.w      	r4, (r13, 0x0)
 8011f8a:	690c      	and      	r4, r3
 8011f8c:	e924fffd 	bnez      	r4, 0x8011f86	// 8011f86 <HAL_SPI_Transmit+0x66>
    __HAL_SPI_ENABLE_TX(hspi);
 8011f90:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8011f94:	3bb3      	bseti      	r3, 19
 8011f96:	dc6d2000 	st.w      	r3, (r13, 0x0)
    hspi->State       = HAL_SPI_STATE_BUSY_TX;
 8011f9a:	3303      	movi      	r3, 3
 8011f9c:	dc702010 	st.w      	r3, (r16, 0x40)
    block_cnt = Size / BLOCK_SIZE;
 8011fa0:	ea031ff8 	movi      	r3, 8184
 8011fa4:	c4628029 	divu      	r9, r2, r3
            tx_size = Size % BLOCK_SIZE;
 8011fa8:	7ce4      	mult      	r3, r9
 8011faa:	5acd      	subu      	r6, r2, r3
    hspi->ErrorCode   = HAL_SPI_ERROR_NONE;
 8011fac:	dc902011 	st.w      	r4, (r16, 0x44)
    hspi->pRxBuffPtr  = (uint8_t *)NULL;
 8011fb0:	dc90200a 	st.w      	r4, (r16, 0x28)
    hspi->RxXferSize  = 0U;
 8011fb4:	dc90200b 	st.w      	r4, (r16, 0x2c)
    hspi->RxXferCount = 0U;
 8011fb8:	dc90200c 	st.w      	r4, (r16, 0x30)
 8011fbc:	c4c6482a 	lsli      	r10, r6, 6
 8011fc0:	6d47      	mov      	r5, r1
                for (i = 0; i < hspi->TxXferCount; i++)
 8011fc2:	ea110002 	movi      	r17, 2
        if (tx_block_cnt < block_cnt)
 8011fc6:	6650      	cmphs      	r4, r9
 8011fc8:	ea230008 	movih      	r3, 8
 8011fcc:	e46311ff 	subi      	r3, r3, 512
 8011fd0:	c46a0c40 	inct      	r3, r10, 0
 8011fd4:	6c8f      	mov      	r2, r3
 8011fd6:	6650      	cmphs      	r4, r9
 8011fd8:	ea031ff8 	movi      	r3, 8184
 8011fdc:	c4660c40 	inct      	r3, r6, 0
        hspi->TxXferCount = tx_size;
 8011fe0:	dc702009 	st.w      	r3, (r16, 0x24)
        hspi->TxXferSize  = tx_size;
 8011fe4:	dc702008 	st.w      	r3, (r16, 0x20)
        __HAL_SPI_SET_CLK_NUM(hspi, tx_size * 8);
 8011fe8:	ea01ffff 	movi      	r1, 65535
 8011fec:	c6614901 	rotli      	r1, r1, 19
 8011ff0:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8011ff4:	68c4      	and      	r3, r1
 8011ff6:	6cc8      	or      	r3, r2
        hspi->pTxBuffPtr  = (uint8_t *)(pData + (tx_block_cnt * BLOCK_SIZE));
 8011ff8:	dcb02007 	st.w      	r5, (r16, 0x1c)
        __HAL_SPI_SET_CLK_NUM(hspi, tx_size * 8);
 8011ffc:	dc6d2000 	st.w      	r3, (r13, 0x0)
        __HAL_SPI_SET_START(hspi);
 8012000:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8012004:	ec630001 	ori      	r3, r3, 1
 8012008:	dc6d2000 	st.w      	r3, (r13, 0x0)
            fifo_count = (32 - __HAL_SPI_GET_TXFIFO(hspi)) / 4;
 801200c:	ea080020 	movi      	r8, 32
        while (hspi->TxXferCount > 0U)
 8012010:	d8702009 	ld.w      	r3, (r16, 0x24)
 8012014:	e903005e 	bez      	r3, 0x80120d0	// 80120d0 <HAL_SPI_Transmit+0x1b0>
            fifo_count = (32 - __HAL_SPI_GET_TXFIFO(hspi)) / 4;
 8012018:	d98d2006 	ld.w      	r12, (r13, 0x18)
 801201c:	e58c203f 	andi      	r12, r12, 63
 8012020:	c588008c 	subu      	r12, r8, r12
 8012024:	c44c484c 	lsri      	r12, r12, 2
            while((fifo_count > 0) && (hspi->TxXferCount > 0))
 8012028:	e90c003f 	bez      	r12, 0x80120a6	// 80120a6 <HAL_SPI_Transmit+0x186>
 801202c:	d8702009 	ld.w      	r3, (r16, 0x24)
 8012030:	e903003b 	bez      	r3, 0x80120a6	// 80120a6 <HAL_SPI_Transmit+0x186>
 8012034:	d8702007 	ld.w      	r3, (r16, 0x1c)
 8012038:	042f      	br      	0x8012096	// 8012096 <HAL_SPI_Transmit+0x176>
                for (i = 0; i < hspi->TxXferCount; i++)
 801203a:	d8302009 	ld.w      	r1, (r16, 0x24)
 801203e:	3901      	cmphsi      	r1, 2
                    data |= (hspi->pTxBuffPtr[i] << ((i) * 8));
 8012040:	8340      	ld.b      	r2, (r3, 0x0)
                for (i = 0; i < hspi->TxXferCount; i++)
 8012042:	0c3f      	bf      	0x80120c0	// 80120c0 <HAL_SPI_Transmit+0x1a0>
                    data |= (hspi->pTxBuffPtr[i] << ((i) * 8));
 8012044:	8321      	ld.b      	r1, (r3, 0x1)
                for (i = 0; i < hspi->TxXferCount; i++)
 8012046:	d8102009 	ld.w      	r0, (r16, 0x24)
                    data |= (hspi->pTxBuffPtr[i] << ((i) * 8));
 801204a:	4128      	lsli      	r1, r1, 8
                for (i = 0; i < hspi->TxXferCount; i++)
 801204c:	c4110420 	cmphs      	r17, r0
                    data |= (hspi->pTxBuffPtr[i] << ((i) * 8));
 8012050:	6c48      	or      	r1, r2
 8012052:	7485      	zexth      	r2, r1
                for (i = 0; i < hspi->TxXferCount; i++)
 8012054:	0838      	bt      	0x80120c4	// 80120c4 <HAL_SPI_Transmit+0x1a4>
 8012056:	da502009 	ld.w      	r18, (r16, 0x24)
 801205a:	eb120003 	cmphsi      	r18, 4
                    data |= (hspi->pTxBuffPtr[i] << ((i) * 8));
 801205e:	8302      	ld.b      	r0, (r3, 0x2)
                for (i = 0; i < hspi->TxXferCount; i++)
 8012060:	0c34      	bf      	0x80120c8	// 80120c8 <HAL_SPI_Transmit+0x1a8>
                    data |= (hspi->pTxBuffPtr[i] << ((i) * 8));
 8012062:	4050      	lsli      	r2, r0, 16
 8012064:	6c48      	or      	r1, r2
 8012066:	8343      	ld.b      	r2, (r3, 0x3)
 8012068:	4258      	lsli      	r2, r2, 24
 801206a:	6c84      	or      	r2, r1
                for (i = 0; i < hspi->TxXferCount; i++)
 801206c:	3004      	movi      	r0, 4
 801206e:	d8302009 	ld.w      	r1, (r16, 0x24)
                hspi->TxXferCount -= i;
 8012072:	d8302009 	ld.w      	r1, (r16, 0x24)
                hspi->pTxBuffPtr += sizeof(uint8_t) * i;
 8012076:	60c0      	addu      	r3, r0
                hspi->TxXferCount -= i;
 8012078:	6042      	subu      	r1, r0
                    fifo_count--;
 801207a:	e58c1000 	subi      	r12, r12, 1
                hspi->pTxBuffPtr += sizeof(uint8_t) * i;
 801207e:	dc702007 	st.w      	r3, (r16, 0x1c)
                hspi->TxXferCount -= i;
 8012082:	dc302009 	st.w      	r1, (r16, 0x24)
                WRITE_REG(hspi->Instance->TXDATA, data );//<< 8
 8012086:	dc4d2008 	st.w      	r2, (r13, 0x20)
            while((fifo_count > 0) && (hspi->TxXferCount > 0))
 801208a:	e90c000e 	bez      	r12, 0x80120a6	// 80120a6 <HAL_SPI_Transmit+0x186>
 801208e:	d8502009 	ld.w      	r2, (r16, 0x24)
 8012092:	e902000a 	bez      	r2, 0x80120a6	// 80120a6 <HAL_SPI_Transmit+0x186>
                for (i = 0; i < hspi->TxXferCount; i++)
 8012096:	d8502009 	ld.w      	r2, (r16, 0x24)
 801209a:	e922ffd0 	bnez      	r2, 0x801203a	// 801203a <HAL_SPI_Transmit+0x11a>
 801209e:	6c0b      	mov      	r0, r2
 80120a0:	07e9      	br      	0x8012072	// 8012072 <HAL_SPI_Transmit+0x152>
        errorcode = HAL_ERROR;
 80120a2:	3001      	movi      	r0, 1
 80120a4:	0759      	br      	0x8011f56	// 8011f56 <HAL_SPI_Transmit+0x36>
            if ((((HAL_GetTick() - tickstart) >=  Timeout) && (Timeout != HAL_MAX_DELAY)) || (Timeout == 0U))
 80120a6:	e3fffed5 	bsr      	0x8011e50	// 8011e50 <HAL_GetTick>
 80120aa:	601e      	subu      	r0, r7
 80120ac:	66c0      	cmphs      	r0, r11
 80120ae:	d9b02000 	ld.w      	r13, (r16, 0x0)
 80120b2:	0faf      	bf      	0x8012010	// 8012010 <HAL_SPI_Transmit+0xf0>
 80120b4:	3300      	movi      	r3, 0
 80120b6:	2b00      	subi      	r3, 1
 80120b8:	64ee      	cmpne      	r11, r3
 80120ba:	0fab      	bf      	0x8012010	// 8012010 <HAL_SPI_Transmit+0xf0>
                errorcode = HAL_TIMEOUT;
 80120bc:	3003      	movi      	r0, 3
 80120be:	074c      	br      	0x8011f56	// 8011f56 <HAL_SPI_Transmit+0x36>
                for (i = 0; i < hspi->TxXferCount; i++)
 80120c0:	3001      	movi      	r0, 1
 80120c2:	07d8      	br      	0x8012072	// 8012072 <HAL_SPI_Transmit+0x152>
 80120c4:	3002      	movi      	r0, 2
 80120c6:	07d6      	br      	0x8012072	// 8012072 <HAL_SPI_Transmit+0x152>
                    data |= (hspi->pTxBuffPtr[i] << ((i) * 8));
 80120c8:	4010      	lsli      	r0, r0, 16
 80120ca:	6c80      	or      	r2, r0
                for (i = 0; i < hspi->TxXferCount; i++)
 80120cc:	3003      	movi      	r0, 3
 80120ce:	07d2      	br      	0x8012072	// 8012072 <HAL_SPI_Transmit+0x152>
 80120d0:	2b00      	subi      	r3, 1
 80120d2:	64ee      	cmpne      	r11, r3
 80120d4:	0c06      	bf      	0x80120e0	// 80120e0 <HAL_SPI_Transmit+0x1c0>
 80120d6:	0419      	br      	0x8012108	// 8012108 <HAL_SPI_Transmit+0x1e8>
            if ((((HAL_GetTick() - tickstart) >=  Timeout) && (Timeout != HAL_MAX_DELAY)) || (Timeout == 0U))
 80120d8:	e3fffebc 	bsr      	0x8011e50	// 8011e50 <HAL_GetTick>
 80120dc:	d9b02000 	ld.w      	r13, (r16, 0x0)
        while (__HAL_SPI_GET_FLAG(hspi, SPI_INT_SRC_DONE) != SPI_INT_SRC_DONE)
 80120e0:	d86d2005 	ld.w      	r3, (r13, 0x14)
 80120e4:	e4632040 	andi      	r3, r3, 64
 80120e8:	e903fff8 	bez      	r3, 0x80120d8	// 80120d8 <HAL_SPI_Transmit+0x1b8>
        __HAL_SPI_CLEAR_FLAG(hspi, SPI_INT_SRC_DONE);
 80120ec:	d86d2005 	ld.w      	r3, (r13, 0x14)
        tx_block_cnt++;
 80120f0:	2400      	addi      	r4, 1
        __HAL_SPI_CLEAR_FLAG(hspi, SPI_INT_SRC_DONE);
 80120f2:	ec630040 	ori      	r3, r3, 64
    while (tx_block_cnt <= block_cnt)
 80120f6:	6524      	cmphs      	r9, r4
        __HAL_SPI_CLEAR_FLAG(hspi, SPI_INT_SRC_DONE);
 80120f8:	dc6d2005 	st.w      	r3, (r13, 0x14)
 80120fc:	ea031ff8 	movi      	r3, 8184
 8012100:	614c      	addu      	r5, r3
    while (tx_block_cnt <= block_cnt)
 8012102:	0b62      	bt      	0x8011fc6	// 8011fc6 <HAL_SPI_Transmit+0xa6>
    HAL_StatusTypeDef errorcode = HAL_OK;
 8012104:	3000      	movi      	r0, 0
 8012106:	0728      	br      	0x8011f56	// 8011f56 <HAL_SPI_Transmit+0x36>
        while (__HAL_SPI_GET_FLAG(hspi, SPI_INT_SRC_DONE) != SPI_INT_SRC_DONE)
 8012108:	d86d2005 	ld.w      	r3, (r13, 0x14)
 801210c:	e4632040 	andi      	r3, r3, 64
 8012110:	e923ffee 	bnez      	r3, 0x80120ec	// 80120ec <HAL_SPI_Transmit+0x1cc>
            if ((((HAL_GetTick() - tickstart) >=  Timeout) && (Timeout != HAL_MAX_DELAY)) || (Timeout == 0U))
 8012114:	e3fffe9e 	bsr      	0x8011e50	// 8011e50 <HAL_GetTick>
 8012118:	601e      	subu      	r0, r7
 801211a:	66c0      	cmphs      	r0, r11
 801211c:	d9b02000 	ld.w      	r13, (r16, 0x0)
 8012120:	0ff4      	bf      	0x8012108	// 8012108 <HAL_SPI_Transmit+0x1e8>
 8012122:	07cd      	br      	0x80120bc	// 80120bc <HAL_SPI_Transmit+0x19c>

08012124 <HAL_I2C_MspInit>:
 8012124:	783c      	jmp      	r15
	...

08012128 <HAL_I2C_Init>:
#define I2C_FREQ_MAX            (1000000)
#define I2C_FREQ_MIN            (100000)


HAL_StatusTypeDef HAL_I2C_Init(I2C_HandleTypeDef *hi2c)
{
 8012128:	14d1      	push      	r4, r15
 801212a:	1423      	subi      	r14, r14, 12
 801212c:	6d03      	mov      	r4, r0
    if (hi2c == NULL)
 801212e:	e900003a 	bez      	r0, 0x80121a2	// 80121a2 <HAL_I2C_Init+0x7a>
    {
        return HAL_ERROR;
    }

    hi2c->Lock = HAL_UNLOCKED;
 8012132:	3300      	movi      	r3, 0
 8012134:	b062      	st.w      	r3, (r0, 0x8)
    HAL_I2C_MspInit(hi2c);
 8012136:	e3fffff7 	bsr      	0x8012124	// 8012124 <HAL_I2C_MspInit>

    wm_sys_clk sysclk;
    uint32_t div = 0;
    if (hi2c->Frequency < I2C_FREQ_MIN)
 801213a:	9461      	ld.w      	r3, (r4, 0x4)
 801213c:	ea02869f 	movi      	r2, 34463
 8012140:	3ab0      	bseti      	r2, 16
 8012142:	64c8      	cmphs      	r2, r3
 8012144:	0c27      	bf      	0x8012192	// 8012192 <HAL_I2C_Init+0x6a>
    {
        hi2c->Frequency = I2C_FREQ_MIN;
 8012146:	ea0386a0 	movi      	r3, 34464
 801214a:	3bb0      	bseti      	r3, 16
 801214c:	b461      	st.w      	r3, (r4, 0x4)
    }
    else if (hi2c->Frequency > I2C_FREQ_MAX)
    {
        hi2c->Frequency = I2C_FREQ_MAX;
    }
    SystemClock_Get(&sysclk);
 801214e:	6c3b      	mov      	r0, r14
 8012150:	e3fffdfa 	bsr      	0x8011d44	// 8011d44 <SystemClock_Get>
    div = (sysclk.apbclk * 1000000) / (5 * hi2c->Frequency) - 1;
 8012154:	9860      	ld.w      	r3, (r14, 0x0)
 8012156:	ea02f424 	movi      	r2, 62500
 801215a:	c4824902 	rotli      	r2, r2, 4
 801215e:	7cc8      	mult      	r3, r2
 8012160:	3105      	movi      	r1, 5
 8012162:	9441      	ld.w      	r2, (r4, 0x4)
 8012164:	7c84      	mult      	r2, r1
 8012166:	c4438023 	divu      	r3, r3, r2
 801216a:	2b00      	subi      	r3, 1
    WRITE_REG(hi2c->Instance->PRESCALE_L, div & 0xff);
 801216c:	9440      	ld.w      	r2, (r4, 0x0)
 801216e:	e42320ff 	andi      	r1, r3, 255
    WRITE_REG(hi2c->Instance->PRESCALE_H, (div >> 8) & 0xff);
 8012172:	c50355e3 	zext      	r3, r3, 15, 8
    WRITE_REG(hi2c->Instance->PRESCALE_L, div & 0xff);
 8012176:	b220      	st.w      	r1, (r2, 0x0)
    WRITE_REG(hi2c->Instance->PRESCALE_H, (div >> 8) & 0xff);
 8012178:	b261      	st.w      	r3, (r2, 0x4)
    WRITE_REG(hi2c->Instance->EN, I2C_EN_ENABLE | I2C_EN_IEMASK);
 801217a:	33c0      	movi      	r3, 192
 801217c:	b262      	st.w      	r3, (r2, 0x8)
    HAL_NVIC_SetPriority(I2C_IRQn, 0);
 801217e:	3100      	movi      	r1, 0
 8012180:	300a      	movi      	r0, 10
 8012182:	e3fffe79 	bsr      	0x8011e74	// 8011e74 <HAL_NVIC_SetPriority>
    HAL_NVIC_EnableIRQ(I2C_IRQn);
 8012186:	300a      	movi      	r0, 10
 8012188:	e3fffe90 	bsr      	0x8011ea8	// 8011ea8 <HAL_NVIC_EnableIRQ>
    return HAL_OK;
 801218c:	3000      	movi      	r0, 0
}
 801218e:	1403      	addi      	r14, r14, 12
 8012190:	1491      	pop      	r4, r15
    else if (hi2c->Frequency > I2C_FREQ_MAX)
 8012192:	ea02f424 	movi      	r2, 62500
 8012196:	c4824902 	rotli      	r2, r2, 4
 801219a:	64c8      	cmphs      	r2, r3
 801219c:	0bd9      	bt      	0x801214e	// 801214e <HAL_I2C_Init+0x26>
        hi2c->Frequency = I2C_FREQ_MAX;
 801219e:	b441      	st.w      	r2, (r4, 0x4)
 80121a0:	07d7      	br      	0x801214e	// 801214e <HAL_I2C_Init+0x26>
        return HAL_ERROR;
 80121a2:	3001      	movi      	r0, 1
}
 80121a4:	1403      	addi      	r14, r14, 12
 80121a6:	1491      	pop      	r4, r15

080121a8 <HAL_I2C_Write>:
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
    return READ_REG(hi2c->Instance->DATA);
}

HAL_StatusTypeDef HAL_I2C_Write(I2C_HandleTypeDef *hi2c, uint8_t DevAddress, uint8_t MemAddress, uint8_t *pData, uint16_t Size)
{
 80121a8:	14d1      	push      	r4, r15
    WRITE_REG(hi2c->Instance->DATA, dat);
 80121aa:	d9802000 	ld.w      	r12, (r0, 0x0)
 80121ae:	e42120fe 	andi      	r1, r1, 254
 80121b2:	dc2c2003 	st.w      	r1, (r12, 0xc)
        WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_START | I2C_CR_WR);
 80121b6:	3190      	movi      	r1, 144
{
 80121b8:	6d03      	mov      	r4, r0
 80121ba:	d9ae1004 	ld.h      	r13, (r14, 0x8)
        WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_START | I2C_CR_WR);
 80121be:	dc2c2004 	st.w      	r1, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 80121c2:	d82c2004 	ld.w      	r1, (r12, 0x10)
 80121c6:	e4212002 	andi      	r1, r1, 2
 80121ca:	e921fffc 	bnez      	r1, 0x80121c2	// 80121c2 <HAL_I2C_Write+0x1a>
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 80121ce:	d82c2004 	ld.w      	r1, (r12, 0x10)
 80121d2:	e4212002 	andi      	r1, r1, 2
 80121d6:	e921fffc 	bnez      	r1, 0x80121ce	// 80121ce <HAL_I2C_Write+0x26>
 80121da:	ea000201 	movi      	r0, 513
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_RXACK))
 80121de:	d82c2004 	ld.w      	r1, (r12, 0x10)
 80121e2:	e4212080 	andi      	r1, r1, 128
 80121e6:	e901001d 	bez      	r1, 0x8012220	// 8012220 <HAL_I2C_Write+0x78>
 80121ea:	e820fffa 	bnezad      	r0, 0x80121de	// 80121de <HAL_I2C_Write+0x36>
            printf("i2c ack error");
 80121ee:	111d      	lrw      	r0, 0x8018938	// 80122e0 <HAL_I2C_Write+0x138>
 80121f0:	e000327e 	bsr      	0x80186ec	// 80186ec <wm_printf>
    WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_STOP);
 80121f4:	d9842000 	ld.w      	r12, (r4, 0x0)
 80121f8:	3340      	movi      	r3, 64
 80121fa:	dc6c2004 	st.w      	r3, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 80121fe:	d86c2004 	ld.w      	r3, (r12, 0x10)
 8012202:	e4632002 	andi      	r3, r3, 2
 8012206:	e923fffc 	bnez      	r3, 0x80121fe	// 80121fe <HAL_I2C_Write+0x56>
    uint32_t i, ret = HAL_ERROR;
 801220a:	3001      	movi      	r0, 1
    WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_STOP);
 801220c:	3340      	movi      	r3, 64
 801220e:	dc6c2004 	st.w      	r3, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 8012212:	d86c2004 	ld.w      	r3, (r12, 0x10)
 8012216:	e4632002 	andi      	r3, r3, 2
 801221a:	e923fffc 	bnez      	r3, 0x8012212	// 8012212 <HAL_I2C_Write+0x6a>
    }
    ret = HAL_OK;
OUT:
    HAL_I2C_Stop(hi2c);
    return ret;
}
 801221e:	1491      	pop      	r4, r15
    WRITE_REG(hi2c->Instance->DATA, dat);
 8012220:	dc4c2003 	st.w      	r2, (r12, 0xc)
        WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_WR);
 8012224:	3210      	movi      	r2, 16
 8012226:	dc4c2004 	st.w      	r2, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 801222a:	d84c2004 	ld.w      	r2, (r12, 0x10)
 801222e:	e4422002 	andi      	r2, r2, 2
 8012232:	e922fffc 	bnez      	r2, 0x801222a	// 801222a <HAL_I2C_Write+0x82>
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 8012236:	d84c2004 	ld.w      	r2, (r12, 0x10)
 801223a:	e4422002 	andi      	r2, r2, 2
 801223e:	e922fffc 	bnez      	r2, 0x8012236	// 8012236 <HAL_I2C_Write+0x8e>
 8012242:	ea010201 	movi      	r1, 513
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_RXACK))
 8012246:	d84c2004 	ld.w      	r2, (r12, 0x10)
 801224a:	e4422080 	andi      	r2, r2, 128
 801224e:	e9020013 	bez      	r2, 0x8012274	// 8012274 <HAL_I2C_Write+0xcc>
 8012252:	e821fffa 	bnezad      	r1, 0x8012246	// 8012246 <HAL_I2C_Write+0x9e>
            printf("i2c ack error");
 8012256:	1103      	lrw      	r0, 0x8018938	// 80122e0 <HAL_I2C_Write+0x138>
 8012258:	e000324a 	bsr      	0x80186ec	// 80186ec <wm_printf>
    WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_STOP);
 801225c:	d9842000 	ld.w      	r12, (r4, 0x0)
 8012260:	3340      	movi      	r3, 64
 8012262:	dc6c2004 	st.w      	r3, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 8012266:	d86c2004 	ld.w      	r3, (r12, 0x10)
 801226a:	e4632002 	andi      	r3, r3, 2
 801226e:	e923fffc 	bnez      	r3, 0x8012266	// 8012266 <HAL_I2C_Write+0xbe>
 8012272:	07cc      	br      	0x801220a	// 801220a <HAL_I2C_Write+0x62>
    for (i = 0; i < Size; i++)
 8012274:	6c37      	mov      	r0, r13
 8012276:	e90dffcb 	bez      	r13, 0x801220c	// 801220c <HAL_I2C_Write+0x64>
 801227a:	c5a30021 	addu      	r1, r3, r13
        WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_WR);
 801227e:	ea0d0010 	movi      	r13, 16
    WRITE_REG(hi2c->Instance->DATA, dat);
 8012282:	8340      	ld.b      	r2, (r3, 0x0)
 8012284:	dc4c2003 	st.w      	r2, (r12, 0xc)
        WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_WR);
 8012288:	ddac2004 	st.w      	r13, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 801228c:	d84c2004 	ld.w      	r2, (r12, 0x10)
 8012290:	e4422002 	andi      	r2, r2, 2
 8012294:	e922fffc 	bnez      	r2, 0x801228c	// 801228c <HAL_I2C_Write+0xe4>
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 8012298:	d84c2004 	ld.w      	r2, (r12, 0x10)
 801229c:	e4422002 	andi      	r2, r2, 2
 80122a0:	e922fffc 	bnez      	r2, 0x8012298	// 8012298 <HAL_I2C_Write+0xf0>
 80122a4:	ea020201 	movi      	r2, 513
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_RXACK))
 80122a8:	d80c2004 	ld.w      	r0, (r12, 0x10)
 80122ac:	e4002080 	andi      	r0, r0, 128
 80122b0:	e9000013 	bez      	r0, 0x80122d6	// 80122d6 <HAL_I2C_Write+0x12e>
 80122b4:	e822fffa 	bnezad      	r2, 0x80122a8	// 80122a8 <HAL_I2C_Write+0x100>
            printf("i2c ack error");
 80122b8:	100a      	lrw      	r0, 0x8018938	// 80122e0 <HAL_I2C_Write+0x138>
 80122ba:	e0003219 	bsr      	0x80186ec	// 80186ec <wm_printf>
    WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_STOP);
 80122be:	d9842000 	ld.w      	r12, (r4, 0x0)
 80122c2:	3340      	movi      	r3, 64
 80122c4:	dc6c2004 	st.w      	r3, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 80122c8:	d86c2004 	ld.w      	r3, (r12, 0x10)
 80122cc:	e4632002 	andi      	r3, r3, 2
 80122d0:	e923fffc 	bnez      	r3, 0x80122c8	// 80122c8 <HAL_I2C_Write+0x120>
 80122d4:	079b      	br      	0x801220a	// 801220a <HAL_I2C_Write+0x62>
 80122d6:	2300      	addi      	r3, 1
    for (i = 0; i < Size; i++)
 80122d8:	64c6      	cmpne      	r1, r3
 80122da:	0bd4      	bt      	0x8012282	// 8012282 <HAL_I2C_Write+0xda>
 80122dc:	0798      	br      	0x801220c	// 801220c <HAL_I2C_Write+0x64>
 80122de:	0000      	.short	0x0000
 80122e0:	08018938 	.long	0x08018938

080122e4 <HAL_I2C_Read>:

HAL_StatusTypeDef HAL_I2C_Read(I2C_HandleTypeDef *hi2c, uint8_t DevAddress, uint8_t MemAddress, uint8_t *pData, uint16_t Size)
{
 80122e4:	14d1      	push      	r4, r15
    WRITE_REG(hi2c->Instance->DATA, dat);
 80122e6:	d9802000 	ld.w      	r12, (r0, 0x0)
 80122ea:	ec210001 	ori      	r1, r1, 1
        WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_START | I2C_CR_WR);
 80122ee:	3290      	movi      	r2, 144
    WRITE_REG(hi2c->Instance->DATA, dat);
 80122f0:	dc2c2003 	st.w      	r1, (r12, 0xc)
{
 80122f4:	6d03      	mov      	r4, r0
 80122f6:	d9ae1004 	ld.h      	r13, (r14, 0x8)
        WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_START | I2C_CR_WR);
 80122fa:	dc4c2004 	st.w      	r2, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 80122fe:	d84c2004 	ld.w      	r2, (r12, 0x10)
 8012302:	e4422002 	andi      	r2, r2, 2
 8012306:	e922fffc 	bnez      	r2, 0x80122fe	// 80122fe <HAL_I2C_Read+0x1a>
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 801230a:	d84c2004 	ld.w      	r2, (r12, 0x10)
 801230e:	e4422002 	andi      	r2, r2, 2
 8012312:	e922fffc 	bnez      	r2, 0x801230a	// 801230a <HAL_I2C_Read+0x26>
 8012316:	ea010201 	movi      	r1, 513
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_RXACK))
 801231a:	d84c2004 	ld.w      	r2, (r12, 0x10)
 801231e:	e4422080 	andi      	r2, r2, 128
 8012322:	e902001d 	bez      	r2, 0x801235c	// 801235c <HAL_I2C_Read+0x78>
 8012326:	e821fffa 	bnezad      	r1, 0x801231a	// 801231a <HAL_I2C_Read+0x36>
            printf("i2c ack error");
 801232a:	1101      	lrw      	r0, 0x8018938	// 80123ac <HAL_I2C_Read+0xc8>
 801232c:	e00031e0 	bsr      	0x80186ec	// 80186ec <wm_printf>
    WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_STOP);
 8012330:	d9842000 	ld.w      	r12, (r4, 0x0)
 8012334:	3340      	movi      	r3, 64
 8012336:	dc6c2004 	st.w      	r3, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 801233a:	d86c2004 	ld.w      	r3, (r12, 0x10)
 801233e:	e4632002 	andi      	r3, r3, 2
 8012342:	e923fffc 	bnez      	r3, 0x801233a	// 801233a <HAL_I2C_Read+0x56>
    uint32_t i, ret = HAL_ERROR;
 8012346:	3001      	movi      	r0, 1
    WRITE_REG(hi2c->Instance->CR_SR, I2C_CR_STOP);
 8012348:	3340      	movi      	r3, 64
 801234a:	dc6c2004 	st.w      	r3, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 801234e:	d86c2004 	ld.w      	r3, (r12, 0x10)
 8012352:	e4632002 	andi      	r3, r3, 2
 8012356:	e923fffc 	bnez      	r3, 0x801234e	// 801234e <HAL_I2C_Read+0x6a>
    }
    ret = HAL_OK;
OUT:
    HAL_I2C_Stop(hi2c);
    return ret;
}
 801235a:	1491      	pop      	r4, r15
    for (i = 0; i < Size; i++)
 801235c:	6c37      	mov      	r0, r13
 801235e:	e90dfff5 	bez      	r13, 0x8012348	// 8012348 <HAL_I2C_Read+0x64>
 8012362:	e40d1000 	subi      	r0, r13, 1
 8012366:	6c4b      	mov      	r1, r2
    WRITE_REG(hi2c->Instance->CR_SR, value);
 8012368:	ea120020 	movi      	r18, 32
 801236c:	ea130028 	movi      	r19, 40
        if (i == (Size - 1))
 8012370:	6406      	cmpne      	r1, r0
 8012372:	0c14      	bf      	0x801239a	// 801239a <HAL_I2C_Read+0xb6>
    WRITE_REG(hi2c->Instance->CR_SR, value);
 8012374:	de4c2004 	st.w      	r18, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 8012378:	d84c2004 	ld.w      	r2, (r12, 0x10)
 801237c:	e4422002 	andi      	r2, r2, 2
 8012380:	e922fffc 	bnez      	r2, 0x8012378	// 8012378 <HAL_I2C_Read+0x94>
    for (i = 0; i < Size; i++)
 8012384:	2100      	addi      	r1, 1
    return READ_REG(hi2c->Instance->DATA);
 8012386:	d84c2003 	ld.w      	r2, (r12, 0xc)
    for (i = 0; i < Size; i++)
 801238a:	6746      	cmpne      	r1, r13
    return READ_REG(hi2c->Instance->DATA);
 801238c:	a340      	st.b      	r2, (r3, 0x0)
 801238e:	d9842000 	ld.w      	r12, (r4, 0x0)
 8012392:	2300      	addi      	r3, 1
    for (i = 0; i < Size; i++)
 8012394:	0bee      	bt      	0x8012370	// 8012370 <HAL_I2C_Read+0x8c>
    ret = HAL_OK;
 8012396:	3000      	movi      	r0, 0
 8012398:	07d8      	br      	0x8012348	// 8012348 <HAL_I2C_Read+0x64>
    WRITE_REG(hi2c->Instance->CR_SR, value);
 801239a:	de6c2004 	st.w      	r19, (r12, 0x10)
    while(READ_BIT(hi2c->Instance->CR_SR, I2C_SR_TIP));
 801239e:	d84c2004 	ld.w      	r2, (r12, 0x10)
 80123a2:	e4422002 	andi      	r2, r2, 2
 80123a6:	e922fffc 	bnez      	r2, 0x801239e	// 801239e <HAL_I2C_Read+0xba>
 80123aa:	07ed      	br      	0x8012384	// 8012384 <HAL_I2C_Read+0xa0>
 80123ac:	08018938 	.long	0x08018938

080123b0 <ST7789_WriteString.constprop.5>:
 * @param font -> fontstyle of the string
 * @param color -> color of the string
 * @param bgcolor -> background color of the string
 * @return  none
 */
void ST7789_WriteString(uint16_t x, uint16_t y, const char *str, FontDef font, uint16_t color, uint16_t bgcolor)
 80123b0:	ebe00058 	push      	r4-r11, r15, r16-r17
 80123b4:	1425      	subi      	r14, r14, 20
 80123b6:	6d07      	mov      	r4, r1
 80123b8:	b801      	st.w      	r0, (r14, 0x4)
 80123ba:	7588      	zextb      	r6, r2
 80123bc:	c50255eb 	zext      	r11, r2, 15, 8
{
	ST7789_Select();
 80123c0:	ea210080 	movih      	r1, 128
 80123c4:	3200      	movi      	r2, 0
 80123c6:	021a      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
void ST7789_WriteString(uint16_t x, uint16_t y, const char *str, FontDef font, uint16_t color, uint16_t bgcolor)
 80123c8:	b862      	st.w      	r3, (r14, 0x8)
	ST7789_Select();
 80123ca:	e3fffca9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80123ce:	5c62      	addi      	r3, r4, 1
 80123d0:	b860      	st.w      	r3, (r14, 0x0)
	while (*str) {
 80123d2:	2b00      	subi      	r3, 1
	for (i = 0; i < font.height; i++) {
 80123d4:	ea11000a 	movi      	r17, 10
	while (*str) {
 80123d8:	8380      	ld.b      	r4, (r3, 0x0)
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 80123da:	02be      	lrw      	r5, 0x200018b4	// 801265c <ST7789_WriteString.constprop.5+0x2ac>
	while (*str) {
 80123dc:	e904012c 	bez      	r4, 0x8012634	// 8012634 <ST7789_WriteString.constprop.5+0x284>
		if (x + font.width >= ST7789_WIDTH) {
 80123e0:	c4d10028 	addu      	r8, r17, r6
 80123e4:	eb2800ef 	cmplti      	r8, 240
			x = 0;
			y += font.height;
 80123e8:	75ed      	zexth      	r7, r11
		if (x + font.width >= ST7789_WIDTH) {
 80123ea:	092e      	bt      	0x8012646	// 8012646 <ST7789_WriteString.constprop.5+0x296>
			y += font.height;
 80123ec:	9861      	ld.w      	r3, (r14, 0x4)
 80123ee:	c4670030 	addu      	r16, r7, r3
 80123f2:	c41055e3 	zext      	r3, r16, 15, 0
 80123f6:	b861      	st.w      	r3, (r14, 0x4)
			if (y + font.height >= ST7789_HEIGHT) {
 80123f8:	60ec      	addu      	r3, r11
 80123fa:	eb2300ef 	cmplti      	r3, 240
 80123fe:	0d1b      	bf      	0x8012634	// 8012634 <ST7789_WriteString.constprop.5+0x284>
				break;
			}

			if (*str == ' ') {
 8012400:	eb440020 	cmpnei      	r4, 32
 8012404:	0d26      	bf      	0x8012650	// 8012650 <ST7789_WriteString.constprop.5+0x2a0>
 8012406:	ea090000 	movi      	r9, 0
 801240a:	6ea7      	mov      	r10, r9
 801240c:	6e1b      	mov      	r8, r6
	ST7789_Select();
 801240e:	3200      	movi      	r2, 0
 8012410:	ea210080 	movih      	r1, 128
 8012414:	030e      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 8012416:	e3fffc83 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 801241a:	da0e2001 	ld.w      	r16, (r14, 0x4)
 801241e:	c4104823 	lsli      	r3, r16, 0
	ST7789_Select();
 8012422:	3200      	movi      	r2, 0
 8012424:	ea210080 	movih      	r1, 128
 8012428:	0313      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 801242a:	61cc      	addu      	r7, r3
	ST7789_Select();
 801242c:	e3fffc78 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012430:	312a      	movi      	r1, 42
 8012432:	dc2e000f 	st.b      	r1, (r14, 0xf)
	ST7789_Select();
 8012436:	3200      	movi      	r2, 0
 8012438:	ea210080 	movih      	r1, 128
 801243c:	0318      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 801243e:	e3fffc6f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012442:	3200      	movi      	r2, 0
 8012444:	ea210040 	movih      	r1, 64
 8012448:	031b      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 801244a:	e3fffc69 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 801244e:	c40855f1 	zext      	r17, r8, 15, 0
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012452:	3300      	movi      	r3, 0
 8012454:	2b00      	subi      	r3, 1
 8012456:	3201      	movi      	r2, 1
 8012458:	e42e000e 	addi      	r1, r14, 15
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 801245c:	e5111000 	subi      	r8, r17, 1
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012460:	6c17      	mov      	r0, r5
 8012462:	e3fffd5f 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8012466:	7621      	zexth      	r8, r8
	ST7789_UnSelect();
 8012468:	3201      	movi      	r2, 1
 801246a:	ea210080 	movih      	r1, 128
 801246e:	131b      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 8012470:	e3fffc56 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 8012474:	c5084843 	lsri      	r3, r8, 8
	ST7789_Select();
 8012478:	3200      	movi      	r2, 0
 801247a:	ea210080 	movih      	r1, 128
 801247e:	1317      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 8012480:	dc6e0012 	st.b      	r3, (r14, 0x12)
 8012484:	dd4e0010 	st.b      	r10, (r14, 0x10)
 8012488:	dd2e0011 	st.b      	r9, (r14, 0x11)
 801248c:	dd0e0013 	st.b      	r8, (r14, 0x13)
	ST7789_Select();
 8012490:	e3fffc46 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012494:	3201      	movi      	r2, 1
 8012496:	ea210040 	movih      	r1, 64
 801249a:	1310      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 801249c:	e3fffc40 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80124a0:	3300      	movi      	r3, 0
 80124a2:	2b00      	subi      	r3, 1
 80124a4:	3204      	movi      	r2, 4
 80124a6:	1904      	addi      	r1, r14, 16
 80124a8:	6c17      	mov      	r0, r5
 80124aa:	e3fffd3b 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80124ae:	3201      	movi      	r2, 1
 80124b0:	ea210080 	movih      	r1, 128
 80124b4:	1309      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 80124b6:	e3fffc33 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80124ba:	312b      	movi      	r1, 43
 80124bc:	dc2e000e 	st.b      	r1, (r14, 0xe)
	ST7789_Select();
 80124c0:	3200      	movi      	r2, 0
 80124c2:	ea210080 	movih      	r1, 128
 80124c6:	1305      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 80124c8:	e3fffc2a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 80124cc:	3200      	movi      	r2, 0
 80124ce:	ea210040 	movih      	r1, 64
 80124d2:	1302      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 80124d4:	e3fffc24 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 80124d8:	3300      	movi      	r3, 0
 80124da:	2b00      	subi      	r3, 1
 80124dc:	3201      	movi      	r2, 1
 80124de:	e42e000d 	addi      	r1, r14, 14
 80124e2:	6c17      	mov      	r0, r5
 80124e4:	e3fffd1e 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80124e8:	3201      	movi      	r2, 1
 80124ea:	ea210080 	movih      	r1, 128
 80124ee:	121b      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 80124f0:	e3fffc16 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80124f4:	2f00      	subi      	r7, 1
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80124f6:	c4104822 	lsli      	r2, r16, 0
 80124fa:	4a68      	lsri      	r3, r2, 8
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80124fc:	75dd      	zexth      	r7, r7
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80124fe:	dc6e0010 	st.b      	r3, (r14, 0x10)
	ST7789_Select();
 8012502:	3200      	movi      	r2, 0
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 8012504:	4f68      	lsri      	r3, r7, 8
	ST7789_Select();
 8012506:	ea210080 	movih      	r1, 128
 801250a:	1214      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 801250c:	dc6e0012 	st.b      	r3, (r14, 0x12)
 8012510:	de0e0011 	st.b      	r16, (r14, 0x11)
 8012514:	dcee0013 	st.b      	r7, (r14, 0x13)
	ST7789_Select();
 8012518:	e3fffc02 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801251c:	3201      	movi      	r2, 1
 801251e:	ea210040 	movih      	r1, 64
 8012522:	120e      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 8012524:	e3fffbfc 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8012528:	3300      	movi      	r3, 0
 801252a:	2b00      	subi      	r3, 1
 801252c:	3204      	movi      	r2, 4
 801252e:	1904      	addi      	r1, r14, 16
 8012530:	6c17      	mov      	r0, r5
 8012532:	e3fffcf7 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012536:	3201      	movi      	r2, 1
 8012538:	ea210080 	movih      	r1, 128
 801253c:	1207      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 801253e:	e3fffbef 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012542:	332c      	movi      	r3, 44
	ST7789_Select();
 8012544:	3200      	movi      	r2, 0
 8012546:	ea210080 	movih      	r1, 128
 801254a:	1204      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 801254c:	dc6e000d 	st.b      	r3, (r14, 0xd)
 8012550:	e3fffbe6 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012554:	3200      	movi      	r2, 0
 8012556:	ea210040 	movih      	r1, 64
 801255a:	1200      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 801255c:	e3fffbe0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012560:	3300      	movi      	r3, 0
 8012562:	2b00      	subi      	r3, 1
 8012564:	3201      	movi      	r2, 1
 8012566:	e42e000c 	addi      	r1, r14, 13
 801256a:	6c17      	mov      	r0, r5
 801256c:	e3fffcda 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012570:	3201      	movi      	r2, 1
 8012572:	ea210080 	movih      	r1, 128
 8012576:	1119      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 8012578:	e3fffbd2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801257c:	3201      	movi      	r2, 1
 801257e:	ea210080 	movih      	r1, 128
 8012582:	1116      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 8012584:	e3fffbcc 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	for (i = 0; i < font.height; i++) {
 8012588:	e90b0049 	bez      	r11, 0x801261a	// 801261a <ST7789_WriteString.constprop.5+0x26a>
 801258c:	2c1f      	subi      	r4, 32
 801258e:	c564842a 	mult      	r10, r4, r11
 8012592:	e9060044 	bez      	r6, 0x801261a	// 801261a <ST7789_WriteString.constprop.5+0x26a>
 8012596:	ea090000 	movi      	r9, 0
 801259a:	62a8      	addu      	r10, r10
 801259c:	9862      	ld.w      	r3, (r14, 0x8)
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 801259e:	6de7      	mov      	r7, r9
 80125a0:	628c      	addu      	r10, r3
			if ((b << j) & 0x8000) {
 80125a2:	ea088000 	movi      	r8, 32768
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 80125a6:	2f00      	subi      	r7, 1
		b = font.data[(ch - 32) * font.height + i];
 80125a8:	d12a0444 	ldr.h      	r4, (r10, r9 << 1)
 80125ac:	7511      	zexth      	r4, r4
 80125ae:	ea100000 	movi      	r16, 0
 80125b2:	0426      	br      	0x80125fe	// 80125fe <ST7789_WriteString.constprop.5+0x24e>
				uint8_t data[] = {color >> 8, color & 0xFF};
 80125b4:	3300      	movi      	r3, 0
 80125b6:	2b07      	subi      	r3, 8
 80125b8:	dc6e0010 	st.b      	r3, (r14, 0x10)
 80125bc:	3300      	movi      	r3, 0
 80125be:	dc6e0011 	st.b      	r3, (r14, 0x11)
	ST7789_Select();
 80125c2:	3200      	movi      	r2, 0
 80125c4:	ea210080 	movih      	r1, 128
 80125c8:	1104      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 80125ca:	e3fffba9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80125ce:	3201      	movi      	r2, 1
 80125d0:	ea210040 	movih      	r1, 64
 80125d4:	1101      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 80125d6:	e3fffba3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80125da:	3300      	movi      	r3, 0
 80125dc:	2b00      	subi      	r3, 1
 80125de:	3202      	movi      	r2, 2
 80125e0:	1904      	addi      	r1, r14, 16
 80125e2:	6c17      	mov      	r0, r5
 80125e4:	e3fffc9e 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		for (j = 0; j < font.width; j++) {
 80125e8:	e6100000 	addi      	r16, r16, 1
	ST7789_UnSelect();
 80125ec:	3201      	movi      	r2, 1
 80125ee:	ea210080 	movih      	r1, 128
 80125f2:	101a      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 80125f4:	e3fffb94 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		for (j = 0; j < font.width; j++) {
 80125f8:	c4d00480 	cmpne      	r16, r6
 80125fc:	0c0b      	bf      	0x8012612	// 8012612 <ST7789_WriteString.constprop.5+0x262>
			if ((b << j) & 0x8000) {
 80125fe:	c6044022 	lsl      	r2, r4, r16
 8012602:	68a0      	and      	r2, r8
 8012604:	e922ffd8 	bnez      	r2, 0x80125b4	// 80125b4 <ST7789_WriteString.constprop.5+0x204>
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 8012608:	dcee0010 	st.b      	r7, (r14, 0x10)
 801260c:	dcee0011 	st.b      	r7, (r14, 0x11)
 8012610:	07da      	br      	0x80125c4	// 80125c4 <ST7789_WriteString.constprop.5+0x214>
	for (i = 0; i < font.height; i++) {
 8012612:	e5290000 	addi      	r9, r9, 1
 8012616:	66e6      	cmpne      	r9, r11
 8012618:	0bc8      	bt      	0x80125a8	// 80125a8 <ST7789_WriteString.constprop.5+0x1f8>
	ST7789_UnSelect();
 801261a:	3201      	movi      	r2, 1
 801261c:	ea210080 	movih      	r1, 128
 8012620:	100e      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 8012622:	e3fffb7d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012626:	9860      	ld.w      	r3, (r14, 0x0)
 8012628:	2300      	addi      	r3, 1
 801262a:	b860      	st.w      	r3, (r14, 0x0)
	while (*str) {
 801262c:	2b00      	subi      	r3, 1
 801262e:	8380      	ld.b      	r4, (r3, 0x0)
 8012630:	e924fed8 	bnez      	r4, 0x80123e0	// 80123e0 <ST7789_WriteString.constprop.5+0x30>
		}
		ST7789_WriteChar(x, y, *str, font, color, bgcolor);
		x += font.width;
		str++;
	}
	ST7789_UnSelect();
 8012634:	3201      	movi      	r2, 1
 8012636:	ea210080 	movih      	r1, 128
 801263a:	1008      	lrw      	r0, 0x40011400	// 8012658 <ST7789_WriteString.constprop.5+0x2a8>
 801263c:	e3fffb70 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 8012640:	1405      	addi      	r14, r14, 20
 8012642:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8012646:	c511484a 	lsri      	r10, r17, 8
 801264a:	c41154e9 	zext      	r9, r17, 7, 0
 801264e:	06e0      	br      	0x801240e	// 801240e <ST7789_WriteString.constprop.5+0x5e>
			x = 0;
 8012650:	ea110000 	movi      	r17, 0
 8012654:	07e9      	br      	0x8012626	// 8012626 <ST7789_WriteString.constprop.5+0x276>
 8012656:	0000      	.short	0x0000
 8012658:	40011400 	.long	0x40011400
 801265c:	200018b4 	.long	0x200018b4

08012660 <ST7789_WriteString.constprop.7>:
void ST7789_WriteString(uint16_t x, uint16_t y, const char *str, FontDef font, uint16_t color, uint16_t bgcolor)
 8012660:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012664:	1427      	subi      	r14, r14, 28
 8012666:	6d07      	mov      	r4, r1
 8012668:	b803      	st.w      	r0, (r14, 0xc)
 801266a:	b864      	st.w      	r3, (r14, 0x10)
 801266c:	75c8      	zextb      	r7, r2
 801266e:	c50255e3 	zext      	r3, r2, 15, 8
	ST7789_Select();
 8012672:	ea210080 	movih      	r1, 128
 8012676:	3200      	movi      	r2, 0
 8012678:	0214      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
void ST7789_WriteString(uint16_t x, uint16_t y, const char *str, FontDef font, uint16_t color, uint16_t bgcolor)
 801267a:	d92e1024 	ld.h      	r9, (r14, 0x48)
 801267e:	b860      	st.w      	r3, (r14, 0x0)
	ST7789_Select();
 8012680:	e3fffb4e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012684:	5c62      	addi      	r3, r4, 1
 8012686:	b861      	st.w      	r3, (r14, 0x4)
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 8012688:	330a      	movi      	r3, 10
 801268a:	b862      	st.w      	r3, (r14, 0x8)
 801268c:	9861      	ld.w      	r3, (r14, 0x4)
	while (*str) {
 801268e:	2b00      	subi      	r3, 1
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 8012690:	c509484a 	lsri      	r10, r9, 8
	while (*str) {
 8012694:	8380      	ld.b      	r4, (r3, 0x0)
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012696:	02da      	lrw      	r6, 0x200018b4	// 8012928 <ST7789_WriteString.constprop.7+0x2c8>
	while (*str) {
 8012698:	e9040131 	bez      	r4, 0x80128fa	// 80128fa <ST7789_WriteString.constprop.7+0x29a>
		if (x + font.width >= ST7789_WIDTH) {
 801269c:	9862      	ld.w      	r3, (r14, 0x8)
 801269e:	c4e30028 	addu      	r8, r3, r7
 80126a2:	eb2800ef 	cmplti      	r8, 240
 80126a6:	0933      	bt      	0x801290c	// 801290c <ST7789_WriteString.constprop.7+0x2ac>
			y += font.height;
 80126a8:	9840      	ld.w      	r2, (r14, 0x0)
 80126aa:	9863      	ld.w      	r3, (r14, 0xc)
 80126ac:	7549      	zexth      	r5, r2
 80126ae:	60d4      	addu      	r3, r5
 80126b0:	74cd      	zexth      	r3, r3
 80126b2:	b863      	st.w      	r3, (r14, 0xc)
			if (y + font.height >= ST7789_HEIGHT) {
 80126b4:	60c8      	addu      	r3, r2
 80126b6:	eb2300ef 	cmplti      	r3, 240
 80126ba:	0d20      	bf      	0x80128fa	// 80128fa <ST7789_WriteString.constprop.7+0x29a>
			if (*str == ' ') {
 80126bc:	eb440020 	cmpnei      	r4, 32
 80126c0:	0d2e      	bf      	0x801291c	// 801291c <ST7789_WriteString.constprop.7+0x2bc>
 80126c2:	ea0b0000 	movi      	r11, 0
 80126c6:	c40b4830 	lsli      	r16, r11, 0
 80126ca:	6e1f      	mov      	r8, r7
	ST7789_Select();
 80126cc:	3200      	movi      	r2, 0
 80126ce:	ea210080 	movih      	r1, 128
 80126d2:	030a      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 80126d4:	e3fffb24 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80126d8:	da2e2003 	ld.w      	r17, (r14, 0xc)
 80126dc:	74e1      	zexth      	r3, r8
 80126de:	b862      	st.w      	r3, (r14, 0x8)
 80126e0:	e5031000 	subi      	r8, r3, 1
	ST7789_Select();
 80126e4:	3200      	movi      	r2, 0
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80126e6:	c4114823 	lsli      	r3, r17, 0
	ST7789_Select();
 80126ea:	ea210080 	movih      	r1, 128
 80126ee:	0311      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80126f0:	614c      	addu      	r5, r3
	ST7789_Select();
 80126f2:	e3fffb15 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80126f6:	312a      	movi      	r1, 42
 80126f8:	dc2e0017 	st.b      	r1, (r14, 0x17)
	ST7789_Select();
 80126fc:	3200      	movi      	r2, 0
 80126fe:	ea210080 	movih      	r1, 128
 8012702:	0316      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 8012704:	e3fffb0c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012708:	3200      	movi      	r2, 0
 801270a:	ea210040 	movih      	r1, 64
 801270e:	0319      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 8012710:	e3fffb06 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012714:	3300      	movi      	r3, 0
 8012716:	2b00      	subi      	r3, 1
 8012718:	3201      	movi      	r2, 1
 801271a:	e42e0016 	addi      	r1, r14, 23
 801271e:	6c1b      	mov      	r0, r6
 8012720:	e3fffc00 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8012724:	7621      	zexth      	r8, r8
	ST7789_UnSelect();
 8012726:	3201      	movi      	r2, 1
 8012728:	ea210080 	movih      	r1, 128
 801272c:	131e      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 801272e:	e3fffaf7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 8012732:	c5084843 	lsri      	r3, r8, 8
	ST7789_Select();
 8012736:	3200      	movi      	r2, 0
 8012738:	ea210080 	movih      	r1, 128
 801273c:	131a      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 801273e:	dc6e001a 	st.b      	r3, (r14, 0x1a)
 8012742:	de0e0018 	st.b      	r16, (r14, 0x18)
 8012746:	dd6e0019 	st.b      	r11, (r14, 0x19)
 801274a:	dd0e001b 	st.b      	r8, (r14, 0x1b)
	ST7789_Select();
 801274e:	e3fffae7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012752:	3201      	movi      	r2, 1
 8012754:	ea210040 	movih      	r1, 64
 8012758:	1313      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 801275a:	e3fffae1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801275e:	3300      	movi      	r3, 0
 8012760:	2b00      	subi      	r3, 1
 8012762:	3204      	movi      	r2, 4
 8012764:	1906      	addi      	r1, r14, 24
 8012766:	6c1b      	mov      	r0, r6
 8012768:	e3fffbdc 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801276c:	3201      	movi      	r2, 1
 801276e:	ea210080 	movih      	r1, 128
 8012772:	130d      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 8012774:	e3fffad4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012778:	312b      	movi      	r1, 43
 801277a:	dc2e0016 	st.b      	r1, (r14, 0x16)
	ST7789_Select();
 801277e:	3200      	movi      	r2, 0
 8012780:	ea210080 	movih      	r1, 128
 8012784:	1308      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 8012786:	e3fffacb 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 801278a:	3200      	movi      	r2, 0
 801278c:	ea210040 	movih      	r1, 64
 8012790:	1305      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 8012792:	e3fffac5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012796:	3300      	movi      	r3, 0
 8012798:	2b00      	subi      	r3, 1
 801279a:	3201      	movi      	r2, 1
 801279c:	e42e0015 	addi      	r1, r14, 22
 80127a0:	6c1b      	mov      	r0, r6
 80127a2:	e3fffbbf 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80127a6:	3201      	movi      	r2, 1
 80127a8:	ea210080 	movih      	r1, 128
 80127ac:	121e      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 80127ae:	e3fffab7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80127b2:	2d00      	subi      	r5, 1
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80127b4:	c4114822 	lsli      	r2, r17, 0
 80127b8:	4a68      	lsri      	r3, r2, 8
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80127ba:	7555      	zexth      	r5, r5
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80127bc:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 80127c0:	3200      	movi      	r2, 0
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80127c2:	4d68      	lsri      	r3, r5, 8
	ST7789_Select();
 80127c4:	ea210080 	movih      	r1, 128
 80127c8:	1217      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80127ca:	dc6e001a 	st.b      	r3, (r14, 0x1a)
 80127ce:	de2e0019 	st.b      	r17, (r14, 0x19)
 80127d2:	dcae001b 	st.b      	r5, (r14, 0x1b)
	ST7789_Select();
 80127d6:	e3fffaa3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80127da:	3201      	movi      	r2, 1
 80127dc:	ea210040 	movih      	r1, 64
 80127e0:	1211      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 80127e2:	e3fffa9d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80127e6:	3300      	movi      	r3, 0
 80127e8:	2b00      	subi      	r3, 1
 80127ea:	3204      	movi      	r2, 4
 80127ec:	1906      	addi      	r1, r14, 24
 80127ee:	6c1b      	mov      	r0, r6
 80127f0:	e3fffb98 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80127f4:	3201      	movi      	r2, 1
 80127f6:	ea210080 	movih      	r1, 128
 80127fa:	120b      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 80127fc:	e3fffa90 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012800:	332c      	movi      	r3, 44
	ST7789_Select();
 8012802:	3200      	movi      	r2, 0
 8012804:	ea210080 	movih      	r1, 128
 8012808:	1207      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 801280a:	dc6e0015 	st.b      	r3, (r14, 0x15)
 801280e:	e3fffa87 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012812:	3200      	movi      	r2, 0
 8012814:	ea210040 	movih      	r1, 64
 8012818:	1203      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 801281a:	e3fffa81 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 801281e:	3300      	movi      	r3, 0
 8012820:	2b00      	subi      	r3, 1
 8012822:	3201      	movi      	r2, 1
 8012824:	e42e0014 	addi      	r1, r14, 21
 8012828:	6c1b      	mov      	r0, r6
 801282a:	e3fffb7b 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801282e:	3201      	movi      	r2, 1
 8012830:	ea210080 	movih      	r1, 128
 8012834:	111c      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 8012836:	e3fffa73 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801283a:	3201      	movi      	r2, 1
 801283c:	ea210080 	movih      	r1, 128
 8012840:	1119      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 8012842:	e3fffa6d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	for (i = 0; i < font.height; i++) {
 8012846:	9860      	ld.w      	r3, (r14, 0x0)
 8012848:	e903004c 	bez      	r3, 0x80128e0	// 80128e0 <ST7789_WriteString.constprop.7+0x280>
 801284c:	2c1f      	subi      	r4, 32
 801284e:	c4648430 	mult      	r16, r4, r3
 8012852:	e9070047 	bez      	r7, 0x80128e0	// 80128e0 <ST7789_WriteString.constprop.7+0x280>
 8012856:	c6100030 	addu      	r16, r16, r16
 801285a:	9864      	ld.w      	r3, (r14, 0x10)
 801285c:	c6030030 	addu      	r16, r3, r16
 8012860:	ea0b0000 	movi      	r11, 0
			if ((b << j) & 0x8000) {
 8012864:	ea088000 	movi      	r8, 32768
	ST7789_Select();
 8012868:	118f      	lrw      	r4, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
		b = font.data[(ch - 32) * font.height + i];
 801286a:	d1700445 	ldr.h      	r5, (r16, r11 << 1)
 801286e:	7555      	zexth      	r5, r5
 8012870:	ea110000 	movi      	r17, 0
 8012874:	0427      	br      	0x80128c2	// 80128c2 <ST7789_WriteString.constprop.7+0x262>
				uint8_t data[] = {color >> 8, color & 0xFF};
 8012876:	3300      	movi      	r3, 0
 8012878:	2b00      	subi      	r3, 1
 801287a:	dc6e0018 	st.b      	r3, (r14, 0x18)
 801287e:	3300      	movi      	r3, 0
 8012880:	2b1f      	subi      	r3, 32
 8012882:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8012886:	3200      	movi      	r2, 0
 8012888:	ea210080 	movih      	r1, 128
 801288c:	6c13      	mov      	r0, r4
 801288e:	e3fffa47 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012892:	3201      	movi      	r2, 1
 8012894:	ea210040 	movih      	r1, 64
 8012898:	6c13      	mov      	r0, r4
 801289a:	e3fffa41 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801289e:	3300      	movi      	r3, 0
 80128a0:	2b00      	subi      	r3, 1
 80128a2:	3202      	movi      	r2, 2
 80128a4:	1906      	addi      	r1, r14, 24
 80128a6:	6c1b      	mov      	r0, r6
 80128a8:	e3fffb3c 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		for (j = 0; j < font.width; j++) {
 80128ac:	e6310000 	addi      	r17, r17, 1
	ST7789_UnSelect();
 80128b0:	3201      	movi      	r2, 1
 80128b2:	ea210080 	movih      	r1, 128
 80128b6:	6c13      	mov      	r0, r4
 80128b8:	e3fffa32 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		for (j = 0; j < font.width; j++) {
 80128bc:	c4f10480 	cmpne      	r17, r7
 80128c0:	0c0b      	bf      	0x80128d6	// 80128d6 <ST7789_WriteString.constprop.7+0x276>
			if ((b << j) & 0x8000) {
 80128c2:	c6254022 	lsl      	r2, r5, r17
 80128c6:	68a0      	and      	r2, r8
 80128c8:	e922ffd7 	bnez      	r2, 0x8012876	// 8012876 <ST7789_WriteString.constprop.7+0x216>
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 80128cc:	dd4e0018 	st.b      	r10, (r14, 0x18)
 80128d0:	dd2e0019 	st.b      	r9, (r14, 0x19)
 80128d4:	07da      	br      	0x8012888	// 8012888 <ST7789_WriteString.constprop.7+0x228>
	for (i = 0; i < font.height; i++) {
 80128d6:	e56b0000 	addi      	r11, r11, 1
 80128da:	9860      	ld.w      	r3, (r14, 0x0)
 80128dc:	64ee      	cmpne      	r11, r3
 80128de:	0bc6      	bt      	0x801286a	// 801286a <ST7789_WriteString.constprop.7+0x20a>
	ST7789_UnSelect();
 80128e0:	3201      	movi      	r2, 1
 80128e2:	ea210080 	movih      	r1, 128
 80128e6:	1010      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 80128e8:	e3fffa1a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80128ec:	9861      	ld.w      	r3, (r14, 0x4)
 80128ee:	2300      	addi      	r3, 1
 80128f0:	b861      	st.w      	r3, (r14, 0x4)
	while (*str) {
 80128f2:	2b00      	subi      	r3, 1
 80128f4:	8380      	ld.b      	r4, (r3, 0x0)
 80128f6:	e924fed3 	bnez      	r4, 0x801269c	// 801269c <ST7789_WriteString.constprop.7+0x3c>
	ST7789_UnSelect();
 80128fa:	3201      	movi      	r2, 1
 80128fc:	ea210080 	movih      	r1, 128
 8012900:	1009      	lrw      	r0, 0x40011400	// 8012924 <ST7789_WriteString.constprop.7+0x2c4>
 8012902:	e3fffa0d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 8012906:	1407      	addi      	r14, r14, 28
 8012908:	ebc00058 	pop      	r4-r11, r15, r16-r17
 801290c:	d86e1000 	ld.h      	r3, (r14, 0x0)
 8012910:	754d      	zexth      	r5, r3
 8012912:	9862      	ld.w      	r3, (r14, 0x8)
 8012914:	c5034850 	lsri      	r16, r3, 8
 8012918:	76cc      	zextb      	r11, r3
 801291a:	06d9      	br      	0x80126cc	// 80126cc <ST7789_WriteString.constprop.7+0x6c>
			x = 0;
 801291c:	3300      	movi      	r3, 0
 801291e:	b862      	st.w      	r3, (r14, 0x8)
 8012920:	07e6      	br      	0x80128ec	// 80128ec <ST7789_WriteString.constprop.7+0x28c>
 8012922:	0000      	.short	0x0000
 8012924:	40011400 	.long	0x40011400
 8012928:	200018b4 	.long	0x200018b4

0801292c <ST7789_SetAddressWindow>:
{
 801292c:	14d5      	push      	r4-r8, r15
 801292e:	1422      	subi      	r14, r14, 8
 8012930:	6e03      	mov      	r8, r0
 8012932:	6d87      	mov      	r6, r1
 8012934:	6dcb      	mov      	r7, r2
	ST7789_Select();
 8012936:	ea210080 	movih      	r1, 128
 801293a:	3200      	movi      	r2, 0
 801293c:	1216      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
{
 801293e:	6d4f      	mov      	r5, r3
	ST7789_Select();
 8012940:	e3fff9ee 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012944:	332a      	movi      	r3, 42
	ST7789_Select();
 8012946:	3200      	movi      	r2, 0
 8012948:	ea210080 	movih      	r1, 128
 801294c:	1212      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 801294e:	dc6e0003 	st.b      	r3, (r14, 0x3)
 8012952:	e3fff9e5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012956:	3200      	movi      	r2, 0
 8012958:	ea210040 	movih      	r1, 64
 801295c:	120e      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 801295e:	e3fff9df 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012962:	128e      	lrw      	r4, 0x200018b4	// 8012a98 <ST7789_SetAddressWindow+0x16c>
 8012964:	3300      	movi      	r3, 0
 8012966:	2b00      	subi      	r3, 1
 8012968:	e42e0002 	addi      	r1, r14, 3
 801296c:	3201      	movi      	r2, 1
 801296e:	6c13      	mov      	r0, r4
 8012970:	e3fffad8 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012974:	3201      	movi      	r2, 1
 8012976:	ea210080 	movih      	r1, 128
 801297a:	1207      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 801297c:	e3fff9d0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 8012980:	c5084843 	lsri      	r3, r8, 8
 8012984:	dc6e0004 	st.b      	r3, (r14, 0x4)
	ST7789_Select();
 8012988:	3200      	movi      	r2, 0
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 801298a:	4f68      	lsri      	r3, r7, 8
	ST7789_Select();
 801298c:	ea210080 	movih      	r1, 128
 8012990:	1201      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 8012992:	dc6e0006 	st.b      	r3, (r14, 0x6)
 8012996:	dd0e0005 	st.b      	r8, (r14, 0x5)
 801299a:	dcee0007 	st.b      	r7, (r14, 0x7)
	ST7789_Select();
 801299e:	e3fff9bf 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80129a2:	3201      	movi      	r2, 1
 80129a4:	ea210040 	movih      	r1, 64
 80129a8:	111b      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 80129aa:	e3fff9b9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80129ae:	3204      	movi      	r2, 4
 80129b0:	3300      	movi      	r3, 0
 80129b2:	c44e0021 	addu      	r1, r14, r2
 80129b6:	2b00      	subi      	r3, 1
 80129b8:	6c13      	mov      	r0, r4
 80129ba:	e3fffab3 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80129be:	3201      	movi      	r2, 1
 80129c0:	ea210080 	movih      	r1, 128
 80129c4:	1114      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 80129c6:	e3fff9ab 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80129ca:	332b      	movi      	r3, 43
	ST7789_Select();
 80129cc:	3200      	movi      	r2, 0
 80129ce:	ea210080 	movih      	r1, 128
 80129d2:	1111      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 80129d4:	dc6e0002 	st.b      	r3, (r14, 0x2)
 80129d8:	e3fff9a2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 80129dc:	3200      	movi      	r2, 0
 80129de:	ea210040 	movih      	r1, 64
 80129e2:	110d      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 80129e4:	e3fff99c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 80129e8:	3300      	movi      	r3, 0
 80129ea:	2b00      	subi      	r3, 1
 80129ec:	e42e0001 	addi      	r1, r14, 2
 80129f0:	3201      	movi      	r2, 1
 80129f2:	6c13      	mov      	r0, r4
 80129f4:	e3fffa96 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80129f8:	3201      	movi      	r2, 1
 80129fa:	ea210080 	movih      	r1, 128
 80129fe:	1106      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 8012a00:	e3fff98e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 8012a04:	4e68      	lsri      	r3, r6, 8
 8012a06:	dc6e0004 	st.b      	r3, (r14, 0x4)
	ST7789_Select();
 8012a0a:	3200      	movi      	r2, 0
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 8012a0c:	4d68      	lsri      	r3, r5, 8
	ST7789_Select();
 8012a0e:	ea210080 	movih      	r1, 128
 8012a12:	1101      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 8012a14:	dc6e0006 	st.b      	r3, (r14, 0x6)
 8012a18:	dcce0005 	st.b      	r6, (r14, 0x5)
 8012a1c:	dcae0007 	st.b      	r5, (r14, 0x7)
	ST7789_Select();
 8012a20:	e3fff97e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012a24:	3201      	movi      	r2, 1
 8012a26:	ea210040 	movih      	r1, 64
 8012a2a:	101b      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 8012a2c:	e3fff978 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8012a30:	3204      	movi      	r2, 4
 8012a32:	3300      	movi      	r3, 0
 8012a34:	c44e0021 	addu      	r1, r14, r2
 8012a38:	2b00      	subi      	r3, 1
 8012a3a:	6c13      	mov      	r0, r4
 8012a3c:	e3fffa72 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012a40:	3201      	movi      	r2, 1
 8012a42:	ea210080 	movih      	r1, 128
 8012a46:	1014      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 8012a48:	e3fff96a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012a4c:	332c      	movi      	r3, 44
	ST7789_Select();
 8012a4e:	3200      	movi      	r2, 0
 8012a50:	ea210080 	movih      	r1, 128
 8012a54:	1010      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 8012a56:	dc6e0004 	st.b      	r3, (r14, 0x4)
 8012a5a:	e3fff961 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012a5e:	3200      	movi      	r2, 0
 8012a60:	ea210040 	movih      	r1, 64
 8012a64:	100c      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 8012a66:	e3fff95b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012a6a:	3300      	movi      	r3, 0
 8012a6c:	2b00      	subi      	r3, 1
 8012a6e:	1901      	addi      	r1, r14, 4
 8012a70:	3201      	movi      	r2, 1
 8012a72:	6c13      	mov      	r0, r4
 8012a74:	e3fffa56 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012a78:	3201      	movi      	r2, 1
 8012a7a:	ea210080 	movih      	r1, 128
 8012a7e:	1006      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 8012a80:	e3fff94e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8012a84:	3201      	movi      	r2, 1
 8012a86:	ea210080 	movih      	r1, 128
 8012a8a:	1003      	lrw      	r0, 0x40011400	// 8012a94 <ST7789_SetAddressWindow+0x168>
 8012a8c:	e3fff948 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 8012a90:	1402      	addi      	r14, r14, 8
 8012a92:	1495      	pop      	r4-r8, r15
 8012a94:	40011400 	.long	0x40011400
 8012a98:	200018b4 	.long	0x200018b4

08012a9c <ST7789_Fill_Color>:
{
 8012a9c:	14d6      	push      	r4-r9, r15
 8012a9e:	1421      	subi      	r14, r14, 4
	ST7789_SetAddressWindow(0, 0, ST7789_WIDTH - 1, ST7789_HEIGHT - 1);
 8012aa0:	33ef      	movi      	r3, 239
 8012aa2:	3100      	movi      	r1, 0
{
 8012aa4:	6d83      	mov      	r6, r0
	ST7789_SetAddressWindow(0, 0, ST7789_WIDTH - 1, ST7789_HEIGHT - 1);
 8012aa6:	6c8f      	mov      	r2, r3
 8012aa8:	6c07      	mov      	r0, r1
 8012aaa:	e3ffff41 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 8012aae:	3200      	movi      	r2, 0
 8012ab0:	ea210080 	movih      	r1, 128
 8012ab4:	101d      	lrw      	r0, 0x40011400	// 8012b28 <ST7789_Fill_Color+0x8c>
 8012ab6:	c5064848 	lsri      	r8, r6, 8
 8012aba:	e3fff931 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012abe:	7598      	zextb      	r6, r6
 8012ac0:	ea0900f0 	movi      	r9, 240
	ST7789_Select();
 8012ac4:	10b9      	lrw      	r5, 0x40011400	// 8012b28 <ST7789_Fill_Color+0x8c>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8012ac6:	10fa      	lrw      	r7, 0x200018b4	// 8012b2c <ST7789_Fill_Color+0x90>
{
 8012ac8:	34f0      	movi      	r4, 240
	ST7789_Select();
 8012aca:	3200      	movi      	r2, 0
 8012acc:	ea210080 	movih      	r1, 128
 8012ad0:	6c17      	mov      	r0, r5
					uint8_t data[] = {color >> 8, color & 0xFF};
 8012ad2:	dd0e0000 	st.b      	r8, (r14, 0x0)
 8012ad6:	dcce0001 	st.b      	r6, (r14, 0x1)
	ST7789_Select();
 8012ada:	e3fff921 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012ade:	3201      	movi      	r2, 1
 8012ae0:	ea210040 	movih      	r1, 64
 8012ae4:	6c17      	mov      	r0, r5
 8012ae6:	e3fff91b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012aea:	2c00      	subi      	r4, 1
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8012aec:	3300      	movi      	r3, 0
 8012aee:	2b00      	subi      	r3, 1
 8012af0:	3202      	movi      	r2, 2
 8012af2:	6c7b      	mov      	r1, r14
 8012af4:	6c1f      	mov      	r0, r7
 8012af6:	7511      	zexth      	r4, r4
 8012af8:	e3fffa14 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012afc:	3201      	movi      	r2, 1
 8012afe:	ea210080 	movih      	r1, 128
 8012b02:	6c17      	mov      	r0, r5
 8012b04:	e3fff90c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
				for (j = 0; j < ST7789_HEIGHT; j++) {
 8012b08:	e924ffe1 	bnez      	r4, 0x8012aca	// 8012aca <ST7789_Fill_Color+0x2e>
 8012b0c:	e5291000 	subi      	r9, r9, 1
 8012b10:	7665      	zexth      	r9, r9
		for (i = 0; i < ST7789_WIDTH; i++)
 8012b12:	e929ffdb 	bnez      	r9, 0x8012ac8	// 8012ac8 <ST7789_Fill_Color+0x2c>
	ST7789_UnSelect();
 8012b16:	3201      	movi      	r2, 1
 8012b18:	ea210080 	movih      	r1, 128
 8012b1c:	1003      	lrw      	r0, 0x40011400	// 8012b28 <ST7789_Fill_Color+0x8c>
 8012b1e:	e3fff8ff 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 8012b22:	1401      	addi      	r14, r14, 4
 8012b24:	1496      	pop      	r4-r9, r15
 8012b26:	0000      	.short	0x0000
 8012b28:	40011400 	.long	0x40011400
 8012b2c:	200018b4 	.long	0x200018b4

08012b30 <ST7789_Init>:
{
 8012b30:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012b34:	142c      	subi      	r14, r14, 48
	HAL_Delay(25);
 8012b36:	3019      	movi      	r0, 25
 8012b38:	e3fff992 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
    ST7789_RST_Clr();
 8012b3c:	3200      	movi      	r2, 0
 8012b3e:	ea210020 	movih      	r1, 32
 8012b42:	ea800214 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012b46:	e3fff8eb 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    HAL_Delay(25);
 8012b4a:	3019      	movi      	r0, 25
 8012b4c:	e3fff988 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
    ST7789_RST_Set();
 8012b50:	3201      	movi      	r2, 1
 8012b52:	ea210020 	movih      	r1, 32
 8012b56:	ea80020f 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012b5a:	e3fff8e1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    HAL_Delay(50);
 8012b5e:	3032      	movi      	r0, 50
 8012b60:	e3fff97e 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
 8012b64:	333a      	movi      	r3, 58
	ST7789_Select();
 8012b66:	3200      	movi      	r2, 0
 8012b68:	ea210080 	movih      	r1, 128
 8012b6c:	ea800209 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012b70:	dc6e001f 	st.b      	r3, (r14, 0x1f)
 8012b74:	e3fff8d4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012b78:	3200      	movi      	r2, 0
 8012b7a:	ea210040 	movih      	r1, 64
 8012b7e:	ea800205 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012b82:	ea840205 	lrw      	r4, 0x200018b4	// 8013394 <ST7789_Init+0x864>
	ST7789_DC_Clr();
 8012b86:	e3fff8cb 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012b8a:	3300      	movi      	r3, 0
 8012b8c:	2b00      	subi      	r3, 1
 8012b8e:	e42e001e 	addi      	r1, r14, 31
 8012b92:	3201      	movi      	r2, 1
 8012b94:	6c13      	mov      	r0, r4
 8012b96:	e3fff9c5 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012b9a:	3201      	movi      	r2, 1
 8012b9c:	ea210080 	movih      	r1, 128
 8012ba0:	ea8001fc 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012ba4:	e3fff8bc 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012ba8:	3355      	movi      	r3, 85
	ST7789_Select();
 8012baa:	3200      	movi      	r2, 0
 8012bac:	ea210080 	movih      	r1, 128
 8012bb0:	ea8001f8 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012bb4:	dc6e001e 	st.b      	r3, (r14, 0x1e)
 8012bb8:	e3fff8b2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012bbc:	3201      	movi      	r2, 1
 8012bbe:	ea210040 	movih      	r1, 64
 8012bc2:	ea8001f4 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012bc6:	e3fff8ab 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8012bca:	3300      	movi      	r3, 0
 8012bcc:	2b00      	subi      	r3, 1
 8012bce:	e42e001d 	addi      	r1, r14, 30
 8012bd2:	3201      	movi      	r2, 1
 8012bd4:	6c13      	mov      	r0, r4
 8012bd6:	e3fff9a5 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012bda:	3201      	movi      	r2, 1
 8012bdc:	ea210080 	movih      	r1, 128
 8012be0:	ea8001ec 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012be4:	e3fff89c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012be8:	3300      	movi      	r3, 0
 8012bea:	2b4d      	subi      	r3, 78
	ST7789_Select();
 8012bec:	3200      	movi      	r2, 0
 8012bee:	ea210080 	movih      	r1, 128
 8012bf2:	ea8001e8 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012bf6:	dc6e001d 	st.b      	r3, (r14, 0x1d)
 8012bfa:	e3fff891 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012bfe:	3200      	movi      	r2, 0
 8012c00:	ea210040 	movih      	r1, 64
 8012c04:	ea8001e3 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012c08:	e3fff88a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012c0c:	3300      	movi      	r3, 0
 8012c0e:	2b00      	subi      	r3, 1
 8012c10:	e42e001c 	addi      	r1, r14, 29
 8012c14:	3201      	movi      	r2, 1
 8012c16:	6c13      	mov      	r0, r4
 8012c18:	e3fff984 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012c1c:	3201      	movi      	r2, 1
 8012c1e:	ea210080 	movih      	r1, 128
 8012c22:	ea8001dc 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012c26:	e3fff87b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		uint8_t data[] = {0x0C, 0x0C, 0x00, 0x33, 0x33};
 8012c2a:	ea09000c 	movi      	r9, 12
 8012c2e:	3333      	movi      	r3, 51
 8012c30:	3500      	movi      	r5, 0
	ST7789_Select();
 8012c32:	3200      	movi      	r2, 0
 8012c34:	ea210080 	movih      	r1, 128
 8012c38:	ea8001d6 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
		uint8_t data[] = {0x0C, 0x0C, 0x00, 0x33, 0x33};
 8012c3c:	dc6e0023 	st.b      	r3, (r14, 0x23)
 8012c40:	dc6e0024 	st.b      	r3, (r14, 0x24)
 8012c44:	dcae0022 	st.b      	r5, (r14, 0x22)
 8012c48:	dd2e0020 	st.b      	r9, (r14, 0x20)
 8012c4c:	dd2e0021 	st.b      	r9, (r14, 0x21)
	ST7789_Select();
 8012c50:	e3fff866 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012c54:	3201      	movi      	r2, 1
 8012c56:	ea210040 	movih      	r1, 64
 8012c5a:	ea8001ce 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012c5e:	e3fff85f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8012c62:	3300      	movi      	r3, 0
 8012c64:	2b00      	subi      	r3, 1
 8012c66:	1908      	addi      	r1, r14, 32
 8012c68:	3205      	movi      	r2, 5
 8012c6a:	6c13      	mov      	r0, r4
 8012c6c:	e3fff95a 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012c70:	3201      	movi      	r2, 1
 8012c72:	ea210080 	movih      	r1, 128
 8012c76:	ea8001c7 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012c7a:	e3fff851 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012c7e:	3336      	movi      	r3, 54
	ST7789_Select();
 8012c80:	3200      	movi      	r2, 0
 8012c82:	ea210080 	movih      	r1, 128
 8012c86:	ea8001c3 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012c8a:	dc6e001c 	st.b      	r3, (r14, 0x1c)
 8012c8e:	e3fff847 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012c92:	3200      	movi      	r2, 0
 8012c94:	ea210040 	movih      	r1, 64
 8012c98:	ea8001be 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012c9c:	e3fff840 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012ca0:	3300      	movi      	r3, 0
 8012ca2:	2b00      	subi      	r3, 1
 8012ca4:	1907      	addi      	r1, r14, 28
 8012ca6:	3201      	movi      	r2, 1
 8012ca8:	6c13      	mov      	r0, r4
 8012caa:	e3fff93b 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012cae:	3201      	movi      	r2, 1
 8012cb0:	ea210080 	movih      	r1, 128
 8012cb4:	ea8001b7 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012cb8:	e3fff832 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8012cbc:	3200      	movi      	r2, 0
 8012cbe:	ea210080 	movih      	r1, 128
 8012cc2:	ea8001b4 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012cc6:	dcae001b 	st.b      	r5, (r14, 0x1b)
 8012cca:	e3fff829 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012cce:	3201      	movi      	r2, 1
 8012cd0:	ea210040 	movih      	r1, 64
 8012cd4:	ea8001af 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012cd8:	e3fff822 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8012cdc:	3300      	movi      	r3, 0
 8012cde:	2b00      	subi      	r3, 1
 8012ce0:	e42e001a 	addi      	r1, r14, 27
 8012ce4:	3201      	movi      	r2, 1
 8012ce6:	6c13      	mov      	r0, r4
 8012ce8:	e3fff91c 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012cec:	3201      	movi      	r2, 1
 8012cee:	ea210080 	movih      	r1, 128
 8012cf2:	ea8001a8 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012cf6:	e3fff813 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012cfa:	3300      	movi      	r3, 0
 8012cfc:	2b48      	subi      	r3, 73
	ST7789_Select();
 8012cfe:	3200      	movi      	r2, 0
 8012d00:	ea210080 	movih      	r1, 128
 8012d04:	ea8001a3 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012d08:	dc6e001a 	st.b      	r3, (r14, 0x1a)
 8012d0c:	e3fff808 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012d10:	3200      	movi      	r2, 0
 8012d12:	ea210040 	movih      	r1, 64
 8012d16:	ea80019f 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012d1a:	e3fff801 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012d1e:	3300      	movi      	r3, 0
 8012d20:	2b00      	subi      	r3, 1
 8012d22:	e42e0019 	addi      	r1, r14, 26
 8012d26:	3201      	movi      	r2, 1
 8012d28:	6c13      	mov      	r0, r4
 8012d2a:	e3fff8fb 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012d2e:	3201      	movi      	r2, 1
 8012d30:	ea210080 	movih      	r1, 128
 8012d34:	ea800197 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012d38:	e3fff7f2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012d3c:	3335      	movi      	r3, 53
	ST7789_Select();
 8012d3e:	3200      	movi      	r2, 0
 8012d40:	ea210080 	movih      	r1, 128
 8012d44:	ea800193 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012d48:	dc6e0019 	st.b      	r3, (r14, 0x19)
 8012d4c:	e3fff7e8 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012d50:	3201      	movi      	r2, 1
 8012d52:	ea210040 	movih      	r1, 64
 8012d56:	ea80018f 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012d5a:	e3fff7e1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8012d5e:	3300      	movi      	r3, 0
 8012d60:	2b00      	subi      	r3, 1
 8012d62:	e42e0018 	addi      	r1, r14, 25
 8012d66:	3201      	movi      	r2, 1
 8012d68:	6c13      	mov      	r0, r4
 8012d6a:	e3fff8db 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012d6e:	3201      	movi      	r2, 1
 8012d70:	ea210080 	movih      	r1, 128
 8012d74:	ea800187 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012d78:	e3fff7d2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012d7c:	3300      	movi      	r3, 0
 8012d7e:	2b44      	subi      	r3, 69
	ST7789_Select();
 8012d80:	3200      	movi      	r2, 0
 8012d82:	ea210080 	movih      	r1, 128
 8012d86:	ea800183 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012d8a:	dc6e0018 	st.b      	r3, (r14, 0x18)
 8012d8e:	e3fff7c7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012d92:	3200      	movi      	r2, 0
 8012d94:	ea210040 	movih      	r1, 64
 8012d98:	ea80017e 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012d9c:	e3fff7c0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012da0:	3300      	movi      	r3, 0
 8012da2:	2b00      	subi      	r3, 1
 8012da4:	1906      	addi      	r1, r14, 24
 8012da6:	3201      	movi      	r2, 1
 8012da8:	6c13      	mov      	r0, r4
 8012daa:	e3fff8bb 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012dae:	3201      	movi      	r2, 1
 8012db0:	ea210080 	movih      	r1, 128
 8012db4:	ea800177 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012db8:	e3fff7b2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012dbc:	3319      	movi      	r3, 25
	ST7789_Select();
 8012dbe:	3200      	movi      	r2, 0
 8012dc0:	ea210080 	movih      	r1, 128
 8012dc4:	ea800173 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012dc8:	dc6e0017 	st.b      	r3, (r14, 0x17)
 8012dcc:	e3fff7a8 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012dd0:	3201      	movi      	r2, 1
 8012dd2:	ea210040 	movih      	r1, 64
 8012dd6:	ea80016f 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012dda:	e3fff7a1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8012dde:	3300      	movi      	r3, 0
 8012de0:	2b00      	subi      	r3, 1
 8012de2:	e42e0016 	addi      	r1, r14, 23
 8012de6:	3201      	movi      	r2, 1
 8012de8:	6c13      	mov      	r0, r4
 8012dea:	e3fff89b 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012dee:	3201      	movi      	r2, 1
 8012df0:	ea210080 	movih      	r1, 128
 8012df4:	ea800167 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012df8:	e3fff792 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012dfc:	3300      	movi      	r3, 0
 8012dfe:	2b3f      	subi      	r3, 64
	ST7789_Select();
 8012e00:	3200      	movi      	r2, 0
 8012e02:	ea210080 	movih      	r1, 128
 8012e06:	ea800163 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012e0a:	dc6e0016 	st.b      	r3, (r14, 0x16)
 8012e0e:	e3fff787 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012e12:	3200      	movi      	r2, 0
 8012e14:	ea210040 	movih      	r1, 64
 8012e18:	ea80015e 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012e1c:	e3fff780 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012e20:	3300      	movi      	r3, 0
 8012e22:	2b00      	subi      	r3, 1
 8012e24:	e42e0015 	addi      	r1, r14, 22
 8012e28:	3201      	movi      	r2, 1
 8012e2a:	6c13      	mov      	r0, r4
 8012e2c:	e3fff87a 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012e30:	3201      	movi      	r2, 1
 8012e32:	ea210080 	movih      	r1, 128
 8012e36:	ea800157 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012e3a:	e3fff771 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012e3e:	ea11002c 	movi      	r17, 44
	ST7789_Select();
 8012e42:	3200      	movi      	r2, 0
 8012e44:	ea210080 	movih      	r1, 128
 8012e48:	ea800152 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012e4c:	de2e0015 	st.b      	r17, (r14, 0x15)
 8012e50:	e3fff766 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012e54:	3201      	movi      	r2, 1
 8012e56:	ea210040 	movih      	r1, 64
 8012e5a:	ea80014e 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012e5e:	e3fff75f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8012e62:	3300      	movi      	r3, 0
 8012e64:	2b00      	subi      	r3, 1
 8012e66:	e42e0014 	addi      	r1, r14, 21
 8012e6a:	3201      	movi      	r2, 1
 8012e6c:	6c13      	mov      	r0, r4
 8012e6e:	e3fff859 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012e72:	3201      	movi      	r2, 1
 8012e74:	ea210080 	movih      	r1, 128
 8012e78:	ea800146 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012e7c:	e3fff750 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012e80:	3300      	movi      	r3, 0
 8012e82:	2b3d      	subi      	r3, 62
	ST7789_Select();
 8012e84:	3200      	movi      	r2, 0
 8012e86:	ea210080 	movih      	r1, 128
 8012e8a:	ea800142 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012e8e:	dc6e0014 	st.b      	r3, (r14, 0x14)
 8012e92:	e3fff745 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012e96:	3200      	movi      	r2, 0
 8012e98:	ea210040 	movih      	r1, 64
 8012e9c:	ea80013d 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012ea0:	e3fff73e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012ea4:	3300      	movi      	r3, 0
 8012ea6:	2b00      	subi      	r3, 1
 8012ea8:	1905      	addi      	r1, r14, 20
 8012eaa:	3201      	movi      	r2, 1
 8012eac:	6c13      	mov      	r0, r4
 8012eae:	e3fff839 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012eb2:	3201      	movi      	r2, 1
 8012eb4:	ea210080 	movih      	r1, 128
 8012eb8:	ea800136 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012ebc:	e3fff730 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012ec0:	3301      	movi      	r3, 1
	ST7789_Select();
 8012ec2:	3200      	movi      	r2, 0
 8012ec4:	ea210080 	movih      	r1, 128
 8012ec8:	ea800132 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012ecc:	dc6e0013 	st.b      	r3, (r14, 0x13)
 8012ed0:	e3fff726 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012ed4:	3201      	movi      	r2, 1
 8012ed6:	ea210040 	movih      	r1, 64
 8012eda:	ea80012e 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012ede:	e3fff71f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8012ee2:	3300      	movi      	r3, 0
 8012ee4:	2b00      	subi      	r3, 1
 8012ee6:	e42e0012 	addi      	r1, r14, 19
 8012eea:	3201      	movi      	r2, 1
 8012eec:	6c13      	mov      	r0, r4
 8012eee:	e3fff819 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012ef2:	3201      	movi      	r2, 1
 8012ef4:	ea210080 	movih      	r1, 128
 8012ef8:	ea800126 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012efc:	e3fff710 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012f00:	3300      	movi      	r3, 0
 8012f02:	2b3c      	subi      	r3, 61
	ST7789_Select();
 8012f04:	3200      	movi      	r2, 0
 8012f06:	ea210080 	movih      	r1, 128
 8012f0a:	ea800122 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012f0e:	dc6e0012 	st.b      	r3, (r14, 0x12)
 8012f12:	e3fff705 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012f16:	3200      	movi      	r2, 0
 8012f18:	ea210040 	movih      	r1, 64
 8012f1c:	ea80011d 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012f20:	e3fff6fe 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012f24:	3300      	movi      	r3, 0
 8012f26:	2b00      	subi      	r3, 1
 8012f28:	e42e0011 	addi      	r1, r14, 18
 8012f2c:	3201      	movi      	r2, 1
 8012f2e:	6c13      	mov      	r0, r4
 8012f30:	e3fff7f8 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012f34:	3201      	movi      	r2, 1
 8012f36:	ea210080 	movih      	r1, 128
 8012f3a:	ea800116 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012f3e:	e3fff6ef 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012f42:	3312      	movi      	r3, 18
	ST7789_Select();
 8012f44:	3200      	movi      	r2, 0
 8012f46:	ea210080 	movih      	r1, 128
 8012f4a:	ea800112 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012f4e:	dc6e0011 	st.b      	r3, (r14, 0x11)
 8012f52:	e3fff6e5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012f56:	3201      	movi      	r2, 1
 8012f58:	ea210040 	movih      	r1, 64
 8012f5c:	ea80010d 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012f60:	e3fff6de 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8012f64:	3300      	movi      	r3, 0
 8012f66:	2b00      	subi      	r3, 1
 8012f68:	e42e0010 	addi      	r1, r14, 17
 8012f6c:	3201      	movi      	r2, 1
 8012f6e:	6c13      	mov      	r0, r4
 8012f70:	e3fff7d8 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012f74:	3201      	movi      	r2, 1
 8012f76:	ea210080 	movih      	r1, 128
 8012f7a:	ea800106 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012f7e:	e3fff6cf 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012f82:	3300      	movi      	r3, 0
 8012f84:	2b3b      	subi      	r3, 60
	ST7789_Select();
 8012f86:	3200      	movi      	r2, 0
 8012f88:	ea210080 	movih      	r1, 128
 8012f8c:	ea800101 	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012f90:	dc6e0010 	st.b      	r3, (r14, 0x10)
 8012f94:	e3fff6c4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8012f98:	3200      	movi      	r2, 0
 8012f9a:	ea210040 	movih      	r1, 64
 8012f9e:	0002      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012fa0:	e3fff6be 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8012fa4:	3300      	movi      	r3, 0
 8012fa6:	2b00      	subi      	r3, 1
 8012fa8:	1904      	addi      	r1, r14, 16
 8012faa:	3201      	movi      	r2, 1
 8012fac:	6c13      	mov      	r0, r4
 8012fae:	e3fff7b9 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012fb2:	3201      	movi      	r2, 1
 8012fb4:	ea210080 	movih      	r1, 128
 8012fb8:	0009      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012fba:	e3fff6b1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012fbe:	ea0b0020 	movi      	r11, 32
	ST7789_Select();
 8012fc2:	3200      	movi      	r2, 0
 8012fc4:	ea210080 	movih      	r1, 128
 8012fc8:	000d      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012fca:	dd6e000f 	st.b      	r11, (r14, 0xf)
 8012fce:	e3fff6a7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8012fd2:	3201      	movi      	r2, 1
 8012fd4:	ea210040 	movih      	r1, 64
 8012fd8:	0011      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012fda:	e3fff6a1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8012fde:	3300      	movi      	r3, 0
 8012fe0:	2b00      	subi      	r3, 1
 8012fe2:	e42e000e 	addi      	r1, r14, 15
 8012fe6:	3201      	movi      	r2, 1
 8012fe8:	6c13      	mov      	r0, r4
 8012fea:	e3fff79b 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8012fee:	3201      	movi      	r2, 1
 8012ff0:	ea210080 	movih      	r1, 128
 8012ff4:	0018      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8012ff6:	e3fff693 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8012ffa:	3300      	movi      	r3, 0
 8012ffc:	2b39      	subi      	r3, 58
	ST7789_Select();
 8012ffe:	3200      	movi      	r2, 0
 8013000:	ea210080 	movih      	r1, 128
 8013004:	001c      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013006:	dc6e000e 	st.b      	r3, (r14, 0xe)
 801300a:	e3fff689 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 801300e:	3200      	movi      	r2, 0
 8013010:	ea210040 	movih      	r1, 64
 8013014:	0100      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013016:	e3fff683 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 801301a:	3300      	movi      	r3, 0
 801301c:	2b00      	subi      	r3, 1
 801301e:	e42e000d 	addi      	r1, r14, 14
 8013022:	3201      	movi      	r2, 1
 8013024:	6c13      	mov      	r0, r4
 8013026:	e3fff77d 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801302a:	3201      	movi      	r2, 1
 801302c:	ea210080 	movih      	r1, 128
 8013030:	0107      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013032:	e3fff675 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013036:	330f      	movi      	r3, 15
	ST7789_Select();
 8013038:	3200      	movi      	r2, 0
 801303a:	ea210080 	movih      	r1, 128
 801303e:	010a      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013040:	dc6e000d 	st.b      	r3, (r14, 0xd)
 8013044:	e3fff66c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013048:	3201      	movi      	r2, 1
 801304a:	ea210040 	movih      	r1, 64
 801304e:	010e      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013050:	e3fff666 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8013054:	3300      	movi      	r3, 0
 8013056:	2b00      	subi      	r3, 1
 8013058:	e42e000c 	addi      	r1, r14, 13
 801305c:	3201      	movi      	r2, 1
 801305e:	6c13      	mov      	r0, r4
 8013060:	e3fff760 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
 8013064:	3500      	movi      	r5, 0
	ST7789_UnSelect();
 8013066:	3201      	movi      	r2, 1
 8013068:	ea210080 	movih      	r1, 128
 801306c:	0116      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801306e:	e3fff657 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013072:	2d2f      	subi      	r5, 48
	ST7789_Select();
 8013074:	3200      	movi      	r2, 0
 8013076:	ea210080 	movih      	r1, 128
 801307a:	0119      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801307c:	dcae000c 	st.b      	r5, (r14, 0xc)
 8013080:	e3fff64e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8013084:	3200      	movi      	r2, 0
 8013086:	ea210040 	movih      	r1, 64
 801308a:	011d      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801308c:	e3fff648 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8013090:	3300      	movi      	r3, 0
 8013092:	2b00      	subi      	r3, 1
 8013094:	1903      	addi      	r1, r14, 12
 8013096:	3201      	movi      	r2, 1
 8013098:	6c13      	mov      	r0, r4
 801309a:	e3fff743 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801309e:	3201      	movi      	r2, 1
 80130a0:	ea210080 	movih      	r1, 128
 80130a4:	0204      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80130a6:	e3fff63b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80130aa:	3300      	movi      	r3, 0
 80130ac:	2b5b      	subi      	r3, 92
	ST7789_Select();
 80130ae:	3200      	movi      	r2, 0
 80130b0:	ea210080 	movih      	r1, 128
 80130b4:	0208      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80130b6:	dc6e000b 	st.b      	r3, (r14, 0xb)
 80130ba:	e3fff631 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80130be:	3201      	movi      	r2, 1
 80130c0:	ea210040 	movih      	r1, 64
 80130c4:	020c      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80130c6:	e3fff62b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 80130ca:	3300      	movi      	r3, 0
 80130cc:	2b00      	subi      	r3, 1
 80130ce:	e42e000a 	addi      	r1, r14, 11
 80130d2:	3201      	movi      	r2, 1
 80130d4:	6c13      	mov      	r0, r4
 80130d6:	e3fff725 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80130da:	3201      	movi      	r2, 1
 80130dc:	ea210080 	movih      	r1, 128
 80130e0:	0213      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80130e2:	e3fff61d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80130e6:	3300      	movi      	r3, 0
 80130e8:	2b5e      	subi      	r3, 95
	ST7789_Select();
 80130ea:	3200      	movi      	r2, 0
 80130ec:	ea210080 	movih      	r1, 128
 80130f0:	0217      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80130f2:	dc6e000a 	st.b      	r3, (r14, 0xa)
 80130f6:	e3fff613 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80130fa:	3201      	movi      	r2, 1
 80130fc:	ea210040 	movih      	r1, 64
 8013100:	021b      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013102:	e3fff60d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &data, sizeof(data), HAL_MAX_DELAY);
 8013106:	3300      	movi      	r3, 0
 8013108:	2b00      	subi      	r3, 1
 801310a:	e42e0009 	addi      	r1, r14, 10
 801310e:	3201      	movi      	r2, 1
 8013110:	6c13      	mov      	r0, r4
 8013112:	e3fff707 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013116:	3201      	movi      	r2, 1
 8013118:	ea210080 	movih      	r1, 128
 801311c:	0302      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801311e:	e3fff5ff 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013122:	3300      	movi      	r3, 0
 8013124:	2b1f      	subi      	r3, 32
	ST7789_Select();
 8013126:	3200      	movi      	r2, 0
 8013128:	ea210080 	movih      	r1, 128
 801312c:	0306      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801312e:	dc6e0009 	st.b      	r3, (r14, 0x9)
 8013132:	e3fff5f5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8013136:	3200      	movi      	r2, 0
 8013138:	ea210040 	movih      	r1, 64
 801313c:	030a      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801313e:	e3fff5ef 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8013142:	3300      	movi      	r3, 0
 8013144:	2b00      	subi      	r3, 1
 8013146:	e42e0008 	addi      	r1, r14, 9
 801314a:	3201      	movi      	r2, 1
 801314c:	6c13      	mov      	r0, r4
 801314e:	e3fff6e9 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013152:	3201      	movi      	r2, 1
 8013154:	ea210080 	movih      	r1, 128
 8013158:	0311      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801315a:	e3fff5e1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		uint8_t data[] = {0xD0, 0x04, 0x0D, 0x11, 0x13, 0x2B, 0x3F, 0x54, 0x4C, 0x18, 0x0D, 0x0B, 0x1F, 0x23};
 801315e:	322b      	movi      	r2, 43
 8013160:	dc4e0025 	st.b      	r2, (r14, 0x25)
 8013164:	3254      	movi      	r2, 84
 8013166:	dc4e0027 	st.b      	r2, (r14, 0x27)
 801316a:	324c      	movi      	r2, 76
 801316c:	330d      	movi      	r3, 13
 801316e:	dc4e0028 	st.b      	r2, (r14, 0x28)
 8013172:	3218      	movi      	r2, 24
 8013174:	ea0c0004 	movi      	r12, 4
 8013178:	3711      	movi      	r7, 17
 801317a:	3613      	movi      	r6, 19
 801317c:	ea08001f 	movi      	r8, 31
 8013180:	dc6e0022 	st.b      	r3, (r14, 0x22)
 8013184:	ea10003f 	movi      	r16, 63
 8013188:	dc4e0029 	st.b      	r2, (r14, 0x29)
 801318c:	dc6e002a 	st.b      	r3, (r14, 0x2a)
 8013190:	ea0a0023 	movi      	r10, 35
 8013194:	330b      	movi      	r3, 11
	ST7789_Select();
 8013196:	3200      	movi      	r2, 0
 8013198:	ea210080 	movih      	r1, 128
 801319c:	131d      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
		uint8_t data[] = {0xD0, 0x04, 0x0D, 0x11, 0x13, 0x2B, 0x3F, 0x54, 0x4C, 0x18, 0x0D, 0x0B, 0x1F, 0x23};
 801319e:	dd8e0021 	st.b      	r12, (r14, 0x21)
 80131a2:	dd8e2000 	st.w      	r12, (r14, 0x0)
 80131a6:	dc6e002b 	st.b      	r3, (r14, 0x2b)
 80131aa:	dcae0020 	st.b      	r5, (r14, 0x20)
 80131ae:	dcee0023 	st.b      	r7, (r14, 0x23)
 80131b2:	dcce0024 	st.b      	r6, (r14, 0x24)
 80131b6:	de0e0026 	st.b      	r16, (r14, 0x26)
 80131ba:	dd0e002c 	st.b      	r8, (r14, 0x2c)
 80131be:	dd4e002d 	st.b      	r10, (r14, 0x2d)
	ST7789_Select();
 80131c2:	e3fff5ad 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80131c6:	3201      	movi      	r2, 1
 80131c8:	ea210040 	movih      	r1, 64
 80131cc:	1311      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80131ce:	e3fff5a7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80131d2:	3300      	movi      	r3, 0
 80131d4:	2b00      	subi      	r3, 1
 80131d6:	1908      	addi      	r1, r14, 32
 80131d8:	320e      	movi      	r2, 14
 80131da:	6c13      	mov      	r0, r4
 80131dc:	e3fff6a2 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80131e0:	3201      	movi      	r2, 1
 80131e2:	ea210080 	movih      	r1, 128
 80131e6:	130b      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80131e8:	e3fff59a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80131ec:	3300      	movi      	r3, 0
 80131ee:	2b1e      	subi      	r3, 31
	ST7789_Select();
 80131f0:	3200      	movi      	r2, 0
 80131f2:	ea210080 	movih      	r1, 128
 80131f6:	1307      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80131f8:	dc6e0008 	st.b      	r3, (r14, 0x8)
 80131fc:	e3fff590 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8013200:	3200      	movi      	r2, 0
 8013202:	ea210040 	movih      	r1, 64
 8013206:	1303      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013208:	e3fff58a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 801320c:	3300      	movi      	r3, 0
 801320e:	2b00      	subi      	r3, 1
 8013210:	1902      	addi      	r1, r14, 8
 8013212:	3201      	movi      	r2, 1
 8013214:	6c13      	mov      	r0, r4
 8013216:	e3fff685 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801321a:	3201      	movi      	r2, 1
 801321c:	ea210080 	movih      	r1, 128
 8013220:	121c      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013222:	e3fff57d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		uint8_t data[] = {0xD0, 0x04, 0x0C, 0x11, 0x13, 0x2C, 0x3F, 0x44, 0x51, 0x2F, 0x1F, 0x1F, 0x20, 0x23};
 8013226:	3344      	movi      	r3, 68
 8013228:	dc6e0027 	st.b      	r3, (r14, 0x27)
 801322c:	3351      	movi      	r3, 81
 801322e:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8013232:	dc6e0028 	st.b      	r3, (r14, 0x28)
	ST7789_Select();
 8013236:	3200      	movi      	r2, 0
		uint8_t data[] = {0xD0, 0x04, 0x0C, 0x11, 0x13, 0x2C, 0x3F, 0x44, 0x51, 0x2F, 0x1F, 0x1F, 0x20, 0x23};
 8013238:	332f      	movi      	r3, 47
	ST7789_Select();
 801323a:	ea210080 	movih      	r1, 128
 801323e:	1215      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
		uint8_t data[] = {0xD0, 0x04, 0x0C, 0x11, 0x13, 0x2C, 0x3F, 0x44, 0x51, 0x2F, 0x1F, 0x1F, 0x20, 0x23};
 8013240:	dd8e0021 	st.b      	r12, (r14, 0x21)
 8013244:	dc6e0029 	st.b      	r3, (r14, 0x29)
 8013248:	dcae0020 	st.b      	r5, (r14, 0x20)
 801324c:	dd2e0022 	st.b      	r9, (r14, 0x22)
 8013250:	dcee0023 	st.b      	r7, (r14, 0x23)
 8013254:	dcce0024 	st.b      	r6, (r14, 0x24)
 8013258:	de2e0025 	st.b      	r17, (r14, 0x25)
 801325c:	de0e0026 	st.b      	r16, (r14, 0x26)
 8013260:	dd0e002a 	st.b      	r8, (r14, 0x2a)
 8013264:	dd0e002b 	st.b      	r8, (r14, 0x2b)
 8013268:	dd6e002c 	st.b      	r11, (r14, 0x2c)
 801326c:	dd4e002d 	st.b      	r10, (r14, 0x2d)
	ST7789_Select();
 8013270:	e3fff556 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013274:	3201      	movi      	r2, 1
 8013276:	ea210040 	movih      	r1, 64
 801327a:	1206      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801327c:	e3fff550 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013280:	3300      	movi      	r3, 0
 8013282:	2b00      	subi      	r3, 1
 8013284:	1908      	addi      	r1, r14, 32
 8013286:	320e      	movi      	r2, 14
 8013288:	6c13      	mov      	r0, r4
 801328a:	e3fff64b 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801328e:	3201      	movi      	r2, 1
 8013290:	ea210080 	movih      	r1, 128
 8013294:	111f      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013296:	e3fff543 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 801329a:	3321      	movi      	r3, 33
	ST7789_Select();
 801329c:	3200      	movi      	r2, 0
 801329e:	ea210080 	movih      	r1, 128
 80132a2:	111c      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80132a4:	dc6e0020 	st.b      	r3, (r14, 0x20)
 80132a8:	e3fff53a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 80132ac:	3200      	movi      	r2, 0
 80132ae:	ea210040 	movih      	r1, 64
 80132b2:	1118      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80132b4:	e3fff534 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 80132b8:	3300      	movi      	r3, 0
 80132ba:	2b00      	subi      	r3, 1
 80132bc:	1908      	addi      	r1, r14, 32
 80132be:	3201      	movi      	r2, 1
 80132c0:	6c13      	mov      	r0, r4
 80132c2:	e3fff62f 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80132c6:	3201      	movi      	r2, 1
 80132c8:	ea210080 	movih      	r1, 128
 80132cc:	1111      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80132ce:	e3fff527 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80132d2:	3200      	movi      	r2, 0
 80132d4:	ea210080 	movih      	r1, 128
 80132d8:	110e      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80132da:	dcee0007 	st.b      	r7, (r14, 0x7)
 80132de:	e3fff51f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 80132e2:	3200      	movi      	r2, 0
 80132e4:	ea210040 	movih      	r1, 64
 80132e8:	110a      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 80132ea:	e3fff519 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 80132ee:	3300      	movi      	r3, 0
 80132f0:	2b00      	subi      	r3, 1
 80132f2:	e42e0006 	addi      	r1, r14, 7
 80132f6:	3201      	movi      	r2, 1
 80132f8:	6c13      	mov      	r0, r4
 80132fa:	e3fff613 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80132fe:	3201      	movi      	r2, 1
 8013300:	ea210080 	movih      	r1, 128
 8013304:	1103      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013306:	e3fff50b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 801330a:	3200      	movi      	r2, 0
 801330c:	ea210080 	movih      	r1, 128
 8013310:	1100      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013312:	dcce0006 	st.b      	r6, (r14, 0x6)
 8013316:	e3fff503 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 801331a:	3200      	movi      	r2, 0
 801331c:	ea210040 	movih      	r1, 64
 8013320:	101c      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013322:	e3fff4fd 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8013326:	3300      	movi      	r3, 0
 8013328:	2b00      	subi      	r3, 1
 801332a:	e42e0005 	addi      	r1, r14, 6
 801332e:	3201      	movi      	r2, 1
 8013330:	6c13      	mov      	r0, r4
 8013332:	e3fff5f7 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013336:	3201      	movi      	r2, 1
 8013338:	ea210080 	movih      	r1, 128
 801333c:	1015      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801333e:	e3fff4ef 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013342:	3329      	movi      	r3, 41
	ST7789_Select();
 8013344:	3200      	movi      	r2, 0
 8013346:	ea210080 	movih      	r1, 128
 801334a:	1012      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801334c:	dc6e0005 	st.b      	r3, (r14, 0x5)
 8013350:	e3fff4e6 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8013354:	3200      	movi      	r2, 0
 8013356:	ea210040 	movih      	r1, 64
 801335a:	100e      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 801335c:	e3fff4e0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8013360:	3300      	movi      	r3, 0
 8013362:	2b00      	subi      	r3, 1
 8013364:	e42e0004 	addi      	r1, r14, 5
 8013368:	3201      	movi      	r2, 1
 801336a:	6c13      	mov      	r0, r4
 801336c:	e3fff5da 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013370:	3201      	movi      	r2, 1
 8013372:	ea210080 	movih      	r1, 128
 8013376:	1007      	lrw      	r0, 0x40011400	// 8013390 <ST7789_Init+0x860>
 8013378:	e3fff4d2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_Delay(50);
 801337c:	3032      	movi      	r0, 50
 801337e:	e3fff56f 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(BLACK);				//	Fill with Black.
 8013382:	3000      	movi      	r0, 0
 8013384:	e3fffb8c 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
}
 8013388:	140c      	addi      	r14, r14, 48
 801338a:	ebc00058 	pop      	r4-r11, r15, r16-r17
 801338e:	0000      	.short	0x0000
 8013390:	40011400 	.long	0x40011400
 8013394:	200018b4 	.long	0x200018b4

08013398 <ST7789_DrawPixel>:
{
 8013398:	14d1      	push      	r4, r15
 801339a:	1421      	subi      	r14, r14, 4
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 801339c:	eb0000ef 	cmphsi      	r0, 240
{
 80133a0:	6cc7      	mov      	r3, r1
 80133a2:	6d0b      	mov      	r4, r2
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80133a4:	0804      	bt      	0x80133ac	// 80133ac <ST7789_DrawPixel+0x14>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80133a6:	eb0100ef 	cmphsi      	r1, 240
 80133aa:	0c03      	bf      	0x80133b0	// 80133b0 <ST7789_DrawPixel+0x18>
}
 80133ac:	1401      	addi      	r14, r14, 4
 80133ae:	1491      	pop      	r4, r15
	ST7789_SetAddressWindow(x, y, x, y);
 80133b0:	6c83      	mov      	r2, r0
 80133b2:	e3fffabd 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80133b6:	4c68      	lsri      	r3, r4, 8
	ST7789_Select();
 80133b8:	3200      	movi      	r2, 0
 80133ba:	ea210080 	movih      	r1, 128
 80133be:	1015      	lrw      	r0, 0x40011400	// 8013410 <ST7789_DrawPixel+0x78>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80133c0:	dc6e0000 	st.b      	r3, (r14, 0x0)
 80133c4:	dc8e0001 	st.b      	r4, (r14, 0x1)
	ST7789_Select();
 80133c8:	e3fff4aa 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80133cc:	3200      	movi      	r2, 0
 80133ce:	ea210080 	movih      	r1, 128
 80133d2:	1010      	lrw      	r0, 0x40011400	// 8013410 <ST7789_DrawPixel+0x78>
 80133d4:	e3fff4a4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80133d8:	3201      	movi      	r2, 1
 80133da:	ea210040 	movih      	r1, 64
 80133de:	100d      	lrw      	r0, 0x40011400	// 8013410 <ST7789_DrawPixel+0x78>
 80133e0:	e3fff49e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80133e4:	3300      	movi      	r3, 0
 80133e6:	2b00      	subi      	r3, 1
 80133e8:	6c7b      	mov      	r1, r14
 80133ea:	3202      	movi      	r2, 2
 80133ec:	100a      	lrw      	r0, 0x200018b4	// 8013414 <ST7789_DrawPixel+0x7c>
 80133ee:	e3fff599 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80133f2:	3201      	movi      	r2, 1
 80133f4:	ea210080 	movih      	r1, 128
 80133f8:	1006      	lrw      	r0, 0x40011400	// 8013410 <ST7789_DrawPixel+0x78>
 80133fa:	e3fff491 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 80133fe:	3201      	movi      	r2, 1
 8013400:	ea210080 	movih      	r1, 128
 8013404:	1003      	lrw      	r0, 0x40011400	// 8013410 <ST7789_DrawPixel+0x78>
 8013406:	e3fff48b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 801340a:	1401      	addi      	r14, r14, 4
 801340c:	1491      	pop      	r4, r15
 801340e:	0000      	.short	0x0000
 8013410:	40011400 	.long	0x40011400
 8013414:	200018b4 	.long	0x200018b4

08013418 <ST7789_DrawLine>:
        uint16_t color) {
 8013418:	ebe00058 	push      	r4-r11, r15, r16-r17
 801341c:	1424      	subi      	r14, r14, 16
    uint16_t steep = ABS(y1 - y0) > ABS(x1 - x0);
 801341e:	c4230090 	subu      	r16, r3, r1
 8013422:	c4020091 	subu      	r17, r2, r0
 8013426:	c4100210 	abs      	r16, r16
 801342a:	c4110211 	abs      	r17, r17
    if (steep) {
 801342e:	c6110440 	cmplt      	r17, r16
        uint16_t color) {
 8013432:	6d0f      	mov      	r4, r3
    uint16_t steep = ABS(y1 - y0) > ABS(x1 - x0);
 8013434:	6f0f      	mov      	r12, r3
        uint16_t color) {
 8013436:	6ec7      	mov      	r11, r1
 8013438:	6e8b      	mov      	r10, r2
 801343a:	d8ce101e 	ld.h      	r6, (r14, 0x3c)
    uint16_t steep = ABS(y1 - y0) > ABS(x1 - x0);
 801343e:	6cc3      	mov      	r3, r0
    if (steep) {
 8013440:	0898      	bt      	0x8013570	// 8013570 <ST7789_DrawLine+0x158>
 8013442:	6c93      	mov      	r2, r4
 8013444:	6ec3      	mov      	r11, r0
 8013446:	6d2b      	mov      	r4, r10
 8013448:	c410482d 	lsli      	r13, r16, 0
 801344c:	6cc7      	mov      	r3, r1
 801344e:	6eb3      	mov      	r10, r12
 8013450:	6c07      	mov      	r0, r1
    if (x0 > x1) {
 8013452:	66d0      	cmphs      	r4, r11
 8013454:	087d      	bt      	0x801354e	// 801354e <ST7789_DrawLine+0x136>
    dx = x1 - x0;
 8013456:	c48b0092 	subu      	r18, r11, r4
 801345a:	c41255e9 	zext      	r9, r18, 15, 0
 801345e:	c443008d 	subu      	r13, r3, r2
    int16_t err = dx / 2;
 8013462:	74e7      	sexth      	r3, r9
 8013464:	4bbf      	lsri      	r5, r3, 31
    if (y0 < y1) {
 8013466:	6428      	cmphs      	r10, r0
    int16_t err = dx / 2;
 8013468:	614c      	addu      	r5, r3
 801346a:	c40d020d 	abs      	r13, r13
 801346e:	55a1      	asri      	r5, r5, 1
    if (y0 < y1) {
 8013470:	0883      	bt      	0x8013576	// 8013576 <ST7789_DrawLine+0x15e>
 8013472:	ea080001 	movi      	r8, 1
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013476:	4e68      	lsri      	r3, r6, 8
 8013478:	b860      	st.w      	r3, (r14, 0x0)
 801347a:	7775      	zexth      	r13, r13
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801347c:	1261      	lrw      	r3, 0x200018b4	// 8013580 <ST7789_DrawLine+0x168>
	ST7789_Select();
 801347e:	12e2      	lrw      	r7, 0x40011400	// 8013584 <ST7789_DrawLine+0x16c>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013480:	b861      	st.w      	r3, (r14, 0x4)
 8013482:	0410      	br      	0x80134a2	// 80134a2 <ST7789_DrawLine+0x8a>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013484:	eb0a00ef 	cmphsi      	r10, 240
 8013488:	0804      	bt      	0x8013490	// 8013490 <ST7789_DrawLine+0x78>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 801348a:	eb0400ef 	cmphsi      	r4, 240
 801348e:	0c59      	bf      	0x8013540	// 8013540 <ST7789_DrawLine+0x128>
        err -= dy;
 8013490:	6176      	subu      	r5, r13
 8013492:	7715      	zexth      	r12, r5
 8013494:	7573      	sexth      	r5, r12
        if (err < 0) {
 8013496:	e9850049 	blz      	r5, 0x8013528	// 8013528 <ST7789_DrawLine+0x110>
    for (; x0<=x1; x0++) {
 801349a:	2400      	addi      	r4, 1
 801349c:	7511      	zexth      	r4, r4
 801349e:	652c      	cmphs      	r11, r4
 80134a0:	0c4d      	bf      	0x801353a	// 801353a <ST7789_DrawLine+0x122>
        if (steep) {
 80134a2:	c6110440 	cmplt      	r17, r16
 80134a6:	0bef      	bt      	0x8013484	// 8013484 <ST7789_DrawLine+0x6c>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80134a8:	eb0400ef 	cmphsi      	r4, 240
 80134ac:	0bf2      	bt      	0x8013490	// 8013490 <ST7789_DrawLine+0x78>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80134ae:	eb0a00ef 	cmphsi      	r10, 240
 80134b2:	0bef      	bt      	0x8013490	// 8013490 <ST7789_DrawLine+0x78>
 80134b4:	ddae2002 	st.w      	r13, (r14, 0x8)
	ST7789_SetAddressWindow(x, y, x, y);
 80134b8:	6ceb      	mov      	r3, r10
 80134ba:	6c93      	mov      	r2, r4
 80134bc:	6c6b      	mov      	r1, r10
 80134be:	6c13      	mov      	r0, r4
 80134c0:	e3fffa36 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80134c4:	d86e0000 	ld.b      	r3, (r14, 0x0)
	ST7789_Select();
 80134c8:	3200      	movi      	r2, 0
 80134ca:	ea210080 	movih      	r1, 128
 80134ce:	6c1f      	mov      	r0, r7
	uint8_t data[] = {color >> 8, color & 0xFF};
 80134d0:	dc6e000c 	st.b      	r3, (r14, 0xc)
 80134d4:	dcce000d 	st.b      	r6, (r14, 0xd)
	ST7789_Select();
 80134d8:	e3fff422 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80134dc:	3200      	movi      	r2, 0
 80134de:	ea210080 	movih      	r1, 128
 80134e2:	6c1f      	mov      	r0, r7
 80134e4:	e3fff41c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80134e8:	3201      	movi      	r2, 1
 80134ea:	ea210040 	movih      	r1, 64
 80134ee:	6c1f      	mov      	r0, r7
 80134f0:	e3fff416 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80134f4:	3300      	movi      	r3, 0
 80134f6:	2b00      	subi      	r3, 1
 80134f8:	3202      	movi      	r2, 2
 80134fa:	1903      	addi      	r1, r14, 12
 80134fc:	9801      	ld.w      	r0, (r14, 0x4)
 80134fe:	e3fff511 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013502:	3201      	movi      	r2, 1
 8013504:	ea210080 	movih      	r1, 128
 8013508:	6c1f      	mov      	r0, r7
 801350a:	e3fff409 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801350e:	3201      	movi      	r2, 1
 8013510:	ea210080 	movih      	r1, 128
 8013514:	6c1f      	mov      	r0, r7
 8013516:	e3fff403 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 801351a:	d9ae2002 	ld.w      	r13, (r14, 0x8)
        err -= dy;
 801351e:	6176      	subu      	r5, r13
 8013520:	7715      	zexth      	r12, r5
 8013522:	7573      	sexth      	r5, r12
        if (err < 0) {
 8013524:	e9a5ffbb 	bhsz      	r5, 0x801349a	// 801349a <ST7789_DrawLine+0x82>
    for (; x0<=x1; x0++) {
 8013528:	2400      	addi      	r4, 1
 801352a:	7511      	zexth      	r4, r4
 801352c:	652c      	cmphs      	r11, r4
            y0 += ystep;
 801352e:	62a0      	addu      	r10, r8
            err += dx;
 8013530:	c52c0025 	addu      	r5, r12, r9
            y0 += ystep;
 8013534:	76a9      	zexth      	r10, r10
            err += dx;
 8013536:	7557      	sexth      	r5, r5
    for (; x0<=x1; x0++) {
 8013538:	0bb5      	bt      	0x80134a2	// 80134a2 <ST7789_DrawLine+0x8a>
}
 801353a:	1404      	addi      	r14, r14, 16
 801353c:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8013540:	ddae2002 	st.w      	r13, (r14, 0x8)
	ST7789_SetAddressWindow(x, y, x, y);
 8013544:	6cd3      	mov      	r3, r4
 8013546:	6cab      	mov      	r2, r10
 8013548:	6c53      	mov      	r1, r4
 801354a:	6c2b      	mov      	r0, r10
 801354c:	07ba      	br      	0x80134c0	// 80134c0 <ST7789_DrawLine+0xa8>
    dx = x1 - x0;
 801354e:	c5640092 	subu      	r18, r4, r11
 8013552:	c41255e9 	zext      	r9, r18, 15, 0
    int16_t err = dx / 2;
 8013556:	74e7      	sexth      	r3, r9
 8013558:	4bbf      	lsri      	r5, r3, 31
    if (y0 < y1) {
 801355a:	6680      	cmphs      	r0, r10
    int16_t err = dx / 2;
 801355c:	614c      	addu      	r5, r3
    if (y0 < y1) {
 801355e:	6cef      	mov      	r3, r11
    int16_t err = dx / 2;
 8013560:	55a1      	asri      	r5, r5, 1
    if (y0 < y1) {
 8013562:	6ed3      	mov      	r11, r4
 8013564:	6e83      	mov      	r10, r0
 8013566:	6d0f      	mov      	r4, r3
 8013568:	0f85      	bf      	0x8013472	// 8013472 <ST7789_DrawLine+0x5a>
 801356a:	ea08ffff 	movi      	r8, 65535
 801356e:	0784      	br      	0x8013476	// 8013476 <ST7789_DrawLine+0x5e>
 8013570:	c411482d 	lsli      	r13, r17, 0
 8013574:	076f      	br      	0x8013452	// 8013452 <ST7789_DrawLine+0x3a>
    for (; x0<=x1; x0++) {
 8013576:	652c      	cmphs      	r11, r4
 8013578:	0fe1      	bf      	0x801353a	// 801353a <ST7789_DrawLine+0x122>
    if (y0 < y1) {
 801357a:	ea08ffff 	movi      	r8, 65535
 801357e:	077c      	br      	0x8013476	// 8013476 <ST7789_DrawLine+0x5e>
 8013580:	200018b4 	.long	0x200018b4
 8013584:	40011400 	.long	0x40011400

08013588 <ST7789_DrawRectangle>:
{
 8013588:	ebe00058 	push      	r4-r11, r15, r16-r17
 801358c:	1429      	subi      	r14, r14, 36
 801358e:	6d43      	mov      	r5, r0
 8013590:	6d0b      	mov      	r4, r2
 8013592:	c4014831 	lsli      	r17, r1, 0
	ST7789_Select();
 8013596:	3200      	movi      	r2, 0
 8013598:	ea210080 	movih      	r1, 128
 801359c:	000f      	lrw      	r0, 0x40011400	// 801395c <ST7789_DrawRectangle+0x3d4>
{
 801359e:	6e4f      	mov      	r9, r3
 80135a0:	d90e1028 	ld.h      	r8, (r14, 0x50)
	ST7789_Select();
 80135a4:	e3fff3bc 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    if (x0 > x1) {
 80135a8:	6550      	cmphs      	r4, r5
 80135aa:	e8600246 	bt      	0x8013a36	// 8013a36 <ST7789_DrawRectangle+0x4ae>
 80135ae:	c4054832 	lsli      	r18, r5, 0
 80135b2:	6d93      	mov      	r6, r4
    dx = x1 - x0;
 80135b4:	c4d20093 	subu      	r19, r18, r6
 80135b8:	c41355f3 	zext      	r19, r19, 15, 0
    int16_t err = dx / 2;
 80135bc:	c41359e3 	sext      	r3, r19, 15, 0
 80135c0:	c7e3484a 	lsri      	r10, r3, 31
 80135c4:	628c      	addu      	r10, r3
 80135c6:	c42a488a 	asri      	r10, r10, 1
	uint8_t data[] = {color >> 8, color & 0xFF};
 80135ca:	c5084843 	lsri      	r3, r8, 8
 80135ce:	b860      	st.w      	r3, (r14, 0x0)
    int16_t err = dx / 2;
 80135d0:	6f2b      	mov      	r12, r10
	uint8_t data[] = {color >> 8, color & 0xFF};
 80135d2:	6ddb      	mov      	r7, r6
 80135d4:	c4114834 	lsli      	r20, r17, 0
	ST7789_Select();
 80135d8:	ea8b00e1 	lrw      	r11, 0x40011400	// 801395c <ST7789_DrawRectangle+0x3d4>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80135dc:	ea9000e1 	lrw      	r16, 0x200018b4	// 8013960 <ST7789_DrawRectangle+0x3d8>
 80135e0:	0406      	br      	0x80135ec	// 80135ec <ST7789_DrawRectangle+0x64>
    for (; x0<=x1; x0++) {
 80135e2:	2700      	addi      	r7, 1
 80135e4:	75dd      	zexth      	r7, r7
 80135e6:	c4f20420 	cmphs      	r18, r7
 80135ea:	0c15      	bf      	0x8013614	// 8013614 <ST7789_DrawRectangle+0x8c>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80135ec:	eb0700ef 	cmphsi      	r7, 240
 80135f0:	0804      	bt      	0x80135f8	// 80135f8 <ST7789_DrawRectangle+0x70>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80135f2:	eb1400ef 	cmphsi      	r20, 240
 80135f6:	0c69      	bf      	0x80136c8	// 80136c8 <ST7789_DrawRectangle+0x140>
        if (err < 0) {
 80135f8:	e9acfff5 	bhsz      	r12, 0x80135e2	// 80135e2 <ST7789_DrawRectangle+0x5a>
    for (; x0<=x1; x0++) {
 80135fc:	2700      	addi      	r7, 1
 80135fe:	75dd      	zexth      	r7, r7
 8013600:	c4f20420 	cmphs      	r18, r7
            y0 += ystep;
 8013604:	e6941000 	subi      	r20, r20, 1
            err += dx;
 8013608:	c593002c 	addu      	r12, r19, r12
            y0 += ystep;
 801360c:	c41455f4 	zext      	r20, r20, 15, 0
            err += dx;
 8013610:	7733      	sexth      	r12, r12
    for (; x0<=x1; x0++) {
 8013612:	0bed      	bt      	0x80135ec	// 80135ec <ST7789_DrawRectangle+0x64>
    uint16_t steep = ABS(y1 - y0) > ABS(x1 - x0);
 8013614:	c6290087 	subu      	r7, r9, r17
    if (steep) {
 8013618:	c5310480 	cmpne      	r17, r9
    uint16_t steep = ABS(y1 - y0) > ABS(x1 - x0);
 801361c:	c4070203 	abs      	r3, r7
 8013620:	b861      	st.w      	r3, (r14, 0x4)
    if (steep) {
 8013622:	0cd4      	bf      	0x80137ca	// 80137ca <ST7789_DrawRectangle+0x242>
    if (x0 > x1) {
 8013624:	c6290420 	cmphs      	r9, r17
 8013628:	e860021c 	bt      	0x8013a60	// 8013a60 <ST7789_DrawRectangle+0x4d8>
 801362c:	c4114827 	lsli      	r7, r17, 0
 8013630:	6ce7      	mov      	r3, r9
    dx = x1 - x0;
 8013632:	c4670097 	subu      	r23, r7, r3
 8013636:	c41755f7 	zext      	r23, r23, 15, 0
    int16_t err = dx / 2;
 801363a:	c41759f8 	sext      	r24, r23, 15, 0
 801363e:	c7f8484c 	lsri      	r12, r24, 31
    for (; x0<=x1; x0++) {
 8013642:	64dc      	cmphs      	r7, r3
    int16_t err = dx / 2;
 8013644:	c70c002c 	addu      	r12, r12, r24
 8013648:	c42c4890 	asri      	r16, r12, 1
    for (; x0<=x1; x0++) {
 801364c:	e8600204 	bt      	0x8013a54	// 8013a54 <ST7789_DrawRectangle+0x4cc>
    int16_t err = dx / 2;
 8013650:	c4094830 	lsli      	r16, r9, 0
	ST7789_Select();
 8013654:	01bd      	lrw      	r5, 0x40011400	// 801395c <ST7789_DrawRectangle+0x3d4>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013656:	ea8b00c3 	lrw      	r11, 0x200018b4	// 8013960 <ST7789_DrawRectangle+0x3d8>
 801365a:	0406      	br      	0x8013666	// 8013666 <ST7789_DrawRectangle+0xde>
    for (; x0<=x1; x0++) {
 801365c:	2600      	addi      	r6, 1
 801365e:	7599      	zexth      	r6, r6
 8013660:	c4d20420 	cmphs      	r18, r6
 8013664:	0c15      	bf      	0x801368e	// 801368e <ST7789_DrawRectangle+0x106>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013666:	eb0600ef 	cmphsi      	r6, 240
 801366a:	0804      	bt      	0x8013672	// 8013672 <ST7789_DrawRectangle+0xea>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 801366c:	eb1000ef 	cmphsi      	r16, 240
 8013670:	0c71      	bf      	0x8013752	// 8013752 <ST7789_DrawRectangle+0x1ca>
        if (err < 0) {
 8013672:	e9aafff5 	bhsz      	r10, 0x801365c	// 801365c <ST7789_DrawRectangle+0xd4>
    for (; x0<=x1; x0++) {
 8013676:	2600      	addi      	r6, 1
 8013678:	7599      	zexth      	r6, r6
 801367a:	c4d20420 	cmphs      	r18, r6
            y0 += ystep;
 801367e:	e6101000 	subi      	r16, r16, 1
            err += dx;
 8013682:	c553002a 	addu      	r10, r19, r10
            y0 += ystep;
 8013686:	c41055f0 	zext      	r16, r16, 15, 0
            err += dx;
 801368a:	76ab      	sexth      	r10, r10
    for (; x0<=x1; x0++) {
 801368c:	0bed      	bt      	0x8013666	// 8013666 <ST7789_DrawRectangle+0xde>
    if (steep) {
 801368e:	c5310480 	cmpne      	r17, r9
 8013692:	0d69      	bf      	0x8013964	// 8013964 <ST7789_DrawRectangle+0x3dc>
    if (x0 > x1) {
 8013694:	c6290420 	cmphs      	r9, r17
 8013698:	09d9      	bt      	0x8013a4a	// 8013a4a <ST7789_DrawRectangle+0x4c2>
 801369a:	c4114830 	lsli      	r16, r17, 0
 801369e:	6ce7      	mov      	r3, r9
    dx = x1 - x0;
 80136a0:	c4700092 	subu      	r18, r16, r3
 80136a4:	c41255ea 	zext      	r10, r18, 15, 0
    int16_t err = dx / 2;
 80136a8:	74ab      	sexth      	r2, r10
 80136aa:	4abf      	lsri      	r5, r2, 31
    for (; x0<=x1; x0++) {
 80136ac:	c4700420 	cmphs      	r16, r3
    int16_t err = dx / 2;
 80136b0:	6148      	addu      	r5, r2
 80136b2:	55a1      	asri      	r5, r5, 1
    for (; x0<=x1; x0++) {
 80136b4:	09c6      	bt      	0x8013a40	// 8013a40 <ST7789_DrawRectangle+0x4b8>
	ST7789_UnSelect();
 80136b6:	3201      	movi      	r2, 1
 80136b8:	ea210080 	movih      	r1, 128
 80136bc:	0217      	lrw      	r0, 0x40011400	// 801395c <ST7789_DrawRectangle+0x3d4>
 80136be:	e3fff32f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 80136c2:	1409      	addi      	r14, r14, 36
 80136c4:	ebc00058 	pop      	r4-r11, r15, r16-r17
	ST7789_SetAddressWindow(x, y, x, y);
 80136c8:	c4144823 	lsli      	r3, r20, 0
 80136cc:	c4144821 	lsli      	r1, r20, 0
 80136d0:	6c9f      	mov      	r2, r7
 80136d2:	6c1f      	mov      	r0, r7
 80136d4:	dd8e2004 	st.w      	r12, (r14, 0x10)
 80136d8:	de4e2003 	st.w      	r18, (r14, 0xc)
 80136dc:	de6e2002 	st.w      	r19, (r14, 0x8)
 80136e0:	de8e2001 	st.w      	r20, (r14, 0x4)
 80136e4:	e3fff924 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80136e8:	d86e0000 	ld.b      	r3, (r14, 0x0)
	ST7789_Select();
 80136ec:	3200      	movi      	r2, 0
 80136ee:	ea210080 	movih      	r1, 128
 80136f2:	6c2f      	mov      	r0, r11
	uint8_t data[] = {color >> 8, color & 0xFF};
 80136f4:	dc6e0020 	st.b      	r3, (r14, 0x20)
 80136f8:	dd0e0021 	st.b      	r8, (r14, 0x21)
	ST7789_Select();
 80136fc:	e3fff310 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013700:	3200      	movi      	r2, 0
 8013702:	ea210080 	movih      	r1, 128
 8013706:	6c2f      	mov      	r0, r11
 8013708:	e3fff30a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801370c:	3201      	movi      	r2, 1
 801370e:	ea210040 	movih      	r1, 64
 8013712:	6c2f      	mov      	r0, r11
 8013714:	e3fff304 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013718:	3300      	movi      	r3, 0
 801371a:	2b00      	subi      	r3, 1
 801371c:	3202      	movi      	r2, 2
 801371e:	1908      	addi      	r1, r14, 32
 8013720:	c4104820 	lsli      	r0, r16, 0
 8013724:	e3fff3fe 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013728:	3201      	movi      	r2, 1
 801372a:	ea210080 	movih      	r1, 128
 801372e:	6c2f      	mov      	r0, r11
 8013730:	e3fff2f6 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013734:	3201      	movi      	r2, 1
 8013736:	ea210080 	movih      	r1, 128
 801373a:	6c2f      	mov      	r0, r11
 801373c:	e3fff2f0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013740:	d98e2004 	ld.w      	r12, (r14, 0x10)
 8013744:	da4e2003 	ld.w      	r18, (r14, 0xc)
 8013748:	da6e2002 	ld.w      	r19, (r14, 0x8)
 801374c:	da8e2001 	ld.w      	r20, (r14, 0x4)
 8013750:	0754      	br      	0x80135f8	// 80135f8 <ST7789_DrawRectangle+0x70>
	ST7789_SetAddressWindow(x, y, x, y);
 8013752:	c4104823 	lsli      	r3, r16, 0
 8013756:	6c9b      	mov      	r2, r6
 8013758:	c4104821 	lsli      	r1, r16, 0
 801375c:	6c1b      	mov      	r0, r6
 801375e:	de4e2002 	st.w      	r18, (r14, 0x8)
 8013762:	c4134827 	lsli      	r7, r19, 0
 8013766:	e3fff8e3 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 801376a:	d86e0000 	ld.b      	r3, (r14, 0x0)
	ST7789_Select();
 801376e:	3200      	movi      	r2, 0
 8013770:	ea210080 	movih      	r1, 128
 8013774:	6c17      	mov      	r0, r5
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013776:	dc6e0020 	st.b      	r3, (r14, 0x20)
 801377a:	dd0e0021 	st.b      	r8, (r14, 0x21)
	ST7789_Select();
 801377e:	e3fff2cf 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013782:	3200      	movi      	r2, 0
 8013784:	ea210080 	movih      	r1, 128
 8013788:	6c17      	mov      	r0, r5
 801378a:	e3fff2c9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801378e:	3201      	movi      	r2, 1
 8013790:	ea210040 	movih      	r1, 64
 8013794:	6c17      	mov      	r0, r5
 8013796:	e3fff2c3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801379a:	3300      	movi      	r3, 0
 801379c:	2b00      	subi      	r3, 1
 801379e:	3202      	movi      	r2, 2
 80137a0:	1908      	addi      	r1, r14, 32
 80137a2:	6c2f      	mov      	r0, r11
 80137a4:	e3fff3be 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80137a8:	3201      	movi      	r2, 1
 80137aa:	ea210080 	movih      	r1, 128
 80137ae:	6c17      	mov      	r0, r5
 80137b0:	e3fff2b6 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 80137b4:	3201      	movi      	r2, 1
 80137b6:	ea210080 	movih      	r1, 128
 80137ba:	6c17      	mov      	r0, r5
 80137bc:	e3fff2b0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80137c0:	da4e2002 	ld.w      	r18, (r14, 0x8)
 80137c4:	c4074833 	lsli      	r19, r7, 0
 80137c8:	0755      	br      	0x8013672	// 8013672 <ST7789_DrawRectangle+0xea>
    dx = x1 - x0;
 80137ca:	ea170000 	movi      	r23, 0
 80137ce:	c4034835 	lsli      	r21, r3, 0
    if (steep) {
 80137d2:	6dd7      	mov      	r7, r5
 80137d4:	c4114834 	lsli      	r20, r17, 0
    int16_t err = dx / 2;
 80137d8:	c4174830 	lsli      	r16, r23, 0
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80137dc:	1361      	lrw      	r3, 0x200018b4	// 8013960 <ST7789_DrawRectangle+0x3d8>
 80137de:	c41555f5 	zext      	r21, r21, 15, 0
	ST7789_Select();
 80137e2:	ea8b005f 	lrw      	r11, 0x40011400	// 801395c <ST7789_DrawRectangle+0x3d4>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80137e6:	b862      	st.w      	r3, (r14, 0x8)
 80137e8:	0412      	br      	0x801380c	// 801380c <ST7789_DrawRectangle+0x284>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80137ea:	eb1400ef 	cmphsi      	r20, 240
 80137ee:	0804      	bt      	0x80137f6	// 80137f6 <ST7789_DrawRectangle+0x26e>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80137f0:	eb0500ef 	cmphsi      	r5, 240
 80137f4:	0c6c      	bf      	0x80138cc	// 80138cc <ST7789_DrawRectangle+0x344>
        err -= dy;
 80137f6:	c6b0008c 	subu      	r12, r16, r21
 80137fa:	7731      	zexth      	r12, r12
 80137fc:	c40c59f0 	sext      	r16, r12, 15, 0
        if (err < 0) {
 8013800:	e990005d 	blz      	r16, 0x80138ba	// 80138ba <ST7789_DrawRectangle+0x332>
    for (; x0<=x1; x0++) {
 8013804:	2500      	addi      	r5, 1
 8013806:	7555      	zexth      	r5, r5
 8013808:	655c      	cmphs      	r7, r5
 801380a:	0f23      	bf      	0x8013650	// 8013650 <ST7789_DrawRectangle+0xc8>
        if (steep) {
 801380c:	c5310480 	cmpne      	r17, r9
 8013810:	0bed      	bt      	0x80137ea	// 80137ea <ST7789_DrawRectangle+0x262>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013812:	eb0500ef 	cmphsi      	r5, 240
 8013816:	0bf0      	bt      	0x80137f6	// 80137f6 <ST7789_DrawRectangle+0x26e>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013818:	eb1400ef 	cmphsi      	r20, 240
 801381c:	0bed      	bt      	0x80137f6	// 80137f6 <ST7789_DrawRectangle+0x26e>
	ST7789_SetAddressWindow(x, y, x, y);
 801381e:	c4144823 	lsli      	r3, r20, 0
 8013822:	c4144821 	lsli      	r1, r20, 0
 8013826:	6c97      	mov      	r2, r5
 8013828:	6c17      	mov      	r0, r5
 801382a:	deee2007 	st.w      	r23, (r14, 0x1c)
 801382e:	deae2006 	st.w      	r21, (r14, 0x18)
 8013832:	de4e2005 	st.w      	r18, (r14, 0x14)
 8013836:	de6e2004 	st.w      	r19, (r14, 0x10)
 801383a:	de8e2003 	st.w      	r20, (r14, 0xc)
 801383e:	e3fff877 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013842:	d86e0000 	ld.b      	r3, (r14, 0x0)
	ST7789_Select();
 8013846:	3200      	movi      	r2, 0
 8013848:	ea210080 	movih      	r1, 128
 801384c:	6c2f      	mov      	r0, r11
	uint8_t data[] = {color >> 8, color & 0xFF};
 801384e:	dc6e0020 	st.b      	r3, (r14, 0x20)
 8013852:	dd0e0021 	st.b      	r8, (r14, 0x21)
	ST7789_Select();
 8013856:	e3fff263 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 801385a:	3200      	movi      	r2, 0
 801385c:	ea210080 	movih      	r1, 128
 8013860:	6c2f      	mov      	r0, r11
 8013862:	e3fff25d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013866:	3201      	movi      	r2, 1
 8013868:	ea210040 	movih      	r1, 64
 801386c:	6c2f      	mov      	r0, r11
 801386e:	e3fff257 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013872:	3300      	movi      	r3, 0
 8013874:	2b00      	subi      	r3, 1
 8013876:	3202      	movi      	r2, 2
 8013878:	1908      	addi      	r1, r14, 32
 801387a:	9802      	ld.w      	r0, (r14, 0x8)
 801387c:	e3fff352 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013880:	3201      	movi      	r2, 1
 8013882:	ea210080 	movih      	r1, 128
 8013886:	6c2f      	mov      	r0, r11
 8013888:	e3fff24a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801388c:	3201      	movi      	r2, 1
 801388e:	ea210080 	movih      	r1, 128
 8013892:	6c2f      	mov      	r0, r11
 8013894:	e3fff244 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013898:	daae2006 	ld.w      	r21, (r14, 0x18)
        err -= dy;
 801389c:	c6b0008c 	subu      	r12, r16, r21
 80138a0:	7731      	zexth      	r12, r12
 80138a2:	c40c59f0 	sext      	r16, r12, 15, 0
	ST7789_UnSelect();
 80138a6:	daee2007 	ld.w      	r23, (r14, 0x1c)
 80138aa:	da4e2005 	ld.w      	r18, (r14, 0x14)
 80138ae:	da6e2004 	ld.w      	r19, (r14, 0x10)
 80138b2:	da8e2003 	ld.w      	r20, (r14, 0xc)
        if (err < 0) {
 80138b6:	e9b0ffa7 	bhsz      	r16, 0x8013804	// 8013804 <ST7789_DrawRectangle+0x27c>
            y0 += ystep;
 80138ba:	e6941000 	subi      	r20, r20, 1
            err += dx;
 80138be:	c6ec002c 	addu      	r12, r12, r23
            y0 += ystep;
 80138c2:	c41455f4 	zext      	r20, r20, 15, 0
            err += dx;
 80138c6:	c40c59f0 	sext      	r16, r12, 15, 0
 80138ca:	079d      	br      	0x8013804	// 8013804 <ST7789_DrawRectangle+0x27c>
	ST7789_SetAddressWindow(x, y, x, y);
 80138cc:	c4144822 	lsli      	r2, r20, 0
 80138d0:	c4144820 	lsli      	r0, r20, 0
 80138d4:	6cd7      	mov      	r3, r5
 80138d6:	6c57      	mov      	r1, r5
 80138d8:	deee2007 	st.w      	r23, (r14, 0x1c)
 80138dc:	deae2006 	st.w      	r21, (r14, 0x18)
 80138e0:	de4e2005 	st.w      	r18, (r14, 0x14)
 80138e4:	de6e2004 	st.w      	r19, (r14, 0x10)
 80138e8:	de8e2003 	st.w      	r20, (r14, 0xc)
 80138ec:	e3fff820 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80138f0:	d86e0000 	ld.b      	r3, (r14, 0x0)
	ST7789_Select();
 80138f4:	3200      	movi      	r2, 0
 80138f6:	ea210080 	movih      	r1, 128
 80138fa:	6c2f      	mov      	r0, r11
	uint8_t data[] = {color >> 8, color & 0xFF};
 80138fc:	dc6e0020 	st.b      	r3, (r14, 0x20)
 8013900:	dd0e0021 	st.b      	r8, (r14, 0x21)
	ST7789_Select();
 8013904:	e3fff20c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013908:	3200      	movi      	r2, 0
 801390a:	ea210080 	movih      	r1, 128
 801390e:	6c2f      	mov      	r0, r11
 8013910:	e3fff206 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013914:	3201      	movi      	r2, 1
 8013916:	ea210040 	movih      	r1, 64
 801391a:	6c2f      	mov      	r0, r11
 801391c:	e3fff200 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013920:	3300      	movi      	r3, 0
 8013922:	2b00      	subi      	r3, 1
 8013924:	3202      	movi      	r2, 2
 8013926:	1908      	addi      	r1, r14, 32
 8013928:	9802      	ld.w      	r0, (r14, 0x8)
 801392a:	e3fff2fb 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801392e:	3201      	movi      	r2, 1
 8013930:	ea210080 	movih      	r1, 128
 8013934:	6c2f      	mov      	r0, r11
 8013936:	e3fff1f3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801393a:	3201      	movi      	r2, 1
 801393c:	ea210080 	movih      	r1, 128
 8013940:	6c2f      	mov      	r0, r11
 8013942:	e3fff1ed 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013946:	da8e2003 	ld.w      	r20, (r14, 0xc)
 801394a:	da6e2004 	ld.w      	r19, (r14, 0x10)
 801394e:	da4e2005 	ld.w      	r18, (r14, 0x14)
 8013952:	daae2006 	ld.w      	r21, (r14, 0x18)
 8013956:	daee2007 	ld.w      	r23, (r14, 0x1c)
 801395a:	074e      	br      	0x80137f6	// 80137f6 <ST7789_DrawRectangle+0x26e>
 801395c:	40011400 	.long	0x40011400
 8013960:	200018b4 	.long	0x200018b4
    dx = x1 - x0;
 8013964:	ea0a0000 	movi      	r10, 0
    if (steep) {
 8013968:	c4044830 	lsli      	r16, r4, 0
 801396c:	c411482b 	lsli      	r11, r17, 0
    int16_t err = dx / 2;
 8013970:	6d6b      	mov      	r5, r10
 8013972:	d86e1002 	ld.h      	r3, (r14, 0x4)
 8013976:	75cd      	zexth      	r7, r3
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013978:	117d      	lrw      	r3, 0x200018b4	// 8013a6c <ST7789_DrawRectangle+0x4e4>
	ST7789_Select();
 801397a:	11de      	lrw      	r6, 0x40011400	// 8013a70 <ST7789_DrawRectangle+0x4e8>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801397c:	b861      	st.w      	r3, (r14, 0x4)
 801397e:	0411      	br      	0x80139a0	// 80139a0 <ST7789_DrawRectangle+0x418>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013980:	eb0b00ef 	cmphsi      	r11, 240
 8013984:	0804      	bt      	0x801398c	// 801398c <ST7789_DrawRectangle+0x404>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013986:	eb0400ef 	cmphsi      	r4, 240
 801398a:	0c51      	bf      	0x8013a2c	// 8013a2c <ST7789_DrawRectangle+0x4a4>
        err -= dy;
 801398c:	615e      	subu      	r5, r7
 801398e:	7715      	zexth      	r12, r5
 8013990:	7573      	sexth      	r5, r12
        if (err < 0) {
 8013992:	e9850046 	blz      	r5, 0x8013a1e	// 8013a1e <ST7789_DrawRectangle+0x496>
    for (; x0<=x1; x0++) {
 8013996:	2400      	addi      	r4, 1
 8013998:	7511      	zexth      	r4, r4
 801399a:	c4900420 	cmphs      	r16, r4
 801399e:	0e8c      	bf      	0x80136b6	// 80136b6 <ST7789_DrawRectangle+0x12e>
        if (steep) {
 80139a0:	c5310480 	cmpne      	r17, r9
 80139a4:	0bee      	bt      	0x8013980	// 8013980 <ST7789_DrawRectangle+0x3f8>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80139a6:	eb0400ef 	cmphsi      	r4, 240
 80139aa:	0bf1      	bt      	0x801398c	// 801398c <ST7789_DrawRectangle+0x404>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80139ac:	eb0b00ef 	cmphsi      	r11, 240
 80139b0:	0bee      	bt      	0x801398c	// 801398c <ST7789_DrawRectangle+0x404>
	ST7789_SetAddressWindow(x, y, x, y);
 80139b2:	6cef      	mov      	r3, r11
 80139b4:	6c93      	mov      	r2, r4
 80139b6:	6c6f      	mov      	r1, r11
 80139b8:	6c13      	mov      	r0, r4
 80139ba:	e3fff7b9 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80139be:	d86e0000 	ld.b      	r3, (r14, 0x0)
	ST7789_Select();
 80139c2:	3200      	movi      	r2, 0
 80139c4:	ea210080 	movih      	r1, 128
 80139c8:	6c1b      	mov      	r0, r6
	uint8_t data[] = {color >> 8, color & 0xFF};
 80139ca:	dc6e0020 	st.b      	r3, (r14, 0x20)
 80139ce:	dd0e0021 	st.b      	r8, (r14, 0x21)
	ST7789_Select();
 80139d2:	e3fff1a5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80139d6:	3200      	movi      	r2, 0
 80139d8:	ea210080 	movih      	r1, 128
 80139dc:	6c1b      	mov      	r0, r6
 80139de:	e3fff19f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80139e2:	3201      	movi      	r2, 1
 80139e4:	ea210040 	movih      	r1, 64
 80139e8:	6c1b      	mov      	r0, r6
 80139ea:	e3fff199 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80139ee:	3300      	movi      	r3, 0
 80139f0:	2b00      	subi      	r3, 1
 80139f2:	3202      	movi      	r2, 2
 80139f4:	1908      	addi      	r1, r14, 32
 80139f6:	9801      	ld.w      	r0, (r14, 0x4)
 80139f8:	e3fff294 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80139fc:	3201      	movi      	r2, 1
 80139fe:	ea210080 	movih      	r1, 128
 8013a02:	6c1b      	mov      	r0, r6
 8013a04:	e3fff18c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
        err -= dy;
 8013a08:	615e      	subu      	r5, r7
	ST7789_UnSelect();
 8013a0a:	3201      	movi      	r2, 1
 8013a0c:	ea210080 	movih      	r1, 128
 8013a10:	6c1b      	mov      	r0, r6
 8013a12:	e3fff185 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
        err -= dy;
 8013a16:	7715      	zexth      	r12, r5
 8013a18:	7573      	sexth      	r5, r12
        if (err < 0) {
 8013a1a:	e9a5ffbe 	bhsz      	r5, 0x8013996	// 8013996 <ST7789_DrawRectangle+0x40e>
            y0 += ystep;
 8013a1e:	e56b1000 	subi      	r11, r11, 1
            err += dx;
 8013a22:	c54c0025 	addu      	r5, r12, r10
            y0 += ystep;
 8013a26:	76ed      	zexth      	r11, r11
            err += dx;
 8013a28:	7557      	sexth      	r5, r5
 8013a2a:	07b6      	br      	0x8013996	// 8013996 <ST7789_DrawRectangle+0x40e>
	ST7789_SetAddressWindow(x, y, x, y);
 8013a2c:	6cd3      	mov      	r3, r4
 8013a2e:	6caf      	mov      	r2, r11
 8013a30:	6c53      	mov      	r1, r4
 8013a32:	6c2f      	mov      	r0, r11
 8013a34:	07c3      	br      	0x80139ba	// 80139ba <ST7789_DrawRectangle+0x432>
    if (x0 > x1) {
 8013a36:	c4044832 	lsli      	r18, r4, 0
 8013a3a:	6d97      	mov      	r6, r5
 8013a3c:	e800fdbc 	br      	0x80135b4	// 80135b4 <ST7789_DrawRectangle+0x2c>
    for (; x0<=x1; x0++) {
 8013a40:	6ed3      	mov      	r11, r4
 8013a42:	6d0f      	mov      	r4, r3
    dy = ABS(y1 - y0);
 8013a44:	3300      	movi      	r3, 0
 8013a46:	b861      	st.w      	r3, (r14, 0x4)
 8013a48:	0795      	br      	0x8013972	// 8013972 <ST7789_DrawRectangle+0x3ea>
    if (x0 > x1) {
 8013a4a:	c4094830 	lsli      	r16, r9, 0
 8013a4e:	c4114823 	lsli      	r3, r17, 0
 8013a52:	0627      	br      	0x80136a0	// 80136a0 <ST7789_DrawRectangle+0x118>
    for (; x0<=x1; x0++) {
 8013a54:	c4054834 	lsli      	r20, r5, 0
    dy = ABS(y1 - y0);
 8013a58:	ea150000 	movi      	r21, 0
    for (; x0<=x1; x0++) {
 8013a5c:	6d4f      	mov      	r5, r3
 8013a5e:	06bf      	br      	0x80137dc	// 80137dc <ST7789_DrawRectangle+0x254>
    if (x0 > x1) {
 8013a60:	6de7      	mov      	r7, r9
 8013a62:	c4114823 	lsli      	r3, r17, 0
 8013a66:	e800fde6 	br      	0x8013632	// 8013632 <ST7789_DrawRectangle+0xaa>
 8013a6a:	0000      	.short	0x0000
 8013a6c:	200018b4 	.long	0x200018b4
 8013a70:	40011400 	.long	0x40011400

08013a74 <ST7789_DrawCircle>:
{
 8013a74:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013a78:	1427      	subi      	r14, r14, 28
	int16_t ddF_y = -2 * r;
 8013a7a:	ea100000 	movi      	r16, 0
	int16_t f = 1 - r;
 8013a7e:	75c9      	zexth      	r7, r2
{
 8013a80:	6d03      	mov      	r4, r0
 8013a82:	6d47      	mov      	r5, r1
	int16_t y = r;
 8013a84:	764b      	sexth      	r9, r2
	ST7789_Select();
 8013a86:	ea210080 	movih      	r1, 128
 8013a8a:	c4104822 	lsli      	r2, r16, 0
 8013a8e:	0013      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
{
 8013a90:	b862      	st.w      	r3, (r14, 0x8)
	ST7789_Select();
 8013a92:	e3fff145 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013a96:	33ef      	movi      	r3, 239
	int16_t ddF_y = -2 * r;
 8013a98:	5fdc      	addu      	r6, r7, r7
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013a9a:	650c      	cmphs      	r3, r4
	int16_t f = 1 - r;
 8013a9c:	ea080001 	movi      	r8, 1
	int16_t ddF_y = -2 * r;
 8013aa0:	c4d00086 	subu      	r6, r16, r6
	int16_t f = 1 - r;
 8013aa4:	c4e8008a 	subu      	r10, r8, r7
	int16_t ddF_y = -2 * r;
 8013aa8:	759b      	sexth      	r6, r6
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013aaa:	0c0d      	bf      	0x8013ac4	// 8013ac4 <ST7789_DrawCircle+0x50>
	ST7789_DrawPixel(x0, y0 + r, color);
 8013aac:	5f74      	addu      	r3, r7, r5
 8013aae:	74cd      	zexth      	r3, r3
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013ab0:	eb0300ef 	cmphsi      	r3, 240
 8013ab4:	e84002d6 	bf      	0x8014060	// 8014060 <ST7789_DrawCircle+0x5ec>
	ST7789_DrawPixel(x0, y0 - r, color);
 8013ab8:	5d7d      	subu      	r3, r5, r7
 8013aba:	74cd      	zexth      	r3, r3
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013abc:	eb0300ef 	cmphsi      	r3, 240
 8013ac0:	e840030b 	bf      	0x80140d6	// 80140d6 <ST7789_DrawCircle+0x662>
	ST7789_DrawPixel(x0 + r, y0, color);
 8013ac4:	5f50      	addu      	r2, r7, r4
 8013ac6:	7489      	zexth      	r2, r2
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013ac8:	eb0200ef 	cmphsi      	r2, 240
 8013acc:	e860024f 	bt      	0x8013f6a	// 8013f6a <ST7789_DrawCircle+0x4f6>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013ad0:	33ef      	movi      	r3, 239
 8013ad2:	654c      	cmphs      	r3, r5
 8013ad4:	e860025c 	bt      	0x8013f8c	// 8013f8c <ST7789_DrawCircle+0x518>
	while (x < y) {
 8013ad8:	e9090240 	bez      	r9, 0x8013f58	// 8013f58 <ST7789_DrawCircle+0x4e4>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013adc:	9862      	ld.w      	r3, (r14, 0x8)
 8013ade:	4b48      	lsri      	r2, r3, 8
 8013ae0:	74cc      	zextb      	r3, r3
 8013ae2:	e6251000 	subi      	r17, r5, 1
 8013ae6:	e5a50000 	addi      	r13, r5, 1
 8013aea:	e5841000 	subi      	r12, r4, 1
 8013aee:	e6040000 	addi      	r16, r4, 1
 8013af2:	b863      	st.w      	r3, (r14, 0xc)
 8013af4:	b840      	st.w      	r2, (r14, 0x0)
 8013af6:	c41155f1 	zext      	r17, r17, 15, 0
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013afa:	016d      	lrw      	r3, 0x200018b4	// 8013e40 <ST7789_DrawCircle+0x3cc>
 8013afc:	7775      	zexth      	r13, r13
 8013afe:	7631      	zexth      	r8, r12
 8013b00:	c41055f0 	zext      	r16, r16, 15, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013b04:	3700      	movi      	r7, 0
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013b06:	b861      	st.w      	r3, (r14, 0x4)
 8013b08:	0431      	br      	0x8013b6a	// 8013b6a <ST7789_DrawCircle+0xf6>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013b0a:	eb1500ef 	cmphsi      	r21, 240
 8013b0e:	0d9b      	bf      	0x8013e44	// 8013e44 <ST7789_DrawCircle+0x3d0>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013b10:	eb0800ef 	cmphsi      	r8, 240
 8013b14:	0c48      	bf      	0x8013ba4	// 8013ba4 <ST7789_DrawCircle+0x130>
		ST7789_DrawPixel(x0 + x, y0 - y, color);
 8013b16:	c5650083 	subu      	r3, r5, r11
 8013b1a:	74cd      	zexth      	r3, r3
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013b1c:	eb0300ef 	cmphsi      	r3, 240
 8013b20:	e840020c 	bf      	0x8013f38	// 8013f38 <ST7789_DrawCircle+0x4c4>
		ST7789_DrawPixel(x0 + y, y0 + x, color);
 8013b24:	c5640035 	addu      	r21, r4, r11
 8013b28:	c41555f5 	zext      	r21, r21, 15, 0
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013b2c:	eb1500ef 	cmphsi      	r21, 240
 8013b30:	0888      	bt      	0x8013c40	// 8013c40 <ST7789_DrawCircle+0x1cc>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013b32:	eb0d00ef 	cmphsi      	r13, 240
 8013b36:	0d0b      	bf      	0x8013d4c	// 8013d4c <ST7789_DrawCircle+0x2d8>
		ST7789_DrawPixel(x0 - y, y0 + x, color);
 8013b38:	c564008b 	subu      	r11, r4, r11
 8013b3c:	76ed      	zexth      	r11, r11
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013b3e:	eb0b00ef 	cmphsi      	r11, 240
 8013b42:	0c85      	bf      	0x8013c4c	// 8013c4c <ST7789_DrawCircle+0x1d8>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013b44:	eb1100ef 	cmphsi      	r17, 240
 8013b48:	0d40      	bf      	0x8013dc8	// 8013dc8 <ST7789_DrawCircle+0x354>
	while (x < y) {
 8013b4a:	665d      	cmplt      	r7, r9
 8013b4c:	e6311000 	subi      	r17, r17, 1
 8013b50:	e5ad0000 	addi      	r13, r13, 1
 8013b54:	e5881000 	subi      	r12, r8, 1
 8013b58:	e6100000 	addi      	r16, r16, 1
 8013b5c:	c41155f1 	zext      	r17, r17, 15, 0
 8013b60:	7775      	zexth      	r13, r13
 8013b62:	7631      	zexth      	r8, r12
 8013b64:	c41055f0 	zext      	r16, r16, 15, 0
 8013b68:	0df8      	bf      	0x8013f58	// 8013f58 <ST7789_DrawCircle+0x4e4>
		if (f >= 0) {
 8013b6a:	e98a000b 	blz      	r10, 0x8013b80	// 8013b80 <ST7789_DrawCircle+0x10c>
			ddF_y += 2;
 8013b6e:	2601      	addi      	r6, 2
 8013b70:	74d9      	zexth      	r3, r6
			y--;
 8013b72:	e6491000 	subi      	r18, r9, 1
			ddF_y += 2;
 8013b76:	758f      	sexth      	r6, r3
			f += ddF_y;
 8013b78:	60e8      	addu      	r3, r10
			y--;
 8013b7a:	c41259e9 	sext      	r9, r18, 15, 0
			f += ddF_y;
 8013b7e:	768f      	sexth      	r10, r3
 8013b80:	5f62      	addi      	r3, r7, 1
 8013b82:	74cd      	zexth      	r3, r3
 8013b84:	75cf      	sexth      	r7, r3
		f += ddF_x;
 8013b86:	60cc      	addu      	r3, r3
 8013b88:	2300      	addi      	r3, 1
		ST7789_DrawPixel(x0 + x, y0 + y, color);
 8013b8a:	76e5      	zexth      	r11, r9
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013b8c:	eb1000ef 	cmphsi      	r16, 240
		f += ddF_x;
 8013b90:	60e8      	addu      	r3, r10
		ST7789_DrawPixel(x0 + x, y0 + y, color);
 8013b92:	c5650035 	addu      	r21, r5, r11
		f += ddF_x;
 8013b96:	768f      	sexth      	r10, r3
		ST7789_DrawPixel(x0 + x, y0 + y, color);
 8013b98:	c41555f5 	zext      	r21, r21, 15, 0
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013b9c:	0fb7      	bf      	0x8013b0a	// 8013b0a <ST7789_DrawCircle+0x96>
 8013b9e:	eb0800ef 	cmphsi      	r8, 240
 8013ba2:	0bc1      	bt      	0x8013b24	// 8013b24 <ST7789_DrawCircle+0xb0>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013ba4:	eb1500ef 	cmphsi      	r21, 240
 8013ba8:	0d8e      	bf      	0x8013ec4	// 8013ec4 <ST7789_DrawCircle+0x450>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013baa:	eb1000ef 	cmphsi      	r16, 240
		ST7789_DrawPixel(x0 + x, y0 - y, color);
 8013bae:	c5650095 	subu      	r21, r5, r11
 8013bb2:	c41555f5 	zext      	r21, r21, 15, 0
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013bb6:	e84002c4 	bf      	0x801413e	// 801413e <ST7789_DrawCircle+0x6ca>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013bba:	eb1500ef 	cmphsi      	r21, 240
 8013bbe:	0bb3      	bt      	0x8013b24	// 8013b24 <ST7789_DrawCircle+0xb0>
	ST7789_SetAddressWindow(x, y, x, y);
 8013bc0:	c4154823 	lsli      	r3, r21, 0
 8013bc4:	6ca3      	mov      	r2, r8
 8013bc6:	c4154821 	lsli      	r1, r21, 0
 8013bca:	6c23      	mov      	r0, r8
 8013bcc:	ddae2004 	st.w      	r13, (r14, 0x10)
 8013bd0:	e3fff6ae 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013bd4:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8013bd8:	dc6e0018 	st.b      	r3, (r14, 0x18)
 8013bdc:	d86e000c 	ld.b      	r3, (r14, 0xc)
	ST7789_Select();
 8013be0:	3200      	movi      	r2, 0
 8013be2:	ea210080 	movih      	r1, 128
 8013be6:	0309      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013be8:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8013bec:	e3fff098 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013bf0:	3200      	movi      	r2, 0
 8013bf2:	ea210080 	movih      	r1, 128
 8013bf6:	030d      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013bf8:	e3fff092 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013bfc:	3201      	movi      	r2, 1
 8013bfe:	ea210040 	movih      	r1, 64
 8013c02:	0310      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013c04:	e3fff08c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013c08:	3300      	movi      	r3, 0
 8013c0a:	2b00      	subi      	r3, 1
 8013c0c:	3202      	movi      	r2, 2
 8013c0e:	1906      	addi      	r1, r14, 24
 8013c10:	9801      	ld.w      	r0, (r14, 0x4)
 8013c12:	e3fff187 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013c16:	3201      	movi      	r2, 1
 8013c18:	ea210080 	movih      	r1, 128
 8013c1c:	0317      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013c1e:	e3fff07f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013c22:	3201      	movi      	r2, 1
 8013c24:	ea210080 	movih      	r1, 128
 8013c28:	031a      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013c2a:	e3fff079 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		ST7789_DrawPixel(x0 + y, y0 + x, color);
 8013c2e:	c5640035 	addu      	r21, r4, r11
 8013c32:	c41555f5 	zext      	r21, r21, 15, 0
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013c36:	eb1500ef 	cmphsi      	r21, 240
	ST7789_UnSelect();
 8013c3a:	d9ae2004 	ld.w      	r13, (r14, 0x10)
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013c3e:	0f7a      	bf      	0x8013b32	// 8013b32 <ST7789_DrawCircle+0xbe>
		ST7789_DrawPixel(x0 - y, y0 + x, color);
 8013c40:	c564008b 	subu      	r11, r4, r11
 8013c44:	76ed      	zexth      	r11, r11
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013c46:	eb0b00ef 	cmphsi      	r11, 240
 8013c4a:	0b80      	bt      	0x8013b4a	// 8013b4a <ST7789_DrawCircle+0xd6>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013c4c:	eb0d00ef 	cmphsi      	r13, 240
 8013c50:	0c42      	bf      	0x8013cd4	// 8013cd4 <ST7789_DrawCircle+0x260>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013c52:	eb1500ef 	cmphsi      	r21, 240
 8013c56:	e84002b9 	bf      	0x80141c8	// 80141c8 <ST7789_DrawCircle+0x754>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013c5a:	eb1100ef 	cmphsi      	r17, 240
 8013c5e:	0b76      	bt      	0x8013b4a	// 8013b4a <ST7789_DrawCircle+0xd6>
	ST7789_SetAddressWindow(x, y, x, y);
 8013c60:	c4114823 	lsli      	r3, r17, 0
 8013c64:	6caf      	mov      	r2, r11
 8013c66:	c4114821 	lsli      	r1, r17, 0
 8013c6a:	6c2f      	mov      	r0, r11
 8013c6c:	ddae2004 	st.w      	r13, (r14, 0x10)
 8013c70:	e3fff65e 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013c74:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8013c78:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 8013c7c:	3200      	movi      	r2, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013c7e:	d86e000c 	ld.b      	r3, (r14, 0xc)
	ST7789_Select();
 8013c82:	ea210080 	movih      	r1, 128
 8013c86:	130e      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013c88:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8013c8c:	e3fff048 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013c90:	3200      	movi      	r2, 0
 8013c92:	ea210080 	movih      	r1, 128
 8013c96:	130a      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013c98:	e3fff042 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013c9c:	3201      	movi      	r2, 1
 8013c9e:	ea210040 	movih      	r1, 64
 8013ca2:	1307      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013ca4:	e3fff03c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013ca8:	3300      	movi      	r3, 0
 8013caa:	2b00      	subi      	r3, 1
 8013cac:	3202      	movi      	r2, 2
 8013cae:	1906      	addi      	r1, r14, 24
 8013cb0:	9801      	ld.w      	r0, (r14, 0x4)
 8013cb2:	e3fff137 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013cb6:	3201      	movi      	r2, 1
 8013cb8:	ea210080 	movih      	r1, 128
 8013cbc:	1300      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013cbe:	e3fff02f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013cc2:	3201      	movi      	r2, 1
 8013cc4:	ea210080 	movih      	r1, 128
 8013cc8:	121d      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013cca:	e3fff029 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013cce:	d9ae2004 	ld.w      	r13, (r14, 0x10)
 8013cd2:	073c      	br      	0x8013b4a	// 8013b4a <ST7789_DrawCircle+0xd6>
	ST7789_SetAddressWindow(x, y, x, y);
 8013cd4:	6cf7      	mov      	r3, r13
 8013cd6:	6c77      	mov      	r1, r13
 8013cd8:	6caf      	mov      	r2, r11
 8013cda:	6c2f      	mov      	r0, r11
 8013cdc:	deae2005 	st.w      	r21, (r14, 0x14)
 8013ce0:	ddae2004 	st.w      	r13, (r14, 0x10)
 8013ce4:	e3fff624 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013ce8:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8013cec:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 8013cf0:	3200      	movi      	r2, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013cf2:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 8013cf6:	ea210080 	movih      	r1, 128
 8013cfa:	1211      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013cfc:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8013d00:	e3fff00e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013d04:	3200      	movi      	r2, 0
 8013d06:	ea210080 	movih      	r1, 128
 8013d0a:	120d      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013d0c:	e3fff008 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013d10:	3201      	movi      	r2, 1
 8013d12:	ea210040 	movih      	r1, 64
 8013d16:	120a      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013d18:	e3fff002 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013d1c:	3300      	movi      	r3, 0
 8013d1e:	2b00      	subi      	r3, 1
 8013d20:	3202      	movi      	r2, 2
 8013d22:	1906      	addi      	r1, r14, 24
 8013d24:	9801      	ld.w      	r0, (r14, 0x4)
 8013d26:	e3fff0fd 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013d2a:	3201      	movi      	r2, 1
 8013d2c:	ea210080 	movih      	r1, 128
 8013d30:	1203      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013d32:	e3ffeff5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013d36:	3201      	movi      	r2, 1
 8013d38:	ea210080 	movih      	r1, 128
 8013d3c:	1200      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013d3e:	e3ffefef 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013d42:	d9ae2004 	ld.w      	r13, (r14, 0x10)
 8013d46:	daae2005 	ld.w      	r21, (r14, 0x14)
 8013d4a:	0784      	br      	0x8013c52	// 8013c52 <ST7789_DrawCircle+0x1de>
	ST7789_SetAddressWindow(x, y, x, y);
 8013d4c:	6cf7      	mov      	r3, r13
 8013d4e:	c4154822 	lsli      	r2, r21, 0
 8013d52:	6c77      	mov      	r1, r13
 8013d54:	c4154820 	lsli      	r0, r21, 0
 8013d58:	ddae2005 	st.w      	r13, (r14, 0x14)
 8013d5c:	deae2004 	st.w      	r21, (r14, 0x10)
 8013d60:	e3fff5e6 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013d64:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8013d68:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 8013d6c:	3200      	movi      	r2, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013d6e:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 8013d72:	ea210080 	movih      	r1, 128
 8013d76:	1112      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013d78:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8013d7c:	e3ffefd0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013d80:	3200      	movi      	r2, 0
 8013d82:	ea210080 	movih      	r1, 128
 8013d86:	110e      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013d88:	e3ffefca 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013d8c:	3201      	movi      	r2, 1
 8013d8e:	ea210040 	movih      	r1, 64
 8013d92:	110b      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013d94:	e3ffefc4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013d98:	3300      	movi      	r3, 0
 8013d9a:	2b00      	subi      	r3, 1
 8013d9c:	3202      	movi      	r2, 2
 8013d9e:	1906      	addi      	r1, r14, 24
 8013da0:	9801      	ld.w      	r0, (r14, 0x4)
 8013da2:	e3fff0bf 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013da6:	3201      	movi      	r2, 1
 8013da8:	ea210080 	movih      	r1, 128
 8013dac:	1104      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013dae:	e3ffefb7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013db2:	3201      	movi      	r2, 1
 8013db4:	ea210080 	movih      	r1, 128
 8013db8:	1101      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013dba:	e3ffefb1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013dbe:	daae2004 	ld.w      	r21, (r14, 0x10)
 8013dc2:	d9ae2005 	ld.w      	r13, (r14, 0x14)
 8013dc6:	06b9      	br      	0x8013b38	// 8013b38 <ST7789_DrawCircle+0xc4>
	ST7789_SetAddressWindow(x, y, x, y);
 8013dc8:	c4154822 	lsli      	r2, r21, 0
 8013dcc:	c4154820 	lsli      	r0, r21, 0
 8013dd0:	c4114823 	lsli      	r3, r17, 0
 8013dd4:	c4114821 	lsli      	r1, r17, 0
 8013dd8:	6ef7      	mov      	r11, r13
 8013dda:	e3fff5a9 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013dde:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8013de2:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 8013de6:	3200      	movi      	r2, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013de8:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 8013dec:	ea210080 	movih      	r1, 128
 8013df0:	1013      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013df2:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8013df6:	e3ffef93 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013dfa:	3200      	movi      	r2, 0
 8013dfc:	ea210080 	movih      	r1, 128
 8013e00:	100f      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013e02:	e3ffef8d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013e06:	3201      	movi      	r2, 1
 8013e08:	ea210040 	movih      	r1, 64
 8013e0c:	100c      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013e0e:	e3ffef87 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013e12:	3300      	movi      	r3, 0
 8013e14:	2b00      	subi      	r3, 1
 8013e16:	3202      	movi      	r2, 2
 8013e18:	1906      	addi      	r1, r14, 24
 8013e1a:	9801      	ld.w      	r0, (r14, 0x4)
 8013e1c:	e3fff082 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013e20:	3201      	movi      	r2, 1
 8013e22:	ea210080 	movih      	r1, 128
 8013e26:	1006      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013e28:	e3ffef7a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013e2c:	3201      	movi      	r2, 1
 8013e2e:	ea210080 	movih      	r1, 128
 8013e32:	1003      	lrw      	r0, 0x40011400	// 8013e3c <ST7789_DrawCircle+0x3c8>
 8013e34:	e3ffef74 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013e38:	6f6f      	mov      	r13, r11
 8013e3a:	0688      	br      	0x8013b4a	// 8013b4a <ST7789_DrawCircle+0xd6>
 8013e3c:	40011400 	.long	0x40011400
 8013e40:	200018b4 	.long	0x200018b4
	ST7789_SetAddressWindow(x, y, x, y);
 8013e44:	c4154823 	lsli      	r3, r21, 0
 8013e48:	c4154821 	lsli      	r1, r21, 0
 8013e4c:	c4104822 	lsli      	r2, r16, 0
 8013e50:	c4104820 	lsli      	r0, r16, 0
 8013e54:	ddae2005 	st.w      	r13, (r14, 0x14)
 8013e58:	deae2004 	st.w      	r21, (r14, 0x10)
 8013e5c:	e3fff568 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013e60:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8013e64:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 8013e68:	3200      	movi      	r2, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013e6a:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 8013e6e:	ea210080 	movih      	r1, 128
 8013e72:	0008      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013e74:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8013e78:	e3ffef52 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013e7c:	3200      	movi      	r2, 0
 8013e7e:	ea210080 	movih      	r1, 128
 8013e82:	000c      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013e84:	e3ffef4c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013e88:	3201      	movi      	r2, 1
 8013e8a:	ea210040 	movih      	r1, 64
 8013e8e:	000f      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013e90:	e3ffef46 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013e94:	3300      	movi      	r3, 0
 8013e96:	2b00      	subi      	r3, 1
 8013e98:	3202      	movi      	r2, 2
 8013e9a:	1906      	addi      	r1, r14, 24
 8013e9c:	9801      	ld.w      	r0, (r14, 0x4)
 8013e9e:	e3fff041 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013ea2:	3201      	movi      	r2, 1
 8013ea4:	ea210080 	movih      	r1, 128
 8013ea8:	0016      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013eaa:	e3ffef39 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013eae:	3201      	movi      	r2, 1
 8013eb0:	ea210080 	movih      	r1, 128
 8013eb4:	0019      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013eb6:	e3ffef33 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013eba:	daae2004 	ld.w      	r21, (r14, 0x10)
 8013ebe:	d9ae2005 	ld.w      	r13, (r14, 0x14)
 8013ec2:	0627      	br      	0x8013b10	// 8013b10 <ST7789_DrawCircle+0x9c>
	ST7789_SetAddressWindow(x, y, x, y);
 8013ec4:	c4154823 	lsli      	r3, r21, 0
 8013ec8:	c4154821 	lsli      	r1, r21, 0
 8013ecc:	6ca3      	mov      	r2, r8
 8013ece:	6c23      	mov      	r0, r8
 8013ed0:	ddae2004 	st.w      	r13, (r14, 0x10)
 8013ed4:	e3fff52c 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013ed8:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8013edc:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 8013ee0:	3200      	movi      	r2, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013ee2:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 8013ee6:	ea210080 	movih      	r1, 128
 8013eea:	0106      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013eec:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8013ef0:	e3ffef16 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013ef4:	3200      	movi      	r2, 0
 8013ef6:	ea210080 	movih      	r1, 128
 8013efa:	010a      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013efc:	e3ffef10 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013f00:	3201      	movi      	r2, 1
 8013f02:	ea210040 	movih      	r1, 64
 8013f06:	010d      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013f08:	e3ffef0a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013f0c:	3300      	movi      	r3, 0
 8013f0e:	2b00      	subi      	r3, 1
 8013f10:	3202      	movi      	r2, 2
 8013f12:	1906      	addi      	r1, r14, 24
 8013f14:	9801      	ld.w      	r0, (r14, 0x4)
 8013f16:	e3fff005 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013f1a:	3201      	movi      	r2, 1
 8013f1c:	ea210080 	movih      	r1, 128
 8013f20:	0114      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013f22:	e3ffeefd 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013f26:	3201      	movi      	r2, 1
 8013f28:	ea210080 	movih      	r1, 128
 8013f2c:	0117      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013f2e:	e3ffeef7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8013f32:	d9ae2004 	ld.w      	r13, (r14, 0x10)
 8013f36:	063a      	br      	0x8013baa	// 8013baa <ST7789_DrawCircle+0x136>
	ST7789_SetAddressWindow(x, y, x, y);
 8013f38:	6c4f      	mov      	r1, r3
 8013f3a:	c4104822 	lsli      	r2, r16, 0
 8013f3e:	c4104820 	lsli      	r0, r16, 0
 8013f42:	ddae2004 	st.w      	r13, (r14, 0x10)
 8013f46:	e3fff4f3 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013f4a:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8013f4e:	dc6e0018 	st.b      	r3, (r14, 0x18)
 8013f52:	d86e0008 	ld.b      	r3, (r14, 0x8)
 8013f56:	0645      	br      	0x8013be0	// 8013be0 <ST7789_DrawCircle+0x16c>
	ST7789_UnSelect();
 8013f58:	3201      	movi      	r2, 1
 8013f5a:	ea210080 	movih      	r1, 128
 8013f5e:	0203      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013f60:	e3ffeede 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 8013f64:	1407      	addi      	r14, r14, 28
 8013f66:	ebc00058 	pop      	r4-r11, r15, r16-r17
	ST7789_DrawPixel(x0 - r, y0, color);
 8013f6a:	5c5d      	subu      	r2, r4, r7
 8013f6c:	7489      	zexth      	r2, r2
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013f6e:	eb0200ef 	cmphsi      	r2, 240
 8013f72:	e860fdb3 	bt      	0x8013ad8	// 8013ad8 <ST7789_DrawCircle+0x64>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8013f76:	eb0500ef 	cmphsi      	r5, 240
 8013f7a:	e860fdaf 	bt      	0x8013ad8	// 8013ad8 <ST7789_DrawCircle+0x64>
 8013f7e:	9862      	ld.w      	r3, (r14, 0x8)
 8013f80:	c5034850 	lsri      	r16, r3, 8
 8013f84:	760c      	zextb      	r8, r3
 8013f86:	e56e0017 	addi      	r11, r14, 24
 8013f8a:	043b      	br      	0x8014000	// 8014000 <ST7789_DrawCircle+0x58c>
	ST7789_SetAddressWindow(x, y, x, y);
 8013f8c:	6c0b      	mov      	r0, r2
 8013f8e:	6cd7      	mov      	r3, r5
 8013f90:	6c57      	mov      	r1, r5
 8013f92:	e3fff4cd 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013f96:	e56e0017 	addi      	r11, r14, 24
 8013f9a:	9862      	ld.w      	r3, (r14, 0x8)
 8013f9c:	c5034850 	lsri      	r16, r3, 8
 8013fa0:	760c      	zextb      	r8, r3
	ST7789_Select();
 8013fa2:	3200      	movi      	r2, 0
 8013fa4:	ea210080 	movih      	r1, 128
 8013fa8:	0216      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8013faa:	de0b0000 	st.b      	r16, (r11, 0x0)
 8013fae:	dd0b0001 	st.b      	r8, (r11, 0x1)
	ST7789_Select();
 8013fb2:	e3ffeeb5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8013fb6:	3200      	movi      	r2, 0
 8013fb8:	ea210080 	movih      	r1, 128
 8013fbc:	021b      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013fbe:	e3ffeeaf 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8013fc2:	3201      	movi      	r2, 1
 8013fc4:	ea210040 	movih      	r1, 64
 8013fc8:	021e      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013fca:	e3ffeea9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8013fce:	3300      	movi      	r3, 0
 8013fd0:	2b00      	subi      	r3, 1
 8013fd2:	3202      	movi      	r2, 2
 8013fd4:	6c6f      	mov      	r1, r11
 8013fd6:	0300      	lrw      	r0, 0x200018b4	// 8014250 <ST7789_DrawCircle+0x7dc>
 8013fd8:	e3ffefa4 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8013fdc:	3201      	movi      	r2, 1
 8013fde:	ea210080 	movih      	r1, 128
 8013fe2:	0304      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013fe4:	e3ffee9c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8013fe8:	3201      	movi      	r2, 1
 8013fea:	ea210080 	movih      	r1, 128
 8013fee:	0307      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8013ff0:	e3ffee96 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawPixel(x0 - r, y0, color);
 8013ff4:	5c5d      	subu      	r2, r4, r7
 8013ff6:	7489      	zexth      	r2, r2
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8013ff8:	eb0200ef 	cmphsi      	r2, 240
 8013ffc:	e860fd6e 	bt      	0x8013ad8	// 8013ad8 <ST7789_DrawCircle+0x64>
	ST7789_SetAddressWindow(x, y, x, y);
 8014000:	6cd7      	mov      	r3, r5
 8014002:	6c57      	mov      	r1, r5
 8014004:	6c0b      	mov      	r0, r2
 8014006:	e3fff493 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 801400a:	3200      	movi      	r2, 0
 801400c:	ea210080 	movih      	r1, 128
 8014010:	0310      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014012:	de0b0000 	st.b      	r16, (r11, 0x0)
 8014016:	dd0b0001 	st.b      	r8, (r11, 0x1)
	ST7789_Select();
 801401a:	e3ffee81 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 801401e:	3200      	movi      	r2, 0
 8014020:	ea210080 	movih      	r1, 128
 8014024:	0315      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014026:	e3ffee7b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801402a:	3201      	movi      	r2, 1
 801402c:	ea210040 	movih      	r1, 64
 8014030:	0318      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014032:	e3ffee75 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014036:	3300      	movi      	r3, 0
 8014038:	2b00      	subi      	r3, 1
 801403a:	6c6f      	mov      	r1, r11
 801403c:	3202      	movi      	r2, 2
 801403e:	031a      	lrw      	r0, 0x200018b4	// 8014250 <ST7789_DrawCircle+0x7dc>
 8014040:	e3ffef70 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8014044:	3201      	movi      	r2, 1
 8014046:	ea210080 	movih      	r1, 128
 801404a:	031e      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 801404c:	e3ffee68 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8014050:	3201      	movi      	r2, 1
 8014052:	ea210080 	movih      	r1, 128
 8014056:	131e      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014058:	e3ffee62 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 801405c:	e800fd3e 	br      	0x8013ad8	// 8013ad8 <ST7789_DrawCircle+0x64>
	ST7789_SetAddressWindow(x, y, x, y);
 8014060:	6c4f      	mov      	r1, r3
 8014062:	6c93      	mov      	r2, r4
 8014064:	6c13      	mov      	r0, r4
 8014066:	e3fff463 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 801406a:	9842      	ld.w      	r2, (r14, 0x8)
 801406c:	4a68      	lsri      	r3, r2, 8
 801406e:	dc4e0019 	st.b      	r2, (r14, 0x19)
	ST7789_Select();
 8014072:	ea210080 	movih      	r1, 128
 8014076:	c4104822 	lsli      	r2, r16, 0
 801407a:	1315      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 801407c:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 8014080:	e3ffee4e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8014084:	c4104822 	lsli      	r2, r16, 0
 8014088:	ea210080 	movih      	r1, 128
 801408c:	1310      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 801408e:	e3ffee47 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014092:	6ca3      	mov      	r2, r8
 8014094:	ea210040 	movih      	r1, 64
 8014098:	130d      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 801409a:	e3ffee41 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	uint8_t data[] = {color >> 8, color & 0xFF};
 801409e:	e56e0017 	addi      	r11, r14, 24
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80140a2:	c4104823 	lsli      	r3, r16, 0
 80140a6:	60e2      	subu      	r3, r8
 80140a8:	3202      	movi      	r2, 2
 80140aa:	6c6f      	mov      	r1, r11
 80140ac:	1309      	lrw      	r0, 0x200018b4	// 8014250 <ST7789_DrawCircle+0x7dc>
 80140ae:	e3ffef39 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80140b2:	6ca3      	mov      	r2, r8
 80140b4:	ea210080 	movih      	r1, 128
 80140b8:	1305      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 80140ba:	e3ffee31 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 80140be:	6ca3      	mov      	r2, r8
 80140c0:	ea210080 	movih      	r1, 128
 80140c4:	1302      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 80140c6:	e3ffee2b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawPixel(x0, y0 - r, color);
 80140ca:	5d7d      	subu      	r3, r5, r7
 80140cc:	74cd      	zexth      	r3, r3
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80140ce:	eb0300ef 	cmphsi      	r3, 240
 80140d2:	e860fcf9 	bt      	0x8013ac4	// 8013ac4 <ST7789_DrawCircle+0x50>
	ST7789_SetAddressWindow(x, y, x, y);
 80140d6:	6c93      	mov      	r2, r4
 80140d8:	6c4f      	mov      	r1, r3
 80140da:	6c13      	mov      	r0, r4
 80140dc:	e3fff428 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80140e0:	9842      	ld.w      	r2, (r14, 0x8)
 80140e2:	4a68      	lsri      	r3, r2, 8
 80140e4:	dc4e0019 	st.b      	r2, (r14, 0x19)
	ST7789_Select();
 80140e8:	ea210080 	movih      	r1, 128
 80140ec:	3200      	movi      	r2, 0
 80140ee:	1218      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80140f0:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 80140f4:	e3ffee14 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80140f8:	3200      	movi      	r2, 0
 80140fa:	ea210080 	movih      	r1, 128
 80140fe:	1214      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014100:	e3ffee0e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014104:	3201      	movi      	r2, 1
 8014106:	ea210040 	movih      	r1, 64
 801410a:	1211      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 801410c:	e3ffee08 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014110:	e56e0017 	addi      	r11, r14, 24
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014114:	3300      	movi      	r3, 0
 8014116:	2b00      	subi      	r3, 1
 8014118:	6c6f      	mov      	r1, r11
 801411a:	3202      	movi      	r2, 2
 801411c:	120d      	lrw      	r0, 0x200018b4	// 8014250 <ST7789_DrawCircle+0x7dc>
 801411e:	e3ffef01 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8014122:	3201      	movi      	r2, 1
 8014124:	ea210080 	movih      	r1, 128
 8014128:	1209      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 801412a:	e3ffedf9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801412e:	3201      	movi      	r2, 1
 8014130:	ea210080 	movih      	r1, 128
 8014134:	1206      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014136:	e3ffedf3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 801413a:	e800fcc5 	br      	0x8013ac4	// 8013ac4 <ST7789_DrawCircle+0x50>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 801413e:	eb1500ef 	cmphsi      	r21, 240
 8014142:	e860fcf1 	bt      	0x8013b24	// 8013b24 <ST7789_DrawCircle+0xb0>
	ST7789_SetAddressWindow(x, y, x, y);
 8014146:	c4154823 	lsli      	r3, r21, 0
 801414a:	c4154821 	lsli      	r1, r21, 0
 801414e:	c4104822 	lsli      	r2, r16, 0
 8014152:	c4104820 	lsli      	r0, r16, 0
 8014156:	ddae2005 	st.w      	r13, (r14, 0x14)
 801415a:	deae2004 	st.w      	r21, (r14, 0x10)
 801415e:	e3fff3e7 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014162:	d86e0000 	ld.b      	r3, (r14, 0x0)
 8014166:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 801416a:	3200      	movi      	r2, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 801416c:	d86e000c 	ld.b      	r3, (r14, 0xc)
	ST7789_Select();
 8014170:	ea210080 	movih      	r1, 128
 8014174:	1116      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014176:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 801417a:	e3ffedd1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 801417e:	3200      	movi      	r2, 0
 8014180:	ea210080 	movih      	r1, 128
 8014184:	1112      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014186:	e3ffedcb 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801418a:	3201      	movi      	r2, 1
 801418c:	ea210040 	movih      	r1, 64
 8014190:	110f      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014192:	e3ffedc5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014196:	3300      	movi      	r3, 0
 8014198:	2b00      	subi      	r3, 1
 801419a:	3202      	movi      	r2, 2
 801419c:	1906      	addi      	r1, r14, 24
 801419e:	9801      	ld.w      	r0, (r14, 0x4)
 80141a0:	e3ffeec0 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80141a4:	3201      	movi      	r2, 1
 80141a6:	ea210080 	movih      	r1, 128
 80141aa:	1109      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 80141ac:	e3ffedb8 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 80141b0:	3201      	movi      	r2, 1
 80141b2:	ea210080 	movih      	r1, 128
 80141b6:	1106      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 80141b8:	e3ffedb2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80141bc:	daae2004 	ld.w      	r21, (r14, 0x10)
 80141c0:	d9ae2005 	ld.w      	r13, (r14, 0x14)
 80141c4:	e800fcfe 	br      	0x8013bc0	// 8013bc0 <ST7789_DrawCircle+0x14c>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80141c8:	eb1100ef 	cmphsi      	r17, 240
 80141cc:	e860fcbf 	bt      	0x8013b4a	// 8013b4a <ST7789_DrawCircle+0xd6>
	ST7789_SetAddressWindow(x, y, x, y);
 80141d0:	c4154822 	lsli      	r2, r21, 0
 80141d4:	c4154820 	lsli      	r0, r21, 0
 80141d8:	c4114823 	lsli      	r3, r17, 0
 80141dc:	c4114821 	lsli      	r1, r17, 0
 80141e0:	ddae2004 	st.w      	r13, (r14, 0x10)
 80141e4:	e3fff3a4 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80141e8:	d86e0000 	ld.b      	r3, (r14, 0x0)
 80141ec:	dc6e0018 	st.b      	r3, (r14, 0x18)
	ST7789_Select();
 80141f0:	3200      	movi      	r2, 0
	uint8_t data[] = {color >> 8, color & 0xFF};
 80141f2:	d86e000c 	ld.b      	r3, (r14, 0xc)
	ST7789_Select();
 80141f6:	ea210080 	movih      	r1, 128
 80141fa:	1015      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80141fc:	dc6e0019 	st.b      	r3, (r14, 0x19)
	ST7789_Select();
 8014200:	e3ffed8e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8014204:	3200      	movi      	r2, 0
 8014206:	ea210080 	movih      	r1, 128
 801420a:	1011      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 801420c:	e3ffed88 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014210:	3201      	movi      	r2, 1
 8014212:	ea210040 	movih      	r1, 64
 8014216:	100e      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014218:	e3ffed82 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801421c:	3300      	movi      	r3, 0
 801421e:	2b00      	subi      	r3, 1
 8014220:	3202      	movi      	r2, 2
 8014222:	1906      	addi      	r1, r14, 24
 8014224:	9801      	ld.w      	r0, (r14, 0x4)
 8014226:	e3ffee7d 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801422a:	3201      	movi      	r2, 1
 801422c:	ea210080 	movih      	r1, 128
 8014230:	1007      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 8014232:	e3ffed75 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8014236:	3201      	movi      	r2, 1
 8014238:	ea210080 	movih      	r1, 128
 801423c:	1004      	lrw      	r0, 0x40011400	// 801424c <ST7789_DrawCircle+0x7d8>
 801423e:	e3ffed6f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014242:	d9ae2004 	ld.w      	r13, (r14, 0x10)
 8014246:	e800fd0d 	br      	0x8013c60	// 8013c60 <ST7789_DrawCircle+0x1ec>
 801424a:	0000      	.short	0x0000
 801424c:	40011400 	.long	0x40011400
 8014250:	200018b4 	.long	0x200018b4

08014254 <ST7789_WriteString>:
{
 8014254:	1421      	subi      	r14, r14, 4
 8014256:	ebe00058 	push      	r4-r11, r15, r16-r17
 801425a:	1429      	subi      	r14, r14, 36
 801425c:	6d0b      	mov      	r4, r2
 801425e:	9855      	ld.w      	r2, (r14, 0x54)
 8014260:	b804      	st.w      	r0, (r14, 0x10)
 8014262:	b825      	st.w      	r1, (r14, 0x14)
 8014264:	b874      	st.w      	r3, (r14, 0x50)
 8014266:	b846      	st.w      	r2, (r14, 0x18)
 8014268:	75cc      	zextb      	r7, r3
	ST7789_Select();
 801426a:	3200      	movi      	r2, 0
 801426c:	c50355e3 	zext      	r3, r3, 15, 8
 8014270:	ea210080 	movih      	r1, 128
 8014274:	020b      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
{
 8014276:	d92e102c 	ld.h      	r9, (r14, 0x58)
 801427a:	d94e102e 	ld.h      	r10, (r14, 0x5c)
 801427e:	b861      	st.w      	r3, (r14, 0x4)
	ST7789_Select();
 8014280:	e3ffed4e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014284:	5c62      	addi      	r3, r4, 1
 8014286:	b863      	st.w      	r3, (r14, 0xc)
	while (*str) {
 8014288:	2b00      	subi      	r3, 1
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 801428a:	c50a4850 	lsri      	r16, r10, 8
	while (*str) {
 801428e:	8380      	ld.b      	r4, (r3, 0x0)
				uint8_t data[] = {color >> 8, color & 0xFF};
 8014290:	c509484b 	lsri      	r11, r9, 8
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8014294:	02d2      	lrw      	r6, 0x200018b4	// 8014548 <ST7789_WriteString+0x2f4>
	while (*str) {
 8014296:	e9040130 	bez      	r4, 0x80144f6	// 80144f6 <ST7789_WriteString+0x2a2>
		if (x + font.width >= ST7789_WIDTH) {
 801429a:	9864      	ld.w      	r3, (r14, 0x10)
 801429c:	c4e30028 	addu      	r8, r3, r7
 80142a0:	eb2800ef 	cmplti      	r8, 240
 80142a4:	0944      	bt      	0x801452c	// 801452c <ST7789_WriteString+0x2d8>
			y += font.height;
 80142a6:	9841      	ld.w      	r2, (r14, 0x4)
 80142a8:	9865      	ld.w      	r3, (r14, 0x14)
 80142aa:	7549      	zexth      	r5, r2
 80142ac:	60d4      	addu      	r3, r5
 80142ae:	74cd      	zexth      	r3, r3
 80142b0:	b865      	st.w      	r3, (r14, 0x14)
			if (y + font.height >= ST7789_HEIGHT) {
 80142b2:	60c8      	addu      	r3, r2
 80142b4:	eb2300ef 	cmplti      	r3, 240
 80142b8:	0d1f      	bf      	0x80144f6	// 80144f6 <ST7789_WriteString+0x2a2>
			if (*str == ' ') {
 80142ba:	eb440020 	cmpnei      	r4, 32
 80142be:	0d40      	bf      	0x801453e	// 801453e <ST7789_WriteString+0x2ea>
 80142c0:	ea110000 	movi      	r17, 0
 80142c4:	c411482c 	lsli      	r12, r17, 0
 80142c8:	6e1f      	mov      	r8, r7
	ST7789_Select();
 80142ca:	3200      	movi      	r2, 0
 80142cc:	ea210080 	movih      	r1, 128
 80142d0:	0302      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 80142d2:	dd8e2000 	st.w      	r12, (r14, 0x0)
 80142d6:	e3ffed23 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80142da:	74e1      	zexth      	r3, r8
 80142dc:	b864      	st.w      	r3, (r14, 0x10)
 80142de:	e5031000 	subi      	r8, r3, 1
	ST7789_Select();
 80142e2:	3200      	movi      	r2, 0
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80142e4:	9865      	ld.w      	r3, (r14, 0x14)
	ST7789_Select();
 80142e6:	ea210080 	movih      	r1, 128
 80142ea:	0308      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80142ec:	614c      	addu      	r5, r3
	ST7789_Select();
 80142ee:	e3ffed17 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80142f2:	312a      	movi      	r1, 42
 80142f4:	dc2e001f 	st.b      	r1, (r14, 0x1f)
	ST7789_Select();
 80142f8:	3200      	movi      	r2, 0
 80142fa:	ea210080 	movih      	r1, 128
 80142fe:	030d      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 8014300:	e3ffed0e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8014304:	3200      	movi      	r2, 0
 8014306:	ea210040 	movih      	r1, 64
 801430a:	0310      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 801430c:	e3ffed08 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8014310:	3300      	movi      	r3, 0
 8014312:	2b00      	subi      	r3, 1
 8014314:	3201      	movi      	r2, 1
 8014316:	e42e001e 	addi      	r1, r14, 31
 801431a:	6c1b      	mov      	r0, r6
 801431c:	e3ffee02 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8014320:	7621      	zexth      	r8, r8
	ST7789_UnSelect();
 8014322:	3201      	movi      	r2, 1
 8014324:	ea210080 	movih      	r1, 128
 8014328:	0318      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 801432a:	e3ffecf9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 801432e:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8014332:	c5084843 	lsri      	r3, r8, 8
	ST7789_Select();
 8014336:	3200      	movi      	r2, 0
 8014338:	ea210080 	movih      	r1, 128
 801433c:	031d      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
		uint8_t data[] = {x_start >> 8, x_start & 0xFF, x_end >> 8, x_end & 0xFF};
 801433e:	dd8e0020 	st.b      	r12, (r14, 0x20)
 8014342:	dc6e0022 	st.b      	r3, (r14, 0x22)
 8014346:	de2e0021 	st.b      	r17, (r14, 0x21)
 801434a:	dd0e0023 	st.b      	r8, (r14, 0x23)
	ST7789_Select();
 801434e:	e3ffece7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014352:	3201      	movi      	r2, 1
 8014354:	ea210040 	movih      	r1, 64
 8014358:	131b      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 801435a:	e3ffece1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801435e:	3300      	movi      	r3, 0
 8014360:	2b00      	subi      	r3, 1
 8014362:	3204      	movi      	r2, 4
 8014364:	1908      	addi      	r1, r14, 32
 8014366:	6c1b      	mov      	r0, r6
 8014368:	e3ffeddc 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801436c:	3201      	movi      	r2, 1
 801436e:	ea210080 	movih      	r1, 128
 8014372:	1315      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 8014374:	e3ffecd4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014378:	312b      	movi      	r1, 43
 801437a:	dc2e001e 	st.b      	r1, (r14, 0x1e)
	ST7789_Select();
 801437e:	3200      	movi      	r2, 0
 8014380:	ea210080 	movih      	r1, 128
 8014384:	1310      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 8014386:	e3ffeccb 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 801438a:	3200      	movi      	r2, 0
 801438c:	ea210040 	movih      	r1, 64
 8014390:	130d      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 8014392:	e3ffecc5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 8014396:	3300      	movi      	r3, 0
 8014398:	2b00      	subi      	r3, 1
 801439a:	3201      	movi      	r2, 1
 801439c:	e42e001d 	addi      	r1, r14, 30
 80143a0:	6c1b      	mov      	r0, r6
 80143a2:	e3ffedbf 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80143a6:	3201      	movi      	r2, 1
 80143a8:	ea210080 	movih      	r1, 128
 80143ac:	1306      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 80143ae:	e3ffecb7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80143b2:	2d00      	subi      	r5, 1
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80143b4:	9845      	ld.w      	r2, (r14, 0x14)
 80143b6:	4a68      	lsri      	r3, r2, 8
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 80143b8:	7555      	zexth      	r5, r5
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80143ba:	dc6e0020 	st.b      	r3, (r14, 0x20)
 80143be:	dc4e0021 	st.b      	r2, (r14, 0x21)
 80143c2:	4d68      	lsri      	r3, r5, 8
	ST7789_Select();
 80143c4:	3200      	movi      	r2, 0
 80143c6:	ea210080 	movih      	r1, 128
 80143ca:	121f      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
		uint8_t data[] = {y_start >> 8, y_start & 0xFF, y_end >> 8, y_end & 0xFF};
 80143cc:	dc6e0022 	st.b      	r3, (r14, 0x22)
 80143d0:	dcae0023 	st.b      	r5, (r14, 0x23)
	ST7789_Select();
 80143d4:	e3ffeca4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80143d8:	3201      	movi      	r2, 1
 80143da:	ea210040 	movih      	r1, 64
 80143de:	121a      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 80143e0:	e3ffec9e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80143e4:	3300      	movi      	r3, 0
 80143e6:	2b00      	subi      	r3, 1
 80143e8:	3204      	movi      	r2, 4
 80143ea:	1908      	addi      	r1, r14, 32
 80143ec:	6c1b      	mov      	r0, r6
 80143ee:	e3ffed99 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80143f2:	3201      	movi      	r2, 1
 80143f4:	ea210080 	movih      	r1, 128
 80143f8:	1213      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 80143fa:	e3ffec91 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80143fe:	332c      	movi      	r3, 44
	ST7789_Select();
 8014400:	3200      	movi      	r2, 0
 8014402:	ea210080 	movih      	r1, 128
 8014406:	1210      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 8014408:	dc6e001d 	st.b      	r3, (r14, 0x1d)
 801440c:	e3ffec88 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Clr();
 8014410:	3200      	movi      	r2, 0
 8014412:	ea210040 	movih      	r1, 64
 8014416:	120c      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 8014418:	e3ffec82 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&ST7789_SPI_PORT, &cmd, sizeof(cmd), HAL_MAX_DELAY);
 801441c:	3300      	movi      	r3, 0
 801441e:	2b00      	subi      	r3, 1
 8014420:	3201      	movi      	r2, 1
 8014422:	e42e001c 	addi      	r1, r14, 29
 8014426:	6c1b      	mov      	r0, r6
 8014428:	e3ffed7c 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801442c:	3201      	movi      	r2, 1
 801442e:	ea210080 	movih      	r1, 128
 8014432:	1205      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 8014434:	e3ffec74 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8014438:	3201      	movi      	r2, 1
 801443a:	ea210080 	movih      	r1, 128
 801443e:	1202      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 8014440:	e3ffec6e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	for (i = 0; i < font.height; i++) {
 8014444:	9861      	ld.w      	r3, (r14, 0x4)
 8014446:	e903004b 	bez      	r3, 0x80144dc	// 80144dc <ST7789_WriteString+0x288>
 801444a:	6c8f      	mov      	r2, r3
 801444c:	e464101f 	subi      	r3, r4, 32
 8014450:	7cc8      	mult      	r3, r2
 8014452:	e9070045 	bez      	r7, 0x80144dc	// 80144dc <ST7789_WriteString+0x288>
 8014456:	60cc      	addu      	r3, r3
 8014458:	9846      	ld.w      	r2, (r14, 0x18)
 801445a:	60c8      	addu      	r3, r2
 801445c:	b862      	st.w      	r3, (r14, 0x8)
 801445e:	3300      	movi      	r3, 0
 8014460:	b860      	st.w      	r3, (r14, 0x0)
			if ((b << j) & 0x8000) {
 8014462:	ea088000 	movi      	r8, 32768
	ST7789_Select();
 8014466:	1198      	lrw      	r4, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
		b = font.data[(ch - 32) * font.height + i];
 8014468:	9862      	ld.w      	r3, (r14, 0x8)
 801446a:	9840      	ld.w      	r2, (r14, 0x0)
 801446c:	d0430445 	ldr.h      	r5, (r3, r2 << 1)
 8014470:	7555      	zexth      	r5, r5
 8014472:	ea110000 	movi      	r17, 0
 8014476:	0423      	br      	0x80144bc	// 80144bc <ST7789_WriteString+0x268>
				uint8_t data[] = {color >> 8, color & 0xFF};
 8014478:	dd6e0020 	st.b      	r11, (r14, 0x20)
 801447c:	dd2e0021 	st.b      	r9, (r14, 0x21)
	ST7789_Select();
 8014480:	3200      	movi      	r2, 0
 8014482:	ea210080 	movih      	r1, 128
 8014486:	6c13      	mov      	r0, r4
 8014488:	e3ffec4a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801448c:	3201      	movi      	r2, 1
 801448e:	ea210040 	movih      	r1, 64
 8014492:	6c13      	mov      	r0, r4
 8014494:	e3ffec44 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014498:	3300      	movi      	r3, 0
 801449a:	2b00      	subi      	r3, 1
 801449c:	3202      	movi      	r2, 2
 801449e:	1908      	addi      	r1, r14, 32
 80144a0:	6c1b      	mov      	r0, r6
 80144a2:	e3ffed3f 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		for (j = 0; j < font.width; j++) {
 80144a6:	e6310000 	addi      	r17, r17, 1
	ST7789_UnSelect();
 80144aa:	3201      	movi      	r2, 1
 80144ac:	ea210080 	movih      	r1, 128
 80144b0:	6c13      	mov      	r0, r4
 80144b2:	e3ffec35 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		for (j = 0; j < font.width; j++) {
 80144b6:	c4f10480 	cmpne      	r17, r7
 80144ba:	0c0b      	bf      	0x80144d0	// 80144d0 <ST7789_WriteString+0x27c>
			if ((b << j) & 0x8000) {
 80144bc:	c6254022 	lsl      	r2, r5, r17
 80144c0:	68a0      	and      	r2, r8
 80144c2:	e922ffdb 	bnez      	r2, 0x8014478	// 8014478 <ST7789_WriteString+0x224>
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 80144c6:	de0e0020 	st.b      	r16, (r14, 0x20)
 80144ca:	dd4e0021 	st.b      	r10, (r14, 0x21)
 80144ce:	07da      	br      	0x8014482	// 8014482 <ST7789_WriteString+0x22e>
	for (i = 0; i < font.height; i++) {
 80144d0:	9860      	ld.w      	r3, (r14, 0x0)
 80144d2:	2300      	addi      	r3, 1
 80144d4:	9841      	ld.w      	r2, (r14, 0x4)
 80144d6:	648e      	cmpne      	r3, r2
 80144d8:	b860      	st.w      	r3, (r14, 0x0)
 80144da:	0bc7      	bt      	0x8014468	// 8014468 <ST7789_WriteString+0x214>
	ST7789_UnSelect();
 80144dc:	3201      	movi      	r2, 1
 80144de:	ea210080 	movih      	r1, 128
 80144e2:	1019      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 80144e4:	e3ffec1c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80144e8:	9863      	ld.w      	r3, (r14, 0xc)
 80144ea:	2300      	addi      	r3, 1
 80144ec:	b863      	st.w      	r3, (r14, 0xc)
	while (*str) {
 80144ee:	2b00      	subi      	r3, 1
 80144f0:	8380      	ld.b      	r4, (r3, 0x0)
 80144f2:	e924fed4 	bnez      	r4, 0x801429a	// 801429a <ST7789_WriteString+0x46>
	ST7789_UnSelect();
 80144f6:	3201      	movi      	r2, 1
 80144f8:	ea210080 	movih      	r1, 128
 80144fc:	1012      	lrw      	r0, 0x40011400	// 8014544 <ST7789_WriteString+0x2f0>
 80144fe:	e3ffec0f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 8014502:	1409      	addi      	r14, r14, 36
 8014504:	da2e200a 	ld.w      	r17, (r14, 0x28)
 8014508:	da0e2009 	ld.w      	r16, (r14, 0x24)
 801450c:	d9ee2008 	ld.w      	r15, (r14, 0x20)
 8014510:	d96e2007 	ld.w      	r11, (r14, 0x1c)
 8014514:	d94e2006 	ld.w      	r10, (r14, 0x18)
 8014518:	d92e2005 	ld.w      	r9, (r14, 0x14)
 801451c:	d90e2004 	ld.w      	r8, (r14, 0x10)
 8014520:	98e3      	ld.w      	r7, (r14, 0xc)
 8014522:	98c2      	ld.w      	r6, (r14, 0x8)
 8014524:	98a1      	ld.w      	r5, (r14, 0x4)
 8014526:	9880      	ld.w      	r4, (r14, 0x0)
 8014528:	140c      	addi      	r14, r14, 48
 801452a:	783c      	jmp      	r15
 801452c:	d86e1002 	ld.h      	r3, (r14, 0x4)
 8014530:	754d      	zexth      	r5, r3
 8014532:	9864      	ld.w      	r3, (r14, 0x10)
 8014534:	c503484c 	lsri      	r12, r3, 8
 8014538:	c40354f1 	zext      	r17, r3, 7, 0
 801453c:	06c7      	br      	0x80142ca	// 80142ca <ST7789_WriteString+0x76>
			x = 0;
 801453e:	3300      	movi      	r3, 0
 8014540:	b864      	st.w      	r3, (r14, 0x10)
 8014542:	07d3      	br      	0x80144e8	// 80144e8 <ST7789_WriteString+0x294>
 8014544:	40011400 	.long	0x40011400
 8014548:	200018b4 	.long	0x200018b4

0801454c <ST7789_DrawFilledCircle>:
 * @param r -> radius of circle
 * @param color -> color of circle
 * @return  none
 */
void ST7789_DrawFilledCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color)
{
 801454c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014550:	142d      	subi      	r14, r14, 52
 8014552:	6dcb      	mov      	r7, r2
 8014554:	6e43      	mov      	r9, r0
 8014556:	6e07      	mov      	r8, r1
	ST7789_Select();
	int16_t f = 1 - r;
 8014558:	759d      	zexth      	r6, r7
	ST7789_Select();
 801455a:	3200      	movi      	r2, 0
 801455c:	ea210080 	movih      	r1, 128
 8014560:	0015      	lrw      	r0, 0x40011400	// 8014908 <ST7789_DrawFilledCircle+0x3bc>
{
 8014562:	6e8f      	mov      	r10, r3
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
 8014564:	ea0b0000 	movi      	r11, 0
	ST7789_Select();
 8014568:	e3ffebda 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	int16_t ddF_y = -2 * r;
 801456c:	5e78      	addu      	r3, r6, r6
 801456e:	c46b0083 	subu      	r3, r11, r3
 8014572:	74cf      	sexth      	r3, r3
 8014574:	b864      	st.w      	r3, (r14, 0x10)
	int16_t x = 0;
	int16_t y = r;

	ST7789_DrawPixel(x0, y0 + r, color);
 8014576:	7665      	zexth      	r9, r9
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8014578:	33ef      	movi      	r3, 239
	int16_t f = 1 - r;
 801457a:	3401      	movi      	r4, 1
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 801457c:	664c      	cmphs      	r3, r9
	int16_t f = 1 - r;
 801457e:	5cb9      	subu      	r5, r4, r6
 8014580:	7557      	sexth      	r5, r5
	ST7789_DrawPixel(x0, y0 + r, color);
 8014582:	7621      	zexth      	r8, r8
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8014584:	0c0f      	bf      	0x80145a2	// 80145a2 <ST7789_DrawFilledCircle+0x56>
	ST7789_DrawPixel(x0, y0 + r, color);
 8014586:	c5060023 	addu      	r3, r6, r8
 801458a:	74cd      	zexth      	r3, r3
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 801458c:	eb0300ef 	cmphsi      	r3, 240
 8014590:	e8400254 	bf      	0x8014a38	// 8014a38 <ST7789_DrawFilledCircle+0x4ec>
	ST7789_DrawPixel(x0, y0 - r, color);
 8014594:	c4c80083 	subu      	r3, r8, r6
 8014598:	74cd      	zexth      	r3, r3
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 801459a:	eb0300ef 	cmphsi      	r3, 240
 801459e:	e84002ff 	bf      	0x8014b9c	// 8014b9c <ST7789_DrawFilledCircle+0x650>
	ST7789_DrawPixel(x0 + r, y0, color);
 80145a2:	c5260024 	addu      	r4, r6, r9
 80145a6:	7511      	zexth      	r4, r4
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80145a8:	eb0400ef 	cmphsi      	r4, 240
 80145ac:	0912      	bt      	0x80147d0	// 80147d0 <ST7789_DrawFilledCircle+0x284>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80145ae:	eb0800ef 	cmphsi      	r8, 240
 80145b2:	e840027e 	bf      	0x8014aae	// 8014aae <ST7789_DrawFilledCircle+0x562>
	ST7789_DrawPixel(x0 - r, y0, color);
 80145b6:	c4c9008b 	subu      	r11, r9, r6
 80145ba:	76ed      	zexth      	r11, r11
	ST7789_DrawLine(x0 - r, y0, x0 + r, y0, color);
 80145bc:	dd4e2000 	st.w      	r10, (r14, 0x0)
 80145c0:	6ce3      	mov      	r3, r8
 80145c2:	6c93      	mov      	r2, r4
 80145c4:	6c63      	mov      	r1, r8
 80145c6:	6c2f      	mov      	r0, r11
 80145c8:	e3fff728 	bsr      	0x8013418	// 8013418 <ST7789_DrawLine>

	while (x < y) {
 80145cc:	e96700f9 	blsz      	r7, 0x80147be	// 80147be <ST7789_DrawFilledCircle+0x272>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80145d0:	ea110001 	movi      	r17, 1
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80145d4:	0171      	lrw      	r3, 0x200018b4	// 801490c <ST7789_DrawFilledCircle+0x3c0>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80145d6:	c50a4850 	lsri      	r16, r10, 8
	ST7789_Select();
 80145da:	0193      	lrw      	r4, 0x40011400	// 8014908 <ST7789_DrawFilledCircle+0x3bc>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80145dc:	b861      	st.w      	r3, (r14, 0x4)
 80145de:	c411482b 	lsli      	r11, r17, 0
 80145e2:	dd4e2002 	st.w      	r10, (r14, 0x8)
		if (f >= 0) {
 80145e6:	e985000e 	blz      	r5, 0x8014602	// 8014602 <ST7789_DrawFilledCircle+0xb6>
			y--;
			ddF_y += 2;
 80145ea:	9864      	ld.w      	r3, (r14, 0x10)
 80145ec:	e6230001 	addi      	r17, r3, 2
 80145f0:	c41155e3 	zext      	r3, r17, 15, 0
			y--;
 80145f4:	2f00      	subi      	r7, 1
 80145f6:	75df      	sexth      	r7, r7
			ddF_y += 2;
 80145f8:	748f      	sexth      	r2, r3
			f += ddF_y;
 80145fa:	614c      	addu      	r5, r3
			ddF_y += 2;
 80145fc:	b844      	st.w      	r2, (r14, 0x10)
			f += ddF_y;
 80145fe:	7557      	sexth      	r5, r5
 8014600:	759d      	zexth      	r6, r7
 8014602:	c56b0033 	addu      	r19, r11, r11
 8014606:	c569008c 	subu      	r12, r9, r11
 801460a:	c41355ea 	zext      	r10, r19, 15, 0
 801460e:	7731      	zexth      	r12, r12
 8014610:	c58a0035 	addu      	r21, r10, r12
		}
		x++;
 8014614:	74ef      	sexth      	r3, r11
 8014616:	c41555f5 	zext      	r21, r21, 15, 0
 801461a:	b863      	st.w      	r3, (r14, 0xc)
    if (x0 > x1) {
 801461c:	c5950420 	cmphs      	r21, r12
		ddF_x += 2;
		f += ddF_x;
 8014620:	e46a0000 	addi      	r3, r10, 1
 8014624:	614c      	addu      	r5, r3

		ST7789_DrawLine(x0 - x, y0 + y, x0 + x, y0 + y, color);
 8014626:	c4c80036 	addu      	r22, r8, r6
		f += ddF_x;
 801462a:	7557      	sexth      	r5, r5
		ST7789_DrawLine(x0 - x, y0 + y, x0 + x, y0 + y, color);
 801462c:	c41655f6 	zext      	r22, r22, 15, 0
    if (x0 > x1) {
 8014630:	e86002eb 	bt      	0x8014c06	// 8014c06 <ST7789_DrawFilledCircle+0x6ba>
 8014634:	c40c4837 	lsli      	r23, r12, 0
 8014638:	c415482d 	lsli      	r13, r21, 0
    dx = x1 - x0;
 801463c:	c5b70098 	subu      	r24, r23, r13
 8014640:	c41855f8 	zext      	r24, r24, 15, 0
    int16_t err = dx / 2;
 8014644:	c41859e3 	sext      	r3, r24, 15, 0
 8014648:	c7e34854 	lsri      	r20, r3, 31
 801464c:	c4740034 	addu      	r20, r20, r3
 8014650:	c4344891 	asri      	r17, r20, 1
 8014654:	0407      	br      	0x8014662	// 8014662 <ST7789_DrawFilledCircle+0x116>
    for (; x0<=x1; x0++) {
 8014656:	e5ad0000 	addi      	r13, r13, 1
 801465a:	7775      	zexth      	r13, r13
 801465c:	c5b70420 	cmphs      	r23, r13
 8014660:	0c17      	bf      	0x801468e	// 801468e <ST7789_DrawFilledCircle+0x142>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8014662:	eb0d00ef 	cmphsi      	r13, 240
 8014666:	0804      	bt      	0x801466e	// 801466e <ST7789_DrawFilledCircle+0x122>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8014668:	eb1600ef 	cmphsi      	r22, 240
 801466c:	0d02      	bf      	0x8014870	// 8014870 <ST7789_DrawFilledCircle+0x324>
        if (err < 0) {
 801466e:	e9b1fff4 	bhsz      	r17, 0x8014656	// 8014656 <ST7789_DrawFilledCircle+0x10a>
    for (; x0<=x1; x0++) {
 8014672:	e5ad0000 	addi      	r13, r13, 1
 8014676:	7775      	zexth      	r13, r13
 8014678:	c5b70420 	cmphs      	r23, r13
            y0 += ystep;
 801467c:	e6d61000 	subi      	r22, r22, 1
            err += dx;
 8014680:	c6380031 	addu      	r17, r24, r17
            y0 += ystep;
 8014684:	c41655f6 	zext      	r22, r22, 15, 0
            err += dx;
 8014688:	c41159f1 	sext      	r17, r17, 15, 0
    for (; x0<=x1; x0++) {
 801468c:	0beb      	bt      	0x8014662	// 8014662 <ST7789_DrawFilledCircle+0x116>
    if (x0 > x1) {
 801468e:	c6ac0420 	cmphs      	r12, r21
		ST7789_DrawLine(x0 + x, y0 - y, x0 - x, y0 - y, color);
 8014692:	c4c80094 	subu      	r20, r8, r6
 8014696:	c41455f4 	zext      	r20, r20, 15, 0
    if (x0 > x1) {
 801469a:	e86002c2 	bt      	0x8014c1e	// 8014c1e <ST7789_DrawFilledCircle+0x6d2>
    dx = x1 - x0;
 801469e:	c5950096 	subu      	r22, r21, r12
 80146a2:	c41655f6 	zext      	r22, r22, 15, 0
    int16_t err = dx / 2;
 80146a6:	c41659e3 	sext      	r3, r22, 15, 0
 80146aa:	c7e3484d 	lsri      	r13, r3, 31
 80146ae:	634c      	addu      	r13, r3
 80146b0:	c42d4891 	asri      	r17, r13, 1
 80146b4:	0407      	br      	0x80146c2	// 80146c2 <ST7789_DrawFilledCircle+0x176>
    for (; x0<=x1; x0++) {
 80146b6:	e58c0000 	addi      	r12, r12, 1
 80146ba:	7731      	zexth      	r12, r12
 80146bc:	c5950420 	cmphs      	r21, r12
 80146c0:	0c17      	bf      	0x80146ee	// 80146ee <ST7789_DrawFilledCircle+0x1a2>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80146c2:	eb0c00ef 	cmphsi      	r12, 240
 80146c6:	0804      	bt      	0x80146ce	// 80146ce <ST7789_DrawFilledCircle+0x182>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80146c8:	eb1400ef 	cmphsi      	r20, 240
 80146cc:	0d22      	bf      	0x8014910	// 8014910 <ST7789_DrawFilledCircle+0x3c4>
        if (err < 0) {
 80146ce:	e9b1fff4 	bhsz      	r17, 0x80146b6	// 80146b6 <ST7789_DrawFilledCircle+0x16a>
    for (; x0<=x1; x0++) {
 80146d2:	e58c0000 	addi      	r12, r12, 1
 80146d6:	7731      	zexth      	r12, r12
 80146d8:	c5950420 	cmphs      	r21, r12
            y0 += ystep;
 80146dc:	e6941000 	subi      	r20, r20, 1
            err += dx;
 80146e0:	c6360031 	addu      	r17, r22, r17
            y0 += ystep;
 80146e4:	c41455f4 	zext      	r20, r20, 15, 0
            err += dx;
 80146e8:	c41159f1 	sext      	r17, r17, 15, 0
    for (; x0<=x1; x0++) {
 80146ec:	0beb      	bt      	0x80146c2	// 80146c2 <ST7789_DrawFilledCircle+0x176>

		ST7789_DrawLine(x0 + y, y0 + x, x0 - y, y0 + x, color);
 80146ee:	c4c90036 	addu      	r22, r9, r6
 80146f2:	c4c9008c 	subu      	r12, r9, r6
 80146f6:	c41655f6 	zext      	r22, r22, 15, 0
 80146fa:	7731      	zexth      	r12, r12
    if (x0 > x1) {
 80146fc:	c6cc0420 	cmphs      	r12, r22
 8014700:	c5680034 	addu      	r20, r8, r11
 8014704:	c41455f1 	zext      	r17, r20, 15, 0
 8014708:	e8600284 	bt      	0x8014c10	// 8014c10 <ST7789_DrawFilledCircle+0x6c4>
    dx = x1 - x0;
 801470c:	c5960098 	subu      	r24, r22, r12
 8014710:	c41855f8 	zext      	r24, r24, 15, 0
    int16_t err = dx / 2;
 8014714:	c41859e3 	sext      	r3, r24, 15, 0
 8014718:	c7e34855 	lsri      	r21, r3, 31
 801471c:	c4750035 	addu      	r21, r21, r3
 8014720:	c4354895 	asri      	r21, r21, 1
 8014724:	c4154837 	lsli      	r23, r21, 0
 8014728:	6f73      	mov      	r13, r12
 801472a:	c4114839 	lsli      	r25, r17, 0
 801472e:	0407      	br      	0x801473c	// 801473c <ST7789_DrawFilledCircle+0x1f0>
    for (; x0<=x1; x0++) {
 8014730:	e5ad0000 	addi      	r13, r13, 1
 8014734:	7775      	zexth      	r13, r13
 8014736:	c5b60420 	cmphs      	r22, r13
 801473a:	0c17      	bf      	0x8014768	// 8014768 <ST7789_DrawFilledCircle+0x21c>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 801473c:	eb0d00ef 	cmphsi      	r13, 240
 8014740:	0804      	bt      	0x8014748	// 8014748 <ST7789_DrawFilledCircle+0x1fc>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8014742:	eb1900ef 	cmphsi      	r25, 240
 8014746:	0d29      	bf      	0x8014998	// 8014998 <ST7789_DrawFilledCircle+0x44c>
        if (err < 0) {
 8014748:	e9b7fff4 	bhsz      	r23, 0x8014730	// 8014730 <ST7789_DrawFilledCircle+0x1e4>
    for (; x0<=x1; x0++) {
 801474c:	e5ad0000 	addi      	r13, r13, 1
 8014750:	7775      	zexth      	r13, r13
 8014752:	c5b60420 	cmphs      	r22, r13
            y0 += ystep;
 8014756:	e7391000 	subi      	r25, r25, 1
            err += dx;
 801475a:	c6f80037 	addu      	r23, r24, r23
            y0 += ystep;
 801475e:	c41955f9 	zext      	r25, r25, 15, 0
            err += dx;
 8014762:	c41759f7 	sext      	r23, r23, 15, 0
    for (; x0<=x1; x0++) {
 8014766:	0beb      	bt      	0x801473c	// 801473c <ST7789_DrawFilledCircle+0x1f0>
 8014768:	c5510093 	subu      	r19, r17, r10
 801476c:	c41355ea 	zext      	r10, r19, 15, 0
 8014770:	c40c4831 	lsli      	r17, r12, 0
 8014774:	0408      	br      	0x8014784	// 8014784 <ST7789_DrawFilledCircle+0x238>
 8014776:	e6310000 	addi      	r17, r17, 1
 801477a:	c41155f1 	zext      	r17, r17, 15, 0
 801477e:	c6360420 	cmphs      	r22, r17
 8014782:	0c17      	bf      	0x80147b0	// 80147b0 <ST7789_DrawFilledCircle+0x264>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8014784:	eb1100ef 	cmphsi      	r17, 240
 8014788:	0804      	bt      	0x8014790	// 8014790 <ST7789_DrawFilledCircle+0x244>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 801478a:	eb0a00ef 	cmphsi      	r10, 240
 801478e:	0c31      	bf      	0x80147f0	// 80147f0 <ST7789_DrawFilledCircle+0x2a4>
        if (err < 0) {
 8014790:	e9b5fff3 	bhsz      	r21, 0x8014776	// 8014776 <ST7789_DrawFilledCircle+0x22a>
    for (; x0<=x1; x0++) {
 8014794:	e6310000 	addi      	r17, r17, 1
 8014798:	c41155f1 	zext      	r17, r17, 15, 0
 801479c:	c6360420 	cmphs      	r22, r17
            y0 += ystep;
 80147a0:	e54a1000 	subi      	r10, r10, 1
            err += dx;
 80147a4:	c6b80035 	addu      	r21, r24, r21
            y0 += ystep;
 80147a8:	76a9      	zexth      	r10, r10
            err += dx;
 80147aa:	c41559f5 	sext      	r21, r21, 15, 0
    for (; x0<=x1; x0++) {
 80147ae:	0beb      	bt      	0x8014784	// 8014784 <ST7789_DrawFilledCircle+0x238>
	while (x < y) {
 80147b0:	9863      	ld.w      	r3, (r14, 0xc)
 80147b2:	65cd      	cmplt      	r3, r7
 80147b4:	e64b0000 	addi      	r18, r11, 1
 80147b8:	c41255eb 	zext      	r11, r18, 15, 0
 80147bc:	0b15      	bt      	0x80145e6	// 80145e6 <ST7789_DrawFilledCircle+0x9a>
		ST7789_DrawLine(x0 + y, y0 - x, x0 - y, y0 - x, color);
	}
	ST7789_UnSelect();
 80147be:	3201      	movi      	r2, 1
 80147c0:	ea210080 	movih      	r1, 128
 80147c4:	1211      	lrw      	r0, 0x40011400	// 8014908 <ST7789_DrawFilledCircle+0x3bc>
 80147c6:	e3ffeaab 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
}
 80147ca:	140d      	addi      	r14, r14, 52
 80147cc:	ebc00058 	pop      	r4-r11, r15, r16-r17
	ST7789_DrawPixel(x0 - r, y0, color);
 80147d0:	c4c9008b 	subu      	r11, r9, r6
 80147d4:	76ed      	zexth      	r11, r11
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80147d6:	eb0b00ef 	cmphsi      	r11, 240
 80147da:	0af1      	bt      	0x80145bc	// 80145bc <ST7789_DrawFilledCircle+0x70>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80147dc:	eb0800ef 	cmphsi      	r8, 240
 80147e0:	0aee      	bt      	0x80145bc	// 80145bc <ST7789_DrawFilledCircle+0x70>
 80147e2:	c50a484c 	lsri      	r12, r10, 8
 80147e6:	c40a54f1 	zext      	r17, r10, 7, 0
 80147ea:	e60e002f 	addi      	r16, r14, 48
 80147ee:	05a1      	br      	0x8014b30	// 8014b30 <ST7789_DrawFilledCircle+0x5e4>
	ST7789_SetAddressWindow(x, y, x, y);
 80147f0:	6ceb      	mov      	r3, r10
 80147f2:	c4114822 	lsli      	r2, r17, 0
 80147f6:	6c6b      	mov      	r1, r10
 80147f8:	c4114820 	lsli      	r0, r17, 0
 80147fc:	df0e2007 	st.w      	r24, (r14, 0x1c)
 8014800:	deae2006 	st.w      	r21, (r14, 0x18)
 8014804:	dece2005 	st.w      	r22, (r14, 0x14)
 8014808:	e3fff092 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 801480c:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 8014810:	3200      	movi      	r2, 0
 8014812:	ea210080 	movih      	r1, 128
 8014816:	6c13      	mov      	r0, r4
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014818:	dc6e0031 	st.b      	r3, (r14, 0x31)
 801481c:	de0e0030 	st.b      	r16, (r14, 0x30)
	ST7789_Select();
 8014820:	e3ffea7e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8014824:	3200      	movi      	r2, 0
 8014826:	ea210080 	movih      	r1, 128
 801482a:	6c13      	mov      	r0, r4
 801482c:	e3ffea78 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014830:	3201      	movi      	r2, 1
 8014832:	ea210040 	movih      	r1, 64
 8014836:	6c13      	mov      	r0, r4
 8014838:	e3ffea72 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801483c:	3300      	movi      	r3, 0
 801483e:	2b00      	subi      	r3, 1
 8014840:	3202      	movi      	r2, 2
 8014842:	190c      	addi      	r1, r14, 48
 8014844:	9801      	ld.w      	r0, (r14, 0x4)
 8014846:	e3ffeb6d 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801484a:	3201      	movi      	r2, 1
 801484c:	ea210080 	movih      	r1, 128
 8014850:	6c13      	mov      	r0, r4
 8014852:	e3ffea65 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8014856:	3201      	movi      	r2, 1
 8014858:	ea210080 	movih      	r1, 128
 801485c:	6c13      	mov      	r0, r4
 801485e:	e3ffea5f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014862:	db0e2007 	ld.w      	r24, (r14, 0x1c)
 8014866:	daae2006 	ld.w      	r21, (r14, 0x18)
 801486a:	dace2005 	ld.w      	r22, (r14, 0x14)
 801486e:	0791      	br      	0x8014790	// 8014790 <ST7789_DrawFilledCircle+0x244>
	ST7789_SetAddressWindow(x, y, x, y);
 8014870:	c4164823 	lsli      	r3, r22, 0
 8014874:	6cb7      	mov      	r2, r13
 8014876:	c4164821 	lsli      	r1, r22, 0
 801487a:	6c37      	mov      	r0, r13
 801487c:	deae200a 	st.w      	r21, (r14, 0x28)
 8014880:	dd8e2009 	st.w      	r12, (r14, 0x24)
 8014884:	df0e2008 	st.w      	r24, (r14, 0x20)
 8014888:	deee2007 	st.w      	r23, (r14, 0x1c)
 801488c:	dece2006 	st.w      	r22, (r14, 0x18)
 8014890:	ddae2005 	st.w      	r13, (r14, 0x14)
 8014894:	e3fff04c 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014898:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 801489c:	3200      	movi      	r2, 0
 801489e:	ea210080 	movih      	r1, 128
 80148a2:	6c13      	mov      	r0, r4
	uint8_t data[] = {color >> 8, color & 0xFF};
 80148a4:	dc6e0031 	st.b      	r3, (r14, 0x31)
 80148a8:	de0e0030 	st.b      	r16, (r14, 0x30)
	ST7789_Select();
 80148ac:	e3ffea38 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80148b0:	3200      	movi      	r2, 0
 80148b2:	ea210080 	movih      	r1, 128
 80148b6:	6c13      	mov      	r0, r4
 80148b8:	e3ffea32 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80148bc:	3201      	movi      	r2, 1
 80148be:	ea210040 	movih      	r1, 64
 80148c2:	6c13      	mov      	r0, r4
 80148c4:	e3ffea2c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80148c8:	3300      	movi      	r3, 0
 80148ca:	2b00      	subi      	r3, 1
 80148cc:	3202      	movi      	r2, 2
 80148ce:	190c      	addi      	r1, r14, 48
 80148d0:	9801      	ld.w      	r0, (r14, 0x4)
 80148d2:	e3ffeb27 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80148d6:	3201      	movi      	r2, 1
 80148d8:	ea210080 	movih      	r1, 128
 80148dc:	6c13      	mov      	r0, r4
 80148de:	e3ffea1f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 80148e2:	3201      	movi      	r2, 1
 80148e4:	ea210080 	movih      	r1, 128
 80148e8:	6c13      	mov      	r0, r4
 80148ea:	e3ffea19 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80148ee:	daae200a 	ld.w      	r21, (r14, 0x28)
 80148f2:	d98e2009 	ld.w      	r12, (r14, 0x24)
 80148f6:	db0e2008 	ld.w      	r24, (r14, 0x20)
 80148fa:	daee2007 	ld.w      	r23, (r14, 0x1c)
 80148fe:	dace2006 	ld.w      	r22, (r14, 0x18)
 8014902:	d9ae2005 	ld.w      	r13, (r14, 0x14)
 8014906:	06b4      	br      	0x801466e	// 801466e <ST7789_DrawFilledCircle+0x122>
 8014908:	40011400 	.long	0x40011400
 801490c:	200018b4 	.long	0x200018b4
	ST7789_SetAddressWindow(x, y, x, y);
 8014910:	c4144823 	lsli      	r3, r20, 0
 8014914:	6cb3      	mov      	r2, r12
 8014916:	c4144821 	lsli      	r1, r20, 0
 801491a:	6c33      	mov      	r0, r12
 801491c:	dece2008 	st.w      	r22, (r14, 0x20)
 8014920:	deae2007 	st.w      	r21, (r14, 0x1c)
 8014924:	de8e2006 	st.w      	r20, (r14, 0x18)
 8014928:	dd8e2005 	st.w      	r12, (r14, 0x14)
 801492c:	e3fff000 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014930:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 8014934:	3200      	movi      	r2, 0
 8014936:	ea210080 	movih      	r1, 128
 801493a:	6c13      	mov      	r0, r4
	uint8_t data[] = {color >> 8, color & 0xFF};
 801493c:	dc6e0031 	st.b      	r3, (r14, 0x31)
 8014940:	de0e0030 	st.b      	r16, (r14, 0x30)
	ST7789_Select();
 8014944:	e3ffe9ec 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8014948:	3200      	movi      	r2, 0
 801494a:	ea210080 	movih      	r1, 128
 801494e:	6c13      	mov      	r0, r4
 8014950:	e3ffe9e6 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014954:	3201      	movi      	r2, 1
 8014956:	ea210040 	movih      	r1, 64
 801495a:	6c13      	mov      	r0, r4
 801495c:	e3ffe9e0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014960:	3300      	movi      	r3, 0
 8014962:	2b00      	subi      	r3, 1
 8014964:	3202      	movi      	r2, 2
 8014966:	190c      	addi      	r1, r14, 48
 8014968:	9801      	ld.w      	r0, (r14, 0x4)
 801496a:	e3ffeadb 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 801496e:	3201      	movi      	r2, 1
 8014970:	ea210080 	movih      	r1, 128
 8014974:	6c13      	mov      	r0, r4
 8014976:	e3ffe9d3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801497a:	3201      	movi      	r2, 1
 801497c:	ea210080 	movih      	r1, 128
 8014980:	6c13      	mov      	r0, r4
 8014982:	e3ffe9cd 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014986:	dace2008 	ld.w      	r22, (r14, 0x20)
 801498a:	daae2007 	ld.w      	r21, (r14, 0x1c)
 801498e:	da8e2006 	ld.w      	r20, (r14, 0x18)
 8014992:	d98e2005 	ld.w      	r12, (r14, 0x14)
 8014996:	069c      	br      	0x80146ce	// 80146ce <ST7789_DrawFilledCircle+0x182>
	ST7789_SetAddressWindow(x, y, x, y);
 8014998:	c4194823 	lsli      	r3, r25, 0
 801499c:	6cb7      	mov      	r2, r13
 801499e:	c4194821 	lsli      	r1, r25, 0
 80149a2:	6c37      	mov      	r0, r13
 80149a4:	df0e200b 	st.w      	r24, (r14, 0x2c)
 80149a8:	deee200a 	st.w      	r23, (r14, 0x28)
 80149ac:	deae2009 	st.w      	r21, (r14, 0x24)
 80149b0:	dd8e2008 	st.w      	r12, (r14, 0x20)
 80149b4:	dece2007 	st.w      	r22, (r14, 0x1c)
 80149b8:	df2e2006 	st.w      	r25, (r14, 0x18)
 80149bc:	ddae2005 	st.w      	r13, (r14, 0x14)
 80149c0:	e3ffefb6 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80149c4:	d86e0008 	ld.b      	r3, (r14, 0x8)
	ST7789_Select();
 80149c8:	3200      	movi      	r2, 0
 80149ca:	ea210080 	movih      	r1, 128
 80149ce:	6c13      	mov      	r0, r4
	uint8_t data[] = {color >> 8, color & 0xFF};
 80149d0:	dc6e0031 	st.b      	r3, (r14, 0x31)
 80149d4:	de0e0030 	st.b      	r16, (r14, 0x30)
	ST7789_Select();
 80149d8:	e3ffe9a2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80149dc:	3200      	movi      	r2, 0
 80149de:	ea210080 	movih      	r1, 128
 80149e2:	6c13      	mov      	r0, r4
 80149e4:	e3ffe99c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80149e8:	3201      	movi      	r2, 1
 80149ea:	ea210040 	movih      	r1, 64
 80149ee:	6c13      	mov      	r0, r4
 80149f0:	e3ffe996 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80149f4:	3300      	movi      	r3, 0
 80149f6:	2b00      	subi      	r3, 1
 80149f8:	3202      	movi      	r2, 2
 80149fa:	190c      	addi      	r1, r14, 48
 80149fc:	9801      	ld.w      	r0, (r14, 0x4)
 80149fe:	e3ffea91 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8014a02:	3201      	movi      	r2, 1
 8014a04:	ea210080 	movih      	r1, 128
 8014a08:	6c13      	mov      	r0, r4
 8014a0a:	e3ffe989 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8014a0e:	3201      	movi      	r2, 1
 8014a10:	ea210080 	movih      	r1, 128
 8014a14:	6c13      	mov      	r0, r4
 8014a16:	e3ffe983 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014a1a:	db0e200b 	ld.w      	r24, (r14, 0x2c)
 8014a1e:	daee200a 	ld.w      	r23, (r14, 0x28)
 8014a22:	daae2009 	ld.w      	r21, (r14, 0x24)
 8014a26:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8014a2a:	dace2007 	ld.w      	r22, (r14, 0x1c)
 8014a2e:	db2e2006 	ld.w      	r25, (r14, 0x18)
 8014a32:	d9ae2005 	ld.w      	r13, (r14, 0x14)
 8014a36:	0689      	br      	0x8014748	// 8014748 <ST7789_DrawFilledCircle+0x1fc>
	ST7789_SetAddressWindow(x, y, x, y);
 8014a38:	6c4f      	mov      	r1, r3
 8014a3a:	6ca7      	mov      	r2, r9
 8014a3c:	6c27      	mov      	r0, r9
 8014a3e:	e3ffef77 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014a42:	c50a4843 	lsri      	r3, r10, 8
	ST7789_Select();
 8014a46:	6caf      	mov      	r2, r11
 8014a48:	ea210080 	movih      	r1, 128
 8014a4c:	1318      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014a4e:	dc6e0030 	st.b      	r3, (r14, 0x30)
 8014a52:	dd4e0031 	st.b      	r10, (r14, 0x31)
	ST7789_Select();
 8014a56:	e3ffe963 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8014a5a:	6caf      	mov      	r2, r11
 8014a5c:	ea210080 	movih      	r1, 128
 8014a60:	1313      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014a62:	e3ffe95d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014a66:	6c93      	mov      	r2, r4
 8014a68:	ea210040 	movih      	r1, 64
 8014a6c:	1310      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014a6e:	e3ffe957 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014a72:	e60e002f 	addi      	r16, r14, 48
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014a76:	6cef      	mov      	r3, r11
 8014a78:	60d2      	subu      	r3, r4
 8014a7a:	3202      	movi      	r2, 2
 8014a7c:	c4104821 	lsli      	r1, r16, 0
 8014a80:	130c      	lrw      	r0, 0x200018b4	// 8014c30 <ST7789_DrawFilledCircle+0x6e4>
 8014a82:	e3ffea4f 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8014a86:	6c93      	mov      	r2, r4
 8014a88:	ea210080 	movih      	r1, 128
 8014a8c:	1308      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014a8e:	e3ffe947 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8014a92:	6c93      	mov      	r2, r4
 8014a94:	ea210080 	movih      	r1, 128
 8014a98:	1305      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014a9a:	e3ffe941 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawPixel(x0, y0 - r, color);
 8014a9e:	c4c80083 	subu      	r3, r8, r6
 8014aa2:	74cd      	zexth      	r3, r3
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8014aa4:	eb0300ef 	cmphsi      	r3, 240
 8014aa8:	e860fd7d 	bt      	0x80145a2	// 80145a2 <ST7789_DrawFilledCircle+0x56>
 8014aac:	0478      	br      	0x8014b9c	// 8014b9c <ST7789_DrawFilledCircle+0x650>
	ST7789_SetAddressWindow(x, y, x, y);
 8014aae:	6ce3      	mov      	r3, r8
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014ab0:	e60e002f 	addi      	r16, r14, 48
	ST7789_SetAddressWindow(x, y, x, y);
 8014ab4:	6c93      	mov      	r2, r4
 8014ab6:	6c63      	mov      	r1, r8
 8014ab8:	6c13      	mov      	r0, r4
 8014aba:	e3ffef39 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014abe:	c40a54f1 	zext      	r17, r10, 7, 0
 8014ac2:	c50a484c 	lsri      	r12, r10, 8
	ST7789_Select();
 8014ac6:	3200      	movi      	r2, 0
 8014ac8:	ea210080 	movih      	r1, 128
 8014acc:	1218      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014ace:	dd900000 	st.b      	r12, (r16, 0x0)
 8014ad2:	dd8e2001 	st.w      	r12, (r14, 0x4)
 8014ad6:	de300001 	st.b      	r17, (r16, 0x1)
	ST7789_Select();
 8014ada:	e3ffe921 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8014ade:	3200      	movi      	r2, 0
 8014ae0:	ea210080 	movih      	r1, 128
 8014ae4:	1212      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014ae6:	e3ffe91b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014aea:	3201      	movi      	r2, 1
 8014aec:	ea210040 	movih      	r1, 64
 8014af0:	120f      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014af2:	e3ffe915 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014af6:	3300      	movi      	r3, 0
 8014af8:	2b00      	subi      	r3, 1
 8014afa:	3202      	movi      	r2, 2
 8014afc:	c4104821 	lsli      	r1, r16, 0
 8014b00:	120c      	lrw      	r0, 0x200018b4	// 8014c30 <ST7789_DrawFilledCircle+0x6e4>
 8014b02:	e3ffea0f 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_DrawPixel(x0 - r, y0, color);
 8014b06:	c4c9008b 	subu      	r11, r9, r6
	ST7789_UnSelect();
 8014b0a:	3201      	movi      	r2, 1
 8014b0c:	ea210080 	movih      	r1, 128
 8014b10:	1207      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014b12:	e3ffe905 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawPixel(x0 - r, y0, color);
 8014b16:	76ed      	zexth      	r11, r11
	ST7789_UnSelect();
 8014b18:	3201      	movi      	r2, 1
 8014b1a:	ea210080 	movih      	r1, 128
 8014b1e:	1204      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014b20:	e3ffe8fe 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 8014b24:	eb0b00ef 	cmphsi      	r11, 240
 8014b28:	d98e2001 	ld.w      	r12, (r14, 0x4)
 8014b2c:	e860fd48 	bt      	0x80145bc	// 80145bc <ST7789_DrawFilledCircle+0x70>
	ST7789_SetAddressWindow(x, y, x, y);
 8014b30:	6ce3      	mov      	r3, r8
 8014b32:	6caf      	mov      	r2, r11
 8014b34:	6c63      	mov      	r1, r8
 8014b36:	6c2f      	mov      	r0, r11
 8014b38:	dd8e2001 	st.w      	r12, (r14, 0x4)
 8014b3c:	e3ffeef8 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014b40:	d98e2001 	ld.w      	r12, (r14, 0x4)
	ST7789_Select();
 8014b44:	3200      	movi      	r2, 0
 8014b46:	ea210080 	movih      	r1, 128
 8014b4a:	1119      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014b4c:	dd900000 	st.b      	r12, (r16, 0x0)
 8014b50:	de300001 	st.b      	r17, (r16, 0x1)
	ST7789_Select();
 8014b54:	e3ffe8e4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8014b58:	3200      	movi      	r2, 0
 8014b5a:	ea210080 	movih      	r1, 128
 8014b5e:	1114      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014b60:	e3ffe8de 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014b64:	3201      	movi      	r2, 1
 8014b66:	ea210040 	movih      	r1, 64
 8014b6a:	1111      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014b6c:	e3ffe8d8 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014b70:	3300      	movi      	r3, 0
 8014b72:	2b00      	subi      	r3, 1
 8014b74:	c4104821 	lsli      	r1, r16, 0
 8014b78:	3202      	movi      	r2, 2
 8014b7a:	110e      	lrw      	r0, 0x200018b4	// 8014c30 <ST7789_DrawFilledCircle+0x6e4>
 8014b7c:	e3ffe9d2 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8014b80:	3201      	movi      	r2, 1
 8014b82:	ea210080 	movih      	r1, 128
 8014b86:	110a      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014b88:	e3ffe8ca 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8014b8c:	3201      	movi      	r2, 1
 8014b8e:	ea210080 	movih      	r1, 128
 8014b92:	1107      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014b94:	e3ffe8c4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014b98:	e800fd12 	br      	0x80145bc	// 80145bc <ST7789_DrawFilledCircle+0x70>
	ST7789_SetAddressWindow(x, y, x, y);
 8014b9c:	6ca7      	mov      	r2, r9
 8014b9e:	6c4f      	mov      	r1, r3
 8014ba0:	6c27      	mov      	r0, r9
 8014ba2:	e3ffeec5 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014ba6:	c50a4843 	lsri      	r3, r10, 8
	ST7789_Select();
 8014baa:	3200      	movi      	r2, 0
 8014bac:	ea210080 	movih      	r1, 128
 8014bb0:	101f      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014bb2:	dc6e0030 	st.b      	r3, (r14, 0x30)
 8014bb6:	dd4e0031 	st.b      	r10, (r14, 0x31)
	ST7789_Select();
 8014bba:	e3ffe8b1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8014bbe:	3200      	movi      	r2, 0
 8014bc0:	ea210080 	movih      	r1, 128
 8014bc4:	101a      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014bc6:	e3ffe8ab 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014bca:	3201      	movi      	r2, 1
 8014bcc:	ea210040 	movih      	r1, 64
 8014bd0:	1017      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014bd2:	e3ffe8a5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8014bd6:	e60e002f 	addi      	r16, r14, 48
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014bda:	3300      	movi      	r3, 0
 8014bdc:	2b00      	subi      	r3, 1
 8014bde:	c4104821 	lsli      	r1, r16, 0
 8014be2:	3202      	movi      	r2, 2
 8014be4:	1013      	lrw      	r0, 0x200018b4	// 8014c30 <ST7789_DrawFilledCircle+0x6e4>
 8014be6:	e3ffe99d 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8014bea:	3201      	movi      	r2, 1
 8014bec:	ea210080 	movih      	r1, 128
 8014bf0:	100f      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014bf2:	e3ffe895 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8014bf6:	3201      	movi      	r2, 1
 8014bf8:	ea210080 	movih      	r1, 128
 8014bfc:	100c      	lrw      	r0, 0x40011400	// 8014c2c <ST7789_DrawFilledCircle+0x6e0>
 8014bfe:	e3ffe88f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014c02:	e800fcd0 	br      	0x80145a2	// 80145a2 <ST7789_DrawFilledCircle+0x56>
    if (x0 > x1) {
 8014c06:	c4154837 	lsli      	r23, r21, 0
 8014c0a:	6f73      	mov      	r13, r12
 8014c0c:	e800fd18 	br      	0x801463c	// 801463c <ST7789_DrawFilledCircle+0xf0>
 8014c10:	6cf3      	mov      	r3, r12
 8014c12:	c416482c 	lsli      	r12, r22, 0
 8014c16:	c4034836 	lsli      	r22, r3, 0
 8014c1a:	e800fd79 	br      	0x801470c	// 801470c <ST7789_DrawFilledCircle+0x1c0>
 8014c1e:	6cf3      	mov      	r3, r12
 8014c20:	c415482c 	lsli      	r12, r21, 0
 8014c24:	c4034835 	lsli      	r21, r3, 0
 8014c28:	e800fd3b 	br      	0x801469e	// 801469e <ST7789_DrawFilledCircle+0x152>
 8014c2c:	40011400 	.long	0x40011400
 8014c30:	200018b4 	.long	0x200018b4

08014c34 <ST7789_Test>:
 * @brief A Simple test function for ST7789
 * @param  none
 * @return  none
 */
void ST7789_Test(void)
{
 8014c34:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014c38:	1429      	subi      	r14, r14, 36
	
	ST7789_Fill_Color(WHITE);
 8014c3a:	ea00ffff 	movi      	r0, 65535
 8014c3e:	e3ffef2f 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	HAL_Delay(1000);
 8014c42:	ea0003e8 	movi      	r0, 1000
 8014c46:	e3ffe90b 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Select();
 8014c4a:	3200      	movi      	r2, 0
 8014c4c:	ea210080 	movih      	r1, 128
 8014c50:	0107      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014c52:	e3ffe865 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + w - 1, y + h - 1);
 8014c56:	33ef      	movi      	r3, 239
 8014c58:	3100      	movi      	r1, 0
 8014c5a:	6c8f      	mov      	r2, r3
 8014c5c:	6c07      	mov      	r0, r1
 8014c5e:	e3ffee67 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 8014c62:	3200      	movi      	r2, 0
 8014c64:	ea210080 	movih      	r1, 128
 8014c68:	010d      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014c6a:	e3ffe859 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014c6e:	3201      	movi      	r2, 1
 8014c70:	ea210040 	movih      	r1, 64
 8014c74:	0110      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014c76:	e3ffe853 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014c7a:	01b0      	lrw      	r5, 0x803735c	// 8014fb4 <ST7789_Test+0x380>
 8014c7c:	ea04c200 	movi      	r4, 49664
 8014c80:	3cb0      	bseti      	r4, 16
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 8014c82:	ea08ffff 	movi      	r8, 65535
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014c86:	01f2      	lrw      	r7, 0x200018b4	// 8014fb8 <ST7789_Test+0x384>
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 8014c88:	f904cd26 	min.u32      	r6, r4, r8
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014c8c:	3300      	movi      	r3, 0
 8014c8e:	6c57      	mov      	r1, r5
 8014c90:	2b00      	subi      	r3, 1
 8014c92:	6c9b      	mov      	r2, r6
 8014c94:	6c1f      	mov      	r0, r7
		buff_size -= chunk_size;
 8014c96:	611a      	subu      	r4, r6
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014c98:	e3ffe944 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		buff += chunk_size;
 8014c9c:	6158      	addu      	r5, r6
	while (buff_size > 0) {
 8014c9e:	e924fff5 	bnez      	r4, 0x8014c88	// 8014c88 <ST7789_Test+0x54>
	ST7789_UnSelect();
 8014ca2:	3201      	movi      	r2, 1
 8014ca4:	ea210080 	movih      	r1, 128
 8014ca8:	011d      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014caa:	e3ffe839 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawImage(0, 0, 240, 240, (uint16_t *)test_img);
	HAL_Delay(3000);
	ST7789_WriteString(10, 20, "Speed Test", Font_11x18, RED, WHITE);
 8014cae:	ea9000c4 	lrw      	r16, 0x20000160	// 8014fbc <ST7789_Test+0x388>
	ST7789_UnSelect();
 8014cb2:	3201      	movi      	r2, 1
 8014cb4:	ea210080 	movih      	r1, 128
 8014cb8:	0201      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014cba:	e3ffe831 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	HAL_Delay(3000);
 8014cbe:	ea000bb8 	movi      	r0, 3000
 8014cc2:	e3ffe8cd 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_WriteString(10, 20, "Speed Test", Font_11x18, RED, WHITE);
 8014cc6:	d8502000 	ld.w      	r2, (r16, 0x0)
 8014cca:	d8702001 	ld.w      	r3, (r16, 0x4)
 8014cce:	3014      	movi      	r0, 20
 8014cd0:	0223      	lrw      	r1, 0x805355c	// 8014fc0 <ST7789_Test+0x38c>
 8014cd2:	e3ffeb6f 	bsr      	0x80123b0	// 80123b0 <ST7789_WriteString.constprop.5>
	HAL_Delay(1000);
 8014cd6:	ea0003e8 	movi      	r0, 1000
 8014cda:	e3ffe8c1 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(CYAN);
 8014cde:	ea007fff 	movi      	r0, 32767
 8014ce2:	e3ffeedd 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014ce6:	ea0001f4 	movi      	r0, 500
 8014cea:	e3ffe8b9 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(RED);
 8014cee:	ea00f800 	movi      	r0, 63488
 8014cf2:	e3ffeed5 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014cf6:	ea0001f4 	movi      	r0, 500
 8014cfa:	e3ffe8b1 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(BLUE);
 8014cfe:	301f      	movi      	r0, 31
 8014d00:	e3ffeece 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d04:	ea0001f4 	movi      	r0, 500
 8014d08:	e3ffe8aa 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(GREEN);
 8014d0c:	ea0007e0 	movi      	r0, 2016
 8014d10:	e3ffeec6 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d14:	ea0001f4 	movi      	r0, 500
 8014d18:	e3ffe8a2 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(YELLOW);
 8014d1c:	ea00ffe0 	movi      	r0, 65504
 8014d20:	e3ffeebe 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d24:	ea0001f4 	movi      	r0, 500
 8014d28:	e3ffe89a 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(BROWN);
 8014d2c:	ea00bc40 	movi      	r0, 48192
 8014d30:	e3ffeeb6 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d34:	ea0001f4 	movi      	r0, 500
 8014d38:	e3ffe892 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(DARKBLUE);
 8014d3c:	ea0001cf 	movi      	r0, 463
 8014d40:	e3ffeeae 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d44:	ea0001f4 	movi      	r0, 500
 8014d48:	e3ffe88a 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(MAGENTA);
 8014d4c:	ea00f81f 	movi      	r0, 63519
 8014d50:	e3ffeea6 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d54:	ea0001f4 	movi      	r0, 500
 8014d58:	e3ffe882 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(LIGHTGREEN);
 8014d5c:	ea00841f 	movi      	r0, 33823
 8014d60:	e3ffee9e 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d64:	ea0001f4 	movi      	r0, 500
 8014d68:	e3ffe87a 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(LGRAY);
 8014d6c:	ea00c618 	movi      	r0, 50712
 8014d70:	e3ffee96 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d74:	ea0001f4 	movi      	r0, 500
 8014d78:	e3ffe872 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(LBBLUE);
 8014d7c:	ea002b12 	movi      	r0, 11026
 8014d80:	e3ffee8e 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
    HAL_Delay(500);
 8014d84:	ea0001f4 	movi      	r0, 500
 8014d88:	e3ffe86a 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Fill_Color(WHITE);
 8014d8c:	ea00ffff 	movi      	r0, 65535
 8014d90:	e3ffee86 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	HAL_Delay(500);
 8014d94:	ea0001f4 	movi      	r0, 500
 8014d98:	e3ffe862 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
 8014d9c:	0375      	lrw      	r3, 0x20000168	// 8014fc4 <ST7789_Test+0x390>
	ST7789_Select();
 8014d9e:	6c93      	mov      	r2, r4
 8014da0:	d9630001 	ld.b      	r11, (r3, 0x1)
 8014da4:	b866      	st.w      	r3, (r14, 0x18)
 8014da6:	83c0      	ld.b      	r6, (r3, 0x0)
 8014da8:	ea210080 	movih      	r1, 128
 8014dac:	9361      	ld.w      	r3, (r3, 0x4)
 8014dae:	031e      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014db0:	b865      	st.w      	r3, (r14, 0x14)
 8014db2:	e3ffe7b5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014db6:	74ed      	zexth      	r3, r11
 8014db8:	035b      	lrw      	r2, 0x8053569	// 8014fc8 <ST7789_Test+0x394>
 8014dba:	b864      	st.w      	r3, (r14, 0x10)
 8014dbc:	b842      	st.w      	r2, (r14, 0x8)
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8014dbe:	2b00      	subi      	r3, 1
	for (i = 0; i < font.height; i++) {
 8014dc0:	320a      	movi      	r2, 10
	while (*str) {
 8014dc2:	3546      	movi      	r5, 70
	for (i = 0; i < font.height; i++) {
 8014dc4:	b843      	st.w      	r2, (r14, 0xc)
 8014dc6:	b841      	st.w      	r2, (r14, 0x4)
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8014dc8:	b867      	st.w      	r3, (r14, 0x1c)
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 8014dca:	2c00      	subi      	r4, 1
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014dcc:	13fb      	lrw      	r7, 0x200018b4	// 8014fb8 <ST7789_Test+0x384>
		if (x + font.width >= ST7789_WIDTH) {
 8014dce:	9861      	ld.w      	r3, (r14, 0x4)
 8014dd0:	60d8      	addu      	r3, r6
 8014dd2:	eb2300ef 	cmplti      	r3, 240
 8014dd6:	e86004d4 	bt      	0x801577e	// 801577e <ST7789_Test+0xb4a>
			y += font.height;
 8014dda:	9864      	ld.w      	r3, (r14, 0x10)
 8014ddc:	9843      	ld.w      	r2, (r14, 0xc)
 8014dde:	c4430031 	addu      	r17, r3, r2
 8014de2:	c41155e3 	zext      	r3, r17, 15, 0
 8014de6:	b863      	st.w      	r3, (r14, 0xc)
			if (y + font.height >= ST7789_HEIGHT) {
 8014de8:	60ec      	addu      	r3, r11
 8014dea:	eb2300ef 	cmplti      	r3, 240
 8014dee:	0c6e      	bf      	0x8014eca	// 8014eca <ST7789_Test+0x296>
			if (*str == ' ') {
 8014df0:	eb450020 	cmpnei      	r5, 32
 8014df4:	e84004cd 	bf      	0x801578e	// 801578e <ST7789_Test+0xb5a>
			x = 0;
 8014df8:	ea080000 	movi      	r8, 0
	ST7789_Select();
 8014dfc:	3200      	movi      	r2, 0
 8014dfe:	ea210080 	movih      	r1, 128
 8014e02:	130c      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014e04:	e3ffe78c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8014e08:	c4c80023 	addu      	r3, r8, r6
 8014e0c:	748d      	zexth      	r2, r3
 8014e0e:	9823      	ld.w      	r1, (r14, 0xc)
 8014e10:	6c0b      	mov      	r0, r2
 8014e12:	b841      	st.w      	r2, (r14, 0x4)
 8014e14:	6cc7      	mov      	r3, r1
 8014e16:	9847      	ld.w      	r2, (r14, 0x1c)
 8014e18:	60c8      	addu      	r3, r2
 8014e1a:	6c83      	mov      	r2, r0
 8014e1c:	2a00      	subi      	r2, 1
 8014e1e:	74cd      	zexth      	r3, r3
 8014e20:	7489      	zexth      	r2, r2
 8014e22:	6c23      	mov      	r0, r8
 8014e24:	e3ffed84 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	for (i = 0; i < font.height; i++) {
 8014e28:	e90b0045 	bez      	r11, 0x8014eb2	// 8014eb2 <ST7789_Test+0x27e>
 8014e2c:	2d1f      	subi      	r5, 32
 8014e2e:	c565842a 	mult      	r10, r5, r11
 8014e32:	e9060040 	bez      	r6, 0x8014eb2	// 8014eb2 <ST7789_Test+0x27e>
 8014e36:	62a8      	addu      	r10, r10
 8014e38:	9865      	ld.w      	r3, (r14, 0x14)
 8014e3a:	628c      	addu      	r10, r3
 8014e3c:	ea090000 	movi      	r9, 0
			if ((b << j) & 0x8000) {
 8014e40:	ea088000 	movi      	r8, 32768
		b = font.data[(ch - 32) * font.height + i];
 8014e44:	d12a0445 	ldr.h      	r5, (r10, r9 << 1)
 8014e48:	7555      	zexth      	r5, r5
 8014e4a:	ea110000 	movi      	r17, 0
 8014e4e:	0424      	br      	0x8014e96	// 8014e96 <ST7789_Test+0x262>
				uint8_t data[] = {color >> 8, color & 0xFF};
 8014e50:	3307      	movi      	r3, 7
 8014e52:	dc6e0020 	st.b      	r3, (r14, 0x20)
 8014e56:	dc8e0021 	st.b      	r4, (r14, 0x21)
	ST7789_Select();
 8014e5a:	3200      	movi      	r2, 0
 8014e5c:	ea210080 	movih      	r1, 128
 8014e60:	1214      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014e62:	e3ffe75d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014e66:	3201      	movi      	r2, 1
 8014e68:	ea210040 	movih      	r1, 64
 8014e6c:	1211      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014e6e:	e3ffe757 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014e72:	3300      	movi      	r3, 0
 8014e74:	2b00      	subi      	r3, 1
 8014e76:	3202      	movi      	r2, 2
 8014e78:	1908      	addi      	r1, r14, 32
 8014e7a:	6c1f      	mov      	r0, r7
 8014e7c:	e3ffe852 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		for (j = 0; j < font.width; j++) {
 8014e80:	e6310000 	addi      	r17, r17, 1
	ST7789_UnSelect();
 8014e84:	3201      	movi      	r2, 1
 8014e86:	ea210080 	movih      	r1, 128
 8014e8a:	120a      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014e8c:	e3ffe748 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		for (j = 0; j < font.width; j++) {
 8014e90:	c4d10480 	cmpne      	r17, r6
 8014e94:	0c0b      	bf      	0x8014eaa	// 8014eaa <ST7789_Test+0x276>
			if ((b << j) & 0x8000) {
 8014e96:	c6254022 	lsl      	r2, r5, r17
 8014e9a:	68a0      	and      	r2, r8
 8014e9c:	e922ffda 	bnez      	r2, 0x8014e50	// 8014e50 <ST7789_Test+0x21c>
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 8014ea0:	dc8e0020 	st.b      	r4, (r14, 0x20)
 8014ea4:	dc8e0021 	st.b      	r4, (r14, 0x21)
 8014ea8:	07da      	br      	0x8014e5c	// 8014e5c <ST7789_Test+0x228>
	for (i = 0; i < font.height; i++) {
 8014eaa:	e5290000 	addi      	r9, r9, 1
 8014eae:	66e6      	cmpne      	r9, r11
 8014eb0:	0bca      	bt      	0x8014e44	// 8014e44 <ST7789_Test+0x210>
	ST7789_UnSelect();
 8014eb2:	3201      	movi      	r2, 1
 8014eb4:	ea210080 	movih      	r1, 128
 8014eb8:	111e      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014eba:	e3ffe731 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	while (*str) {
 8014ebe:	9862      	ld.w      	r3, (r14, 0x8)
 8014ec0:	d0038005 	ldbi.b      	r5, (r3)
 8014ec4:	b862      	st.w      	r3, (r14, 0x8)
 8014ec6:	e925ff84 	bnez      	r5, 0x8014dce	// 8014dce <ST7789_Test+0x19a>
	ST7789_UnSelect();
 8014eca:	3201      	movi      	r2, 1
 8014ecc:	ea210080 	movih      	r1, 128
 8014ed0:	1118      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014ed2:	e3ffe725 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>

	ST7789_WriteString(10, 10, "Font test.", Font_16x26, GBLUE, WHITE);
	ST7789_WriteString(10, 50, "Hello ProgramEl!", Font_7x10, RED, WHITE);
 8014ed6:	117e      	lrw      	r3, 0x20000170	// 8014fcc <ST7789_Test+0x398>
 8014ed8:	113e      	lrw      	r1, 0x8053574	// 8014fd0 <ST7789_Test+0x39c>
 8014eda:	3032      	movi      	r0, 50
 8014edc:	9340      	ld.w      	r2, (r3, 0x0)
 8014ede:	9361      	ld.w      	r3, (r3, 0x4)
 8014ee0:	e3ffea68 	bsr      	0x80123b0	// 80123b0 <ST7789_WriteString.constprop.5>
	ST7789_WriteString(10, 75, "Hello ProgramEl!", Font_11x18, YELLOW, WHITE);
 8014ee4:	ea03ffff 	movi      	r3, 65535
 8014ee8:	b860      	st.w      	r3, (r14, 0x0)
 8014eea:	d8502000 	ld.w      	r2, (r16, 0x0)
 8014eee:	d8702001 	ld.w      	r3, (r16, 0x4)
 8014ef2:	304b      	movi      	r0, 75
 8014ef4:	1137      	lrw      	r1, 0x8053574	// 8014fd0 <ST7789_Test+0x39c>
 8014ef6:	e3ffebb5 	bsr      	0x8012660	// 8012660 <ST7789_WriteString.constprop.7>
 8014efa:	9866      	ld.w      	r3, (r14, 0x18)
	ST7789_Select();
 8014efc:	3200      	movi      	r2, 0
 8014efe:	d9630001 	ld.b      	r11, (r3, 0x1)
 8014f02:	83c0      	ld.b      	r6, (r3, 0x0)
 8014f04:	ea210080 	movih      	r1, 128
 8014f08:	9361      	ld.w      	r3, (r3, 0x4)
 8014f0a:	110a      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
 8014f0c:	b865      	st.w      	r3, (r14, 0x14)
 8014f0e:	e3ffe707 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8014f12:	1151      	lrw      	r2, 0x8053575	// 8014fd4 <ST7789_Test+0x3a0>
 8014f14:	74ed      	zexth      	r3, r11
 8014f16:	b842      	st.w      	r2, (r14, 0x8)
	for (i = 0; i < font.height; i++) {
 8014f18:	3264      	movi      	r2, 100
 8014f1a:	b864      	st.w      	r3, (r14, 0x10)
 8014f1c:	b843      	st.w      	r2, (r14, 0xc)
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8014f1e:	2b00      	subi      	r3, 1
	for (i = 0; i < font.height; i++) {
 8014f20:	320a      	movi      	r2, 10
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 8014f22:	3500      	movi      	r5, 0
	while (*str) {
 8014f24:	3448      	movi      	r4, 72
	for (i = 0; i < font.height; i++) {
 8014f26:	b841      	st.w      	r2, (r14, 0x4)
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8014f28:	b866      	st.w      	r3, (r14, 0x18)
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 8014f2a:	2d00      	subi      	r5, 1
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8014f2c:	11e3      	lrw      	r7, 0x200018b4	// 8014fb8 <ST7789_Test+0x384>
		if (x + font.width >= ST7789_WIDTH) {
 8014f2e:	9861      	ld.w      	r3, (r14, 0x4)
 8014f30:	60d8      	addu      	r3, r6
 8014f32:	eb2300ef 	cmplti      	r3, 240
 8014f36:	e8600420 	bt      	0x8015776	// 8015776 <ST7789_Test+0xb42>
			y += font.height;
 8014f3a:	9863      	ld.w      	r3, (r14, 0xc)
 8014f3c:	9844      	ld.w      	r2, (r14, 0x10)
 8014f3e:	60c8      	addu      	r3, r2
 8014f40:	74cd      	zexth      	r3, r3
 8014f42:	b863      	st.w      	r3, (r14, 0xc)
			if (y + font.height >= ST7789_HEIGHT) {
 8014f44:	60ec      	addu      	r3, r11
 8014f46:	eb2300ef 	cmplti      	r3, 240
 8014f4a:	0c8a      	bf      	0x801505e	// 801505e <ST7789_Test+0x42a>
			if (*str == ' ') {
 8014f4c:	eb440020 	cmpnei      	r4, 32
 8014f50:	e840041b 	bf      	0x8015786	// 8015786 <ST7789_Test+0xb52>
			x = 0;
 8014f54:	ea080000 	movi      	r8, 0
	ST7789_Select();
 8014f58:	3200      	movi      	r2, 0
 8014f5a:	ea210080 	movih      	r1, 128
 8014f5e:	1015      	lrw      	r0, 0x40011400	// 8014fb0 <ST7789_Test+0x37c>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8014f60:	c4c80031 	addu      	r17, r8, r6
	ST7789_Select();
 8014f64:	e3ffe6dc 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + font.width - 1, y + font.height - 1);
 8014f68:	c41155e2 	zext      	r2, r17, 15, 0
 8014f6c:	9823      	ld.w      	r1, (r14, 0xc)
 8014f6e:	6c0b      	mov      	r0, r2
 8014f70:	b841      	st.w      	r2, (r14, 0x4)
 8014f72:	6cc7      	mov      	r3, r1
 8014f74:	9846      	ld.w      	r2, (r14, 0x18)
 8014f76:	60c8      	addu      	r3, r2
 8014f78:	6c83      	mov      	r2, r0
 8014f7a:	2a00      	subi      	r2, 1
 8014f7c:	74cd      	zexth      	r3, r3
 8014f7e:	7489      	zexth      	r2, r2
 8014f80:	6c23      	mov      	r0, r8
 8014f82:	e3ffecd5 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	for (i = 0; i < font.height; i++) {
 8014f86:	e90b005f 	bez      	r11, 0x8015044	// 8015044 <ST7789_Test+0x410>
 8014f8a:	2c1f      	subi      	r4, 32
 8014f8c:	c564842a 	mult      	r10, r4, r11
 8014f90:	e906005a 	bez      	r6, 0x8015044	// 8015044 <ST7789_Test+0x410>
 8014f94:	62a8      	addu      	r10, r10
 8014f96:	9865      	ld.w      	r3, (r14, 0x14)
 8014f98:	628c      	addu      	r10, r3
 8014f9a:	ea090000 	movi      	r9, 0
			if ((b << j) & 0x8000) {
 8014f9e:	ea088000 	movi      	r8, 32768
		b = font.data[(ch - 32) * font.height + i];
 8014fa2:	d12a0444 	ldr.h      	r4, (r10, r9 << 1)
 8014fa6:	7511      	zexth      	r4, r4
 8014fa8:	ea110000 	movi      	r17, 0
 8014fac:	043e      	br      	0x8015028	// 8015028 <ST7789_Test+0x3f4>
 8014fae:	0000      	.short	0x0000
 8014fb0:	40011400 	.long	0x40011400
 8014fb4:	0803735c 	.long	0x0803735c
 8014fb8:	200018b4 	.long	0x200018b4
 8014fbc:	20000160 	.long	0x20000160
 8014fc0:	0805355c 	.long	0x0805355c
 8014fc4:	20000168 	.long	0x20000168
 8014fc8:	08053569 	.long	0x08053569
 8014fcc:	20000170 	.long	0x20000170
 8014fd0:	08053574 	.long	0x08053574
 8014fd4:	08053575 	.long	0x08053575
				uint8_t data[] = {color >> 8, color & 0xFF};
 8014fd8:	3300      	movi      	r3, 0
 8014fda:	2b07      	subi      	r3, 8
 8014fdc:	dc6e0020 	st.b      	r3, (r14, 0x20)
 8014fe0:	331f      	movi      	r3, 31
 8014fe2:	dc6e0021 	st.b      	r3, (r14, 0x21)
	ST7789_Select();
 8014fe6:	3200      	movi      	r2, 0
 8014fe8:	ea210080 	movih      	r1, 128
 8014fec:	ea800134 	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 8014ff0:	e3ffe696 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8014ff4:	3201      	movi      	r2, 1
 8014ff6:	ea210040 	movih      	r1, 64
 8014ffa:	ea800131 	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 8014ffe:	e3ffe68f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015002:	3300      	movi      	r3, 0
 8015004:	2b00      	subi      	r3, 1
 8015006:	3202      	movi      	r2, 2
 8015008:	1908      	addi      	r1, r14, 32
 801500a:	6c1f      	mov      	r0, r7
 801500c:	e3ffe78a 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		for (j = 0; j < font.width; j++) {
 8015010:	e6310000 	addi      	r17, r17, 1
	ST7789_UnSelect();
 8015014:	3201      	movi      	r2, 1
 8015016:	ea210080 	movih      	r1, 128
 801501a:	ea800129 	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 801501e:	e3ffe67f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
		for (j = 0; j < font.width; j++) {
 8015022:	c4d10480 	cmpne      	r17, r6
 8015026:	0c0b      	bf      	0x801503c	// 801503c <ST7789_Test+0x408>
			if ((b << j) & 0x8000) {
 8015028:	c6244022 	lsl      	r2, r4, r17
 801502c:	68a0      	and      	r2, r8
 801502e:	e922ffd5 	bnez      	r2, 0x8014fd8	// 8014fd8 <ST7789_Test+0x3a4>
				uint8_t data[] = {bgcolor >> 8, bgcolor & 0xFF};
 8015032:	dcae0020 	st.b      	r5, (r14, 0x20)
 8015036:	dcae0021 	st.b      	r5, (r14, 0x21)
 801503a:	07d7      	br      	0x8014fe8	// 8014fe8 <ST7789_Test+0x3b4>
	for (i = 0; i < font.height; i++) {
 801503c:	e5290000 	addi      	r9, r9, 1
 8015040:	66e6      	cmpne      	r9, r11
 8015042:	0bb0      	bt      	0x8014fa2	// 8014fa2 <ST7789_Test+0x36e>
	ST7789_UnSelect();
 8015044:	3201      	movi      	r2, 1
 8015046:	ea210080 	movih      	r1, 128
 801504a:	ea80011d 	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 801504e:	e3ffe667 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	while (*str) {
 8015052:	9862      	ld.w      	r3, (r14, 0x8)
 8015054:	d0038004 	ldbi.b      	r4, (r3)
 8015058:	b862      	st.w      	r3, (r14, 0x8)
 801505a:	e924ff6a 	bnez      	r4, 0x8014f2e	// 8014f2e <ST7789_Test+0x2fa>
	ST7789_UnSelect();
 801505e:	3201      	movi      	r2, 1
 8015060:	ea210080 	movih      	r1, 128
 8015064:	ea800116 	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 8015068:	e3ffe65a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_WriteString(10, 100, "Hello ProgramEl!", Font_16x26, MAGENTA, WHITE);
	HAL_Delay(1000);
 801506c:	ea0003e8 	movi      	r0, 1000
 8015070:	e3ffe6f6 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>

	ST7789_Fill_Color(RED);
	ST7789_WriteString(10, 10, "Rect./Line.", Font_11x18, YELLOW, BLACK);
 8015074:	3400      	movi      	r4, 0
	ST7789_Fill_Color(RED);
 8015076:	ea00f800 	movi      	r0, 63488
 801507a:	e3ffed11 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	ST7789_WriteString(10, 10, "Rect./Line.", Font_11x18, YELLOW, BLACK);
 801507e:	b880      	st.w      	r4, (r14, 0x0)
 8015080:	d8502000 	ld.w      	r2, (r16, 0x0)
 8015084:	d8702001 	ld.w      	r3, (r16, 0x4)
 8015088:	300a      	movi      	r0, 10
 801508a:	ea81010e 	lrw      	r1, 0x8053588	// 80154c0 <ST7789_Test+0x88c>
 801508e:	e3ffeae9 	bsr      	0x8012660	// 8012660 <ST7789_WriteString.constprop.7>
	ST7789_Select();
 8015092:	6c93      	mov      	r2, r4
 8015094:	ea210080 	movih      	r1, 128
 8015098:	ea800109 	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 801509c:	e3ffe640 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80150a0:	341e      	movi      	r4, 30
	ST7789_Select();
 80150a2:	ea850107 	lrw      	r5, 0x40011400	// 80154bc <ST7789_Test+0x888>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80150a6:	ea860108 	lrw      	r6, 0x200018b4	// 80154c4 <ST7789_Test+0x890>
	ST7789_SetAddressWindow(x, y, x, y);
 80150aa:	331e      	movi      	r3, 30
 80150ac:	6c93      	mov      	r2, r4
 80150ae:	6c4f      	mov      	r1, r3
 80150b0:	6c13      	mov      	r0, r4
 80150b2:	e3ffec3d 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80150b6:	3300      	movi      	r3, 0
 80150b8:	2b00      	subi      	r3, 1
	ST7789_Select();
 80150ba:	3200      	movi      	r2, 0
 80150bc:	ea210080 	movih      	r1, 128
 80150c0:	6c17      	mov      	r0, r5
	uint8_t data[] = {color >> 8, color & 0xFF};
 80150c2:	dc6e0020 	st.b      	r3, (r14, 0x20)
 80150c6:	dc6e0021 	st.b      	r3, (r14, 0x21)
	ST7789_Select();
 80150ca:	e3ffe629 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80150ce:	3200      	movi      	r2, 0
 80150d0:	ea210080 	movih      	r1, 128
 80150d4:	6c17      	mov      	r0, r5
 80150d6:	e3ffe623 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80150da:	3201      	movi      	r2, 1
 80150dc:	ea210040 	movih      	r1, 64
 80150e0:	6c17      	mov      	r0, r5
 80150e2:	e3ffe61d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80150e6:	3300      	movi      	r3, 0
 80150e8:	2b00      	subi      	r3, 1
 80150ea:	3202      	movi      	r2, 2
 80150ec:	1908      	addi      	r1, r14, 32
 80150ee:	6c1b      	mov      	r0, r6
 80150f0:	e3ffe718 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
    for (; x0<=x1; x0++) {
 80150f4:	2400      	addi      	r4, 1
	ST7789_UnSelect();
 80150f6:	3201      	movi      	r2, 1
 80150f8:	ea210080 	movih      	r1, 128
 80150fc:	6c17      	mov      	r0, r5
 80150fe:	e3ffe60f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015102:	7511      	zexth      	r4, r4
	ST7789_UnSelect();
 8015104:	3201      	movi      	r2, 1
 8015106:	ea210080 	movih      	r1, 128
 801510a:	6c17      	mov      	r0, r5
 801510c:	e3ffe608 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015110:	eb440065 	cmpnei      	r4, 101
 8015114:	0bcb      	bt      	0x80150aa	// 80150aa <ST7789_Test+0x476>
 8015116:	341e      	movi      	r4, 30
	ST7789_Select();
 8015118:	00b6      	lrw      	r5, 0x40011400	// 80154bc <ST7789_Test+0x888>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801511a:	00d4      	lrw      	r6, 0x200018b4	// 80154c4 <ST7789_Test+0x890>
	ST7789_SetAddressWindow(x, y, x, y);
 801511c:	321e      	movi      	r2, 30
 801511e:	6cd3      	mov      	r3, r4
 8015120:	6c53      	mov      	r1, r4
 8015122:	6c0b      	mov      	r0, r2
 8015124:	e3ffec04 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 8015128:	3300      	movi      	r3, 0
 801512a:	2b00      	subi      	r3, 1
	ST7789_Select();
 801512c:	3200      	movi      	r2, 0
 801512e:	ea210080 	movih      	r1, 128
 8015132:	6c17      	mov      	r0, r5
	uint8_t data[] = {color >> 8, color & 0xFF};
 8015134:	dc6e0020 	st.b      	r3, (r14, 0x20)
 8015138:	dc6e0021 	st.b      	r3, (r14, 0x21)
	ST7789_Select();
 801513c:	e3ffe5f0 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8015140:	3200      	movi      	r2, 0
 8015142:	ea210080 	movih      	r1, 128
 8015146:	6c17      	mov      	r0, r5
 8015148:	e3ffe5ea 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801514c:	3201      	movi      	r2, 1
 801514e:	ea210040 	movih      	r1, 64
 8015152:	6c17      	mov      	r0, r5
 8015154:	e3ffe5e4 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015158:	3300      	movi      	r3, 0
 801515a:	2b00      	subi      	r3, 1
 801515c:	3202      	movi      	r2, 2
 801515e:	1908      	addi      	r1, r14, 32
 8015160:	6c1b      	mov      	r0, r6
 8015162:	e3ffe6df 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
    for (; x0<=x1; x0++) {
 8015166:	2400      	addi      	r4, 1
	ST7789_UnSelect();
 8015168:	3201      	movi      	r2, 1
 801516a:	ea210080 	movih      	r1, 128
 801516e:	6c17      	mov      	r0, r5
 8015170:	e3ffe5d6 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015174:	7511      	zexth      	r4, r4
	ST7789_UnSelect();
 8015176:	3201      	movi      	r2, 1
 8015178:	ea210080 	movih      	r1, 128
 801517c:	6c17      	mov      	r0, r5
 801517e:	e3ffe5cf 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015182:	eb440065 	cmpnei      	r4, 101
 8015186:	0bcb      	bt      	0x801511c	// 801511c <ST7789_Test+0x4e8>
 8015188:	341e      	movi      	r4, 30
	ST7789_Select();
 801518a:	01b2      	lrw      	r5, 0x40011400	// 80154bc <ST7789_Test+0x888>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801518c:	01d1      	lrw      	r6, 0x200018b4	// 80154c4 <ST7789_Test+0x890>
	ST7789_SetAddressWindow(x, y, x, y);
 801518e:	3364      	movi      	r3, 100
 8015190:	6c93      	mov      	r2, r4
 8015192:	6c4f      	mov      	r1, r3
 8015194:	6c13      	mov      	r0, r4
 8015196:	e3ffebcb 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 801519a:	3300      	movi      	r3, 0
 801519c:	2b00      	subi      	r3, 1
	ST7789_Select();
 801519e:	3200      	movi      	r2, 0
 80151a0:	ea210080 	movih      	r1, 128
 80151a4:	6c17      	mov      	r0, r5
	uint8_t data[] = {color >> 8, color & 0xFF};
 80151a6:	dc6e0020 	st.b      	r3, (r14, 0x20)
 80151aa:	dc6e0021 	st.b      	r3, (r14, 0x21)
	ST7789_Select();
 80151ae:	e3ffe5b7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80151b2:	3200      	movi      	r2, 0
 80151b4:	ea210080 	movih      	r1, 128
 80151b8:	6c17      	mov      	r0, r5
 80151ba:	e3ffe5b1 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80151be:	3201      	movi      	r2, 1
 80151c0:	ea210040 	movih      	r1, 64
 80151c4:	6c17      	mov      	r0, r5
 80151c6:	e3ffe5ab 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80151ca:	3300      	movi      	r3, 0
 80151cc:	2b00      	subi      	r3, 1
 80151ce:	3202      	movi      	r2, 2
 80151d0:	1908      	addi      	r1, r14, 32
 80151d2:	6c1b      	mov      	r0, r6
 80151d4:	e3ffe6a6 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
    for (; x0<=x1; x0++) {
 80151d8:	2400      	addi      	r4, 1
	ST7789_UnSelect();
 80151da:	3201      	movi      	r2, 1
 80151dc:	ea210080 	movih      	r1, 128
 80151e0:	6c17      	mov      	r0, r5
 80151e2:	e3ffe59d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 80151e6:	7511      	zexth      	r4, r4
	ST7789_UnSelect();
 80151e8:	3201      	movi      	r2, 1
 80151ea:	ea210080 	movih      	r1, 128
 80151ee:	6c17      	mov      	r0, r5
 80151f0:	e3ffe596 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 80151f4:	eb440065 	cmpnei      	r4, 101
 80151f8:	0bcb      	bt      	0x801518e	// 801518e <ST7789_Test+0x55a>
 80151fa:	341e      	movi      	r4, 30
	ST7789_Select();
 80151fc:	02af      	lrw      	r5, 0x40011400	// 80154bc <ST7789_Test+0x888>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80151fe:	02cd      	lrw      	r6, 0x200018b4	// 80154c4 <ST7789_Test+0x890>
	ST7789_SetAddressWindow(x, y, x, y);
 8015200:	3264      	movi      	r2, 100
 8015202:	6cd3      	mov      	r3, r4
 8015204:	6c53      	mov      	r1, r4
 8015206:	6c0b      	mov      	r0, r2
 8015208:	e3ffeb92 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 801520c:	3300      	movi      	r3, 0
 801520e:	2b00      	subi      	r3, 1
	ST7789_Select();
 8015210:	3200      	movi      	r2, 0
 8015212:	ea210080 	movih      	r1, 128
 8015216:	6c17      	mov      	r0, r5
	uint8_t data[] = {color >> 8, color & 0xFF};
 8015218:	dc6e0020 	st.b      	r3, (r14, 0x20)
 801521c:	dc6e0021 	st.b      	r3, (r14, 0x21)
	ST7789_Select();
 8015220:	e3ffe57e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8015224:	3200      	movi      	r2, 0
 8015226:	ea210080 	movih      	r1, 128
 801522a:	6c17      	mov      	r0, r5
 801522c:	e3ffe578 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8015230:	3201      	movi      	r2, 1
 8015232:	ea210040 	movih      	r1, 64
 8015236:	6c17      	mov      	r0, r5
 8015238:	e3ffe572 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801523c:	3300      	movi      	r3, 0
 801523e:	2b00      	subi      	r3, 1
 8015240:	3202      	movi      	r2, 2
 8015242:	1908      	addi      	r1, r14, 32
 8015244:	6c1b      	mov      	r0, r6
 8015246:	e3ffe66d 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
    for (; x0<=x1; x0++) {
 801524a:	2400      	addi      	r4, 1
	ST7789_UnSelect();
 801524c:	3201      	movi      	r2, 1
 801524e:	ea210080 	movih      	r1, 128
 8015252:	6c17      	mov      	r0, r5
 8015254:	e3ffe564 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015258:	7511      	zexth      	r4, r4
	ST7789_UnSelect();
 801525a:	3201      	movi      	r2, 1
 801525c:	ea210080 	movih      	r1, 128
 8015260:	6c17      	mov      	r0, r5
 8015262:	e3ffe55d 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015266:	eb440065 	cmpnei      	r4, 101
 801526a:	0bcb      	bt      	0x8015200	// 8015200 <ST7789_Test+0x5cc>
	ST7789_UnSelect();
 801526c:	3201      	movi      	r2, 1
 801526e:	ea210080 	movih      	r1, 128
 8015272:	030c      	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 8015274:	e3ffe554 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawRectangle(30, 30, 100, 100, WHITE);
	HAL_Delay(1000);
 8015278:	ea0003e8 	movi      	r0, 1000
 801527c:	e3ffe5f0 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>

	ST7789_Fill_Color(RED);
	ST7789_WriteString(10, 10, "Filled Rect.", Font_11x18, YELLOW, BLACK);
 8015280:	3400      	movi      	r4, 0
	ST7789_Fill_Color(RED);
 8015282:	ea00f800 	movi      	r0, 63488
 8015286:	e3ffec0b 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	ST7789_WriteString(10, 10, "Filled Rect.", Font_11x18, YELLOW, BLACK);
 801528a:	b880      	st.w      	r4, (r14, 0x0)
 801528c:	d8502000 	ld.w      	r2, (r16, 0x0)
 8015290:	d8702001 	ld.w      	r3, (r16, 0x4)
 8015294:	300a      	movi      	r0, 10
 8015296:	0332      	lrw      	r1, 0x8053594	// 80154c8 <ST7789_Test+0x894>
 8015298:	e3ffe9e4 	bsr      	0x8012660	// 8012660 <ST7789_WriteString.constprop.7>
	ST7789_Select();
 801529c:	6c93      	mov      	r2, r4
 801529e:	ea210080 	movih      	r1, 128
 80152a2:	0318      	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 80152a4:	e3ffe53c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80152a8:	361e      	movi      	r6, 30
	ST7789_Select();
 80152aa:	03ba      	lrw      	r5, 0x40011400	// 80154bc <ST7789_Test+0x888>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80152ac:	03f9      	lrw      	r7, 0x200018b4	// 80154c4 <ST7789_Test+0x890>
	ST7789_Select();
 80152ae:	341e      	movi      	r4, 30
	ST7789_SetAddressWindow(x, y, x, y);
 80152b0:	6c93      	mov      	r2, r4
 80152b2:	6c13      	mov      	r0, r4
 80152b4:	6cdb      	mov      	r3, r6
 80152b6:	6c5b      	mov      	r1, r6
 80152b8:	e3ffeb3a 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80152bc:	3300      	movi      	r3, 0
 80152be:	2b00      	subi      	r3, 1
	ST7789_Select();
 80152c0:	3200      	movi      	r2, 0
 80152c2:	ea210080 	movih      	r1, 128
 80152c6:	6c17      	mov      	r0, r5
	uint8_t data[] = {color >> 8, color & 0xFF};
 80152c8:	dc6e0020 	st.b      	r3, (r14, 0x20)
 80152cc:	dc6e0021 	st.b      	r3, (r14, 0x21)
	ST7789_Select();
 80152d0:	e3ffe526 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80152d4:	3200      	movi      	r2, 0
 80152d6:	ea210080 	movih      	r1, 128
 80152da:	6c17      	mov      	r0, r5
 80152dc:	e3ffe520 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80152e0:	3201      	movi      	r2, 1
 80152e2:	ea210040 	movih      	r1, 64
 80152e6:	6c17      	mov      	r0, r5
 80152e8:	e3ffe51a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80152ec:	3300      	movi      	r3, 0
 80152ee:	2b00      	subi      	r3, 1
 80152f0:	3202      	movi      	r2, 2
 80152f2:	1908      	addi      	r1, r14, 32
 80152f4:	6c1f      	mov      	r0, r7
 80152f6:	e3ffe615 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
    for (; x0<=x1; x0++) {
 80152fa:	2400      	addi      	r4, 1
	ST7789_UnSelect();
 80152fc:	3201      	movi      	r2, 1
 80152fe:	ea210080 	movih      	r1, 128
 8015302:	6c17      	mov      	r0, r5
 8015304:	e3ffe50c 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015308:	7511      	zexth      	r4, r4
	ST7789_UnSelect();
 801530a:	3201      	movi      	r2, 1
 801530c:	ea210080 	movih      	r1, 128
 8015310:	6c17      	mov      	r0, r5
 8015312:	e3ffe505 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015316:	eb440051 	cmpnei      	r4, 81
 801531a:	0bcb      	bt      	0x80152b0	// 80152b0 <ST7789_Test+0x67c>
 801531c:	2600      	addi      	r6, 1
 801531e:	7599      	zexth      	r6, r6
	for (i = 0; i <= h; i++) {
 8015320:	eb460051 	cmpnei      	r6, 81
 8015324:	0bc5      	bt      	0x80152ae	// 80152ae <ST7789_Test+0x67a>
	ST7789_UnSelect();
 8015326:	3201      	movi      	r2, 1
 8015328:	ea210080 	movih      	r1, 128
 801532c:	1304      	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 801532e:	e3ffe4f7 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawFilledRectangle(30, 30, 50, 50, WHITE);
	HAL_Delay(1000);
 8015332:	ea0003e8 	movi      	r0, 1000
 8015336:	e3ffe593 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>

	ST7789_Fill_Color(RED);
	ST7789_WriteString(10, 10, "Circle.", Font_11x18, YELLOW, BLACK);
 801533a:	3400      	movi      	r4, 0
	ST7789_Fill_Color(RED);
 801533c:	ea00f800 	movi      	r0, 63488
 8015340:	e3ffebae 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	ST7789_WriteString(10, 10, "Circle.", Font_11x18, YELLOW, BLACK);
 8015344:	b880      	st.w      	r4, (r14, 0x0)
 8015346:	d8502000 	ld.w      	r2, (r16, 0x0)
 801534a:	d8702001 	ld.w      	r3, (r16, 0x4)
 801534e:	300a      	movi      	r0, 10
 8015350:	123f      	lrw      	r1, 0x80535a4	// 80154cc <ST7789_Test+0x898>
 8015352:	e3ffe987 	bsr      	0x8012660	// 8012660 <ST7789_WriteString.constprop.7>
	ST7789_DrawCircle(60, 60, 25, WHITE);
 8015356:	313c      	movi      	r1, 60
 8015358:	6c07      	mov      	r0, r1
 801535a:	ea03ffff 	movi      	r3, 65535
 801535e:	3219      	movi      	r2, 25
 8015360:	e3fff38a 	bsr      	0x8013a74	// 8013a74 <ST7789_DrawCircle>
	HAL_Delay(1000);
 8015364:	ea0003e8 	movi      	r0, 1000
 8015368:	e3ffe57a 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>

	ST7789_Fill_Color(RED);
 801536c:	ea00f800 	movi      	r0, 63488
 8015370:	e3ffeb96 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	ST7789_WriteString(10, 10, "Filled Cir.", Font_11x18, YELLOW, BLACK);
 8015374:	b880      	st.w      	r4, (r14, 0x0)
 8015376:	d8502000 	ld.w      	r2, (r16, 0x0)
 801537a:	d8702001 	ld.w      	r3, (r16, 0x4)
 801537e:	300a      	movi      	r0, 10
 8015380:	1234      	lrw      	r1, 0x80535ac	// 80154d0 <ST7789_Test+0x89c>
 8015382:	e3ffe96f 	bsr      	0x8012660	// 8012660 <ST7789_WriteString.constprop.7>
	ST7789_DrawFilledCircle(60, 60, 25, WHITE);
 8015386:	313c      	movi      	r1, 60
 8015388:	6c07      	mov      	r0, r1
 801538a:	ea03ffff 	movi      	r3, 65535
 801538e:	3219      	movi      	r2, 25
 8015390:	e3fff8de 	bsr      	0x801454c	// 801454c <ST7789_DrawFilledCircle>
	HAL_Delay(1000);
 8015394:	ea0003e8 	movi      	r0, 1000
 8015398:	e3ffe562 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>

	ST7789_Fill_Color(RED);
 801539c:	ea00f800 	movi      	r0, 63488
 80153a0:	e3ffeb7e 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	ST7789_WriteString(10, 10, "Triangle", Font_11x18, YELLOW, BLACK);
 80153a4:	b880      	st.w      	r4, (r14, 0x0)
 80153a6:	d8502000 	ld.w      	r2, (r16, 0x0)
 80153aa:	d8702001 	ld.w      	r3, (r16, 0x4)
 80153ae:	300a      	movi      	r0, 10
 80153b0:	1229      	lrw      	r1, 0x80535b8	// 80154d4 <ST7789_Test+0x8a0>
 80153b2:	e3ffe957 	bsr      	0x8012660	// 8012660 <ST7789_WriteString.constprop.7>
	ST7789_Select();
 80153b6:	6c93      	mov      	r2, r4
 80153b8:	ea210080 	movih      	r1, 128
 80153bc:	1200      	lrw      	r0, 0x40011400	// 80154bc <ST7789_Test+0x888>
 80153be:	e3ffe4af 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80153c2:	341e      	movi      	r4, 30
	ST7789_Select();
 80153c4:	11be      	lrw      	r5, 0x40011400	// 80154bc <ST7789_Test+0x888>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80153c6:	12c0      	lrw      	r6, 0x200018b4	// 80154c4 <ST7789_Test+0x890>
	ST7789_SetAddressWindow(x, y, x, y);
 80153c8:	321e      	movi      	r2, 30
 80153ca:	6cd3      	mov      	r3, r4
 80153cc:	6c53      	mov      	r1, r4
 80153ce:	6c0b      	mov      	r0, r2
 80153d0:	e3ffeaae 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 80153d4:	3300      	movi      	r3, 0
 80153d6:	2b00      	subi      	r3, 1
	ST7789_Select();
 80153d8:	3200      	movi      	r2, 0
 80153da:	ea210080 	movih      	r1, 128
 80153de:	6c17      	mov      	r0, r5
	uint8_t data[] = {color >> 8, color & 0xFF};
 80153e0:	dc6e0020 	st.b      	r3, (r14, 0x20)
 80153e4:	dc6e0021 	st.b      	r3, (r14, 0x21)
	ST7789_Select();
 80153e8:	e3ffe49a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80153ec:	3200      	movi      	r2, 0
 80153ee:	ea210080 	movih      	r1, 128
 80153f2:	6c17      	mov      	r0, r5
 80153f4:	e3ffe494 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80153f8:	3201      	movi      	r2, 1
 80153fa:	ea210040 	movih      	r1, 64
 80153fe:	6c17      	mov      	r0, r5
 8015400:	e3ffe48e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015404:	3300      	movi      	r3, 0
 8015406:	2b00      	subi      	r3, 1
 8015408:	3202      	movi      	r2, 2
 801540a:	1908      	addi      	r1, r14, 32
 801540c:	6c1b      	mov      	r0, r6
 801540e:	e3ffe589 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
    for (; x0<=x1; x0++) {
 8015412:	2400      	addi      	r4, 1
	ST7789_UnSelect();
 8015414:	3201      	movi      	r2, 1
 8015416:	ea210080 	movih      	r1, 128
 801541a:	6c17      	mov      	r0, r5
 801541c:	e3ffe480 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015420:	7511      	zexth      	r4, r4
	ST7789_UnSelect();
 8015422:	3201      	movi      	r2, 1
 8015424:	ea210080 	movih      	r1, 128
 8015428:	6c17      	mov      	r0, r5
 801542a:	e3ffe479 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 801542e:	eb440047 	cmpnei      	r4, 71
 8015432:	0bcb      	bt      	0x80153c8	// 80153c8 <ST7789_Test+0x794>
 8015434:	341e      	movi      	r4, 30
	ST7789_Select();
 8015436:	11c2      	lrw      	r6, 0x40011400	// 80154bc <ST7789_Test+0x888>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015438:	11e3      	lrw      	r7, 0x200018b4	// 80154c4 <ST7789_Test+0x890>
 801543a:	3364      	movi      	r3, 100
 801543c:	60d2      	subu      	r3, r4
 801543e:	74cd      	zexth      	r3, r3
	ST7789_SetAddressWindow(x, y, x, y);
 8015440:	6c4f      	mov      	r1, r3
 8015442:	6c93      	mov      	r2, r4
 8015444:	6c13      	mov      	r0, r4
	uint8_t data[] = {color >> 8, color & 0xFF};
 8015446:	3500      	movi      	r5, 0
	ST7789_SetAddressWindow(x, y, x, y);
 8015448:	e3ffea72 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	uint8_t data[] = {color >> 8, color & 0xFF};
 801544c:	2d00      	subi      	r5, 1
	ST7789_Select();
 801544e:	3200      	movi      	r2, 0
 8015450:	ea210080 	movih      	r1, 128
 8015454:	6c1b      	mov      	r0, r6
	uint8_t data[] = {color >> 8, color & 0xFF};
 8015456:	dcae0020 	st.b      	r5, (r14, 0x20)
 801545a:	dcae0021 	st.b      	r5, (r14, 0x21)
	ST7789_Select();
 801545e:	e3ffe45f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 8015462:	3200      	movi      	r2, 0
 8015464:	ea210080 	movih      	r1, 128
 8015468:	6c1b      	mov      	r0, r6
 801546a:	e3ffe459 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801546e:	3201      	movi      	r2, 1
 8015470:	ea210040 	movih      	r1, 64
 8015474:	6c1b      	mov      	r0, r6
 8015476:	e3ffe453 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801547a:	3300      	movi      	r3, 0
 801547c:	2b00      	subi      	r3, 1
 801547e:	3202      	movi      	r2, 2
 8015480:	1908      	addi      	r1, r14, 32
 8015482:	6c1f      	mov      	r0, r7
 8015484:	e3ffe54e 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
    for (; x0<=x1; x0++) {
 8015488:	2400      	addi      	r4, 1
	ST7789_UnSelect();
 801548a:	3201      	movi      	r2, 1
 801548c:	ea210080 	movih      	r1, 128
 8015490:	6c1b      	mov      	r0, r6
 8015492:	e3ffe445 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 8015496:	7511      	zexth      	r4, r4
	ST7789_UnSelect();
 8015498:	3201      	movi      	r2, 1
 801549a:	ea210080 	movih      	r1, 128
 801549e:	6c1b      	mov      	r0, r6
 80154a0:	e3ffe43e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
    for (; x0<=x1; x0++) {
 80154a4:	eb44003d 	cmpnei      	r4, 61
 80154a8:	0bc9      	bt      	0x801543a	// 801543a <ST7789_Test+0x806>
 80154aa:	341e      	movi      	r4, 30
 80154ac:	370f      	movi      	r7, 15
 80154ae:	6d93      	mov      	r6, r4
	ST7789_Select();
 80154b0:	ea880003 	lrw      	r8, 0x40011400	// 80154bc <ST7789_Test+0x888>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80154b4:	ea890004 	lrw      	r9, 0x200018b4	// 80154c4 <ST7789_Test+0x890>
 80154b8:	0415      	br      	0x80154e2	// 80154e2 <ST7789_Test+0x8ae>
 80154ba:	0000      	.short	0x0000
 80154bc:	40011400 	.long	0x40011400
 80154c0:	08053588 	.long	0x08053588
 80154c4:	200018b4 	.long	0x200018b4
 80154c8:	08053594 	.long	0x08053594
 80154cc:	080535a4 	.long	0x080535a4
 80154d0:	080535ac 	.long	0x080535ac
 80154d4:	080535b8 	.long	0x080535b8
    for (; x0<=x1; x0++) {
 80154d8:	2400      	addi      	r4, 1
 80154da:	7511      	zexth      	r4, r4
 80154dc:	eb44003d 	cmpnei      	r4, 61
 80154e0:	0c13      	bf      	0x8015506	// 8015506 <ST7789_Test+0x8d2>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 80154e2:	eb0600ef 	cmphsi      	r6, 240
 80154e6:	0da3      	bf      	0x801582c	// 801582c <ST7789_Test+0xbf8>
        err -= dy;
 80154e8:	74dd      	zexth      	r3, r7
 80154ea:	e4e31009 	subi      	r7, r3, 10
 80154ee:	75df      	sexth      	r7, r7
        if (err < 0) {
 80154f0:	e9a7fff4 	bhsz      	r7, 0x80154d8	// 80154d8 <ST7789_Test+0x8a4>
    for (; x0<=x1; x0++) {
 80154f4:	2400      	addi      	r4, 1
 80154f6:	7511      	zexth      	r4, r4
 80154f8:	eb44003d 	cmpnei      	r4, 61
            y0 += ystep;
 80154fc:	2600      	addi      	r6, 1
            err += dx;
 80154fe:	2313      	addi      	r3, 20
            y0 += ystep;
 8015500:	7599      	zexth      	r6, r6
            err += dx;
 8015502:	75cf      	sexth      	r7, r3
    for (; x0<=x1; x0++) {
 8015504:	0bef      	bt      	0x80154e2	// 80154e2 <ST7789_Test+0x8ae>
	ST7789_UnSelect();
 8015506:	3201      	movi      	r2, 1
 8015508:	ea210080 	movih      	r1, 128
 801550c:	001f      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 801550e:	e3ffe407 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawTriangle(30, 30, 30, 70, 60, 40, WHITE);
	HAL_Delay(1000);
 8015512:	ea0003e8 	movi      	r0, 1000
 8015516:	e3ffe4a3 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>

	ST7789_Fill_Color(RED);
	ST7789_WriteString(10, 10, "Filled Tri", Font_11x18, YELLOW, BLACK);
 801551a:	3400      	movi      	r4, 0
	ST7789_Fill_Color(RED);
 801551c:	ea00f800 	movi      	r0, 63488
 8015520:	e3ffeabe 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	ST7789_WriteString(10, 10, "Filled Tri", Font_11x18, YELLOW, BLACK);
 8015524:	d8502000 	ld.w      	r2, (r16, 0x0)
 8015528:	d8702001 	ld.w      	r3, (r16, 0x4)
 801552c:	300a      	movi      	r0, 10
 801552e:	0126      	lrw      	r1, 0x80535c4	// 8015890 <ST7789_Test+0xc5c>
	ST7789_Select();
 8015530:	ea11fff6 	movi      	r17, 65526
	ST7789_WriteString(10, 10, "Filled Tri", Font_11x18, YELLOW, BLACK);
 8015534:	b880      	st.w      	r4, (r14, 0x0)
 8015536:	e3ffe895 	bsr      	0x8012660	// 8012660 <ST7789_WriteString.constprop.7>
	ST7789_Select();
 801553a:	6c93      	mov      	r2, r4
 801553c:	ea210080 	movih      	r1, 128
 8015540:	010c      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 8015542:	e3ffe3ed 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015546:	014b      	lrw      	r2, 0x200018b4	// 8015894 <ST7789_Test+0xc60>
	ST7789_Select();
 8015548:	370a      	movi      	r7, 10
	y = y1;
 801554a:	331e      	movi      	r3, 30
	ST7789_Select();
 801554c:	01cf      	lrw      	r6, 0x40011400	// 801588c <ST7789_Test+0xc58>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801554e:	b841      	st.w      	r2, (r14, 0x4)
    uint16_t steep = ABS(y1 - y0) > ABS(x1 - x0);
 8015550:	c407020b 	abs      	r11, r7
    if (steep) {
 8015554:	eb4b001f 	cmpnei      	r11, 31
		ST7789_DrawLine(x, y, x3, y3, color);
 8015558:	c40355f0 	zext      	r16, r3, 15, 0
    if (steep) {
 801555c:	0959      	bt      	0x801580e	// 801580e <ST7789_Test+0xbda>
    if (x0 > x1) {
 801555e:	eb230028 	cmplti      	r3, 41
 8015562:	099f      	bt      	0x80158a0	// 80158a0 <ST7789_Test+0xc6c>
    int16_t err = dx / 2;
 8015564:	c41159e3 	sext      	r3, r17, 15, 0
 8015568:	4b9f      	lsri      	r4, r3, 31
 801556a:	610c      	addu      	r4, r3
 801556c:	5481      	asri      	r4, r4, 1
    dx = x1 - x0;
 801556e:	c411482d 	lsli      	r13, r17, 0
    int16_t err = dx / 2;
 8015572:	c4104832 	lsli      	r18, r16, 0
 8015576:	ea13ffff 	movi      	r19, 65535
    dy = ABS(y1 - y0);
 801557a:	ea0a001e 	movi      	r10, 30
		y1 = swap;
 801557e:	ea08003c 	movi      	r8, 60
		x1 = y1;
 8015582:	3528      	movi      	r5, 40
	uint8_t data[] = {color >> 8, color & 0xFF};
 8015584:	ea090000 	movi      	r9, 0
 8015588:	76a9      	zexth      	r10, r10
 801558a:	e5291000 	subi      	r9, r9, 1
 801558e:	040e      	br      	0x80155aa	// 80155aa <ST7789_Test+0x976>
		 (y < 0) || (y >= ST7789_HEIGHT))	return;
 8015590:	eb0800ef 	cmphsi      	r8, 240
 8015594:	0d01      	bf      	0x8015796	// 8015796 <ST7789_Test+0xb62>
        err -= dy;
 8015596:	612a      	subu      	r4, r10
 8015598:	74d1      	zexth      	r3, r4
 801559a:	750f      	sexth      	r4, r3
        if (err < 0) {
 801559c:	e984004d 	blz      	r4, 0x8015636	// 8015636 <ST7789_Test+0xa02>
    for (; x0<=x1; x0++) {
 80155a0:	2500      	addi      	r5, 1
 80155a2:	7555      	zexth      	r5, r5
 80155a4:	c4b20420 	cmphs      	r18, r5
 80155a8:	0c52      	bf      	0x801564c	// 801564c <ST7789_Test+0xa18>
        if (steep) {
 80155aa:	eb4b001f 	cmpnei      	r11, 31
 80155ae:	0bf1      	bt      	0x8015590	// 8015590 <ST7789_Test+0x95c>
	if ((x < 0) || (x >= ST7789_WIDTH) ||
 80155b0:	eb0800ef 	cmphsi      	r8, 240
 80155b4:	0bf1      	bt      	0x8015596	// 8015596 <ST7789_Test+0x962>
	ST7789_SetAddressWindow(x, y, x, y);
 80155b6:	6cd7      	mov      	r3, r5
 80155b8:	6ca3      	mov      	r2, r8
 80155ba:	6c57      	mov      	r1, r5
 80155bc:	6c23      	mov      	r0, r8
 80155be:	ddae2004 	st.w      	r13, (r14, 0x10)
 80155c2:	de6e2003 	st.w      	r19, (r14, 0xc)
 80155c6:	de4e2002 	st.w      	r18, (r14, 0x8)
 80155ca:	e3ffe9b1 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 80155ce:	3200      	movi      	r2, 0
 80155d0:	ea210080 	movih      	r1, 128
 80155d4:	6c1b      	mov      	r0, r6
	uint8_t data[] = {color >> 8, color & 0xFF};
 80155d6:	dd2e0020 	st.b      	r9, (r14, 0x20)
 80155da:	dd2e0021 	st.b      	r9, (r14, 0x21)
	ST7789_Select();
 80155de:	e3ffe39f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80155e2:	3200      	movi      	r2, 0
 80155e4:	ea210080 	movih      	r1, 128
 80155e8:	6c1b      	mov      	r0, r6
 80155ea:	e3ffe399 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80155ee:	3201      	movi      	r2, 1
 80155f0:	ea210040 	movih      	r1, 64
 80155f4:	6c1b      	mov      	r0, r6
 80155f6:	e3ffe393 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80155fa:	3300      	movi      	r3, 0
 80155fc:	2b00      	subi      	r3, 1
 80155fe:	3202      	movi      	r2, 2
 8015600:	1908      	addi      	r1, r14, 32
 8015602:	9801      	ld.w      	r0, (r14, 0x4)
 8015604:	e3ffe48e 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8015608:	3201      	movi      	r2, 1
 801560a:	ea210080 	movih      	r1, 128
 801560e:	6c1b      	mov      	r0, r6
 8015610:	e3ffe386 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
        err -= dy;
 8015614:	612a      	subu      	r4, r10
	ST7789_UnSelect();
 8015616:	3201      	movi      	r2, 1
 8015618:	ea210080 	movih      	r1, 128
 801561c:	6c1b      	mov      	r0, r6
 801561e:	e3ffe37f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
        err -= dy;
 8015622:	74d1      	zexth      	r3, r4
 8015624:	750f      	sexth      	r4, r3
 8015626:	da4e2002 	ld.w      	r18, (r14, 0x8)
 801562a:	da6e2003 	ld.w      	r19, (r14, 0xc)
 801562e:	d9ae2004 	ld.w      	r13, (r14, 0x10)
        if (err < 0) {
 8015632:	e9a4ffb7 	bhsz      	r4, 0x80155a0	// 80155a0 <ST7789_Test+0x96c>
    for (; x0<=x1; x0++) {
 8015636:	2500      	addi      	r5, 1
 8015638:	7555      	zexth      	r5, r5
 801563a:	c4b20420 	cmphs      	r18, r5
            y0 += ystep;
 801563e:	c5130028 	addu      	r8, r19, r8
            err += dx;
 8015642:	c5a30024 	addu      	r4, r3, r13
            y0 += ystep;
 8015646:	7621      	zexth      	r8, r8
            err += dx;
 8015648:	7513      	sexth      	r4, r4
    for (; x0<=x1; x0++) {
 801564a:	0bb0      	bt      	0x80155aa	// 80155aa <ST7789_Test+0x976>
 801564c:	e4500000 	addi      	r2, r16, 1
 8015650:	7489      	zexth      	r2, r2
	for (curpixel = 0; curpixel <= numpixels; curpixel++) {
 8015652:	eb420047 	cmpnei      	r2, 71
 8015656:	e6310000 	addi      	r17, r17, 1
 801565a:	2f00      	subi      	r7, 1
 801565c:	c41155f1 	zext      	r17, r17, 15, 0
 8015660:	74cb      	sexth      	r3, r2
 8015662:	0b77      	bt      	0x8015550	// 8015550 <ST7789_Test+0x91c>
	ST7789_UnSelect();
 8015664:	3201      	movi      	r2, 1
 8015666:	ea210080 	movih      	r1, 128
 801566a:	0316      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 801566c:	e3ffe358 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawFilledTriangle(30, 30, 30, 70, 60, 40, WHITE);
	HAL_Delay(1000);
 8015670:	ea0003e8 	movi      	r0, 1000
 8015674:	e3ffe3f4 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>

	//	If FLASH cannot storage anymore datas, please delete codes below.
	ST7789_Fill_Color(WHITE);
 8015678:	ea00ffff 	movi      	r0, 65535
 801567c:	e3ffea10 	bsr      	0x8012a9c	// 8012a9c <ST7789_Fill_Color>
	ST7789_Select();
 8015680:	3200      	movi      	r2, 0
 8015682:	ea210080 	movih      	r1, 128
 8015686:	031d      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 8015688:	e3ffe34a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + w - 1, y + h - 1);
 801568c:	33ef      	movi      	r3, 239
 801568e:	3100      	movi      	r1, 0
 8015690:	6c8f      	mov      	r2, r3
 8015692:	6c07      	mov      	r0, r1
 8015694:	e3ffe94c 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 8015698:	3200      	movi      	r2, 0
 801569a:	ea210080 	movih      	r1, 128
 801569e:	131c      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 80156a0:	e3ffe33e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80156a4:	3201      	movi      	r2, 1
 80156a6:	ea210040 	movih      	r1, 64
 80156aa:	1319      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 80156ac:	e3ffe338 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 80156b0:	13ba      	lrw      	r5, 0x801b15c	// 8015898 <ST7789_Test+0xc64>
 80156b2:	ea04c200 	movi      	r4, 49664
 80156b6:	3cb0      	bseti      	r4, 16
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 80156b8:	ea08ffff 	movi      	r8, 65535
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80156bc:	13f6      	lrw      	r7, 0x200018b4	// 8015894 <ST7789_Test+0xc60>
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 80156be:	f904cd26 	min.u32      	r6, r4, r8
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80156c2:	3300      	movi      	r3, 0
 80156c4:	6c57      	mov      	r1, r5
 80156c6:	2b00      	subi      	r3, 1
 80156c8:	6c9b      	mov      	r2, r6
 80156ca:	6c1f      	mov      	r0, r7
		buff_size -= chunk_size;
 80156cc:	611a      	subu      	r4, r6
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80156ce:	e3ffe429 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		buff += chunk_size;
 80156d2:	6158      	addu      	r5, r6
	while (buff_size > 0) {
 80156d4:	e924fff5 	bnez      	r4, 0x80156be	// 80156be <ST7789_Test+0xa8a>
	ST7789_UnSelect();
 80156d8:	3201      	movi      	r2, 1
 80156da:	ea210080 	movih      	r1, 128
 80156de:	130c      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 80156e0:	e3ffe31e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 80156e4:	3201      	movi      	r2, 1
 80156e6:	ea210080 	movih      	r1, 128
 80156ea:	1309      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 80156ec:	e3ffe318 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawImage(0, 0, 240, 240, (uint16_t *)adi1);
	HAL_Delay(3000);
 80156f0:	ea000bb8 	movi      	r0, 3000
 80156f4:	e3ffe3b4 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Select();
 80156f8:	6c93      	mov      	r2, r4
 80156fa:	ea210080 	movih      	r1, 128
 80156fe:	1304      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 8015700:	e3ffe30e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + w - 1, y + h - 1);
 8015704:	33ef      	movi      	r3, 239
 8015706:	6c8f      	mov      	r2, r3
 8015708:	6c53      	mov      	r1, r4
 801570a:	6c13      	mov      	r0, r4
 801570c:	e3ffe910 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 8015710:	6c93      	mov      	r2, r4
 8015712:	ea210080 	movih      	r1, 128
 8015716:	121e      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 8015718:	e3ffe302 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801571c:	3201      	movi      	r2, 1
 801571e:	ea210040 	movih      	r1, 64
 8015722:	121b      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 8015724:	e3ffe2fc 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8015728:	12bd      	lrw      	r5, 0x803735c	// 801589c <ST7789_Test+0xc68>
 801572a:	ea04c200 	movi      	r4, 49664
 801572e:	3cb0      	bseti      	r4, 16
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 8015730:	ea08ffff 	movi      	r8, 65535
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015734:	12f8      	lrw      	r7, 0x200018b4	// 8015894 <ST7789_Test+0xc60>
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 8015736:	f904cd26 	min.u32      	r6, r4, r8
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801573a:	3300      	movi      	r3, 0
 801573c:	6c57      	mov      	r1, r5
 801573e:	2b00      	subi      	r3, 1
 8015740:	6c9b      	mov      	r2, r6
 8015742:	6c1f      	mov      	r0, r7
		buff_size -= chunk_size;
 8015744:	611a      	subu      	r4, r6
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015746:	e3ffe3ed 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		buff += chunk_size;
 801574a:	6158      	addu      	r5, r6
	while (buff_size > 0) {
 801574c:	e924fff5 	bnez      	r4, 0x8015736	// 8015736 <ST7789_Test+0xb02>
	ST7789_UnSelect();
 8015750:	3201      	movi      	r2, 1
 8015752:	ea210080 	movih      	r1, 128
 8015756:	120e      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 8015758:	e3ffe2e2 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801575c:	3201      	movi      	r2, 1
 801575e:	ea210080 	movih      	r1, 128
 8015762:	120b      	lrw      	r0, 0x40011400	// 801588c <ST7789_Test+0xc58>
 8015764:	e3ffe2dc 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawImage(0, 0, 240, 240, (uint16_t *)test_img);
	HAL_Delay(3000);
 8015768:	ea000bb8 	movi      	r0, 3000
 801576c:	e3ffe378 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>

}
 8015770:	1409      	addi      	r14, r14, 36
 8015772:	ebc00058 	pop      	r4-r11, r15, r16-r17
		if (x + font.width >= ST7789_WIDTH) {
 8015776:	d90e2001 	ld.w      	r8, (r14, 0x4)
 801577a:	e800fbef 	br      	0x8014f58	// 8014f58 <ST7789_Test+0x324>
 801577e:	d90e2001 	ld.w      	r8, (r14, 0x4)
 8015782:	e800fb3d 	br      	0x8014dfc	// 8014dfc <ST7789_Test+0x1c8>
			x = 0;
 8015786:	3300      	movi      	r3, 0
 8015788:	b861      	st.w      	r3, (r14, 0x4)
 801578a:	e800fc64 	br      	0x8015052	// 8015052 <ST7789_Test+0x41e>
 801578e:	3300      	movi      	r3, 0
 8015790:	b861      	st.w      	r3, (r14, 0x4)
 8015792:	e800fb96 	br      	0x8014ebe	// 8014ebe <ST7789_Test+0x28a>
	ST7789_SetAddressWindow(x, y, x, y);
 8015796:	6ce3      	mov      	r3, r8
 8015798:	6c97      	mov      	r2, r5
 801579a:	6c63      	mov      	r1, r8
 801579c:	6c17      	mov      	r0, r5
 801579e:	ddae2004 	st.w      	r13, (r14, 0x10)
 80157a2:	de6e2003 	st.w      	r19, (r14, 0xc)
 80157a6:	de4e2002 	st.w      	r18, (r14, 0x8)
 80157aa:	e3ffe8c1 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 80157ae:	3200      	movi      	r2, 0
 80157b0:	ea210080 	movih      	r1, 128
 80157b4:	6c1b      	mov      	r0, r6
	uint8_t data[] = {color >> 8, color & 0xFF};
 80157b6:	dd2e0020 	st.b      	r9, (r14, 0x20)
 80157ba:	dd2e0021 	st.b      	r9, (r14, 0x21)
	ST7789_Select();
 80157be:	e3ffe2af 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 80157c2:	3200      	movi      	r2, 0
 80157c4:	ea210080 	movih      	r1, 128
 80157c8:	6c1b      	mov      	r0, r6
 80157ca:	e3ffe2a9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80157ce:	3201      	movi      	r2, 1
 80157d0:	ea210040 	movih      	r1, 64
 80157d4:	6c1b      	mov      	r0, r6
 80157d6:	e3ffe2a3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 80157da:	3300      	movi      	r3, 0
 80157dc:	2b00      	subi      	r3, 1
 80157de:	3202      	movi      	r2, 2
 80157e0:	1908      	addi      	r1, r14, 32
 80157e2:	9801      	ld.w      	r0, (r14, 0x4)
 80157e4:	e3ffe39e 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 80157e8:	3201      	movi      	r2, 1
 80157ea:	ea210080 	movih      	r1, 128
 80157ee:	6c1b      	mov      	r0, r6
 80157f0:	e3ffe296 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 80157f4:	3201      	movi      	r2, 1
 80157f6:	ea210080 	movih      	r1, 128
 80157fa:	6c1b      	mov      	r0, r6
 80157fc:	e3ffe290 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8015800:	d9ae2004 	ld.w      	r13, (r14, 0x10)
 8015804:	da6e2003 	ld.w      	r19, (r14, 0xc)
 8015808:	da4e2002 	ld.w      	r18, (r14, 0x8)
 801580c:	06c5      	br      	0x8015596	// 8015596 <ST7789_Test+0x962>
    if (y0 < y1) {
 801580e:	eb230027 	cmplti      	r3, 40
 8015812:	6eaf      	mov      	r10, r11
 8015814:	c4104828 	lsli      	r8, r16, 0
 8015818:	0c53      	bf      	0x80158be	// 80158be <ST7789_Test+0xc8a>
    dx = x1 - x0;
 801581a:	ea0d001e 	movi      	r13, 30
    if (y0 < y1) {
 801581e:	ea130001 	movi      	r19, 1
    int16_t err = dx / 2;
 8015822:	340f      	movi      	r4, 15
    if (y0 < y1) {
 8015824:	6d77      	mov      	r5, r13
 8015826:	ea12003c 	movi      	r18, 60
 801582a:	06ad      	br      	0x8015584	// 8015584 <ST7789_Test+0x950>
	ST7789_SetAddressWindow(x, y, x, y);
 801582c:	6cdb      	mov      	r3, r6
 801582e:	6c93      	mov      	r2, r4
 8015830:	6c5b      	mov      	r1, r6
 8015832:	6c13      	mov      	r0, r4
 8015834:	e3ffe87c 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 8015838:	6c23      	mov      	r0, r8
 801583a:	3200      	movi      	r2, 0
 801583c:	ea210080 	movih      	r1, 128
	uint8_t data[] = {color >> 8, color & 0xFF};
 8015840:	dcae0020 	st.b      	r5, (r14, 0x20)
 8015844:	dcae0021 	st.b      	r5, (r14, 0x21)
	ST7789_Select();
 8015848:	e3ffe26a 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_Select();
 801584c:	6c23      	mov      	r0, r8
 801584e:	3200      	movi      	r2, 0
 8015850:	ea210080 	movih      	r1, 128
 8015854:	e3ffe264 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 8015858:	6c23      	mov      	r0, r8
 801585a:	3201      	movi      	r2, 1
 801585c:	ea210040 	movih      	r1, 64
 8015860:	e3ffe25e 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015864:	3300      	movi      	r3, 0
 8015866:	2b00      	subi      	r3, 1
 8015868:	1908      	addi      	r1, r14, 32
 801586a:	3202      	movi      	r2, 2
 801586c:	6c27      	mov      	r0, r9
 801586e:	e3ffe359 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
	ST7789_UnSelect();
 8015872:	6c23      	mov      	r0, r8
 8015874:	3201      	movi      	r2, 1
 8015876:	ea210080 	movih      	r1, 128
 801587a:	e3ffe251 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 801587e:	3201      	movi      	r2, 1
 8015880:	ea210080 	movih      	r1, 128
 8015884:	6c23      	mov      	r0, r8
 8015886:	e3ffe24b 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 801588a:	062f      	br      	0x80154e8	// 80154e8 <ST7789_Test+0x8b4>
 801588c:	40011400 	.long	0x40011400
 8015890:	080535c4 	.long	0x080535c4
 8015894:	200018b4 	.long	0x200018b4
 8015898:	0801b15c 	.long	0x0801b15c
 801589c:	0803735c 	.long	0x0803735c
    int16_t err = dx / 2;
 80158a0:	74df      	sexth      	r3, r7
 80158a2:	4b9f      	lsri      	r4, r3, 31
 80158a4:	610c      	addu      	r4, r3
    dy = ABS(y1 - y0);
 80158a6:	ea0a001e 	movi      	r10, 30
    dx = x1 - x0;
 80158aa:	775d      	zexth      	r13, r7
    int16_t err = dx / 2;
 80158ac:	5481      	asri      	r4, r4, 1
 80158ae:	c4104825 	lsli      	r5, r16, 0
 80158b2:	ea130001 	movi      	r19, 1
		y0 = swap;
 80158b6:	6e2b      	mov      	r8, r10
		x1 = y1;
 80158b8:	ea120028 	movi      	r18, 40
 80158bc:	0664      	br      	0x8015584	// 8015584 <ST7789_Test+0x950>
    dx = x1 - x0;
 80158be:	ea0d001e 	movi      	r13, 30
    if (y0 < y1) {
 80158c2:	ea13ffff 	movi      	r19, 65535
    int16_t err = dx / 2;
 80158c6:	340f      	movi      	r4, 15
    if (y0 < y1) {
 80158c8:	6d77      	mov      	r5, r13
 80158ca:	ea12003c 	movi      	r18, 60
 80158ce:	065b      	br      	0x8015584	// 8015584 <ST7789_Test+0x950>

080158d0 <photoramka>:

void photoramka(void){
 80158d0:	14d5      	push      	r4-r8, r15
	ST7789_Select();
 80158d2:	3200      	movi      	r2, 0
 80158d4:	ea210080 	movih      	r1, 128
 80158d8:	111b      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 80158da:	e3ffe221 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + w - 1, y + h - 1);
 80158de:	33ef      	movi      	r3, 239
 80158e0:	3100      	movi      	r1, 0
 80158e2:	6c8f      	mov      	r2, r3
 80158e4:	6c07      	mov      	r0, r1
 80158e6:	e3ffe823 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 80158ea:	3200      	movi      	r2, 0
 80158ec:	ea210080 	movih      	r1, 128
 80158f0:	1115      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 80158f2:	e3ffe215 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 80158f6:	3201      	movi      	r2, 1
 80158f8:	ea210040 	movih      	r1, 64
 80158fc:	1112      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 80158fe:	e3ffe20f 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 8015902:	11d2      	lrw      	r6, 0x801b15c	// 80159c8 <photoramka+0xf8>
 8015904:	ea04c200 	movi      	r4, 49664
 8015908:	3cb0      	bseti      	r4, 16
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 801590a:	ea08ffff 	movi      	r8, 65535
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801590e:	11f0      	lrw      	r7, 0x200018b4	// 80159cc <photoramka+0xfc>
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 8015910:	f904cd25 	min.u32      	r5, r4, r8
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015914:	3300      	movi      	r3, 0
 8015916:	6c5b      	mov      	r1, r6
 8015918:	2b00      	subi      	r3, 1
 801591a:	6c97      	mov      	r2, r5
 801591c:	6c1f      	mov      	r0, r7
		buff_size -= chunk_size;
 801591e:	6116      	subu      	r4, r5
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015920:	e3ffe300 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		buff += chunk_size;
 8015924:	6194      	addu      	r6, r5
	while (buff_size > 0) {
 8015926:	e924fff5 	bnez      	r4, 0x8015910	// 8015910 <photoramka+0x40>
	ST7789_UnSelect();
 801592a:	3201      	movi      	r2, 1
 801592c:	ea210080 	movih      	r1, 128
 8015930:	1105      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 8015932:	e3ffe1f5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 8015936:	3201      	movi      	r2, 1
 8015938:	ea210080 	movih      	r1, 128
 801593c:	1102      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 801593e:	e3ffe1ef 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawImage(0, 0, 240, 240, (uint16_t *)adi1);
	HAL_Delay(3000);
 8015942:	ea000bb8 	movi      	r0, 3000
 8015946:	e3ffe28b 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	ST7789_Select();
 801594a:	6c93      	mov      	r2, r4
 801594c:	ea210080 	movih      	r1, 128
 8015950:	101d      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 8015952:	e3ffe1e5 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_SetAddressWindow(x, y, x + w - 1, y + h - 1);
 8015956:	33ef      	movi      	r3, 239
 8015958:	6c8f      	mov      	r2, r3
 801595a:	6c53      	mov      	r1, r4
 801595c:	6c13      	mov      	r0, r4
 801595e:	e3ffe7e7 	bsr      	0x801292c	// 801292c <ST7789_SetAddressWindow>
	ST7789_Select();
 8015962:	6c93      	mov      	r2, r4
 8015964:	ea210080 	movih      	r1, 128
 8015968:	1017      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 801596a:	e3ffe1d9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DC_Set();
 801596e:	3201      	movi      	r2, 1
 8015970:	ea210040 	movih      	r1, 64
 8015974:	1014      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 8015976:	e3ffe1d3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
 801597a:	10d6      	lrw      	r6, 0x803735c	// 80159d0 <photoramka+0x100>
 801597c:	ea04c200 	movi      	r4, 49664
 8015980:	3cb0      	bseti      	r4, 16
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 8015982:	ea08ffff 	movi      	r8, 65535
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015986:	10f2      	lrw      	r7, 0x200018b4	// 80159cc <photoramka+0xfc>
		uint16_t chunk_size = buff_size > 65535 ? 65535 : buff_size;
 8015988:	f904cd25 	min.u32      	r5, r4, r8
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 801598c:	3300      	movi      	r3, 0
 801598e:	6c5b      	mov      	r1, r6
 8015990:	2b00      	subi      	r3, 1
 8015992:	6c97      	mov      	r2, r5
 8015994:	6c1f      	mov      	r0, r7
		buff_size -= chunk_size;
 8015996:	6116      	subu      	r4, r5
			HAL_SPI_Transmit(&ST7789_SPI_PORT, buff, chunk_size, HAL_MAX_DELAY);
 8015998:	e3ffe2c4 	bsr      	0x8011f20	// 8011f20 <HAL_SPI_Transmit>
		buff += chunk_size;
 801599c:	6194      	addu      	r6, r5
	while (buff_size > 0) {
 801599e:	e924fff5 	bnez      	r4, 0x8015988	// 8015988 <photoramka+0xb8>
	ST7789_UnSelect();
 80159a2:	3201      	movi      	r2, 1
 80159a4:	ea210080 	movih      	r1, 128
 80159a8:	1007      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 80159aa:	e3ffe1b9 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_UnSelect();
 80159ae:	3201      	movi      	r2, 1
 80159b0:	ea210080 	movih      	r1, 128
 80159b4:	1004      	lrw      	r0, 0x40011400	// 80159c4 <photoramka+0xf4>
 80159b6:	e3ffe1b3 	bsr      	0x8011d1c	// 8011d1c <HAL_GPIO_WritePin>
	ST7789_DrawImage(0, 0, 240, 240, (uint16_t *)test_img);
	HAL_Delay(3000);
 80159ba:	ea000bb8 	movi      	r0, 3000
 80159be:	e3ffe24f 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
}
 80159c2:	1495      	pop      	r4-r8, r15
 80159c4:	40011400 	.long	0x40011400
 80159c8:	0801b15c 	.long	0x0801b15c
 80159cc:	200018b4 	.long	0x200018b4
 80159d0:	0803735c 	.long	0x0803735c

080159d4 <main>:
	return ret;
}


int main(void)
{
 80159d4:	ebe00058 	push      	r4-r11, r15, r16-r17
 80159d8:	e5ce129b 	subi      	r14, r14, 668
	//init sys clk
    SystemClock_Config(CPU_CLK_160M);
 80159dc:	3003      	movi      	r0, 3
 80159de:	e3ffe201 	bsr      	0x8011de0	// 8011de0 <SystemClock_Config>
	
	//SPI and I2C clk enable
	uint32_t gates = *((uint32_t *)(HR_CLK_BASE_ADDR));
	*((uint32_t *)(HR_CLK_BASE_ADDR)) |= CLK_GATE_SPI_MASK|CLK_GATE_I2C_MASK;
 80159e2:	ea224000 	movih      	r2, 16384
 80159e6:	e4420dff 	addi      	r2, r2, 3584


    printf("enter main\r\n");
 80159ea:	021c      	lrw      	r0, 0x80535d0	// 8015c74 <main+0x2a0>
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, SPI_SCL);
 80159ec:	029c      	lrw      	r4, 0x40011400	// 8015c78 <main+0x2a4>
	*((uint32_t *)(HR_CLK_BASE_ADDR)) |= CLK_GATE_SPI_MASK|CLK_GATE_I2C_MASK;
 80159ee:	9260      	ld.w      	r3, (r2, 0x0)
 80159f0:	ec630081 	ori      	r3, r3, 129
 80159f4:	b260      	st.w      	r3, (r2, 0x0)
    printf("enter main\r\n");
 80159f6:	e3ffe07b 	bsr      	0x8011aec	// 8011aec <__GI_puts>
	gpio->Mode = GPIO_MODE_OUTPUT;
 80159fa:	023e      	lrw      	r1, 0x200018a0	// 8015c7c <main+0x2a8>
	gpio->Pin =  ST_DC_PIN | ST_RST_PIN;//no initialization needed for peripheral pins SPI_NSS | SPI_SCL | SPI_MOSI | LED_GPIO |
 80159fc:	ea230060 	movih      	r3, 96
 8015a00:	b160      	st.w      	r3, (r1, 0x0)
	gpio->Mode = GPIO_MODE_OUTPUT;
 8015a02:	3502      	movi      	r5, 2
	gpio->Pull = GPIO_PULLUP;
 8015a04:	3313      	movi      	r3, 19
	HAL_GPIO_Init(GPIOB, gpio);
 8015a06:	0302      	lrw      	r0, 0x40011400	// 8015c78 <main+0x2a4>
	gpio->Mode = GPIO_MODE_OUTPUT;
 8015a08:	b1a1      	st.w      	r5, (r1, 0x4)
	gpio->Pull = GPIO_PULLUP;
 8015a0a:	b162      	st.w      	r3, (r1, 0x8)
	HAL_GPIO_Init(GPIOB, gpio);
 8015a0c:	e3ffe0ae 	bsr      	0x8011b68	// 8011b68 <HAL_GPIO_Init>
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, SPI_SCL);
 8015a10:	9464      	ld.w      	r3, (r4, 0x10)
 8015a12:	3bb8      	bseti      	r3, 24
 8015a14:	b464      	st.w      	r3, (r4, 0x10)
 8015a16:	9465      	ld.w      	r3, (r4, 0x14)
 8015a18:	3b98      	bclri      	r3, 24
 8015a1a:	b465      	st.w      	r3, (r4, 0x14)
 8015a1c:	9466      	ld.w      	r3, (r4, 0x18)
 8015a1e:	3b98      	bclri      	r3, 24
 8015a20:	b466      	st.w      	r3, (r4, 0x18)
	__HAL_AFIO_REMAP_SPI_MOSI(GPIOB, SPI_MOSI);
 8015a22:	9464      	ld.w      	r3, (r4, 0x10)
 8015a24:	3bba      	bseti      	r3, 26
 8015a26:	b464      	st.w      	r3, (r4, 0x10)
 8015a28:	9465      	ld.w      	r3, (r4, 0x14)
 8015a2a:	3b9a      	bclri      	r3, 26
 8015a2c:	b465      	st.w      	r3, (r4, 0x14)
 8015a2e:	9466      	ld.w      	r3, (r4, 0x18)
 8015a30:	3b9a      	bclri      	r3, 26
	hspi->Init.Mode = SPI_MODE_MASTER;
 8015a32:	030b      	lrw      	r0, 0x200018b4	// 8015c80 <main+0x2ac>
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, SPI_SCL);
 8015a34:	ea080000 	movi      	r8, 0
	__HAL_AFIO_REMAP_SPI_MOSI(GPIOB, SPI_MOSI);
 8015a38:	b466      	st.w      	r3, (r4, 0x18)
	hspi->Init.Mode = SPI_MODE_MASTER;
 8015a3a:	3304      	movi      	r3, 4
 8015a3c:	b061      	st.w      	r3, (r0, 0x4)
	hspi->Init.CLKPolarity = SPI_POLARITY_HIGH;
 8015a3e:	3301      	movi      	r3, 1
 8015a40:	b062      	st.w      	r3, (r0, 0x8)
	hspi->Instance = SPI;
 8015a42:	ea234001 	movih      	r3, 16385
 8015a46:	3baa      	bseti      	r3, 10
	hspi->Init.CLKPhase = SPI_PHASE_1EDGE;
 8015a48:	dd002003 	st.w      	r8, (r0, 0xc)
	hspi->Init.NSS = SPI_NSS_SOFT;
 8015a4c:	b0a4      	st.w      	r5, (r0, 0x10)
	hspi->Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
 8015a4e:	dd002005 	st.w      	r8, (r0, 0x14)
	hspi->Init.FirstByte = SPI_LITTLEENDIAN;
 8015a52:	dd002006 	st.w      	r8, (r0, 0x18)
	hspi->Instance = SPI;
 8015a56:	b060      	st.w      	r3, (r0, 0x0)
	ret = HAL_SPI_Init(hspi);
 8015a58:	e3ffe23a 	bsr      	0x8011ecc	// 8011ecc <HAL_SPI_Init>
	__HAL_AFIO_REMAP_I2C_SCL(GPIOB, I2C_SCL);
 8015a5c:	9464      	ld.w      	r3, (r4, 0x10)
 8015a5e:	3bb4      	bseti      	r3, 20
 8015a60:	b464      	st.w      	r3, (r4, 0x10)
 8015a62:	9465      	ld.w      	r3, (r4, 0x14)
 8015a64:	3bb4      	bseti      	r3, 20
 8015a66:	b465      	st.w      	r3, (r4, 0x14)
 8015a68:	9466      	ld.w      	r3, (r4, 0x18)
 8015a6a:	3bb4      	bseti      	r3, 20
 8015a6c:	b466      	st.w      	r3, (r4, 0x18)
	__HAL_AFIO_REMAP_I2C_SDA(GPIOB, I2C_SDA);
 8015a6e:	9464      	ld.w      	r3, (r4, 0x10)
 8015a70:	3bb3      	bseti      	r3, 19
 8015a72:	b464      	st.w      	r3, (r4, 0x10)
 8015a74:	9465      	ld.w      	r3, (r4, 0x14)
 8015a76:	3bb3      	bseti      	r3, 19
 8015a78:	b465      	st.w      	r3, (r4, 0x14)
 8015a7a:	9466      	ld.w      	r3, (r4, 0x18)
 8015a7c:	3bb3      	bseti      	r3, 19
	hi2c->Frequency = 100000;
 8015a7e:	03bd      	lrw      	r5, 0x20001884	// 8015c84 <main+0x2b0>
	ret = HAL_I2C_Init(hi2c);
 8015a80:	6c17      	mov      	r0, r5
	__HAL_AFIO_REMAP_I2C_SDA(GPIOB, I2C_SDA);
 8015a82:	b466      	st.w      	r3, (r4, 0x18)
	hi2c->Frequency = 100000;
 8015a84:	ea0386a0 	movi      	r3, 34464
 8015a88:	3bb0      	bseti      	r3, 16
 8015a8a:	b561      	st.w      	r3, (r5, 0x4)
	hi2c->Instance = I2C;
 8015a8c:	ea234001 	movih      	r3, 16385
 8015a90:	b560      	st.w      	r3, (r5, 0x0)
	ret = HAL_I2C_Init(hi2c);
 8015a92:	e3ffe34b 	bsr      	0x8012128	// 8012128 <HAL_I2C_Init>
	
	//SPI Send data example
	//HAL_SPI_Transmit(&hspi1, data, 5, 10000);
	
	//Init display
	ST7789_Init();
 8015a96:	e3ffe84d 	bsr      	0x8012b30	// 8012b30 <ST7789_Init>
	//Show test data
	ST7789_Test();
 8015a9a:	e3fff8cd 	bsr      	0x8014c34	// 8014c34 <ST7789_Test>
	
	//Send init cmd to AHT10
	HAL_I2C_Write(&hi2c1, AHT10_Adress, AHT10_Init_Cmd, (uint8_t*)AHT10_TmpHum_Cmd, 0);
 8015a9e:	13fb      	lrw      	r7, 0x2000017b	// 8015c88 <main+0x2b4>
 8015aa0:	13db      	lrw      	r6, 0x20000178	// 8015c8c <main+0x2b8>
 8015aa2:	135c      	lrw      	r2, 0x20000179	// 8015c90 <main+0x2bc>
 8015aa4:	8760      	ld.b      	r3, (r7, 0x0)
 8015aa6:	8240      	ld.b      	r2, (r2, 0x0)
 8015aa8:	8620      	ld.b      	r1, (r6, 0x0)
 8015aaa:	dd0e2000 	st.w      	r8, (r14, 0x0)
 8015aae:	6c17      	mov      	r0, r5
 8015ab0:	e3ffe37c 	bsr      	0x80121a8	// 80121a8 <HAL_I2C_Write>
	HAL_Delay(200); 
 8015ab4:	30c8      	movi      	r0, 200
 8015ab6:	e3ffe1d3 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	//Send Soft Reset cmd to AHT10
	HAL_I2C_Write(&hi2c1, AHT10_Adress, AHT10_Reset_Cmd, (uint8_t*)AHT10_TmpHum_Cmd, 0);
 8015aba:	1357      	lrw      	r2, 0x2000017a	// 8015c94 <main+0x2c0>
 8015abc:	8620      	ld.b      	r1, (r6, 0x0)
 8015abe:	8240      	ld.b      	r2, (r2, 0x0)
 8015ac0:	8760      	ld.b      	r3, (r7, 0x0)
 8015ac2:	dd0e2000 	st.w      	r8, (r14, 0x0)
 8015ac6:	6c17      	mov      	r0, r5
 8015ac8:	e3ffe370 	bsr      	0x80121a8	// 80121a8 <HAL_I2C_Write>
	
	
	//Draw factorials
	fractal(0, 0, 1, 1);
 8015acc:	ea233f80 	movih      	r3, 16256
 8015ad0:	f4031b63 	fmtvrl      	fr3, r3
 8015ad4:	f4031b62 	fmtvrl      	fr2, r3
 8015ad8:	3300      	movi      	r3, 0
 8015ada:	f4031b61 	fmtvrl      	fr1, r3
 8015ade:	f4031b60 	fmtvrl      	fr0, r3
 8015ae2:	e000010f 	bsr      	0x8015d00	// 8015d00 <fractal>
	HAL_Delay(5000);
 8015ae6:	ea001388 	movi      	r0, 5000
 8015aea:	e3ffe1b9 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	fractal(0.43, 0.23, -0.1, -0.2);
 8015aee:	136b      	lrw      	r3, 0xbe4ccccd	// 8015c98 <main+0x2c4>
 8015af0:	f4031b63 	fmtvrl      	fr3, r3
 8015af4:	136a      	lrw      	r3, 0xbdcccccd	// 8015c9c <main+0x2c8>
 8015af6:	f4031b62 	fmtvrl      	fr2, r3
 8015afa:	136a      	lrw      	r3, 0x3e6b851f	// 8015ca0 <main+0x2cc>
 8015afc:	f4031b61 	fmtvrl      	fr1, r3
 8015b00:	1369      	lrw      	r3, 0x3edc28f6	// 8015ca4 <main+0x2d0>
 8015b02:	f4031b60 	fmtvrl      	fr0, r3
 8015b06:	e00000fd 	bsr      	0x8015d00	// 8015d00 <fractal>
	HAL_Delay(500);
 8015b0a:	ea0001f4 	movi      	r0, 500
 8015b0e:	e3ffe1a7 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	fractal(0.45, 0.25, -0.1, -0.3);
 8015b12:	1366      	lrw      	r3, 0xbe99999a	// 8015ca8 <main+0x2d4>
 8015b14:	f4031b63 	fmtvrl      	fr3, r3
 8015b18:	1361      	lrw      	r3, 0xbdcccccd	// 8015c9c <main+0x2c8>
 8015b1a:	f4031b62 	fmtvrl      	fr2, r3
 8015b1e:	ea233e80 	movih      	r3, 16000
 8015b22:	f4031b61 	fmtvrl      	fr1, r3
 8015b26:	1362      	lrw      	r3, 0x3ee66666	// 8015cac <main+0x2d8>
 8015b28:	f4031b60 	fmtvrl      	fr0, r3
 8015b2c:	e00000ea 	bsr      	0x8015d00	// 8015d00 <fractal>
	HAL_Delay(500);
 8015b30:	ea0001f4 	movi      	r0, 500
 8015b34:	e3ffe194 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
	
	//Draw image
	photoramka();
 8015b38:	e3fffecc 	bsr      	0x80158d0	// 80158d0 <photoramka>
		AHT10_Humidity = (float)(AHT10_ADC_Raw*100.00/1048576.00);		
		HAL_Delay(500);
		
		//Show measured data
		char *tmp[160];
		sprintf(tmp, " Temp: %.2fC  ", AHT10_Temperature);
 8015b3c:	127d      	lrw      	r3, 0x80535dc	// 8015cb0 <main+0x2dc>
 8015b3e:	129e      	lrw      	r4, 0x20001894	// 8015cb4 <main+0x2e0>
 8015b40:	ea89005e 	lrw      	r9, 0x2000189c	// 8015cb8 <main+0x2e4>
 8015b44:	ea91005e 	lrw      	r17, 0x200018b0	// 8015cbc <main+0x2e8>
 8015b48:	ea88005e 	lrw      	r8, 0x200018ac	// 8015cc0 <main+0x2ec>
 8015b4c:	ea8a005e 	lrw      	r10, 0x20000168	// 8015cc4 <main+0x2f0>
 8015b50:	b864      	st.w      	r3, (r14, 0x10)
		HAL_I2C_Read(&hi2c1, AHT10_Adress, AHT10_TmpHum_Cmd, (uint8_t*)AHT10_RX_Data, 6);
 8015b52:	b883      	st.w      	r4, (r14, 0xc)
		ST7789_WriteString(10, 100, tmp, Font_16x26, MAGENTA, WHITE);
		sprintf(tmp, " Hum: %.2f%%  ", AHT10_Humidity);
 8015b54:	127d      	lrw      	r3, 0x80535ec	// 8015cc8 <main+0x2f4>
 8015b56:	b865      	st.w      	r3, (r14, 0x14)
		uint8_t go_measure_data[2] = {0x33, 0};
 8015b58:	3333      	movi      	r3, 51
 8015b5a:	dc6e0018 	st.b      	r3, (r14, 0x18)
 8015b5e:	3300      	movi      	r3, 0
 8015b60:	dc6e0019 	st.b      	r3, (r14, 0x19)
		HAL_I2C_Write(&hi2c1, AHT10_Adress, AHT10_TmpHum_Cmd, (uint8_t*)go_measure_data, 2);
 8015b64:	3302      	movi      	r3, 2
 8015b66:	8740      	ld.b      	r2, (r7, 0x0)
 8015b68:	8620      	ld.b      	r1, (r6, 0x0)
 8015b6a:	b860      	st.w      	r3, (r14, 0x0)
 8015b6c:	6c17      	mov      	r0, r5
 8015b6e:	1b06      	addi      	r3, r14, 24
 8015b70:	e3ffe31c 	bsr      	0x80121a8	// 80121a8 <HAL_I2C_Write>
		HAL_Delay(200); 
 8015b74:	30c8      	movi      	r0, 200
 8015b76:	e3ffe173 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
		HAL_I2C_Read(&hi2c1, AHT10_Adress, AHT10_TmpHum_Cmd, (uint8_t*)AHT10_RX_Data, 6);
 8015b7a:	3306      	movi      	r3, 6
 8015b7c:	8740      	ld.b      	r2, (r7, 0x0)
 8015b7e:	8620      	ld.b      	r1, (r6, 0x0)
 8015b80:	b860      	st.w      	r3, (r14, 0x0)
 8015b82:	6c17      	mov      	r0, r5
 8015b84:	9863      	ld.w      	r3, (r14, 0xc)
 8015b86:	e3ffe3af 	bsr      	0x80122e4	// 80122e4 <HAL_I2C_Read>
		AHT10_ADC_Raw = (((uint32_t)AHT10_RX_Data[3] & 7) << 16) | ((uint32_t)AHT10_RX_Data[4] << 8) | AHT10_RX_Data[5];
 8015b8a:	8464      	ld.b      	r3, (r4, 0x4)
 8015b8c:	d9640003 	ld.b      	r11, (r4, 0x3)
 8015b90:	8405      	ld.b      	r0, (r4, 0x5)
 8015b92:	4368      	lsli      	r3, r3, 8
 8015b94:	6cc0      	or      	r3, r0
 8015b96:	ea220007 	movih      	r2, 7
 8015b9a:	c60b4820 	lsli      	r0, r11, 16
 8015b9e:	6808      	and      	r0, r2
		AHT10_Temperature = (float)(AHT10_ADC_Raw * 200.00 / (1048576.00)) - 50.00;
 8015ba0:	6c0c      	or      	r0, r3
 8015ba2:	e3ffdd05 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 8015ba6:	3200      	movi      	r2, 0
 8015ba8:	ea234069 	movih      	r3, 16489
 8015bac:	e3ffda5e 	bsr      	0x8011068	// 8011068 <__muldf3>
 8015bb0:	3200      	movi      	r2, 0
 8015bb2:	ea233eb0 	movih      	r3, 16048
 8015bb6:	e3ffda59 	bsr      	0x8011068	// 8011068 <__muldf3>
 8015bba:	e3ffdcdf 	bsr      	0x8011578	// 8011578 <__truncdfsf2>
 8015bbe:	ea234248 	movih      	r3, 16968
 8015bc2:	f4031b61 	fmtvrl      	fr1, r3
		AHT10_ADC_Raw = ((uint32_t)AHT10_RX_Data[1] << 12) | ((uint32_t)AHT10_RX_Data[2] << 4) | (AHT10_RX_Data[3] >> 4);
 8015bc6:	8401      	ld.b      	r0, (r4, 0x1)
 8015bc8:	8462      	ld.b      	r3, (r4, 0x2)
 8015bca:	4364      	lsli      	r3, r3, 4
 8015bcc:	400c      	lsli      	r0, r0, 12
 8015bce:	c48b484c 	lsri      	r12, r11, 4
 8015bd2:	6c0c      	or      	r0, r3
		AHT10_Temperature = (float)(AHT10_ADC_Raw * 200.00 / (1048576.00)) - 50.00;
 8015bd4:	f4200020 	fsubs      	fr0, fr0, fr1
		AHT10_ADC_Raw = ((uint32_t)AHT10_RX_Data[1] << 12) | ((uint32_t)AHT10_RX_Data[2] << 4) | (AHT10_RX_Data[3] >> 4);
 8015bd8:	6c30      	or      	r0, r12
		AHT10_Temperature = (float)(AHT10_ADC_Raw * 200.00 / (1048576.00)) - 50.00;
 8015bda:	f4092400 	fsts      	fr0, (r9, 0x0)
		AHT10_ADC_Raw = ((uint32_t)AHT10_RX_Data[1] << 12) | ((uint32_t)AHT10_RX_Data[2] << 4) | (AHT10_RX_Data[3] >> 4);
 8015bde:	dc112000 	st.w      	r0, (r17, 0x0)
		AHT10_Humidity = (float)(AHT10_ADC_Raw*100.00/1048576.00);		
 8015be2:	e3ffdce5 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 8015be6:	3200      	movi      	r2, 0
 8015be8:	ea234059 	movih      	r3, 16473
 8015bec:	e3ffda3e 	bsr      	0x8011068	// 8011068 <__muldf3>
 8015bf0:	3200      	movi      	r2, 0
 8015bf2:	ea233eb0 	movih      	r3, 16048
 8015bf6:	e3ffda39 	bsr      	0x8011068	// 8011068 <__muldf3>
 8015bfa:	e3ffdcbf 	bsr      	0x8011578	// 8011578 <__truncdfsf2>
		HAL_Delay(500);
 8015bfe:	ea0001f4 	movi      	r0, 500
		AHT10_Humidity = (float)(AHT10_ADC_Raw*100.00/1048576.00);		
 8015c02:	f4082400 	fsts      	fr0, (r8, 0x0)
		HAL_Delay(500);
 8015c06:	e3ffe12b 	bsr      	0x8011e5c	// 8011e5c <HAL_Delay>
		sprintf(tmp, " Temp: %.2fC  ", AHT10_Temperature);
 8015c0a:	f4092000 	flds      	fr0, (r9, 0x0)
 8015c0e:	e3ffd87f 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8015c12:	6c83      	mov      	r2, r0
 8015c14:	6cc7      	mov      	r3, r1
 8015c16:	1807      	addi      	r0, r14, 28
 8015c18:	9824      	ld.w      	r1, (r14, 0x10)
 8015c1a:	e0001583 	bsr      	0x8018720	// 8018720 <__cskyvprintfsprintf>
		ST7789_WriteString(10, 100, tmp, Font_16x26, MAGENTA, WHITE);
 8015c1e:	ea10ffff 	movi      	r16, 65535
 8015c22:	d86a2001 	ld.w      	r3, (r10, 0x4)
 8015c26:	ea0bf81f 	movi      	r11, 63519
 8015c2a:	b860      	st.w      	r3, (r14, 0x0)
 8015c2c:	de0e2002 	st.w      	r16, (r14, 0x8)
 8015c30:	dd6e2001 	st.w      	r11, (r14, 0x4)
 8015c34:	d86a2000 	ld.w      	r3, (r10, 0x0)
 8015c38:	1a07      	addi      	r2, r14, 28
 8015c3a:	3164      	movi      	r1, 100
 8015c3c:	300a      	movi      	r0, 10
 8015c3e:	e3fff30b 	bsr      	0x8014254	// 8014254 <ST7789_WriteString>
		sprintf(tmp, " Hum: %.2f%%  ", AHT10_Humidity);
 8015c42:	f4082000 	flds      	fr0, (r8, 0x0)
 8015c46:	e3ffd863 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8015c4a:	6c83      	mov      	r2, r0
 8015c4c:	6cc7      	mov      	r3, r1
 8015c4e:	1807      	addi      	r0, r14, 28
 8015c50:	9825      	ld.w      	r1, (r14, 0x14)
 8015c52:	e0001567 	bsr      	0x8018720	// 8018720 <__cskyvprintfsprintf>
		ST7789_WriteString(10, 125, tmp, Font_16x26, MAGENTA, WHITE);
 8015c56:	d86a2001 	ld.w      	r3, (r10, 0x4)
 8015c5a:	b860      	st.w      	r3, (r14, 0x0)
 8015c5c:	de0e2002 	st.w      	r16, (r14, 0x8)
 8015c60:	dd6e2001 	st.w      	r11, (r14, 0x4)
 8015c64:	d86a2000 	ld.w      	r3, (r10, 0x0)
 8015c68:	1a07      	addi      	r2, r14, 28
 8015c6a:	317d      	movi      	r1, 125
 8015c6c:	300a      	movi      	r0, 10
 8015c6e:	e3fff2f3 	bsr      	0x8014254	// 8014254 <ST7789_WriteString>
 8015c72:	0773      	br      	0x8015b58	// 8015b58 <main+0x184>
 8015c74:	080535d0 	.long	0x080535d0
 8015c78:	40011400 	.long	0x40011400
 8015c7c:	200018a0 	.long	0x200018a0
 8015c80:	200018b4 	.long	0x200018b4
 8015c84:	20001884 	.long	0x20001884
 8015c88:	2000017b 	.long	0x2000017b
 8015c8c:	20000178 	.long	0x20000178
 8015c90:	20000179 	.long	0x20000179
 8015c94:	2000017a 	.long	0x2000017a
 8015c98:	be4ccccd 	.long	0xbe4ccccd
 8015c9c:	bdcccccd 	.long	0xbdcccccd
 8015ca0:	3e6b851f 	.long	0x3e6b851f
 8015ca4:	3edc28f6 	.long	0x3edc28f6
 8015ca8:	be99999a 	.long	0xbe99999a
 8015cac:	3ee66666 	.long	0x3ee66666
 8015cb0:	080535dc 	.long	0x080535dc
 8015cb4:	20001894 	.long	0x20001894
 8015cb8:	2000189c 	.long	0x2000189c
 8015cbc:	200018b0 	.long	0x200018b0
 8015cc0:	200018ac 	.long	0x200018ac
 8015cc4:	20000168 	.long	0x20000168
 8015cc8:	080535ec 	.long	0x080535ec

08015ccc <CORET_IRQHandler>:

#include "wm_hal.h"

#define readl(addr) ({unsigned int __v = (*(volatile unsigned int *) (addr)); __v;})
__attribute__((isr)) void CORET_IRQHandler(void)
{
 8015ccc:	1460      	nie
 8015cce:	1462      	ipush
 8015cd0:	142e      	subi      	r14, r14, 56
 8015cd2:	d64e1c2d 	stm      	r18-r31, (r14)
 8015cd6:	1428      	subi      	r14, r14, 32
 8015cd8:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8015cdc:	14d0      	push      	r15
    readl(0xE000E010);
 8015cde:	1068      	lrw      	r3, 0xe000e000	// 8015cfc <CORET_IRQHandler+0x30>
 8015ce0:	9364      	ld.w      	r3, (r3, 0x10)
    HAL_IncTick();
 8015ce2:	e3ffe0af 	bsr      	0x8011e40	// 8011e40 <HAL_IncTick>
}
 8015ce6:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8015cea:	1401      	addi      	r14, r14, 4
 8015cec:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8015cf0:	1408      	addi      	r14, r14, 32
 8015cf2:	d24e1c2d 	ldm      	r18-r31, (r14)
 8015cf6:	140e      	addi      	r14, r14, 56
 8015cf8:	1463      	ipop
 8015cfa:	1461      	nir
 8015cfc:	e000e000 	.long	0xe000e000

08015d00 <fractal>:
#include "draw_math.h"


void fractal(float left, float top, float xside, float yside)
{
 8015d00:	14d6      	push      	r4-r9, r15
 8015d02:	1426      	subi      	r14, r14, 24
 8015d04:	f40e2408 	fsts      	fr8, (r14, 0x0)
 8015d08:	f40e2419 	fsts      	fr9, (r14, 0x4)
 8015d0c:	f40e242a 	fsts      	fr10, (r14, 0x8)
 8015d10:	f40e243b 	fsts      	fr11, (r14, 0xc)
 8015d14:	f40e244c 	fsts      	fr12, (r14, 0x10)
 8015d18:	f40e245d 	fsts      	fr13, (r14, 0x14)
 8015d1c:	1421      	subi      	r14, r14, 4
  
    // getting maximum value of y-axis of screen
    maxy = 240;
  
    // setting up the xscale and yscale
    xscale = xside / maxx;
 8015d1e:	ea234370 	movih      	r3, 17264
 8015d22:	f4031b6a 	fmtvrl      	fr10, r3
    yscale = yside / maxy;
  
    // calling rectangle function
    // where required image will be seen
    ST7789_DrawRectangle(0, 0, maxx, maxy, BLACK);
 8015d26:	3100      	movi      	r1, 0
 8015d28:	33f0      	movi      	r3, 240
 8015d2a:	6c8f      	mov      	r2, r3
 8015d2c:	b820      	st.w      	r1, (r14, 0x0)
 8015d2e:	6c07      	mov      	r0, r1
    xscale = xside / maxx;
 8015d30:	f5420308 	fdivs      	fr8, fr2, fr10
{
 8015d34:	f4000089 	fmovs      	fr9, fr0
 8015d38:	f401008b 	fmovs      	fr11, fr1
    yscale = yside / maxy;
 8015d3c:	f543030a 	fdivs      	fr10, fr3, fr10
    // Iterate that complex number
    for (y = 1; y <= maxy - 1; y++) {
        for (x = 1; x <= maxx - 1; x++)
        {
            // c_real
            cx = x * xscale + left;
 8015d40:	3500      	movi      	r5, 0
    ST7789_DrawRectangle(0, 0, maxx, maxy, BLACK);
 8015d42:	e3ffec23 	bsr      	0x8013588	// 8013588 <ST7789_DrawRectangle>
            // to the Mandelbrot set or not and draw a pixel
            // at coordinates (x, y) accordingly
            // If you reach the Maximum number of iterations
            // and If the distance from the origin is
            // greater than 2 exit the loop
            while ((zx * zx + zy * zy < 4) && (count < MAXCOUNT))
 8015d46:	ea234080 	movih      	r3, 16512
    for (y = 1; y <= maxy - 1; y++) {
 8015d4a:	ea090001 	movi      	r9, 1
            cx = x * xscale + left;
 8015d4e:	6d97      	mov      	r6, r5
            while ((zx * zx + zy * zy < 4) && (count < MAXCOUNT))
 8015d50:	f4031b6c 	fmtvrl      	fr12, r3
 8015d54:	f4091b60 	fmtvrl      	fr0, r9
 8015d58:	f4001a00 	fsitos      	fr0, fr0
 8015d5c:	f40b008d 	fmovs      	fr13, fr11
 8015d60:	f540028d 	fmacs      	fr13, fr0, fr10
 8015d64:	75e5      	zexth      	r7, r9
{
 8015d66:	3401      	movi      	r4, 1
 8015d68:	ea080064 	movi      	r8, 100
            cx = x * xscale + left;
 8015d6c:	f4041b60 	fmtvrl      	fr0, r4
 8015d70:	f4001a00 	fsitos      	fr0, fr0
 8015d74:	f4090085 	fmovs      	fr5, fr9
 8015d78:	f5000285 	fmacs      	fr5, fr0, fr8
 8015d7c:	f4061b64 	fmtvrl      	fr4, r6
 8015d80:	f4051b60 	fmtvrl      	fr0, r5
 8015d84:	3200      	movi      	r2, 0
 8015d86:	f4051b62 	fmtvrl      	fr2, r5
 8015d8a:	f4051b61 	fmtvrl      	fr1, r5
 8015d8e:	331e      	movi      	r3, 30
            {
                // Calculate Mandelbrot function
                // z = z*z + c where z is a complex number
  
                // tempx = z_real*_real - z_imaginary*z_imaginary + c_real
                tempx = zx * zx - zy * zy + cx;
 8015d90:	f4800020 	fsubs      	fr0, fr0, fr4
 8015d94:	f4a00003 	fadds      	fr3, fr0, fr5
  
                // 2*z_real*z_imaginary + c_imaginary
                zy = 2 * zx * zy + cy;
 8015d98:	f4210001 	fadds      	fr1, fr1, fr1
 8015d9c:	f40d0080 	fmovs      	fr0, fr13
 8015da0:	f4410280 	fmacs      	fr0, fr1, fr2
 8015da4:	f4000082 	fmovs      	fr2, fr0
            while ((zx * zx + zy * zy < 4) && (count < MAXCOUNT))
 8015da8:	f4420204 	fmuls      	fr4, fr2, fr2
 8015dac:	f4630200 	fmuls      	fr0, fr3, fr3
 8015db0:	f4800001 	fadds      	fr1, fr0, fr4
 8015db4:	f58101a0 	fcmplts      	fr1, fr12
  
                // Updating z_real = tempx
                zx = tempx;
  
                // Increment count
                count = count + 1;
 8015db8:	2200      	addi      	r2, 1
            while ((zx * zx + zy * zy < 4) && (count < MAXCOUNT))
 8015dba:	0c23      	bf      	0x8015e00	// 8015e00 <fractal+0x100>
                zx = tempx;
 8015dbc:	f4030081 	fmovs      	fr1, fr3
            while ((zx * zx + zy * zy < 4) && (count < MAXCOUNT))
 8015dc0:	e823ffe8 	bnezad      	r3, 0x8015d90	// 8015d90 <fractal+0x90>
 8015dc4:	ea020bb8 	movi      	r2, 3000
            }
  
            // To display the created fractal
            ST7789_DrawPixel(x, y, count*100);
 8015dc8:	7411      	zexth      	r0, r4
 8015dca:	6c5f      	mov      	r1, r7
        for (x = 1; x <= maxx - 1; x++)
 8015dcc:	2400      	addi      	r4, 1
            ST7789_DrawPixel(x, y, count*100);
 8015dce:	e3ffeae5 	bsr      	0x8013398	// 8013398 <ST7789_DrawPixel>
        for (x = 1; x <= maxx - 1; x++)
 8015dd2:	eb4400f0 	cmpnei      	r4, 240
 8015dd6:	0bcb      	bt      	0x8015d6c	// 8015d6c <fractal+0x6c>
    for (y = 1; y <= maxy - 1; y++) {
 8015dd8:	e5290000 	addi      	r9, r9, 1
 8015ddc:	eb4900f0 	cmpnei      	r9, 240
 8015de0:	0bba      	bt      	0x8015d54	// 8015d54 <fractal+0x54>
        }
    }
 8015de2:	1401      	addi      	r14, r14, 4
 8015de4:	f40e205d 	flds      	fr13, (r14, 0x14)
 8015de8:	f40e204c 	flds      	fr12, (r14, 0x10)
 8015dec:	f40e203b 	flds      	fr11, (r14, 0xc)
 8015df0:	f40e202a 	flds      	fr10, (r14, 0x8)
 8015df4:	f40e2019 	flds      	fr9, (r14, 0x4)
 8015df8:	f40e2008 	flds      	fr8, (r14, 0x0)
 8015dfc:	1406      	addi      	r14, r14, 24
 8015dfe:	1496      	pop      	r4-r9, r15
 8015e00:	7ca0      	mult      	r2, r8
 8015e02:	7489      	zexth      	r2, r2
 8015e04:	07e2      	br      	0x8015dc8	// 8015dc8 <fractal+0xc8>
	...

08015e08 <SystemInit>:
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 8015e08:	106a      	lrw      	r3, 0x20000000	// 8015e30 <SystemInit+0x28>
 8015e0a:	c0036421 	mtcr      	r3, cr<1, 0>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8015e0e:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 8015e12:	ec630010 	ori      	r3, r3, 16
  \details Assigns the given value to the CHR.
  \param [in]    chr  CHR value to set
 */
__ALWAYS_STATIC_INLINE void __set_CHR(uint32_t chr)
{
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8015e16:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 8015e1a:	1047      	lrw      	r2, 0xe000e100	// 8015e34 <SystemInit+0x2c>
 8015e1c:	3300      	movi      	r3, 0
 8015e1e:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 8015e22:	2b00      	subi      	r3, 1
 8015e24:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
 8015e28:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8015e2c:	783c      	jmp      	r15
 8015e2e:	0000      	.short	0x0000
 8015e30:	20000000 	.long	0x20000000
 8015e34:	e000e100 	.long	0xe000e100

08015e38 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8015e38:	14d4      	push      	r4-r7, r15
 8015e3a:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8015e3c:	c0006021 	mfcr      	r1, cr<0, 0>
 8015e40:	4930      	lsri      	r1, r1, 16
 8015e42:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8015e44:	1018      	lrw      	r0, 0x80535fc	// 8015ea4 <trap_c+0x6c>
 8015e46:	e0001453 	bsr      	0x80186ec	// 80186ec <wm_printf>
    printf("\n");
 8015e4a:	300a      	movi      	r0, 10
 8015e4c:	e3ffde48 	bsr      	0x8011adc	// 8011adc <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8015e50:	9540      	ld.w      	r2, (r5, 0x0)
 8015e52:	3100      	movi      	r1, 0
 8015e54:	1015      	lrw      	r0, 0x8053610	// 8015ea8 <trap_c+0x70>
 8015e56:	e000144b 	bsr      	0x80186ec	// 80186ec <wm_printf>
    for (i = 0; i < 16; i++) {
 8015e5a:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 8015e5c:	10f3      	lrw      	r7, 0x8053610	// 8015ea8 <trap_c+0x70>

        if ((i % 5) == 4) {
 8015e5e:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8015e60:	2400      	addi      	r4, 1
 8015e62:	3c50      	cmpnei      	r4, 16
 8015e64:	0c13      	bf      	0x8015e8a	// 8015e8a <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8015e66:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8015e6a:	6c53      	mov      	r1, r4
 8015e6c:	6c1f      	mov      	r0, r7
 8015e6e:	e000143f 	bsr      	0x80186ec	// 80186ec <wm_printf>
        if ((i % 5) == 4) {
 8015e72:	c4c48043 	divs      	r3, r4, r6
 8015e76:	7cd8      	mult      	r3, r6
 8015e78:	5c6d      	subu      	r3, r4, r3
 8015e7a:	3b44      	cmpnei      	r3, 4
 8015e7c:	0bf2      	bt      	0x8015e60	// 8015e60 <trap_c+0x28>
            printf("\n");
 8015e7e:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 8015e80:	2400      	addi      	r4, 1
            printf("\n");
 8015e82:	e3ffde2d 	bsr      	0x8011adc	// 8011adc <__GI_putchar>
    for (i = 0; i < 16; i++) {
 8015e86:	3c50      	cmpnei      	r4, 16
 8015e88:	0bef      	bt      	0x8015e66	// 8015e66 <trap_c+0x2e>
        }
    }

    printf("\n");
 8015e8a:	300a      	movi      	r0, 10
 8015e8c:	e3ffde28 	bsr      	0x8011adc	// 8011adc <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8015e90:	9530      	ld.w      	r1, (r5, 0x40)
 8015e92:	1007      	lrw      	r0, 0x805361c	// 8015eac <trap_c+0x74>
 8015e94:	e000142c 	bsr      	0x80186ec	// 80186ec <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8015e98:	9531      	ld.w      	r1, (r5, 0x44)
 8015e9a:	1006      	lrw      	r0, 0x8053628	// 8015eb0 <trap_c+0x78>
 8015e9c:	e0001428 	bsr      	0x80186ec	// 80186ec <wm_printf>
 8015ea0:	0400      	br      	0x8015ea0	// 8015ea0 <trap_c+0x68>
 8015ea2:	0000      	.short	0x0000
 8015ea4:	080535fc 	.long	0x080535fc
 8015ea8:	08053610 	.long	0x08053610
 8015eac:	0805361c 	.long	0x0805361c
 8015eb0:	08053628 	.long	0x08053628

08015eb4 <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8015eb4:	106a      	lrw      	r3, 0xe000e100	// 8015edc <board_init+0x28>
 8015eb6:	ea210001 	movih      	r1, 1
 8015eba:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8015ebe:	dc232060 	st.w      	r1, (r3, 0x180)
	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);
#endif

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 8015ec2:	1068      	lrw      	r3, 0x40010600	// 8015ee0 <board_init+0x2c>
 8015ec4:	ea21000b 	movih      	r1, 11
 8015ec8:	2113      	addi      	r1, 20
 8015eca:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8015ecc:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 8015ece:	31c3      	movi      	r1, 195
 8015ed0:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);    /* Disable afc */
 8015ed2:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);  /* Disable DMA */
 8015ed4:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00); /* one byte TX/RX */
 8015ed6:	b343      	st.w      	r2, (r3, 0xc)
#else
    //uart1_io_init();
    /* use uart1 as log output io */
	//uart1Init(115200);
#endif
}
 8015ed8:	783c      	jmp      	r15
 8015eda:	0000      	.short	0x0000
 8015edc:	e000e100 	.long	0xe000e100
 8015ee0:	40010600 	.long	0x40010600

08015ee4 <_out_buffer>:
typedef void (*out_fct_type)(char character, void* buffer, size_t idx, size_t maxlen);

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
  if (idx < maxlen) {
 8015ee4:	64c8      	cmphs      	r2, r3
 8015ee6:	0803      	bt      	0x8015eec	// 8015eec <_out_buffer+0x8>
    ((char*)buffer)[idx] = character;
 8015ee8:	d4410020 	str.b      	r0, (r1, r2 << 0)
  }
}
 8015eec:	783c      	jmp      	r15
	...

08015ef0 <_out_uart>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8015ef0:	1044      	lrw      	r2, 0x40010600	// 8015f00 <_out_uart+0x10>
 8015ef2:	9267      	ld.w      	r3, (r2, 0x1c)
 8015ef4:	e463203f 	andi      	r3, r3, 63
 8015ef8:	3b1f      	cmphsi      	r3, 32
 8015efa:	0bfc      	bt      	0x8015ef2	// 8015ef2 <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8015efc:	b208      	st.w      	r0, (r2, 0x20)

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 8015efe:	783c      	jmp      	r15
 8015f00:	40010600 	.long	0x40010600

08015f04 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 8015f04:	783c      	jmp      	r15
	...

08015f08 <_ntoa_format>:
  return idx;
}

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8015f08:	ebe00058 	push      	r4-r11, r15, r16-r17
 8015f0c:	6ecb      	mov      	r11, r2
 8015f0e:	9851      	ld.w      	r2, (r14, 0x44)
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8015f10:	e6022002 	andi      	r16, r2, 2
{
 8015f14:	6e4f      	mov      	r9, r3
 8015f16:	986e      	ld.w      	r3, (r14, 0x38)
 8015f18:	6e07      	mov      	r8, r1
 8015f1a:	6dc3      	mov      	r7, r0
 8015f1c:	da2e200b 	ld.w      	r17, (r14, 0x2c)
 8015f20:	988c      	ld.w      	r4, (r14, 0x30)
 8015f22:	c4034832 	lsli      	r18, r3, 0
 8015f26:	982f      	ld.w      	r1, (r14, 0x3c)
 8015f28:	d94e2010 	ld.w      	r10, (r14, 0x40)
 8015f2c:	d98e0034 	ld.b      	r12, (r14, 0x34)
  if (!(flags & FLAGS_LEFT)) {
 8015f30:	e930002a 	bnez      	r16, 0x8015f84	// 8015f84 <_ntoa_format+0x7c>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8015f34:	e92a008f 	bnez      	r10, 0x8016052	// 8016052 <_ntoa_format+0x14a>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f38:	6450      	cmphs      	r4, r1
 8015f3a:	0825      	bt      	0x8015f84	// 8015f84 <_ntoa_format+0x7c>
 8015f3c:	3c1f      	cmphsi      	r4, 32
 8015f3e:	e5a22001 	andi      	r13, r2, 1
 8015f42:	0821      	bt      	0x8015f84	// 8015f84 <_ntoa_format+0x7c>
 8015f44:	c4910023 	addu      	r3, r17, r4
      buf[len++] = '0';
 8015f48:	3030      	movi      	r0, 48
 8015f4a:	0405      	br      	0x8015f54	// 8015f54 <_ntoa_format+0x4c>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f4c:	eb440020 	cmpnei      	r4, 32
 8015f50:	2300      	addi      	r3, 1
 8015f52:	0c05      	bf      	0x8015f5c	// 8015f5c <_ntoa_format+0x54>
      buf[len++] = '0';
 8015f54:	2400      	addi      	r4, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f56:	6450      	cmphs      	r4, r1
      buf[len++] = '0';
 8015f58:	a300      	st.b      	r0, (r3, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f5a:	0ff9      	bf      	0x8015f4c	// 8015f4c <_ntoa_format+0x44>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f5c:	e90d0014 	bez      	r13, 0x8015f84	// 8015f84 <_ntoa_format+0x7c>
 8015f60:	6690      	cmphs      	r4, r10
 8015f62:	0811      	bt      	0x8015f84	// 8015f84 <_ntoa_format+0x7c>
 8015f64:	331f      	movi      	r3, 31
 8015f66:	650c      	cmphs      	r3, r4
 8015f68:	0c86      	bf      	0x8016074	// 8016074 <_ntoa_format+0x16c>
 8015f6a:	c4910023 	addu      	r3, r17, r4
      buf[len++] = '0';
 8015f6e:	3030      	movi      	r0, 48
 8015f70:	0405      	br      	0x8015f7a	// 8015f7a <_ntoa_format+0x72>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f72:	eb440020 	cmpnei      	r4, 32
 8015f76:	2300      	addi      	r3, 1
 8015f78:	0c7e      	bf      	0x8016074	// 8016074 <_ntoa_format+0x16c>
      buf[len++] = '0';
 8015f7a:	2400      	addi      	r4, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f7c:	6692      	cmpne      	r4, r10
      buf[len++] = '0';
 8015f7e:	a300      	st.b      	r0, (r3, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f80:	0bf9      	bt      	0x8015f72	// 8015f72 <_ntoa_format+0x6a>
      buf[len++] = '0';
 8015f82:	6e93      	mov      	r10, r4
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 8015f84:	e4622010 	andi      	r3, r2, 16
 8015f88:	e9030016 	bez      	r3, 0x8015fb4	// 8015fb4 <_ntoa_format+0xac>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8015f8c:	e4622400 	andi      	r3, r2, 1024
 8015f90:	e9230004 	bnez      	r3, 0x8015f98	// 8015f98 <_ntoa_format+0x90>
 8015f94:	e9240078 	bnez      	r4, 0x8016084	// 8016084 <_ntoa_format+0x17c>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015f98:	c4124823 	lsli      	r3, r18, 0
 8015f9c:	3b50      	cmpnei      	r3, 16
 8015f9e:	0c9e      	bf      	0x80160da	// 80160da <_ntoa_format+0x1d2>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8015fa0:	c4124823 	lsli      	r3, r18, 0
 8015fa4:	3b42      	cmpnei      	r3, 2
 8015fa6:	0ca5      	bf      	0x80160f0	// 80160f0 <_ntoa_format+0x1e8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8015fa8:	3c1f      	cmphsi      	r4, 32
 8015faa:	0815      	bt      	0x8015fd4	// 8015fd4 <_ntoa_format+0xcc>
      buf[len++] = '0';
 8015fac:	3330      	movi      	r3, 48
 8015fae:	d4910023 	str.b      	r3, (r17, r4 << 0)
 8015fb2:	2400      	addi      	r4, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8015fb4:	3c1f      	cmphsi      	r4, 32
 8015fb6:	080f      	bt      	0x8015fd4	// 8015fd4 <_ntoa_format+0xcc>
    if (negative) {
 8015fb8:	e92c0073 	bnez      	r12, 0x801609e	// 801609e <_ntoa_format+0x196>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 8015fbc:	e4622004 	andi      	r3, r2, 4
 8015fc0:	e9230083 	bnez      	r3, 0x80160c6	// 80160c6 <_ntoa_format+0x1be>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 8015fc4:	e4622008 	andi      	r3, r2, 8
 8015fc8:	e903002f 	bez      	r3, 0x8016026	// 8016026 <_ntoa_format+0x11e>
      buf[len++] = ' ';
 8015fcc:	3320      	movi      	r3, 32
 8015fce:	d4910023 	str.b      	r3, (r17, r4 << 0)
 8015fd2:	2400      	addi      	r4, 1
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8015fd4:	e4422003 	andi      	r2, r2, 3
 8015fd8:	e902002b 	bez      	r2, 0x801602e	// 801602e <_ntoa_format+0x126>
 8015fdc:	6d6f      	mov      	r5, r11
 8015fde:	5cc3      	subi      	r6, r4, 1
 8015fe0:	c4d10026 	addu      	r6, r17, r6
 8015fe4:	6114      	addu      	r4, r5
    out(buf[--len], buffer, idx++, maxlen);
 8015fe6:	e6250000 	addi      	r17, r5, 1
 8015fea:	6c97      	mov      	r2, r5
 8015fec:	8600      	ld.b      	r0, (r6, 0x0)
 8015fee:	6ce7      	mov      	r3, r9
 8015ff0:	6c63      	mov      	r1, r8
 8015ff2:	c4114825 	lsli      	r5, r17, 0
 8015ff6:	7bdd      	jsr      	r7
  while (len) {
 8015ff8:	6516      	cmpne      	r5, r4
 8015ffa:	2e00      	subi      	r6, 1
 8015ffc:	0bf5      	bt      	0x8015fe6	// 8015fe6 <_ntoa_format+0xde>
  if (flags & FLAGS_LEFT) {
 8015ffe:	e9100011 	bez      	r16, 0x8016020	// 8016020 <_ntoa_format+0x118>
    while (idx - start_idx < width) {
 8016002:	c5640083 	subu      	r3, r4, r11
 8016006:	668c      	cmphs      	r3, r10
 8016008:	080c      	bt      	0x8016020	// 8016020 <_ntoa_format+0x118>
 801600a:	6c93      	mov      	r2, r4
      out(' ', buffer, idx++, maxlen);
 801600c:	2400      	addi      	r4, 1
 801600e:	6ce7      	mov      	r3, r9
 8016010:	6c63      	mov      	r1, r8
 8016012:	3020      	movi      	r0, 32
 8016014:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 8016016:	c5640083 	subu      	r3, r4, r11
 801601a:	668c      	cmphs      	r3, r10
      out(' ', buffer, idx++, maxlen);
 801601c:	6c93      	mov      	r2, r4
    while (idx - start_idx < width) {
 801601e:	0ff7      	bf      	0x801600c	// 801600c <_ntoa_format+0x104>
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}
 8016020:	6c13      	mov      	r0, r4
 8016022:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8016026:	e4422003 	andi      	r2, r2, 3
 801602a:	e9220049 	bnez      	r2, 0x80160bc	// 80160bc <_ntoa_format+0x1b4>
    for (size_t i = len; i < width; i++) {
 801602e:	6690      	cmphs      	r4, r10
 8016030:	0846      	bt      	0x80160bc	// 80160bc <_ntoa_format+0x1b4>
 8016032:	c54b0026 	addu      	r6, r11, r10
 8016036:	6192      	subu      	r6, r4
 8016038:	6caf      	mov      	r2, r11
      out(' ', buffer, idx++, maxlen);
 801603a:	5aa2      	addi      	r5, r2, 1
 801603c:	6ce7      	mov      	r3, r9
 801603e:	6c63      	mov      	r1, r8
 8016040:	3020      	movi      	r0, 32
 8016042:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 8016044:	6596      	cmpne      	r5, r6
 8016046:	6c97      	mov      	r2, r5
 8016048:	0bf9      	bt      	0x801603a	// 801603a <_ntoa_format+0x132>
  while (len) {
 801604a:	e924ffca 	bnez      	r4, 0x8015fde	// 8015fde <_ntoa_format+0xd6>
 801604e:	6d17      	mov      	r4, r5
 8016050:	07d7      	br      	0x8015ffe	// 8015ffe <_ntoa_format+0xf6>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8016052:	e5a22001 	andi      	r13, r2, 1
 8016056:	e90d002d 	bez      	r13, 0x80160b0	// 80160b0 <_ntoa_format+0x1a8>
 801605a:	e92c0033 	bnez      	r12, 0x80160c0	// 80160c0 <_ntoa_format+0x1b8>
 801605e:	e462200c 	andi      	r3, r2, 12
 8016062:	e923002f 	bnez      	r3, 0x80160c0	// 80160c0 <_ntoa_format+0x1b8>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8016066:	6450      	cmphs      	r4, r1
 8016068:	0b7c      	bt      	0x8015f60	// 8015f60 <_ntoa_format+0x58>
 801606a:	331f      	movi      	r3, 31
 801606c:	650c      	cmphs      	r3, r4
 801606e:	0b6b      	bt      	0x8015f44	// 8015f44 <_ntoa_format+0x3c>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8016070:	6690      	cmphs      	r4, r10
 8016072:	0b89      	bt      	0x8015f84	// 8015f84 <_ntoa_format+0x7c>
  if (flags & FLAGS_HASH) {
 8016074:	e4622010 	andi      	r3, r2, 16
 8016078:	e903ffae 	bez      	r3, 0x8015fd4	// 8015fd4 <_ntoa_format+0xcc>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 801607c:	e4622400 	andi      	r3, r2, 1024
 8016080:	e923ff8c 	bnez      	r3, 0x8015f98	// 8015f98 <_ntoa_format+0x90>
 8016084:	6506      	cmpne      	r1, r4
 8016086:	0c03      	bf      	0x801608c	// 801608c <_ntoa_format+0x184>
 8016088:	6692      	cmpne      	r4, r10
 801608a:	0b87      	bt      	0x8015f98	// 8015f98 <_ntoa_format+0x90>
      len--;
 801608c:	5c63      	subi      	r3, r4, 1
      if (len && (base == 16U)) {
 801608e:	e9030040 	bez      	r3, 0x801610e	// 801610e <_ntoa_format+0x206>
 8016092:	c4124821 	lsli      	r1, r18, 0
 8016096:	3950      	cmpnei      	r1, 16
 8016098:	0c20      	bf      	0x80160d8	// 80160d8 <_ntoa_format+0x1d0>
 801609a:	6d0f      	mov      	r4, r3
 801609c:	0782      	br      	0x8015fa0	// 8015fa0 <_ntoa_format+0x98>
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 801609e:	e4422003 	andi      	r2, r2, 3
      buf[len++] = '-';
 80160a2:	332d      	movi      	r3, 45
 80160a4:	d4910023 	str.b      	r3, (r17, r4 << 0)
 80160a8:	2400      	addi      	r4, 1
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80160aa:	e902ffc2 	bez      	r2, 0x801602e	// 801602e <_ntoa_format+0x126>
 80160ae:	0797      	br      	0x8015fdc	// 8015fdc <_ntoa_format+0xd4>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80160b0:	6450      	cmphs      	r4, r1
 80160b2:	0b69      	bt      	0x8015f84	// 8015f84 <_ntoa_format+0x7c>
 80160b4:	331f      	movi      	r3, 31
 80160b6:	650c      	cmphs      	r3, r4
 80160b8:	0b46      	bt      	0x8015f44	// 8015f44 <_ntoa_format+0x3c>
 80160ba:	0765      	br      	0x8015f84	// 8015f84 <_ntoa_format+0x7c>
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80160bc:	6d6f      	mov      	r5, r11
 80160be:	07c6      	br      	0x801604a	// 801604a <_ntoa_format+0x142>
      width--;
 80160c0:	e54a1000 	subi      	r10, r10, 1
 80160c4:	07d1      	br      	0x8016066	// 8016066 <_ntoa_format+0x15e>
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80160c6:	e4422003 	andi      	r2, r2, 3
      buf[len++] = '+';  // ignore the space if the '+' exists
 80160ca:	332b      	movi      	r3, 43
 80160cc:	d4910023 	str.b      	r3, (r17, r4 << 0)
 80160d0:	2400      	addi      	r4, 1
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80160d2:	e902ffae 	bez      	r2, 0x801602e	// 801602e <_ntoa_format+0x126>
 80160d6:	0783      	br      	0x8015fdc	// 8015fdc <_ntoa_format+0xd4>
        len--;
 80160d8:	2c01      	subi      	r4, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80160da:	e4622020 	andi      	r3, r2, 32
 80160de:	e9230010 	bnez      	r3, 0x80160fe	// 80160fe <_ntoa_format+0x1f6>
 80160e2:	3c1f      	cmphsi      	r4, 32
 80160e4:	0b78      	bt      	0x8015fd4	// 8015fd4 <_ntoa_format+0xcc>
      buf[len++] = 'x';
 80160e6:	3378      	movi      	r3, 120
 80160e8:	d4910023 	str.b      	r3, (r17, r4 << 0)
 80160ec:	2400      	addi      	r4, 1
 80160ee:	075d      	br      	0x8015fa8	// 8015fa8 <_ntoa_format+0xa0>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80160f0:	3c1f      	cmphsi      	r4, 32
 80160f2:	0b71      	bt      	0x8015fd4	// 8015fd4 <_ntoa_format+0xcc>
      buf[len++] = 'b';
 80160f4:	3362      	movi      	r3, 98
 80160f6:	d4910023 	str.b      	r3, (r17, r4 << 0)
 80160fa:	2400      	addi      	r4, 1
 80160fc:	0756      	br      	0x8015fa8	// 8015fa8 <_ntoa_format+0xa0>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80160fe:	331f      	movi      	r3, 31
 8016100:	650c      	cmphs      	r3, r4
 8016102:	0f69      	bf      	0x8015fd4	// 8015fd4 <_ntoa_format+0xcc>
      buf[len++] = 'X';
 8016104:	3358      	movi      	r3, 88
 8016106:	d4910023 	str.b      	r3, (r17, r4 << 0)
 801610a:	2400      	addi      	r4, 1
 801610c:	074e      	br      	0x8015fa8	// 8015fa8 <_ntoa_format+0xa0>
 801610e:	6d0f      	mov      	r4, r3
 8016110:	0744      	br      	0x8015f98	// 8015f98 <_ntoa_format+0x90>
	...

08016114 <_etoa.part.0>:
}


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
 8016114:	ebe00058 	push      	r4-r11, r15, r16-r17
 8016118:	143d      	subi      	r14, r14, 116
 801611a:	6dcf      	mov      	r7, r3
 801611c:	9968      	ld.w      	r3, (r14, 0xa0)
 801611e:	b86a      	st.w      	r3, (r14, 0x28)
 8016120:	6d43      	mov      	r5, r0
 8016122:	6c0f      	mov      	r0, r3
 8016124:	9969      	ld.w      	r3, (r14, 0xa4)
 8016126:	b86b      	st.w      	r3, (r14, 0x2c)
 8016128:	6d87      	mov      	r6, r1
 801612a:	6c4f      	mov      	r1, r3
 801612c:	996b      	ld.w      	r3, (r14, 0xac)
 801612e:	b86c      	st.w      	r3, (r14, 0x30)
 8016130:	6ecb      	mov      	r11, r2
 8016132:	996c      	ld.w      	r3, (r14, 0xb0)
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 8016134:	3200      	movi      	r2, 0
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
 8016136:	b867      	st.w      	r3, (r14, 0x1c)
  if (negative) {
 8016138:	6ccb      	mov      	r3, r2
 801613a:	e3ffd97f 	bsr      	0x8011438	// 8011438 <__ltdf2>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
 801613e:	d90e202a 	ld.w      	r8, (r14, 0xa8)
    value = -value;
 8016142:	d94e200a 	ld.w      	r10, (r14, 0x28)
  if (negative) {
 8016146:	e98002b1 	blz      	r0, 0x80166a8	// 80166a8 <_etoa.part.0+0x594>
 801614a:	988b      	ld.w      	r4, (r14, 0x2c)
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 801614c:	9867      	ld.w      	r3, (r14, 0x1c)
 801614e:	e4632400 	andi      	r3, r3, 1024
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8016152:	c68457c0 	zext      	r0, r4, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8016156:	3b40      	cmpnei      	r3, 0
  if (!(flags & FLAGS_PRECISION)) {
 8016158:	b874      	st.w      	r3, (r14, 0x50)
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801615a:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801615e:	3306      	movi      	r3, 6
 8016160:	c5030c20 	incf      	r8, r3, 0
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8016164:	dd4e2008 	st.w      	r10, (r14, 0x20)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8016168:	e3ffd984 	bsr      	0x8011470	// 8011470 <__floatsidf>
 801616c:	ea820121 	lrw      	r2, 0x509f79fb	// 80165f0 <_etoa.part.0+0x4dc>
 8016170:	ea830121 	lrw      	r3, 0x3fd34413	// 80165f4 <_etoa.part.0+0x4e0>
 8016174:	e3ffd77a 	bsr      	0x8011068	// 8011068 <__muldf3>
 8016178:	ea820120 	lrw      	r2, 0x8b60c8b3	// 80165f8 <_etoa.part.0+0x4e4>
 801617c:	ea830120 	lrw      	r3, 0x3fc68a28	// 80165fc <_etoa.part.0+0x4e8>
 8016180:	e3ffd73e 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8016184:	da4e2008 	ld.w      	r18, (r14, 0x20)
 8016188:	c412482c 	lsli      	r12, r18, 0
 801618c:	ea140000 	movi      	r20, 0
 8016190:	ea353ff0 	movih      	r21, 16368
 8016194:	c404566d 	zext      	r13, r4, 19, 0
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8016198:	c4004830 	lsli      	r16, r0, 0
 801619c:	6e47      	mov      	r9, r1
 801619e:	3200      	movi      	r2, 0
 80161a0:	c68c2420 	or      	r0, r12, r20
 80161a4:	c6ad2421 	or      	r1, r13, r21
 80161a8:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 80161ac:	de4e2013 	st.w      	r18, (r14, 0x4c)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 80161b0:	de8e2011 	st.w      	r20, (r14, 0x44)
 80161b4:	deae2012 	st.w      	r21, (r14, 0x48)
 80161b8:	e3ffd73a 	bsr      	0x801102c	// 801102c <__subdf3>
 80161bc:	ea820111 	lrw      	r2, 0x636f4361	// 8016600 <_etoa.part.0+0x4ec>
 80161c0:	ea830111 	lrw      	r3, 0x3fd287a7	// 8016604 <_etoa.part.0+0x4f0>
 80161c4:	e3ffd752 	bsr      	0x8011068	// 8011068 <__muldf3>
 80161c8:	6c83      	mov      	r2, r0
 80161ca:	6cc7      	mov      	r3, r1
 80161cc:	c4104820 	lsli      	r0, r16, 0
 80161d0:	6c67      	mov      	r1, r9
 80161d2:	e3ffd715 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 80161d6:	e3ffd981 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 80161da:	b808      	st.w      	r0, (r14, 0x20)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 80161dc:	e3ffd94a 	bsr      	0x8011470	// 8011470 <__floatsidf>
 80161e0:	ea82010a 	lrw      	r2, 0x979a371	// 8016608 <_etoa.part.0+0x4f4>
 80161e4:	ea83010a 	lrw      	r3, 0x400a934f	// 801660c <_etoa.part.0+0x4f8>
 80161e8:	c4004830 	lsli      	r16, r0, 0
 80161ec:	6e47      	mov      	r9, r1
 80161ee:	e3ffd73d 	bsr      	0x8011068	// 8011068 <__muldf3>
 80161f2:	3200      	movi      	r2, 0
 80161f4:	ea233fe0 	movih      	r3, 16352
 80161f8:	e3ffd702 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 80161fc:	e3ffd96e 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 8016200:	b809      	st.w      	r0, (r14, 0x24)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 8016202:	ea820104 	lrw      	r2, 0xbbb55516	// 8016610 <_etoa.part.0+0x4fc>
 8016206:	ea830104 	lrw      	r3, 0x40026bb1	// 8016614 <_etoa.part.0+0x500>
 801620a:	c4104820 	lsli      	r0, r16, 0
 801620e:	6c67      	mov      	r1, r9
 8016210:	e3ffd72c 	bsr      	0x8011068	// 8011068 <__muldf3>
 8016214:	c4004830 	lsli      	r16, r0, 0
 8016218:	9809      	ld.w      	r0, (r14, 0x24)
 801621a:	6e47      	mov      	r9, r1
 801621c:	e3ffd92a 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8016220:	0041      	lrw      	r2, 0xfefa39ef	// 8016618 <_etoa.part.0+0x504>
 8016222:	ea8300ff 	lrw      	r3, 0x3fe62e42	// 801661c <_etoa.part.0+0x508>
 8016226:	e3ffd721 	bsr      	0x8011068	// 8011068 <__muldf3>
 801622a:	6c83      	mov      	r2, r0
 801622c:	6cc7      	mov      	r3, r1
 801622e:	c4104820 	lsli      	r0, r16, 0
 8016232:	6c67      	mov      	r1, r9
 8016234:	e3ffd6fc 	bsr      	0x801102c	// 801102c <__subdf3>
  const double z2 = z * z;
 8016238:	6c83      	mov      	r2, r0
 801623a:	6cc7      	mov      	r3, r1
 801623c:	b80e      	st.w      	r0, (r14, 0x38)
 801623e:	b82d      	st.w      	r1, (r14, 0x34)
 8016240:	e3ffd714 	bsr      	0x8011068	// 8011068 <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8016244:	d9ae200e 	ld.w      	r13, (r14, 0x38)
 8016248:	d98e200d 	ld.w      	r12, (r14, 0x34)
 801624c:	6cb7      	mov      	r2, r13
 801624e:	6cf3      	mov      	r3, r12
  const double z2 = z * z;
 8016250:	c4004830 	lsli      	r16, r0, 0
 8016254:	6e47      	mov      	r9, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8016256:	6c37      	mov      	r0, r13
 8016258:	6c73      	mov      	r1, r12
 801625a:	ddae2010 	st.w      	r13, (r14, 0x40)
 801625e:	dd8e200f 	st.w      	r12, (r14, 0x3c)
 8016262:	e3ffd6cd 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 8016266:	b80e      	st.w      	r0, (r14, 0x38)
 8016268:	b82d      	st.w      	r1, (r14, 0x34)
 801626a:	3200      	movi      	r2, 0
 801626c:	ea23402c 	movih      	r3, 16428
 8016270:	c4104820 	lsli      	r0, r16, 0
 8016274:	6c67      	mov      	r1, r9
 8016276:	e3ffd7f9 	bsr      	0x8011268	// 8011268 <__divdf3>
 801627a:	3200      	movi      	r2, 0
 801627c:	ea234024 	movih      	r3, 16420
 8016280:	e3ffd6be 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 8016284:	6c83      	mov      	r2, r0
 8016286:	6cc7      	mov      	r3, r1
 8016288:	c4104820 	lsli      	r0, r16, 0
 801628c:	6c67      	mov      	r1, r9
 801628e:	e3ffd7ed 	bsr      	0x8011268	// 8011268 <__divdf3>
 8016292:	3200      	movi      	r2, 0
 8016294:	ea234018 	movih      	r3, 16408
 8016298:	e3ffd6b2 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 801629c:	6c83      	mov      	r2, r0
 801629e:	6cc7      	mov      	r3, r1
 80162a0:	c4104820 	lsli      	r0, r16, 0
 80162a4:	6c67      	mov      	r1, r9
 80162a6:	e3ffd7e1 	bsr      	0x8011268	// 8011268 <__divdf3>
 80162aa:	d9ae2010 	ld.w      	r13, (r14, 0x40)
 80162ae:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 80162b2:	6cb7      	mov      	r2, r13
 80162b4:	6cf3      	mov      	r3, r12
 80162b6:	c4004830 	lsli      	r16, r0, 0
 80162ba:	6e47      	mov      	r9, r1
 80162bc:	3000      	movi      	r0, 0
 80162be:	ea214000 	movih      	r1, 16384
 80162c2:	e3ffd6b5 	bsr      	0x801102c	// 801102c <__subdf3>
 80162c6:	6c83      	mov      	r2, r0
 80162c8:	6cc7      	mov      	r3, r1
 80162ca:	c4104820 	lsli      	r0, r16, 0
 80162ce:	6c67      	mov      	r1, r9
 80162d0:	e3ffd696 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 80162d4:	daee200e 	ld.w      	r23, (r14, 0x38)
 80162d8:	dace200d 	ld.w      	r22, (r14, 0x34)
 80162dc:	6c83      	mov      	r2, r0
 80162de:	6cc7      	mov      	r3, r1
 80162e0:	c4174820 	lsli      	r0, r23, 0
 80162e4:	c4164821 	lsli      	r1, r22, 0
 80162e8:	e3ffd7c0 	bsr      	0x8011268	// 8011268 <__divdf3>
 80162ec:	da8e2011 	ld.w      	r20, (r14, 0x44)
 80162f0:	daae2012 	ld.w      	r21, (r14, 0x48)
 80162f4:	c4144822 	lsli      	r2, r20, 0
 80162f8:	c4154823 	lsli      	r3, r21, 0
 80162fc:	e3ffd680 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 8016300:	9849      	ld.w      	r2, (r14, 0x24)
 8016302:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8016306:	4374      	lsli      	r3, r3, 20
 8016308:	3200      	movi      	r2, 0
 801630a:	e3ffd6af 	bsr      	0x8011068	// 8011068 <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 801630e:	da4e2013 	ld.w      	r18, (r14, 0x4c)
 8016312:	6c83      	mov      	r2, r0
 8016314:	c4004830 	lsli      	r16, r0, 0
 8016318:	6cc7      	mov      	r3, r1
 801631a:	6e47      	mov      	r9, r1
 801631c:	c4124820 	lsli      	r0, r18, 0
 8016320:	6c53      	mov      	r1, r4
 8016322:	e3ffd88b 	bsr      	0x8011438	// 8011438 <__ltdf2>
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8016326:	c4044831 	lsli      	r17, r4, 0
  if (value < conv.F) {
 801632a:	6f27      	mov      	r12, r9
 801632c:	c410482d 	lsli      	r13, r16, 0
 8016330:	e9a0000f 	bhsz      	r0, 0x801634e	// 801634e <_etoa.part.0+0x23a>
    expval--;
 8016334:	9868      	ld.w      	r3, (r14, 0x20)
 8016336:	2b00      	subi      	r3, 1
 8016338:	b868      	st.w      	r3, (r14, 0x20)
    conv.F /= 10;
 801633a:	3200      	movi      	r2, 0
 801633c:	ea234024 	movih      	r3, 16420
 8016340:	c4104820 	lsli      	r0, r16, 0
 8016344:	6c67      	mov      	r1, r9
 8016346:	e3ffd791 	bsr      	0x8011268	// 8011268 <__divdf3>
 801634a:	6f43      	mov      	r13, r0
 801634c:	6f07      	mov      	r12, r1
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 801634e:	d92e2008 	ld.w      	r9, (r14, 0x20)
 8016352:	6ce7      	mov      	r3, r9
 8016354:	2362      	addi      	r3, 99
 8016356:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 801635a:	9867      	ld.w      	r3, (r14, 0x1c)
 801635c:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8016360:	c4000510 	mvc      	r16
 8016364:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8016368:	e903002c 	bez      	r3, 0x80163c0	// 80163c0 <_etoa.part.0+0x2ac>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 801636c:	0252      	lrw      	r2, 0xeb1c432d	// 8016620 <_etoa.part.0+0x50c>
 801636e:	0271      	lrw      	r3, 0x3f1a36e2	// 8016624 <_etoa.part.0+0x510>
 8016370:	6c2b      	mov      	r0, r10
 8016372:	6c53      	mov      	r1, r4
 8016374:	dd8e2009 	st.w      	r12, (r14, 0x24)
 8016378:	c40d4831 	lsli      	r17, r13, 0
 801637c:	e3ffd83e 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 8016380:	c411482d 	lsli      	r13, r17, 0
 8016384:	d98e2009 	ld.w      	r12, (r14, 0x24)
 8016388:	e9800184 	blz      	r0, 0x8016690	// 8016690 <_etoa.part.0+0x57c>
 801638c:	3200      	movi      	r2, 0
 801638e:	0278      	lrw      	r3, 0x412e8480	// 8016628 <_etoa.part.0+0x514>
 8016390:	6c2b      	mov      	r0, r10
 8016392:	6c53      	mov      	r1, r4
 8016394:	e3ffd852 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016398:	c411482d 	lsli      	r13, r17, 0
 801639c:	d98e2009 	ld.w      	r12, (r14, 0x24)
 80163a0:	e9a00178 	bhsz      	r0, 0x8016690	// 8016690 <_etoa.part.0+0x57c>
      if ((int)prec > expval) {
 80163a4:	6625      	cmplt      	r9, r8
 80163a6:	e8400355 	bf      	0x8016a50	// 8016a50 <_etoa.part.0+0x93c>
        prec = (unsigned)((int)prec - expval - 1);
 80163aa:	6226      	subu      	r8, r9
 80163ac:	e5081000 	subi      	r8, r8, 1
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 80163b0:	9867      	ld.w      	r3, (r14, 0x1c)
 80163b2:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 80163b6:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 80163ba:	b867      	st.w      	r3, (r14, 0x1c)
      expval   = 0;
 80163bc:	de0e2008 	st.w      	r16, (r14, 0x20)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 80163c0:	984c      	ld.w      	r2, (r14, 0x30)
 80163c2:	c6020089 	subu      	r9, r2, r16
 80163c6:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 80163ca:	9847      	ld.w      	r2, (r14, 0x1c)
 80163cc:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 80163d0:	3300      	movi      	r3, 0
 80163d2:	c5230c40 	inct      	r9, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 80163d6:	b849      	st.w      	r2, (r14, 0x24)
 80163d8:	e9020006 	bez      	r2, 0x80163e4	// 80163e4 <_etoa.part.0+0x2d0>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 80163dc:	eb500000 	cmpnei      	r16, 0
 80163e0:	c5230c40 	inct      	r9, r3, 0
  }

  // rescale the float value
  if (expval) {
 80163e4:	9868      	ld.w      	r3, (r14, 0x20)
 80163e6:	e903000a 	bez      	r3, 0x80163fa	// 80163fa <_etoa.part.0+0x2e6>
    value /= conv.F;
 80163ea:	6c2b      	mov      	r0, r10
 80163ec:	6c53      	mov      	r1, r4
 80163ee:	6cb7      	mov      	r2, r13
 80163f0:	6cf3      	mov      	r3, r12
 80163f2:	e3ffd73b 	bsr      	0x8011268	// 8011268 <__divdf3>
 80163f6:	6e83      	mov      	r10, r0
 80163f8:	6d07      	mov      	r4, r1
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 80163fa:	3200      	movi      	r2, 0
 80163fc:	6ccb      	mov      	r3, r2
 80163fe:	980a      	ld.w      	r0, (r14, 0x28)
 8016400:	982b      	ld.w      	r1, (r14, 0x2c)
 8016402:	e3ffd81b 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016406:	e980014c 	blz      	r0, 0x801669e	// 801669e <_etoa.part.0+0x58a>
  if (value != value)
 801640a:	6cab      	mov      	r2, r10
 801640c:	6cd3      	mov      	r3, r4
 801640e:	6c2b      	mov      	r0, r10
 8016410:	6c53      	mov      	r1, r4
 8016412:	e3ffd7b7 	bsr      	0x8011380	// 8011380 <__nedf2>
 8016416:	e920014f 	bnez      	r0, 0x80166b4	// 80166b4 <_etoa.part.0+0x5a0>
  if (value < -DBL_MAX)
 801641a:	3200      	movi      	r2, 0
 801641c:	ea23fff0 	movih      	r3, 65520
 8016420:	2a00      	subi      	r2, 1
 8016422:	2b00      	subi      	r3, 1
 8016424:	6c2b      	mov      	r0, r10
 8016426:	6c53      	mov      	r1, r4
 8016428:	e3ffd808 	bsr      	0x8011438	// 8011438 <__ltdf2>
 801642c:	e980021f 	blz      	r0, 0x801686a	// 801686a <_etoa.part.0+0x756>
  if (value > DBL_MAX)
 8016430:	3200      	movi      	r2, 0
 8016432:	ea237ff0 	movih      	r3, 32752
 8016436:	2a00      	subi      	r2, 1
 8016438:	2b00      	subi      	r3, 1
 801643a:	6c2b      	mov      	r0, r10
 801643c:	6c53      	mov      	r1, r4
 801643e:	e3ffd7bd 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8016442:	e94000f9 	bhz      	r0, 0x8016634	// 8016634 <_etoa.part.0+0x520>
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8016446:	3200      	movi      	r2, 0
 8016448:	1379      	lrw      	r3, 0x41cdcd65	// 801662c <_etoa.part.0+0x518>
 801644a:	6c2b      	mov      	r0, r10
 801644c:	6c53      	mov      	r1, r4
 801644e:	e3ffd7b5 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8016452:	e94001fa 	bhz      	r0, 0x8016846	// 8016846 <_etoa.part.0+0x732>
 8016456:	3200      	movi      	r2, 0
 8016458:	1376      	lrw      	r3, 0xc1cdcd65	// 8016630 <_etoa.part.0+0x51c>
 801645a:	6c2b      	mov      	r0, r10
 801645c:	6c53      	mov      	r1, r4
 801645e:	e3ffd7ed 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016462:	e98001f2 	blz      	r0, 0x8016846	// 8016846 <_etoa.part.0+0x732>
  if (value < 0) {
 8016466:	3200      	movi      	r2, 0
 8016468:	6ccb      	mov      	r3, r2
 801646a:	6c2b      	mov      	r0, r10
 801646c:	6c53      	mov      	r1, r4
 801646e:	e3ffd7e5 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016472:	e9800330 	blz      	r0, 0x8016ad2	// 8016ad2 <_etoa.part.0+0x9be>
  bool negative = false;
 8016476:	3300      	movi      	r3, 0
 8016478:	b874      	st.w      	r3, (r14, 0x50)
  if (!(flags & FLAGS_PRECISION)) {
 801647a:	9867      	ld.w      	r3, (r14, 0x1c)
 801647c:	e5a32400 	andi      	r13, r3, 1024
 8016480:	e92d02c3 	bnez      	r13, 0x8016a06	// 8016a06 <_etoa.part.0+0x8f2>
 8016484:	1369      	lrw      	r3, 0x412e8480	// 8016628 <_etoa.part.0+0x514>
 8016486:	ddae200b 	st.w      	r13, (r14, 0x2c)
 801648a:	b86d      	st.w      	r3, (r14, 0x34)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801648c:	ea0c0006 	movi      	r12, 6
 8016490:	e62e0053 	addi      	r17, r14, 84
  int whole = (int)value;
 8016494:	6c53      	mov      	r1, r4
 8016496:	6c2b      	mov      	r0, r10
 8016498:	dd8e2013 	st.w      	r12, (r14, 0x4c)
 801649c:	ddae2011 	st.w      	r13, (r14, 0x44)
 80164a0:	e3ffd81c 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 80164a4:	b80a      	st.w      	r0, (r14, 0x28)
  double tmp = (value - whole) * pow10[prec];
 80164a6:	e3ffd7e5 	bsr      	0x8011470	// 8011470 <__floatsidf>
 80164aa:	6c83      	mov      	r2, r0
 80164ac:	6cc7      	mov      	r3, r1
 80164ae:	6c2b      	mov      	r0, r10
 80164b0:	6c53      	mov      	r1, r4
 80164b2:	e3ffd5bd 	bsr      	0x801102c	// 801102c <__subdf3>
 80164b6:	984b      	ld.w      	r2, (r14, 0x2c)
 80164b8:	986d      	ld.w      	r3, (r14, 0x34)
 80164ba:	e3ffd5d7 	bsr      	0x8011068	// 8011068 <__muldf3>
 80164be:	b82f      	st.w      	r1, (r14, 0x3c)
 80164c0:	b810      	st.w      	r0, (r14, 0x40)
  unsigned long frac = (unsigned long)tmp;
 80164c2:	e3ffd0dd 	bsr      	0x801067c	// 801067c <__fixunsdfsi>
 80164c6:	b80e      	st.w      	r0, (r14, 0x38)
  diff = tmp - frac;
 80164c8:	e3ffd872 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 80164cc:	da8e2010 	ld.w      	r20, (r14, 0x40)
 80164d0:	da6e200f 	ld.w      	r19, (r14, 0x3c)
 80164d4:	6c83      	mov      	r2, r0
 80164d6:	6cc7      	mov      	r3, r1
 80164d8:	c4144820 	lsli      	r0, r20, 0
 80164dc:	c4134821 	lsli      	r1, r19, 0
 80164e0:	e3ffd5a6 	bsr      	0x801102c	// 801102c <__subdf3>
  if (diff > 0.5) {
 80164e4:	3200      	movi      	r2, 0
 80164e6:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 80164ea:	b80f      	st.w      	r0, (r14, 0x3c)
 80164ec:	b830      	st.w      	r1, (r14, 0x40)
  if (diff > 0.5) {
 80164ee:	e3ffd765 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 80164f2:	da4e200e 	ld.w      	r18, (r14, 0x38)
 80164f6:	d9ae2011 	ld.w      	r13, (r14, 0x44)
 80164fa:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 80164fe:	e9600265 	blsz      	r0, 0x80169c8	// 80169c8 <_etoa.part.0+0x8b4>
    ++frac;
 8016502:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 8016506:	c4124820 	lsli      	r0, r18, 0
 801650a:	dd8e2010 	st.w      	r12, (r14, 0x40)
 801650e:	ddae200f 	st.w      	r13, (r14, 0x3c)
 8016512:	de4e200e 	st.w      	r18, (r14, 0x38)
 8016516:	e3ffd84b 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 801651a:	984b      	ld.w      	r2, (r14, 0x2c)
 801651c:	986d      	ld.w      	r3, (r14, 0x34)
 801651e:	e3ffd76d 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 8016522:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8016526:	d9ae200f 	ld.w      	r13, (r14, 0x3c)
 801652a:	d98e2010 	ld.w      	r12, (r14, 0x40)
 801652e:	e9a002ab 	bhsz      	r0, 0x8016a84	// 8016a84 <_etoa.part.0+0x970>
  if (prec == 0U) {
 8016532:	e92c01dd 	bnez      	r12, 0x80168ec	// 80168ec <_etoa.part.0+0x7d8>
    diff = value - (double)whole;
 8016536:	980a      	ld.w      	r0, (r14, 0x28)
 8016538:	ddae200b 	st.w      	r13, (r14, 0x2c)
 801653c:	dd8e200d 	st.w      	r12, (r14, 0x34)
 8016540:	e3ffd798 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8016544:	6c83      	mov      	r2, r0
 8016546:	6cc7      	mov      	r3, r1
 8016548:	6c2b      	mov      	r0, r10
 801654a:	6c53      	mov      	r1, r4
 801654c:	e3ffd570 	bsr      	0x801102c	// 801102c <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8016550:	d98e200d 	ld.w      	r12, (r14, 0x34)
 8016554:	6cb3      	mov      	r2, r12
 8016556:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 801655a:	6e83      	mov      	r10, r0
 801655c:	6d07      	mov      	r4, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 801655e:	e3ffd76d 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016562:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8016566:	e9800280 	blz      	r0, 0x8016a66	// 8016a66 <_etoa.part.0+0x952>
 801656a:	984a      	ld.w      	r2, (r14, 0x28)
 801656c:	e4622001 	andi      	r3, r2, 1
      ++whole;
 8016570:	3b40      	cmpnei      	r3, 0
 8016572:	c4620c20 	incf      	r3, r2, 0
 8016576:	c4620c41 	inct      	r3, r2, 1
 801657a:	b86a      	st.w      	r3, (r14, 0x28)
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 801657c:	eb4d0020 	cmpnei      	r13, 32
 8016580:	0ddf      	bf      	0x801693e	// 801693e <_etoa.part.0+0x82a>
    buf[len++] = (char)(48 + (whole % 10));
 8016582:	ea0c000a 	movi      	r12, 10
 8016586:	980a      	ld.w      	r0, (r14, 0x28)
 8016588:	c5808043 	divs      	r3, r0, r12
 801658c:	c5838422 	mult      	r2, r3, r12
 8016590:	5849      	subu      	r2, r0, r2
 8016592:	222f      	addi      	r2, 48
 8016594:	e42d0000 	addi      	r1, r13, 1
 8016598:	d5b10022 	str.b      	r2, (r17, r13 << 0)
    if (!(whole /= 10)) {
 801659c:	e9030013 	bez      	r3, 0x80165c2	// 80165c2 <_etoa.part.0+0x4ae>
 80165a0:	c431002d 	addu      	r13, r17, r1
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80165a4:	eb410020 	cmpnei      	r1, 32
 80165a8:	0dcb      	bf      	0x801693e	// 801693e <_etoa.part.0+0x82a>
    buf[len++] = (char)(48 + (whole % 10));
 80165aa:	c5838042 	divs      	r2, r3, r12
 80165ae:	c5828420 	mult      	r0, r2, r12
 80165b2:	60c2      	subu      	r3, r0
 80165b4:	232f      	addi      	r3, 48
 80165b6:	d40d8003 	stbi.b      	r3, (r13)
 80165ba:	2100      	addi      	r1, 1
    if (!(whole /= 10)) {
 80165bc:	6ccb      	mov      	r3, r2
 80165be:	e922fff3 	bnez      	r2, 0x80165a4	// 80165a4 <_etoa.part.0+0x490>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80165c2:	9867      	ld.w      	r3, (r14, 0x1c)
 80165c4:	e4632003 	andi      	r3, r3, 3
 80165c8:	3b41      	cmpnei      	r3, 1
 80165ca:	e8400265 	bf      	0x8016a94	// 8016a94 <_etoa.part.0+0x980>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 80165ce:	eb410020 	cmpnei      	r1, 32
 80165d2:	e84002b5 	bf      	0x8016b3c	// 8016b3c <_etoa.part.0+0xa28>
    if (negative) {
 80165d6:	9854      	ld.w      	r2, (r14, 0x50)
 80165d8:	e9220242 	bnez      	r2, 0x8016a5c	// 8016a5c <_etoa.part.0+0x948>
    else if (flags & FLAGS_PLUS) {
 80165dc:	9847      	ld.w      	r2, (r14, 0x1c)
 80165de:	e4422004 	andi      	r2, r2, 4
 80165e2:	e90202a3 	bez      	r2, 0x8016b28	// 8016b28 <_etoa.part.0+0xa14>
      buf[len++] = '+';  // ignore the space if the '+' exists
 80165e6:	322b      	movi      	r2, 43
 80165e8:	5982      	addi      	r4, r1, 1
 80165ea:	d4310022 	str.b      	r2, (r17, r1 << 0)
 80165ee:	05ae      	br      	0x801694a	// 801694a <_etoa.part.0+0x836>
 80165f0:	509f79fb 	.long	0x509f79fb
 80165f4:	3fd34413 	.long	0x3fd34413
 80165f8:	8b60c8b3 	.long	0x8b60c8b3
 80165fc:	3fc68a28 	.long	0x3fc68a28
 8016600:	636f4361 	.long	0x636f4361
 8016604:	3fd287a7 	.long	0x3fd287a7
 8016608:	0979a371 	.long	0x0979a371
 801660c:	400a934f 	.long	0x400a934f
 8016610:	bbb55516 	.long	0xbbb55516
 8016614:	40026bb1 	.long	0x40026bb1
 8016618:	fefa39ef 	.long	0xfefa39ef
 801661c:	3fe62e42 	.long	0x3fe62e42
 8016620:	eb1c432d 	.long	0xeb1c432d
 8016624:	3f1a36e2 	.long	0x3f1a36e2
 8016628:	412e8480 	.long	0x412e8480
 801662c:	41cdcd65 	.long	0x41cdcd65
 8016630:	c1cdcd65 	.long	0xc1cdcd65
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8016634:	9827      	ld.w      	r1, (r14, 0x1c)
 8016636:	e4612004 	andi      	r3, r1, 4
 801663a:	3b40      	cmpnei      	r3, 0
 801663c:	0140      	lrw      	r2, 0x805381c	// 80169b8 <_etoa.part.0+0x8a4>
 801663e:	ea8a00e0 	lrw      	r10, 0x8053814	// 80169bc <_etoa.part.0+0x8a8>
 8016642:	c5420c20 	incf      	r10, r2, 0
 8016646:	ea110004 	movi      	r17, 4
 801664a:	3b40      	cmpnei      	r3, 0
 801664c:	3303      	movi      	r3, 3
 801664e:	c4710c40 	inct      	r3, r17, 0
 8016652:	6c8f      	mov      	r2, r3
 8016654:	b86a      	st.w      	r3, (r14, 0x28)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8016656:	e4612003 	andi      	r3, r1, 3
 801665a:	e9230044 	bnez      	r3, 0x80166e2	// 80166e2 <_etoa.part.0+0x5ce>
    for (size_t i = len; i < width; i++) {
 801665e:	6648      	cmphs      	r2, r9
 8016660:	6ccb      	mov      	r3, r2
 8016662:	0840      	bt      	0x80166e2	// 80166e2 <_etoa.part.0+0x5ce>
 8016664:	6caf      	mov      	r2, r11
 8016666:	c5630084 	subu      	r4, r3, r11
      out(' ', buffer, idx++, maxlen);
 801666a:	e6220000 	addi      	r17, r2, 1
 801666e:	6cdf      	mov      	r3, r7
 8016670:	6c5b      	mov      	r1, r6
 8016672:	3020      	movi      	r0, 32
 8016674:	7bd5      	jsr      	r5
 8016676:	c4114822 	lsli      	r2, r17, 0
    for (size_t i = len; i < width; i++) {
 801667a:	5c68      	addu      	r3, r4, r2
 801667c:	664c      	cmphs      	r3, r9
 801667e:	0ff6      	bf      	0x801666a	// 801666a <_etoa.part.0+0x556>
 8016680:	c52b0024 	addu      	r4, r11, r9
 8016684:	986a      	ld.w      	r3, (r14, 0x28)
 8016686:	5c6d      	subu      	r3, r4, r3
 8016688:	b86b      	st.w      	r3, (r14, 0x2c)
 801668a:	988a      	ld.w      	r4, (r14, 0x28)
 801668c:	6c8f      	mov      	r2, r3
 801668e:	042e      	br      	0x80166ea	// 80166ea <_etoa.part.0+0x5d6>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 8016690:	e908fe98 	bez      	r8, 0x80163c0	// 80163c0 <_etoa.part.0+0x2ac>
        --prec;
 8016694:	9874      	ld.w      	r3, (r14, 0x50)
 8016696:	3b40      	cmpnei      	r3, 0
 8016698:	c5080d01 	dect      	r8, r8, 1
 801669c:	0692      	br      	0x80163c0	// 80163c0 <_etoa.part.0+0x2ac>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 801669e:	ea238000 	movih      	r3, 32768
 80166a2:	60d0      	addu      	r3, r4
 80166a4:	6d0f      	mov      	r4, r3
 80166a6:	06b2      	br      	0x801640a	// 801640a <_etoa.part.0+0x2f6>
    value = -value;
 80166a8:	986b      	ld.w      	r3, (r14, 0x2c)
 80166aa:	ea228000 	movih      	r2, 32768
 80166ae:	5b88      	addu      	r4, r3, r2
 80166b0:	e800fd4e 	br      	0x801614c	// 801614c <_etoa.part.0+0x38>
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80166b4:	9867      	ld.w      	r3, (r14, 0x1c)
 80166b6:	e4632003 	andi      	r3, r3, 3
 80166ba:	e923009c 	bnez      	r3, 0x80167f2	// 80167f2 <_etoa.part.0+0x6de>
    for (size_t i = len; i < width; i++) {
 80166be:	3303      	movi      	r3, 3
 80166c0:	664c      	cmphs      	r3, r9
 80166c2:	0898      	bt      	0x80167f2	// 80167f2 <_etoa.part.0+0x6de>
 80166c4:	e48b1002 	subi      	r4, r11, 3
 80166c8:	6124      	addu      	r4, r9
 80166ca:	6caf      	mov      	r2, r11
      out(' ', buffer, idx++, maxlen);
 80166cc:	e6220000 	addi      	r17, r2, 1
 80166d0:	6cdf      	mov      	r3, r7
 80166d2:	6c5b      	mov      	r1, r6
 80166d4:	3020      	movi      	r0, 32
 80166d6:	7bd5      	jsr      	r5
 80166d8:	c4114822 	lsli      	r2, r17, 0
    for (size_t i = len; i < width; i++) {
 80166dc:	650a      	cmpne      	r2, r4
 80166de:	0bf7      	bt      	0x80166cc	// 80166cc <_etoa.part.0+0x5b8>
 80166e0:	048b      	br      	0x80167f6	// 80167f6 <_etoa.part.0+0x6e2>
 80166e2:	dd6e200b 	st.w      	r11, (r14, 0x2c)
 80166e6:	6d0b      	mov      	r4, r2
 80166e8:	984b      	ld.w      	r2, (r14, 0x2c)
 80166ea:	6cd3      	mov      	r3, r4
 80166ec:	2b00      	subi      	r3, 1
 80166ee:	628c      	addu      	r10, r3
    out(buf[--len], buffer, idx++, maxlen);
 80166f0:	e6220000 	addi      	r17, r2, 1
 80166f4:	d80a0000 	ld.b      	r0, (r10, 0x0)
 80166f8:	6cdf      	mov      	r3, r7
 80166fa:	6c5b      	mov      	r1, r6
 80166fc:	2c00      	subi      	r4, 1
 80166fe:	7bd5      	jsr      	r5
 8016700:	e54a1000 	subi      	r10, r10, 1
 8016704:	c4114822 	lsli      	r2, r17, 0
  while (len) {
 8016708:	e924fff4 	bnez      	r4, 0x80166f0	// 80166f0 <_etoa.part.0+0x5dc>
 801670c:	986b      	ld.w      	r3, (r14, 0x2c)
 801670e:	988a      	ld.w      	r4, (r14, 0x28)
 8016710:	610c      	addu      	r4, r3
  if (flags & FLAGS_LEFT) {
 8016712:	9869      	ld.w      	r3, (r14, 0x24)
 8016714:	e9030011 	bez      	r3, 0x8016736	// 8016736 <_etoa.part.0+0x622>
    while (idx - start_idx < width) {
 8016718:	c5640083 	subu      	r3, r4, r11
 801671c:	664c      	cmphs      	r3, r9
 801671e:	080c      	bt      	0x8016736	// 8016736 <_etoa.part.0+0x622>
 8016720:	6c93      	mov      	r2, r4
      out(' ', buffer, idx++, maxlen);
 8016722:	2400      	addi      	r4, 1
 8016724:	6cdf      	mov      	r3, r7
 8016726:	6c5b      	mov      	r1, r6
 8016728:	3020      	movi      	r0, 32
 801672a:	7bd5      	jsr      	r5
    while (idx - start_idx < width) {
 801672c:	c5640083 	subu      	r3, r4, r11
 8016730:	664c      	cmphs      	r3, r9
      out(' ', buffer, idx++, maxlen);
 8016732:	6c93      	mov      	r2, r4
    while (idx - start_idx < width) {
 8016734:	0ff7      	bf      	0x8016722	// 8016722 <_etoa.part.0+0x60e>

  // output the exponent part
  if (!prec && minwidth) {
 8016736:	e928005a 	bnez      	r8, 0x80167ea	// 80167ea <_etoa.part.0+0x6d6>
 801673a:	e9100058 	bez      	r16, 0x80167ea	// 80167ea <_etoa.part.0+0x6d6>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 801673e:	9867      	ld.w      	r3, (r14, 0x1c)
 8016740:	e4632020 	andi      	r3, r3, 32
 8016744:	3b40      	cmpnei      	r3, 0
 8016746:	ea0c0065 	movi      	r12, 101
 801674a:	3045      	movi      	r0, 69
 801674c:	6cdf      	mov      	r3, r7
 801674e:	6c93      	mov      	r2, r4
 8016750:	6c5b      	mov      	r1, r6
 8016752:	c40c0c20 	incf      	r0, r12, 0
 8016756:	7bd5      	jsr      	r5
 8016758:	e62e0053 	addi      	r17, r14, 84
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 801675c:	9848      	ld.w      	r2, (r14, 0x20)
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 801675e:	e5240000 	addi      	r9, r4, 1
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8016762:	c4020203 	abs      	r3, r2
 8016766:	c7e24852 	lsri      	r18, r2, 31
 801676a:	e6101000 	subi      	r16, r16, 1
 801676e:	c4114821 	lsli      	r1, r17, 0
      const char digit = (char)(value % base);
 8016772:	ea0d000a 	movi      	r13, 10
 8016776:	ea0c0020 	movi      	r12, 32
 801677a:	c5a38022 	divu      	r2, r3, r13
 801677e:	c5a28420 	mult      	r0, r2, r13
 8016782:	60c2      	subu      	r3, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8016784:	232f      	addi      	r3, 48
 8016786:	a160      	st.b      	r3, (r1, 0x0)
 8016788:	e5080000 	addi      	r8, r8, 1
      value /= base;
 801678c:	6ccb      	mov      	r3, r2
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 801678e:	e9020005 	bez      	r2, 0x8016798	// 8016798 <_etoa.part.0+0x684>
 8016792:	2100      	addi      	r1, 1
 8016794:	e82cfff3 	bnezad      	r12, 0x801677a	// 801677a <_etoa.part.0+0x666>
  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8016798:	3305      	movi      	r3, 5
 801679a:	b866      	st.w      	r3, (r14, 0x18)
 801679c:	3300      	movi      	r3, 0
 801679e:	b864      	st.w      	r3, (r14, 0x10)
 80167a0:	330a      	movi      	r3, 10
 80167a2:	b863      	st.w      	r3, (r14, 0xc)
 80167a4:	de0e2005 	st.w      	r16, (r14, 0x14)
 80167a8:	6cdf      	mov      	r3, r7
 80167aa:	de4e2002 	st.w      	r18, (r14, 0x8)
 80167ae:	dd0e2001 	st.w      	r8, (r14, 0x4)
 80167b2:	de2e2000 	st.w      	r17, (r14, 0x0)
 80167b6:	6ca7      	mov      	r2, r9
 80167b8:	6c5b      	mov      	r1, r6
 80167ba:	6c17      	mov      	r0, r5
 80167bc:	e3fffba6 	bsr      	0x8015f08	// 8015f08 <_ntoa_format>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 80167c0:	9869      	ld.w      	r3, (r14, 0x24)
  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80167c2:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 80167c4:	e9030013 	bez      	r3, 0x80167ea	// 80167ea <_etoa.part.0+0x6d6>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 80167c8:	c5600083 	subu      	r3, r0, r11
 80167cc:	d90e200c 	ld.w      	r8, (r14, 0x30)
 80167d0:	660c      	cmphs      	r3, r8
 80167d2:	080c      	bt      	0x80167ea	// 80167ea <_etoa.part.0+0x6d6>
 80167d4:	6c83      	mov      	r2, r0
 80167d6:	2400      	addi      	r4, 1
 80167d8:	6cdf      	mov      	r3, r7
 80167da:	6c5b      	mov      	r1, r6
 80167dc:	3020      	movi      	r0, 32
 80167de:	7bd5      	jsr      	r5
 80167e0:	c5640083 	subu      	r3, r4, r11
 80167e4:	660c      	cmphs      	r3, r8
 80167e6:	6c93      	mov      	r2, r4
 80167e8:	0ff7      	bf      	0x80167d6	// 80167d6 <_etoa.part.0+0x6c2>
    }
  }
  return idx;
}
 80167ea:	6c13      	mov      	r0, r4
 80167ec:	141d      	addi      	r14, r14, 116
 80167ee:	ebc00058 	pop      	r4-r11, r15, r16-r17
    for (size_t i = len; i < width; i++) {
 80167f2:	c40b4831 	lsli      	r17, r11, 0
 80167f6:	e4710002 	addi      	r3, r17, 3
 80167fa:	c4114822 	lsli      	r2, r17, 0
 80167fe:	ea8a0071 	lrw      	r10, 0x8053822	// 80169c0 <_etoa.part.0+0x8ac>
 8016802:	c4034831 	lsli      	r17, r3, 0
    out(buf[--len], buffer, idx++, maxlen);
 8016806:	5a82      	addi      	r4, r2, 1
 8016808:	d80a0000 	ld.b      	r0, (r10, 0x0)
 801680c:	6cdf      	mov      	r3, r7
 801680e:	6c5b      	mov      	r1, r6
 8016810:	7bd5      	jsr      	r5
  while (len) {
 8016812:	c6240480 	cmpne      	r4, r17
 8016816:	e54a1000 	subi      	r10, r10, 1
 801681a:	6c93      	mov      	r2, r4
 801681c:	0bf5      	bt      	0x8016806	// 8016806 <_etoa.part.0+0x6f2>
  if (flags & FLAGS_LEFT) {
 801681e:	9869      	ld.w      	r3, (r14, 0x24)
 8016820:	c4044831 	lsli      	r17, r4, 0
 8016824:	e903ff89 	bez      	r3, 0x8016736	// 8016736 <_etoa.part.0+0x622>
    while (idx - start_idx < width) {
 8016828:	c5640083 	subu      	r3, r4, r11
 801682c:	664c      	cmphs      	r3, r9
 801682e:	0b84      	bt      	0x8016736	// 8016736 <_etoa.part.0+0x622>
      out(' ', buffer, idx++, maxlen);
 8016830:	2400      	addi      	r4, 1
 8016832:	6cdf      	mov      	r3, r7
 8016834:	6c5b      	mov      	r1, r6
 8016836:	3020      	movi      	r0, 32
 8016838:	7bd5      	jsr      	r5
    while (idx - start_idx < width) {
 801683a:	c5640083 	subu      	r3, r4, r11
 801683e:	664c      	cmphs      	r3, r9
      out(' ', buffer, idx++, maxlen);
 8016840:	6c93      	mov      	r2, r4
    while (idx - start_idx < width) {
 8016842:	0ff7      	bf      	0x8016830	// 8016830 <_etoa.part.0+0x71c>
 8016844:	0779      	br      	0x8016736	// 8016736 <_etoa.part.0+0x622>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8016846:	9867      	ld.w      	r3, (r14, 0x1c)
 8016848:	3b8b      	bclri      	r3, 11
 801684a:	b864      	st.w      	r3, (r14, 0x10)
 801684c:	b881      	st.w      	r4, (r14, 0x4)
 801684e:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8016852:	dd0e2002 	st.w      	r8, (r14, 0x8)
 8016856:	dd4e2000 	st.w      	r10, (r14, 0x0)
 801685a:	6cdf      	mov      	r3, r7
 801685c:	6caf      	mov      	r2, r11
 801685e:	6c5b      	mov      	r1, r6
 8016860:	6c17      	mov      	r0, r5
 8016862:	e3fffc59 	bsr      	0x8016114	// 8016114 <_etoa.part.0>
 8016866:	6d03      	mov      	r4, r0
 8016868:	0767      	br      	0x8016736	// 8016736 <_etoa.part.0+0x622>
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 801686a:	9867      	ld.w      	r3, (r14, 0x1c)
 801686c:	e4632003 	andi      	r3, r3, 3
 8016870:	e923003b 	bnez      	r3, 0x80168e6	// 80168e6 <_etoa.part.0+0x7d2>
    for (size_t i = len; i < width; i++) {
 8016874:	3304      	movi      	r3, 4
 8016876:	664c      	cmphs      	r3, r9
 8016878:	0837      	bt      	0x80168e6	// 80168e6 <_etoa.part.0+0x7d2>
 801687a:	e48b1003 	subi      	r4, r11, 4
 801687e:	6124      	addu      	r4, r9
 8016880:	6caf      	mov      	r2, r11
      out(' ', buffer, idx++, maxlen);
 8016882:	e6220000 	addi      	r17, r2, 1
 8016886:	6cdf      	mov      	r3, r7
 8016888:	6c5b      	mov      	r1, r6
 801688a:	3020      	movi      	r0, 32
 801688c:	7bd5      	jsr      	r5
 801688e:	c4114822 	lsli      	r2, r17, 0
    for (size_t i = len; i < width; i++) {
 8016892:	650a      	cmpne      	r2, r4
 8016894:	0bf7      	bt      	0x8016882	// 8016882 <_etoa.part.0+0x76e>
 8016896:	e4710003 	addi      	r3, r17, 4
 801689a:	c4114822 	lsli      	r2, r17, 0
 801689e:	ea8a004a 	lrw      	r10, 0x8053827	// 80169c4 <_etoa.part.0+0x8b0>
 80168a2:	c4034831 	lsli      	r17, r3, 0
    out(buf[--len], buffer, idx++, maxlen);
 80168a6:	5a82      	addi      	r4, r2, 1
 80168a8:	d80a0000 	ld.b      	r0, (r10, 0x0)
 80168ac:	6cdf      	mov      	r3, r7
 80168ae:	6c5b      	mov      	r1, r6
 80168b0:	7bd5      	jsr      	r5
  while (len) {
 80168b2:	c6240480 	cmpne      	r4, r17
 80168b6:	e54a1000 	subi      	r10, r10, 1
 80168ba:	6c93      	mov      	r2, r4
 80168bc:	0bf5      	bt      	0x80168a6	// 80168a6 <_etoa.part.0+0x792>
  if (flags & FLAGS_LEFT) {
 80168be:	9869      	ld.w      	r3, (r14, 0x24)
 80168c0:	c4044831 	lsli      	r17, r4, 0
 80168c4:	e903ff39 	bez      	r3, 0x8016736	// 8016736 <_etoa.part.0+0x622>
    while (idx - start_idx < width) {
 80168c8:	c5640083 	subu      	r3, r4, r11
 80168cc:	664c      	cmphs      	r3, r9
 80168ce:	0b34      	bt      	0x8016736	// 8016736 <_etoa.part.0+0x622>
      out(' ', buffer, idx++, maxlen);
 80168d0:	2400      	addi      	r4, 1
 80168d2:	6cdf      	mov      	r3, r7
 80168d4:	6c5b      	mov      	r1, r6
 80168d6:	3020      	movi      	r0, 32
 80168d8:	7bd5      	jsr      	r5
    while (idx - start_idx < width) {
 80168da:	c5640083 	subu      	r3, r4, r11
 80168de:	664c      	cmphs      	r3, r9
      out(' ', buffer, idx++, maxlen);
 80168e0:	6c93      	mov      	r2, r4
    while (idx - start_idx < width) {
 80168e2:	0ff7      	bf      	0x80168d0	// 80168d0 <_etoa.part.0+0x7bc>
 80168e4:	0729      	br      	0x8016736	// 8016736 <_etoa.part.0+0x622>
    for (size_t i = len; i < width; i++) {
 80168e6:	c40b4831 	lsli      	r17, r11, 0
 80168ea:	07d6      	br      	0x8016896	// 8016896 <_etoa.part.0+0x782>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80168ec:	eb4d0020 	cmpnei      	r13, 32
 80168f0:	0c27      	bf      	0x801693e	// 801693e <_etoa.part.0+0x82a>
      buf[len++] = (char)(48U + (frac % 10U));
 80168f2:	320a      	movi      	r2, 10
 80168f4:	c4528023 	divu      	r3, r18, r2
 80168f8:	c4438420 	mult      	r0, r3, r2
 80168fc:	c4120092 	subu      	r18, r18, r0
 8016900:	e652002f 	addi      	r18, r18, 48
      --count;
 8016904:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8016908:	e42d0000 	addi      	r1, r13, 1
 801690c:	d5b10032 	str.b      	r18, (r17, r13 << 0)
      if (!(frac /= 10U)) {
 8016910:	e90300ed 	bez      	r3, 0x8016aea	// 8016aea <_etoa.part.0+0x9d6>
 8016914:	c4310032 	addu      	r18, r17, r1
      buf[len++] = (char)(48U + (frac % 10U));
 8016918:	6f4b      	mov      	r13, r2
 801691a:	040f      	br      	0x8016938	// 8016938 <_etoa.part.0+0x824>
 801691c:	c5a38022 	divu      	r2, r3, r13
 8016920:	c5a28420 	mult      	r0, r2, r13
 8016924:	60c2      	subu      	r3, r0
 8016926:	232f      	addi      	r3, 48
 8016928:	d4128003 	stbi.b      	r3, (r18)
      --count;
 801692c:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8016930:	2100      	addi      	r1, 1
      if (!(frac /= 10U)) {
 8016932:	6ccb      	mov      	r3, r2
 8016934:	e90200db 	bez      	r2, 0x8016aea	// 8016aea <_etoa.part.0+0x9d6>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016938:	eb410020 	cmpnei      	r1, 32
 801693c:	0bf0      	bt      	0x801691c	// 801691c <_etoa.part.0+0x808>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 801693e:	9867      	ld.w      	r3, (r14, 0x1c)
 8016940:	e4632003 	andi      	r3, r3, 3
 8016944:	3b41      	cmpnei      	r3, 1
 8016946:	0ca6      	bf      	0x8016a92	// 8016a92 <_etoa.part.0+0x97e>
 8016948:	3420      	movi      	r4, 32
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 801694a:	e9230087 	bnez      	r3, 0x8016a58	// 8016a58 <_etoa.part.0+0x944>
    for (size_t i = len; i < width; i++) {
 801694e:	6650      	cmphs      	r4, r9
 8016950:	0884      	bt      	0x8016a58	// 8016a58 <_etoa.part.0+0x944>
 8016952:	c52b002a 	addu      	r10, r11, r9
 8016956:	6292      	subu      	r10, r4
 8016958:	6caf      	mov      	r2, r11
 801695a:	b88a      	st.w      	r4, (r14, 0x28)
      out(' ', buffer, idx++, maxlen);
 801695c:	5a82      	addi      	r4, r2, 1
 801695e:	6cdf      	mov      	r3, r7
 8016960:	6c5b      	mov      	r1, r6
 8016962:	3020      	movi      	r0, 32
 8016964:	7bd5      	jsr      	r5
    for (size_t i = len; i < width; i++) {
 8016966:	6692      	cmpne      	r4, r10
 8016968:	6c93      	mov      	r2, r4
 801696a:	0bf9      	bt      	0x801695c	// 801695c <_etoa.part.0+0x848>
 801696c:	6f13      	mov      	r12, r4
 801696e:	988a      	ld.w      	r4, (r14, 0x28)
 8016970:	5c63      	subi      	r3, r4, 1
 8016972:	c4710031 	addu      	r17, r17, r3
 8016976:	6130      	addu      	r4, r12
 8016978:	6cb3      	mov      	r2, r12
    out(buf[--len], buffer, idx++, maxlen);
 801697a:	e5420000 	addi      	r10, r2, 1
 801697e:	d8110000 	ld.b      	r0, (r17, 0x0)
 8016982:	6cdf      	mov      	r3, r7
 8016984:	6c5b      	mov      	r1, r6
 8016986:	7bd5      	jsr      	r5
  while (len) {
 8016988:	652a      	cmpne      	r10, r4
 801698a:	e6311000 	subi      	r17, r17, 1
 801698e:	6cab      	mov      	r2, r10
 8016990:	0bf5      	bt      	0x801697a	// 801697a <_etoa.part.0+0x866>
  if (flags & FLAGS_LEFT) {
 8016992:	9869      	ld.w      	r3, (r14, 0x24)
 8016994:	6f2b      	mov      	r12, r10
 8016996:	e903fed0 	bez      	r3, 0x8016736	// 8016736 <_etoa.part.0+0x622>
    while (idx - start_idx < width) {
 801699a:	632e      	subu      	r12, r11
 801699c:	6670      	cmphs      	r12, r9
 801699e:	0acc      	bt      	0x8016736	// 8016736 <_etoa.part.0+0x622>
      out(' ', buffer, idx++, maxlen);
 80169a0:	5a82      	addi      	r4, r2, 1
 80169a2:	6cdf      	mov      	r3, r7
 80169a4:	6c5b      	mov      	r1, r6
 80169a6:	3020      	movi      	r0, 32
 80169a8:	7bd5      	jsr      	r5
    while (idx - start_idx < width) {
 80169aa:	c5640083 	subu      	r3, r4, r11
 80169ae:	664c      	cmphs      	r3, r9
      out(' ', buffer, idx++, maxlen);
 80169b0:	6c93      	mov      	r2, r4
    while (idx - start_idx < width) {
 80169b2:	0ff7      	bf      	0x80169a0	// 80169a0 <_etoa.part.0+0x88c>
 80169b4:	06c1      	br      	0x8016736	// 8016736 <_etoa.part.0+0x622>
 80169b6:	0000      	.short	0x0000
 80169b8:	0805381c 	.long	0x0805381c
 80169bc:	08053814 	.long	0x08053814
 80169c0:	08053822 	.long	0x08053822
 80169c4:	08053827 	.long	0x08053827
  else if (diff < 0.5) {
 80169c8:	3200      	movi      	r2, 0
 80169ca:	ea233fe0 	movih      	r3, 16352
 80169ce:	980f      	ld.w      	r0, (r14, 0x3c)
 80169d0:	9830      	ld.w      	r1, (r14, 0x40)
 80169d2:	de4e200e 	st.w      	r18, (r14, 0x38)
 80169d6:	dd8e200d 	st.w      	r12, (r14, 0x34)
 80169da:	ddae200b 	st.w      	r13, (r14, 0x2c)
 80169de:	e3ffd52d 	bsr      	0x8011438	// 8011438 <__ltdf2>
 80169e2:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 80169e6:	d98e200d 	ld.w      	r12, (r14, 0x34)
 80169ea:	da4e200e 	ld.w      	r18, (r14, 0x38)
 80169ee:	e980fda2 	blz      	r0, 0x8016532	// 8016532 <_etoa.part.0+0x41e>
  else if ((frac == 0U) || (frac & 1U)) {
 80169f2:	e9120006 	bez      	r18, 0x80169fe	// 80169fe <_etoa.part.0+0x8ea>
 80169f6:	e4722001 	andi      	r3, r18, 1
 80169fa:	e903fd9c 	bez      	r3, 0x8016532	// 8016532 <_etoa.part.0+0x41e>
    ++frac;
 80169fe:	e6520000 	addi      	r18, r18, 1
 8016a02:	e800fd98 	br      	0x8016532	// 8016532 <_etoa.part.0+0x41e>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8016a06:	eb080009 	cmphsi      	r8, 10
 8016a0a:	0c9e      	bf      	0x8016b46	// 8016b46 <_etoa.part.0+0xa32>
    buf[len++] = '0';
 8016a0c:	e62e0053 	addi      	r17, r14, 84
 8016a10:	3130      	movi      	r1, 48
 8016a12:	dc310000 	st.b      	r1, (r17, 0x0)
    prec--;
 8016a16:	e5881000 	subi      	r12, r8, 1
 8016a1a:	e44e0054 	addi      	r2, r14, 85
 8016a1e:	e4081008 	subi      	r0, r8, 9
 8016a22:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 8016a26:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8016a28:	6742      	cmpne      	r0, r13
 8016a2a:	0c09      	bf      	0x8016a3c	// 8016a3c <_etoa.part.0+0x928>
    buf[len++] = '0';
 8016a2c:	e5ad0000 	addi      	r13, r13, 1
 8016a30:	d4028001 	stbi.b      	r1, (r2)
    prec--;
 8016a34:	e58c1000 	subi      	r12, r12, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8016a38:	e823fff8 	bnezad      	r3, 0x8016a28	// 8016a28 <_etoa.part.0+0x914>
 8016a3c:	124a      	lrw      	r2, 0x805382c	// 8016b64 <_etoa.part.0+0xa50>
 8016a3e:	c46c4823 	lsli      	r3, r12, 3
 8016a42:	60c8      	addu      	r3, r2
 8016a44:	9340      	ld.w      	r2, (r3, 0x0)
 8016a46:	9361      	ld.w      	r3, (r3, 0x4)
 8016a48:	b84b      	st.w      	r2, (r14, 0x2c)
 8016a4a:	b86d      	st.w      	r3, (r14, 0x34)
 8016a4c:	e800fd24 	br      	0x8016494	// 8016494 <_etoa.part.0+0x380>
      if ((int)prec > expval) {
 8016a50:	ea080000 	movi      	r8, 0
 8016a54:	e800fcae 	br      	0x80163b0	// 80163b0 <_etoa.part.0+0x29c>
    for (size_t i = len; i < width; i++) {
 8016a58:	6f2f      	mov      	r12, r11
 8016a5a:	078b      	br      	0x8016970	// 8016970 <_etoa.part.0+0x85c>
      buf[len++] = '-';
 8016a5c:	322d      	movi      	r2, 45
 8016a5e:	5982      	addi      	r4, r1, 1
 8016a60:	d4310022 	str.b      	r2, (r17, r1 << 0)
 8016a64:	0773      	br      	0x801694a	// 801694a <_etoa.part.0+0x836>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8016a66:	d98e200d 	ld.w      	r12, (r14, 0x34)
 8016a6a:	6cb3      	mov      	r2, r12
 8016a6c:	ea233fe0 	movih      	r3, 16352
 8016a70:	6c2b      	mov      	r0, r10
 8016a72:	6c53      	mov      	r1, r4
 8016a74:	e3ffd4a2 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8016a78:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8016a7c:	e960fd80 	blsz      	r0, 0x801657c	// 801657c <_etoa.part.0+0x468>
 8016a80:	e800fd75 	br      	0x801656a	// 801656a <_etoa.part.0+0x456>
      ++whole;
 8016a84:	986a      	ld.w      	r3, (r14, 0x28)
 8016a86:	2300      	addi      	r3, 1
 8016a88:	b86a      	st.w      	r3, (r14, 0x28)
      frac = 0;
 8016a8a:	ea120000 	movi      	r18, 0
 8016a8e:	e800fd52 	br      	0x8016532	// 8016532 <_etoa.part.0+0x41e>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8016a92:	3120      	movi      	r1, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8016a94:	e9090044 	bez      	r9, 0x8016b1c	// 8016b1c <_etoa.part.0+0xa08>
 8016a98:	9874      	ld.w      	r3, (r14, 0x50)
 8016a9a:	e9230007 	bnez      	r3, 0x8016aa8	// 8016aa8 <_etoa.part.0+0x994>
 8016a9e:	9867      	ld.w      	r3, (r14, 0x1c)
 8016aa0:	e463200c 	andi      	r3, r3, 12
 8016aa4:	e9030004 	bez      	r3, 0x8016aac	// 8016aac <_etoa.part.0+0x998>
      width--;
 8016aa8:	e5291000 	subi      	r9, r9, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8016aac:	6644      	cmphs      	r1, r9
 8016aae:	0837      	bt      	0x8016b1c	// 8016b1c <_etoa.part.0+0xa08>
 8016ab0:	eb410020 	cmpnei      	r1, 32
 8016ab4:	0c0c      	bf      	0x8016acc	// 8016acc <_etoa.part.0+0x9b8>
 8016ab6:	c4310023 	addu      	r3, r17, r1
      buf[len++] = '0';
 8016aba:	3230      	movi      	r2, 48
 8016abc:	2100      	addi      	r1, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8016abe:	6646      	cmpne      	r1, r9
      buf[len++] = '0';
 8016ac0:	a340      	st.b      	r2, (r3, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8016ac2:	0c2c      	bf      	0x8016b1a	// 8016b1a <_etoa.part.0+0xa06>
 8016ac4:	eb410020 	cmpnei      	r1, 32
 8016ac8:	2300      	addi      	r3, 1
 8016aca:	0bf9      	bt      	0x8016abc	// 8016abc <_etoa.part.0+0x9a8>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016acc:	6f2f      	mov      	r12, r11
 8016ace:	3420      	movi      	r4, 32
 8016ad0:	0750      	br      	0x8016970	// 8016970 <_etoa.part.0+0x85c>
    value = 0 - value;
 8016ad2:	6cd3      	mov      	r3, r4
 8016ad4:	6cab      	mov      	r2, r10
 8016ad6:	3000      	movi      	r0, 0
 8016ad8:	3100      	movi      	r1, 0
 8016ada:	e3ffd2a9 	bsr      	0x801102c	// 801102c <__subdf3>
    negative = true;
 8016ade:	3301      	movi      	r3, 1
    value = 0 - value;
 8016ae0:	6e83      	mov      	r10, r0
 8016ae2:	6d07      	mov      	r4, r1
    negative = true;
 8016ae4:	b874      	st.w      	r3, (r14, 0x50)
 8016ae6:	e800fcca 	br      	0x801647a	// 801647a <_etoa.part.0+0x366>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8016aea:	eb410020 	cmpnei      	r1, 32
 8016aee:	0f28      	bf      	0x801693e	// 801693e <_etoa.part.0+0x82a>
 8016af0:	e90c000e 	bez      	r12, 0x8016b0c	// 8016b0c <_etoa.part.0+0x9f8>
 8016af4:	c4310023 	addu      	r3, r17, r1
 8016af8:	6304      	addu      	r12, r1
      buf[len++] = '0';
 8016afa:	3230      	movi      	r2, 48
 8016afc:	2100      	addi      	r1, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8016afe:	eb410020 	cmpnei      	r1, 32
      buf[len++] = '0';
 8016b02:	a340      	st.b      	r2, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8016b04:	0f1d      	bf      	0x801693e	// 801693e <_etoa.part.0+0x82a>
 8016b06:	6706      	cmpne      	r1, r12
 8016b08:	2300      	addi      	r3, 1
 8016b0a:	0bf9      	bt      	0x8016afc	// 8016afc <_etoa.part.0+0x9e8>
      buf[len++] = '.';
 8016b0c:	332e      	movi      	r3, 46
 8016b0e:	e5a10000 	addi      	r13, r1, 1
 8016b12:	d4310023 	str.b      	r3, (r17, r1 << 0)
 8016b16:	e800fd33 	br      	0x801657c	// 801657c <_etoa.part.0+0x468>
      buf[len++] = '0';
 8016b1a:	6e47      	mov      	r9, r1
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016b1c:	eb410020 	cmpnei      	r1, 32
 8016b20:	0c10      	bf      	0x8016b40	// 8016b40 <_etoa.part.0+0xa2c>
 8016b22:	3301      	movi      	r3, 1
 8016b24:	e800fd59 	br      	0x80165d6	// 80165d6 <_etoa.part.0+0x4c2>
    else if (flags & FLAGS_SPACE) {
 8016b28:	9847      	ld.w      	r2, (r14, 0x1c)
 8016b2a:	e4422008 	andi      	r2, r2, 8
 8016b2e:	e9020007 	bez      	r2, 0x8016b3c	// 8016b3c <_etoa.part.0+0xa28>
      buf[len++] = ' ';
 8016b32:	3220      	movi      	r2, 32
 8016b34:	5982      	addi      	r4, r1, 1
 8016b36:	d4310022 	str.b      	r2, (r17, r1 << 0)
 8016b3a:	0708      	br      	0x801694a	// 801694a <_etoa.part.0+0x836>
    else if (flags & FLAGS_SPACE) {
 8016b3c:	6d07      	mov      	r4, r1
 8016b3e:	0706      	br      	0x801694a	// 801694a <_etoa.part.0+0x836>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016b40:	6d07      	mov      	r4, r1
 8016b42:	6f2f      	mov      	r12, r11
 8016b44:	0716      	br      	0x8016970	// 8016970 <_etoa.part.0+0x85c>
 8016b46:	1048      	lrw      	r2, 0x805382c	// 8016b64 <_etoa.part.0+0xa50>
 8016b48:	c4684823 	lsli      	r3, r8, 3
 8016b4c:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8016b4e:	6f23      	mov      	r12, r8
 8016b50:	9340      	ld.w      	r2, (r3, 0x0)
 8016b52:	9361      	ld.w      	r3, (r3, 0x4)
 8016b54:	b84b      	st.w      	r2, (r14, 0x2c)
 8016b56:	b86d      	st.w      	r3, (r14, 0x34)
 8016b58:	ea0d0000 	movi      	r13, 0
 8016b5c:	e62e0053 	addi      	r17, r14, 84
 8016b60:	e800fc9a 	br      	0x8016494	// 8016494 <_etoa.part.0+0x380>
 8016b64:	0805382c 	.long	0x0805382c

08016b68 <_ftoa>:
{
 8016b68:	ebe00058 	push      	r4-r11, r15, r16-r17
 8016b6c:	1434      	subi      	r14, r14, 80
 8016b6e:	98df      	ld.w      	r6, (r14, 0x7c)
 8016b70:	99e0      	ld.w      	r7, (r14, 0x80)
 8016b72:	6e8f      	mov      	r10, r3
 8016b74:	9961      	ld.w      	r3, (r14, 0x84)
 8016b76:	6d03      	mov      	r4, r0
 8016b78:	6d47      	mov      	r5, r1
 8016b7a:	c4024830 	lsli      	r16, r2, 0
 8016b7e:	6e4f      	mov      	r9, r3
  if (value != value)
 8016b80:	6c9b      	mov      	r2, r6
 8016b82:	6cdf      	mov      	r3, r7
 8016b84:	6c1b      	mov      	r0, r6
 8016b86:	6c5f      	mov      	r1, r7
{
 8016b88:	d96e2022 	ld.w      	r11, (r14, 0x88)
 8016b8c:	da2e2023 	ld.w      	r17, (r14, 0x8c)
  if (value != value)
 8016b90:	e3ffd3f8 	bsr      	0x8011380	// 8011380 <__nedf2>
 8016b94:	e9200111 	bnez      	r0, 0x8016db6	// 8016db6 <_ftoa+0x24e>
  if (value < -DBL_MAX)
 8016b98:	3200      	movi      	r2, 0
 8016b9a:	ea23fff0 	movih      	r3, 65520
 8016b9e:	6c5f      	mov      	r1, r7
 8016ba0:	2a00      	subi      	r2, 1
 8016ba2:	2b00      	subi      	r3, 1
 8016ba4:	6c1b      	mov      	r0, r6
 8016ba6:	e3ffd449 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016baa:	e9800191 	blz      	r0, 0x8016ecc	// 8016ecc <_ftoa+0x364>
  if (value > DBL_MAX)
 8016bae:	3200      	movi      	r2, 0
 8016bb0:	ea237ff0 	movih      	r3, 32752
 8016bb4:	2a00      	subi      	r2, 1
 8016bb6:	2b00      	subi      	r3, 1
 8016bb8:	6c1b      	mov      	r0, r6
 8016bba:	9920      	ld.w      	r1, (r14, 0x80)
 8016bbc:	e3ffd3fe 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8016bc0:	e94000d3 	bhz      	r0, 0x8016d66	// 8016d66 <_ftoa+0x1fe>
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8016bc4:	3200      	movi      	r2, 0
 8016bc6:	026d      	lrw      	r3, 0x41cdcd65	// 8016e8c <_ftoa+0x324>
 8016bc8:	6c1b      	mov      	r0, r6
 8016bca:	9920      	ld.w      	r1, (r14, 0x80)
 8016bcc:	e3ffd3f6 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8016bd0:	e940016a 	bhz      	r0, 0x8016ea4	// 8016ea4 <_ftoa+0x33c>
 8016bd4:	3200      	movi      	r2, 0
 8016bd6:	0270      	lrw      	r3, 0xc1cdcd65	// 8016e90 <_ftoa+0x328>
 8016bd8:	6c1b      	mov      	r0, r6
 8016bda:	9920      	ld.w      	r1, (r14, 0x80)
 8016bdc:	e3ffd42e 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016be0:	e9800162 	blz      	r0, 0x8016ea4	// 8016ea4 <_ftoa+0x33c>
  if (value < 0) {
 8016be4:	3200      	movi      	r2, 0
 8016be6:	6ccb      	mov      	r3, r2
 8016be8:	6c1b      	mov      	r0, r6
 8016bea:	9920      	ld.w      	r1, (r14, 0x80)
 8016bec:	e3ffd426 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016bf0:	e9800290 	blz      	r0, 0x8017110	// 8017110 <_ftoa+0x5a8>
  bool negative = false;
 8016bf4:	3300      	movi      	r3, 0
 8016bf6:	b86b      	st.w      	r3, (r14, 0x2c)
  if (!(flags & FLAGS_PRECISION)) {
 8016bf8:	e6712400 	andi      	r19, r17, 1024
 8016bfc:	e933022b 	bnez      	r19, 0x8017052	// 8017052 <_ftoa+0x4ea>
 8016c00:	027a      	lrw      	r3, 0x412e8480	// 8016e94 <_ftoa+0x32c>
 8016c02:	de6e2005 	st.w      	r19, (r14, 0x14)
 8016c06:	b866      	st.w      	r3, (r14, 0x18)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8016c08:	ea080006 	movi      	r8, 6
  int whole = (int)value;
 8016c0c:	6c5f      	mov      	r1, r7
 8016c0e:	6c1b      	mov      	r0, r6
 8016c10:	de6e200a 	st.w      	r19, (r14, 0x28)
 8016c14:	e3ffd462 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 8016c18:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 8016c1a:	e3ffd42b 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8016c1e:	6c83      	mov      	r2, r0
 8016c20:	6cc7      	mov      	r3, r1
 8016c22:	6c1b      	mov      	r0, r6
 8016c24:	6c5f      	mov      	r1, r7
 8016c26:	e3ffd203 	bsr      	0x801102c	// 801102c <__subdf3>
 8016c2a:	da4e2005 	ld.w      	r18, (r14, 0x14)
 8016c2e:	da6e2006 	ld.w      	r19, (r14, 0x18)
 8016c32:	c4124822 	lsli      	r2, r18, 0
 8016c36:	9866      	ld.w      	r3, (r14, 0x18)
 8016c38:	e3ffd218 	bsr      	0x8011068	// 8011068 <__muldf3>
 8016c3c:	6f03      	mov      	r12, r0
 8016c3e:	6f47      	mov      	r13, r1
  unsigned long frac = (unsigned long)tmp;
 8016c40:	dd8e2007 	st.w      	r12, (r14, 0x1c)
 8016c44:	ddae2008 	st.w      	r13, (r14, 0x20)
 8016c48:	e3ffcd1a 	bsr      	0x801067c	// 801067c <__fixunsdfsi>
 8016c4c:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 8016c4e:	e3ffd4af 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 8016c52:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8016c56:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8016c5a:	6c83      	mov      	r2, r0
 8016c5c:	6cc7      	mov      	r3, r1
 8016c5e:	6c33      	mov      	r0, r12
 8016c60:	6c77      	mov      	r1, r13
 8016c62:	e3ffd1e5 	bsr      	0x801102c	// 801102c <__subdf3>
  if (diff > 0.5) {
 8016c66:	3200      	movi      	r2, 0
 8016c68:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 8016c6c:	b807      	st.w      	r0, (r14, 0x1c)
 8016c6e:	b828      	st.w      	r1, (r14, 0x20)
  if (diff > 0.5) {
 8016c70:	e3ffd3a4 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8016c74:	da8e2009 	ld.w      	r20, (r14, 0x24)
 8016c78:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8016c7c:	e96001cd 	blsz      	r0, 0x8017016	// 8017016 <_ftoa+0x4ae>
    ++frac;
 8016c80:	e6940000 	addi      	r20, r20, 1
    if (frac >= pow10[prec]) {
 8016c84:	c4144820 	lsli      	r0, r20, 0
 8016c88:	de8e2007 	st.w      	r20, (r14, 0x1c)
 8016c8c:	de6e2009 	st.w      	r19, (r14, 0x24)
 8016c90:	e3ffd48e 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 8016c94:	da4e2005 	ld.w      	r18, (r14, 0x14)
 8016c98:	da6e2006 	ld.w      	r19, (r14, 0x18)
 8016c9c:	c4134823 	lsli      	r3, r19, 0
 8016ca0:	c4124822 	lsli      	r2, r18, 0
 8016ca4:	e3ffd3aa 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 8016ca8:	da8e2007 	ld.w      	r20, (r14, 0x1c)
 8016cac:	da6e2009 	ld.w      	r19, (r14, 0x24)
 8016cb0:	e9a0020a 	bhsz      	r0, 0x80170c4	// 80170c4 <_ftoa+0x55c>
  if (prec == 0U) {
 8016cb4:	e9280148 	bnez      	r8, 0x8016f44	// 8016f44 <_ftoa+0x3dc>
    diff = value - (double)whole;
 8016cb8:	6c27      	mov      	r0, r9
 8016cba:	de6e2005 	st.w      	r19, (r14, 0x14)
 8016cbe:	e3ffd3d9 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8016cc2:	6c83      	mov      	r2, r0
 8016cc4:	6cc7      	mov      	r3, r1
 8016cc6:	6c1b      	mov      	r0, r6
 8016cc8:	6c5f      	mov      	r1, r7
 8016cca:	e3ffd1b1 	bsr      	0x801102c	// 801102c <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8016cce:	6ca3      	mov      	r2, r8
 8016cd0:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 8016cd4:	6d83      	mov      	r6, r0
 8016cd6:	6dc7      	mov      	r7, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8016cd8:	e3ffd3b0 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8016cdc:	da6e2005 	ld.w      	r19, (r14, 0x14)
 8016ce0:	e98001e6 	blz      	r0, 0x80170ac	// 80170ac <_ftoa+0x544>
 8016ce4:	e4692001 	andi      	r3, r9, 1
      ++whole;
 8016ce8:	3b40      	cmpnei      	r3, 0
 8016cea:	c4690c20 	incf      	r3, r9, 0
 8016cee:	c4690c41 	inct      	r3, r9, 1
 8016cf2:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016cf4:	eb530020 	cmpnei      	r19, 32
 8016cf8:	0d51      	bf      	0x8016f9a	// 8016f9a <_ftoa+0x432>
    buf[len++] = (char)(48 + (whole % 10));
 8016cfa:	300a      	movi      	r0, 10
 8016cfc:	c4098043 	divs      	r3, r9, r0
 8016d00:	c403842c 	mult      	r12, r3, r0
 8016d04:	190c      	addi      	r1, r14, 48
 8016d06:	c589008c 	subu      	r12, r9, r12
 8016d0a:	e58c002f 	addi      	r12, r12, 48
 8016d0e:	e4530000 	addi      	r2, r19, 1
 8016d12:	d661002c 	str.b      	r12, (r1, r19 << 0)
    if (!(whole /= 10)) {
 8016d16:	e9030013 	bez      	r3, 0x8016d3c	// 8016d3c <_ftoa+0x1d4>
 8016d1a:	c4410028 	addu      	r8, r1, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016d1e:	eb420020 	cmpnei      	r2, 32
 8016d22:	0d3c      	bf      	0x8016f9a	// 8016f9a <_ftoa+0x432>
    buf[len++] = (char)(48 + (whole % 10));
 8016d24:	c4038041 	divs      	r1, r3, r0
 8016d28:	c401842c 	mult      	r12, r1, r0
 8016d2c:	60f2      	subu      	r3, r12
 8016d2e:	232f      	addi      	r3, 48
 8016d30:	d4088003 	stbi.b      	r3, (r8)
 8016d34:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 8016d36:	6cc7      	mov      	r3, r1
 8016d38:	e921fff3 	bnez      	r1, 0x8016d1e	// 8016d1e <_ftoa+0x1b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8016d3c:	e4712003 	andi      	r3, r17, 3
 8016d40:	3b41      	cmpnei      	r3, 1
 8016d42:	0dc9      	bf      	0x80170d4	// 80170d4 <_ftoa+0x56c>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016d44:	eb420020 	cmpnei      	r2, 32
 8016d48:	e8400227 	bf      	0x8017196	// 8017196 <_ftoa+0x62e>
    if (negative) {
 8016d4c:	982b      	ld.w      	r1, (r14, 0x2c)
 8016d4e:	e92101a9 	bnez      	r1, 0x80170a0	// 80170a0 <_ftoa+0x538>
    else if (flags & FLAGS_PLUS) {
 8016d52:	e4312004 	andi      	r1, r17, 4
 8016d56:	e9010209 	bez      	r1, 0x8017168	// 8017168 <_ftoa+0x600>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8016d5a:	190c      	addi      	r1, r14, 48
 8016d5c:	302b      	movi      	r0, 43
 8016d5e:	5ac2      	addi      	r6, r2, 1
 8016d60:	d4410020 	str.b      	r0, (r1, r2 << 0)
 8016d64:	0520      	br      	0x8016fa4	// 8016fa4 <_ftoa+0x43c>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8016d66:	e4712004 	andi      	r3, r17, 4
 8016d6a:	3b40      	cmpnei      	r3, 0
 8016d6c:	124b      	lrw      	r2, 0x805381c	// 8016e98 <_ftoa+0x330>
 8016d6e:	12ec      	lrw      	r7, 0x8053814	// 8016e9c <_ftoa+0x334>
 8016d70:	c4e20c20 	incf      	r7, r2, 0
 8016d74:	3604      	movi      	r6, 4
 8016d76:	3b40      	cmpnei      	r3, 0
 8016d78:	3303      	movi      	r3, 3
 8016d7a:	c4660c40 	inct      	r3, r6, 0
 8016d7e:	6e0f      	mov      	r8, r3
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8016d80:	e4712003 	andi      	r3, r17, 3
 8016d84:	e923002f 	bnez      	r3, 0x8016de2	// 8016de2 <_ftoa+0x27a>
    for (size_t i = len; i < width; i++) {
 8016d88:	66e0      	cmphs      	r8, r11
 8016d8a:	082c      	bt      	0x8016de2	// 8016de2 <_ftoa+0x27a>
 8016d8c:	c4104822 	lsli      	r2, r16, 0
 8016d90:	c6080086 	subu      	r6, r8, r16
      out(' ', buffer, idx++, maxlen);
 8016d94:	e5220000 	addi      	r9, r2, 1
 8016d98:	6ceb      	mov      	r3, r10
 8016d9a:	6c57      	mov      	r1, r5
 8016d9c:	3020      	movi      	r0, 32
 8016d9e:	7bd1      	jsr      	r4
 8016da0:	6ca7      	mov      	r2, r9
    for (size_t i = len; i < width; i++) {
 8016da2:	5e68      	addu      	r3, r6, r2
 8016da4:	66cc      	cmphs      	r3, r11
 8016da6:	0ff7      	bf      	0x8016d94	// 8016d94 <_ftoa+0x22c>
 8016da8:	c5700026 	addu      	r6, r16, r11
 8016dac:	c5060083 	subu      	r3, r6, r8
 8016db0:	b865      	st.w      	r3, (r14, 0x14)
 8016db2:	6c8f      	mov      	r2, r3
 8016db4:	041b      	br      	0x8016dea	// 8016dea <_ftoa+0x282>
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8016db6:	e4712003 	andi      	r3, r17, 3
 8016dba:	e9230040 	bnez      	r3, 0x8016e3a	// 8016e3a <_ftoa+0x2d2>
    for (size_t i = len; i < width; i++) {
 8016dbe:	3303      	movi      	r3, 3
 8016dc0:	66cc      	cmphs      	r3, r11
 8016dc2:	083c      	bt      	0x8016e3a	// 8016e3a <_ftoa+0x2d2>
 8016dc4:	e4cb1002 	subi      	r6, r11, 3
 8016dc8:	c6060026 	addu      	r6, r6, r16
 8016dcc:	c4104822 	lsli      	r2, r16, 0
      out(' ', buffer, idx++, maxlen);
 8016dd0:	5ae2      	addi      	r7, r2, 1
 8016dd2:	6ceb      	mov      	r3, r10
 8016dd4:	6c57      	mov      	r1, r5
 8016dd6:	3020      	movi      	r0, 32
 8016dd8:	7bd1      	jsr      	r4
    for (size_t i = len; i < width; i++) {
 8016dda:	659e      	cmpne      	r7, r6
 8016ddc:	6c9f      	mov      	r2, r7
 8016dde:	0bf9      	bt      	0x8016dd0	// 8016dd0 <_ftoa+0x268>
 8016de0:	042f      	br      	0x8016e3e	// 8016e3e <_ftoa+0x2d6>
 8016de2:	de0e2005 	st.w      	r16, (r14, 0x14)
 8016de6:	c4104822 	lsli      	r2, r16, 0
 8016dea:	e4681000 	subi      	r3, r8, 1
 8016dee:	61cc      	addu      	r7, r3
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8016df0:	6e63      	mov      	r9, r8
    out(buf[--len], buffer, idx++, maxlen);
 8016df2:	5ac2      	addi      	r6, r2, 1
 8016df4:	8700      	ld.b      	r0, (r7, 0x0)
 8016df6:	6ceb      	mov      	r3, r10
 8016df8:	6c57      	mov      	r1, r5
 8016dfa:	e5291000 	subi      	r9, r9, 1
 8016dfe:	7bd1      	jsr      	r4
 8016e00:	2f00      	subi      	r7, 1
 8016e02:	6c9b      	mov      	r2, r6
  while (len) {
 8016e04:	e929fff7 	bnez      	r9, 0x8016df2	// 8016df2 <_ftoa+0x28a>
  if (flags & FLAGS_LEFT) {
 8016e08:	e6312002 	andi      	r17, r17, 2
 8016e0c:	98c5      	ld.w      	r6, (r14, 0x14)
 8016e0e:	61a0      	addu      	r6, r8
 8016e10:	e9110011 	bez      	r17, 0x8016e32	// 8016e32 <_ftoa+0x2ca>
    while (idx - start_idx < width) {
 8016e14:	c6060083 	subu      	r3, r6, r16
 8016e18:	66cc      	cmphs      	r3, r11
 8016e1a:	080c      	bt      	0x8016e32	// 8016e32 <_ftoa+0x2ca>
 8016e1c:	6c9b      	mov      	r2, r6
      out(' ', buffer, idx++, maxlen);
 8016e1e:	2600      	addi      	r6, 1
 8016e20:	6ceb      	mov      	r3, r10
 8016e22:	6c57      	mov      	r1, r5
 8016e24:	3020      	movi      	r0, 32
 8016e26:	7bd1      	jsr      	r4
    while (idx - start_idx < width) {
 8016e28:	c6060083 	subu      	r3, r6, r16
 8016e2c:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8016e2e:	6c9b      	mov      	r2, r6
    while (idx - start_idx < width) {
 8016e30:	0ff7      	bf      	0x8016e1e	// 8016e1e <_ftoa+0x2b6>
}
 8016e32:	6c1b      	mov      	r0, r6
 8016e34:	1414      	addi      	r14, r14, 80
 8016e36:	ebc00058 	pop      	r4-r11, r15, r16-r17
    for (size_t i = len; i < width; i++) {
 8016e3a:	c4104827 	lsli      	r7, r16, 0
 8016e3e:	ea880019 	lrw      	r8, 0x8053822	// 8016ea0 <_ftoa+0x338>
 8016e42:	e5270002 	addi      	r9, r7, 3
    out(buf[--len], buffer, idx++, maxlen);
 8016e46:	5fc2      	addi      	r6, r7, 1
 8016e48:	6c9f      	mov      	r2, r7
 8016e4a:	d8080000 	ld.b      	r0, (r8, 0x0)
 8016e4e:	6ceb      	mov      	r3, r10
 8016e50:	6c57      	mov      	r1, r5
 8016e52:	7bd1      	jsr      	r4
  while (len) {
 8016e54:	665a      	cmpne      	r6, r9
 8016e56:	e5081000 	subi      	r8, r8, 1
 8016e5a:	6ddb      	mov      	r7, r6
 8016e5c:	0bf5      	bt      	0x8016e46	// 8016e46 <_ftoa+0x2de>
  if (flags & FLAGS_LEFT) {
 8016e5e:	e6312002 	andi      	r17, r17, 2
 8016e62:	e911ffe8 	bez      	r17, 0x8016e32	// 8016e32 <_ftoa+0x2ca>
    while (idx - start_idx < width) {
 8016e66:	c6060083 	subu      	r3, r6, r16
 8016e6a:	66cc      	cmphs      	r3, r11
 8016e6c:	0be3      	bt      	0x8016e32	// 8016e32 <_ftoa+0x2ca>
 8016e6e:	6c9b      	mov      	r2, r6
      out(' ', buffer, idx++, maxlen);
 8016e70:	2600      	addi      	r6, 1
 8016e72:	6ceb      	mov      	r3, r10
 8016e74:	6c57      	mov      	r1, r5
 8016e76:	3020      	movi      	r0, 32
 8016e78:	7bd1      	jsr      	r4
    while (idx - start_idx < width) {
 8016e7a:	c6060083 	subu      	r3, r6, r16
 8016e7e:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8016e80:	6c9b      	mov      	r2, r6
    while (idx - start_idx < width) {
 8016e82:	0ff7      	bf      	0x8016e70	// 8016e70 <_ftoa+0x308>
}
 8016e84:	6c1b      	mov      	r0, r6
 8016e86:	1414      	addi      	r14, r14, 80
 8016e88:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8016e8c:	41cdcd65 	.long	0x41cdcd65
 8016e90:	c1cdcd65 	.long	0xc1cdcd65
 8016e94:	412e8480 	.long	0x412e8480
 8016e98:	0805381c 	.long	0x0805381c
 8016e9c:	08053814 	.long	0x08053814
 8016ea0:	08053822 	.long	0x08053822
 8016ea4:	b8c0      	st.w      	r6, (r14, 0x0)
 8016ea6:	de2e2004 	st.w      	r17, (r14, 0x10)
 8016eaa:	dd6e2003 	st.w      	r11, (r14, 0xc)
 8016eae:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8016eb2:	b8e1      	st.w      	r7, (r14, 0x4)
 8016eb4:	6ceb      	mov      	r3, r10
 8016eb6:	c4104822 	lsli      	r2, r16, 0
 8016eba:	6c57      	mov      	r1, r5
 8016ebc:	6c13      	mov      	r0, r4
 8016ebe:	e3fff92b 	bsr      	0x8016114	// 8016114 <_etoa.part.0>
 8016ec2:	6d83      	mov      	r6, r0
 8016ec4:	6c1b      	mov      	r0, r6
 8016ec6:	1414      	addi      	r14, r14, 80
 8016ec8:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8016ecc:	e4712003 	andi      	r3, r17, 3
 8016ed0:	e9230037 	bnez      	r3, 0x8016f3e	// 8016f3e <_ftoa+0x3d6>
    for (size_t i = len; i < width; i++) {
 8016ed4:	3304      	movi      	r3, 4
 8016ed6:	66cc      	cmphs      	r3, r11
 8016ed8:	0833      	bt      	0x8016f3e	// 8016f3e <_ftoa+0x3d6>
 8016eda:	e4cb1003 	subi      	r6, r11, 4
 8016ede:	c6060026 	addu      	r6, r6, r16
 8016ee2:	c4104822 	lsli      	r2, r16, 0
      out(' ', buffer, idx++, maxlen);
 8016ee6:	5ae2      	addi      	r7, r2, 1
 8016ee8:	6ceb      	mov      	r3, r10
 8016eea:	6c57      	mov      	r1, r5
 8016eec:	3020      	movi      	r0, 32
 8016eee:	7bd1      	jsr      	r4
    for (size_t i = len; i < width; i++) {
 8016ef0:	659e      	cmpne      	r7, r6
 8016ef2:	6c9f      	mov      	r2, r7
 8016ef4:	0bf9      	bt      	0x8016ee6	// 8016ee6 <_ftoa+0x37e>
 8016ef6:	ea8800b0 	lrw      	r8, 0x8053827	// 80171b4 <_ftoa+0x64c>
 8016efa:	e5270003 	addi      	r9, r7, 4
    out(buf[--len], buffer, idx++, maxlen);
 8016efe:	5fc2      	addi      	r6, r7, 1
 8016f00:	6c9f      	mov      	r2, r7
 8016f02:	d8080000 	ld.b      	r0, (r8, 0x0)
 8016f06:	6ceb      	mov      	r3, r10
 8016f08:	6c57      	mov      	r1, r5
 8016f0a:	7bd1      	jsr      	r4
  while (len) {
 8016f0c:	665a      	cmpne      	r6, r9
 8016f0e:	e5081000 	subi      	r8, r8, 1
 8016f12:	6ddb      	mov      	r7, r6
 8016f14:	0bf5      	bt      	0x8016efe	// 8016efe <_ftoa+0x396>
  if (flags & FLAGS_LEFT) {
 8016f16:	e6312002 	andi      	r17, r17, 2
 8016f1a:	e911ff8c 	bez      	r17, 0x8016e32	// 8016e32 <_ftoa+0x2ca>
    while (idx - start_idx < width) {
 8016f1e:	c6060083 	subu      	r3, r6, r16
 8016f22:	66cc      	cmphs      	r3, r11
 8016f24:	0b87      	bt      	0x8016e32	// 8016e32 <_ftoa+0x2ca>
 8016f26:	6c9b      	mov      	r2, r6
      out(' ', buffer, idx++, maxlen);
 8016f28:	2600      	addi      	r6, 1
 8016f2a:	6ceb      	mov      	r3, r10
 8016f2c:	6c57      	mov      	r1, r5
 8016f2e:	3020      	movi      	r0, 32
 8016f30:	7bd1      	jsr      	r4
    while (idx - start_idx < width) {
 8016f32:	c6060083 	subu      	r3, r6, r16
 8016f36:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8016f38:	6c9b      	mov      	r2, r6
    while (idx - start_idx < width) {
 8016f3a:	0ff7      	bf      	0x8016f28	// 8016f28 <_ftoa+0x3c0>
 8016f3c:	077b      	br      	0x8016e32	// 8016e32 <_ftoa+0x2ca>
    for (size_t i = len; i < width; i++) {
 8016f3e:	c4104827 	lsli      	r7, r16, 0
 8016f42:	07da      	br      	0x8016ef6	// 8016ef6 <_ftoa+0x38e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016f44:	eb530020 	cmpnei      	r19, 32
 8016f48:	0c29      	bf      	0x8016f9a	// 8016f9a <_ftoa+0x432>
      buf[len++] = (char)(48U + (frac % 10U));
 8016f4a:	ea0c000a 	movi      	r12, 10
 8016f4e:	c5948023 	divu      	r3, r20, r12
 8016f52:	c5838420 	mult      	r0, r3, r12
 8016f56:	190c      	addi      	r1, r14, 48
 8016f58:	c4140094 	subu      	r20, r20, r0
 8016f5c:	e694002f 	addi      	r20, r20, 48
      --count;
 8016f60:	e6481000 	subi      	r18, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8016f64:	e4530000 	addi      	r2, r19, 1
 8016f68:	d6610034 	str.b      	r20, (r1, r19 << 0)
      if (!(frac /= 10U)) {
 8016f6c:	e90300de 	bez      	r3, 0x8017128	// 8017128 <_ftoa+0x5c0>
 8016f70:	c441002d 	addu      	r13, r1, r2
 8016f74:	0410      	br      	0x8016f94	// 8016f94 <_ftoa+0x42c>
      buf[len++] = (char)(48U + (frac % 10U));
 8016f76:	c5838020 	divu      	r0, r3, r12
 8016f7a:	c5808433 	mult      	r19, r0, r12
 8016f7e:	c6630083 	subu      	r3, r3, r19
 8016f82:	232f      	addi      	r3, 48
 8016f84:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 8016f88:	e6521000 	subi      	r18, r18, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8016f8c:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 8016f8e:	6cc3      	mov      	r3, r0
 8016f90:	e90000cc 	bez      	r0, 0x8017128	// 8017128 <_ftoa+0x5c0>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8016f94:	eb420020 	cmpnei      	r2, 32
 8016f98:	0bef      	bt      	0x8016f76	// 8016f76 <_ftoa+0x40e>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8016f9a:	e4712003 	andi      	r3, r17, 3
 8016f9e:	3b41      	cmpnei      	r3, 1
 8016fa0:	0c99      	bf      	0x80170d2	// 80170d2 <_ftoa+0x56a>
 8016fa2:	3620      	movi      	r6, 32
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8016fa4:	e923007b 	bnez      	r3, 0x801709a	// 801709a <_ftoa+0x532>
    for (size_t i = len; i < width; i++) {
 8016fa8:	66d8      	cmphs      	r6, r11
 8016faa:	08ee      	bt      	0x8017186	// 8017186 <_ftoa+0x61e>
 8016fac:	c5700028 	addu      	r8, r16, r11
 8016fb0:	621a      	subu      	r8, r6
 8016fb2:	c4104822 	lsli      	r2, r16, 0
      out(' ', buffer, idx++, maxlen);
 8016fb6:	5ae2      	addi      	r7, r2, 1
 8016fb8:	6ceb      	mov      	r3, r10
 8016fba:	6c57      	mov      	r1, r5
 8016fbc:	3020      	movi      	r0, 32
 8016fbe:	7bd1      	jsr      	r4
    for (size_t i = len; i < width; i++) {
 8016fc0:	661e      	cmpne      	r7, r8
 8016fc2:	6c9f      	mov      	r2, r7
 8016fc4:	0bf9      	bt      	0x8016fb6	// 8016fb6 <_ftoa+0x44e>
  while (len) {
 8016fc6:	e90600db 	bez      	r6, 0x801717c	// 801717c <_ftoa+0x614>
 8016fca:	190c      	addi      	r1, r14, 48
 8016fcc:	e5061000 	subi      	r8, r6, 1
 8016fd0:	6204      	addu      	r8, r1
 8016fd2:	619c      	addu      	r6, r7
    out(buf[--len], buffer, idx++, maxlen);
 8016fd4:	e5270000 	addi      	r9, r7, 1
 8016fd8:	6c9f      	mov      	r2, r7
 8016fda:	d8080000 	ld.b      	r0, (r8, 0x0)
 8016fde:	6ceb      	mov      	r3, r10
 8016fe0:	6c57      	mov      	r1, r5
 8016fe2:	7bd1      	jsr      	r4
  while (len) {
 8016fe4:	65a6      	cmpne      	r9, r6
 8016fe6:	e5081000 	subi      	r8, r8, 1
 8016fea:	6de7      	mov      	r7, r9
 8016fec:	0bf4      	bt      	0x8016fd4	// 8016fd4 <_ftoa+0x46c>
  if (flags & FLAGS_LEFT) {
 8016fee:	e6312002 	andi      	r17, r17, 2
 8016ff2:	e911ff20 	bez      	r17, 0x8016e32	// 8016e32 <_ftoa+0x2ca>
    while (idx - start_idx < width) {
 8016ff6:	c6060083 	subu      	r3, r6, r16
 8016ffa:	66cc      	cmphs      	r3, r11
 8016ffc:	0b1b      	bt      	0x8016e32	// 8016e32 <_ftoa+0x2ca>
 8016ffe:	6c9b      	mov      	r2, r6
      out(' ', buffer, idx++, maxlen);
 8017000:	2600      	addi      	r6, 1
 8017002:	6ceb      	mov      	r3, r10
 8017004:	6c57      	mov      	r1, r5
 8017006:	3020      	movi      	r0, 32
 8017008:	7bd1      	jsr      	r4
    while (idx - start_idx < width) {
 801700a:	c6060083 	subu      	r3, r6, r16
 801700e:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8017010:	6c9b      	mov      	r2, r6
    while (idx - start_idx < width) {
 8017012:	0ff7      	bf      	0x8017000	// 8017000 <_ftoa+0x498>
 8017014:	070f      	br      	0x8016e32	// 8016e32 <_ftoa+0x2ca>
  else if (diff < 0.5) {
 8017016:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 801701a:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 801701e:	3200      	movi      	r2, 0
 8017020:	ea233fe0 	movih      	r3, 16352
 8017024:	6c33      	mov      	r0, r12
 8017026:	6c77      	mov      	r1, r13
 8017028:	de8e2009 	st.w      	r20, (r14, 0x24)
 801702c:	de6e2005 	st.w      	r19, (r14, 0x14)
 8017030:	e3ffd204 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8017034:	da6e2005 	ld.w      	r19, (r14, 0x14)
 8017038:	da8e2009 	ld.w      	r20, (r14, 0x24)
 801703c:	e980fe3c 	blz      	r0, 0x8016cb4	// 8016cb4 <_ftoa+0x14c>
  else if ((frac == 0U) || (frac & 1U)) {
 8017040:	e9140006 	bez      	r20, 0x801704c	// 801704c <_ftoa+0x4e4>
 8017044:	e4742001 	andi      	r3, r20, 1
 8017048:	e903fe36 	bez      	r3, 0x8016cb4	// 8016cb4 <_ftoa+0x14c>
    ++frac;
 801704c:	e6940000 	addi      	r20, r20, 1
 8017050:	0632      	br      	0x8016cb4	// 8016cb4 <_ftoa+0x14c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8017052:	6ce7      	mov      	r3, r9
 8017054:	3b09      	cmphsi      	r3, 10
 8017056:	0ca2      	bf      	0x801719a	// 801719a <_ftoa+0x632>
    buf[len++] = '0';
 8017058:	3030      	movi      	r0, 48
 801705a:	dc0e0030 	st.b      	r0, (r14, 0x30)
    prec--;
 801705e:	e5091000 	subi      	r8, r9, 1
 8017062:	e44e0030 	addi      	r2, r14, 49
 8017066:	e4291008 	subi      	r1, r9, 9
 801706a:	ea130001 	movi      	r19, 1
    buf[len++] = '0';
 801706e:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8017070:	c6610480 	cmpne      	r1, r19
 8017074:	0c09      	bf      	0x8017086	// 8017086 <_ftoa+0x51e>
    buf[len++] = '0';
 8017076:	e6730000 	addi      	r19, r19, 1
 801707a:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 801707e:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8017082:	e823fff7 	bnezad      	r3, 0x8017070	// 8017070 <_ftoa+0x508>
 8017086:	124d      	lrw      	r2, 0x805382c	// 80171b8 <_ftoa+0x650>
 8017088:	c4684823 	lsli      	r3, r8, 3
 801708c:	60c8      	addu      	r3, r2
 801708e:	9340      	ld.w      	r2, (r3, 0x0)
 8017090:	9361      	ld.w      	r3, (r3, 0x4)
 8017092:	b845      	st.w      	r2, (r14, 0x14)
 8017094:	b866      	st.w      	r3, (r14, 0x18)
 8017096:	e800fdbb 	br      	0x8016c0c	// 8016c0c <_ftoa+0xa4>
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 801709a:	c4104827 	lsli      	r7, r16, 0
 801709e:	0796      	br      	0x8016fca	// 8016fca <_ftoa+0x462>
      buf[len++] = '-';
 80170a0:	190c      	addi      	r1, r14, 48
 80170a2:	302d      	movi      	r0, 45
 80170a4:	5ac2      	addi      	r6, r2, 1
 80170a6:	d4410020 	str.b      	r0, (r1, r2 << 0)
 80170aa:	077d      	br      	0x8016fa4	// 8016fa4 <_ftoa+0x43c>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 80170ac:	6ca3      	mov      	r2, r8
 80170ae:	ea233fe0 	movih      	r3, 16352
 80170b2:	6c1b      	mov      	r0, r6
 80170b4:	6c5f      	mov      	r1, r7
 80170b6:	e3ffd181 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 80170ba:	da6e2005 	ld.w      	r19, (r14, 0x14)
 80170be:	e960fe1b 	blsz      	r0, 0x8016cf4	// 8016cf4 <_ftoa+0x18c>
 80170c2:	0611      	br      	0x8016ce4	// 8016ce4 <_ftoa+0x17c>
      ++whole;
 80170c4:	6ce7      	mov      	r3, r9
 80170c6:	2300      	addi      	r3, 1
 80170c8:	6e4f      	mov      	r9, r3
      frac = 0;
 80170ca:	ea140000 	movi      	r20, 0
 80170ce:	e800fdf3 	br      	0x8016cb4	// 8016cb4 <_ftoa+0x14c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80170d2:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80170d4:	e90b0044 	bez      	r11, 0x801715c	// 801715c <_ftoa+0x5f4>
 80170d8:	986b      	ld.w      	r3, (r14, 0x2c)
 80170da:	e9230006 	bnez      	r3, 0x80170e6	// 80170e6 <_ftoa+0x57e>
 80170de:	e471200c 	andi      	r3, r17, 12
 80170e2:	e9030004 	bez      	r3, 0x80170ea	// 80170ea <_ftoa+0x582>
      width--;
 80170e6:	e56b1000 	subi      	r11, r11, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80170ea:	66c8      	cmphs      	r2, r11
 80170ec:	0838      	bt      	0x801715c	// 801715c <_ftoa+0x5f4>
 80170ee:	3a1f      	cmphsi      	r2, 32
 80170f0:	084e      	bt      	0x801718c	// 801718c <_ftoa+0x624>
 80170f2:	190c      	addi      	r1, r14, 48
 80170f4:	5968      	addu      	r3, r1, r2
 80170f6:	6d8b      	mov      	r6, r2
      buf[len++] = '0';
 80170f8:	3230      	movi      	r2, 48
 80170fa:	2600      	addi      	r6, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80170fc:	66da      	cmpne      	r6, r11
      buf[len++] = '0';
 80170fe:	a340      	st.b      	r2, (r3, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8017100:	0c2d      	bf      	0x801715a	// 801715a <_ftoa+0x5f2>
 8017102:	eb460020 	cmpnei      	r6, 32
 8017106:	2300      	addi      	r3, 1
 8017108:	0bf9      	bt      	0x80170fa	// 80170fa <_ftoa+0x592>
 801710a:	c4104827 	lsli      	r7, r16, 0
 801710e:	075f      	br      	0x8016fcc	// 8016fcc <_ftoa+0x464>
    value = 0 - value;
 8017110:	6c9b      	mov      	r2, r6
 8017112:	9960      	ld.w      	r3, (r14, 0x80)
 8017114:	3000      	movi      	r0, 0
 8017116:	3100      	movi      	r1, 0
 8017118:	e3ffcf8a 	bsr      	0x801102c	// 801102c <__subdf3>
    negative = true;
 801711c:	3301      	movi      	r3, 1
    value = 0 - value;
 801711e:	6d83      	mov      	r6, r0
 8017120:	6dc7      	mov      	r7, r1
    negative = true;
 8017122:	b86b      	st.w      	r3, (r14, 0x2c)
 8017124:	e800fd6a 	br      	0x8016bf8	// 8016bf8 <_ftoa+0x90>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8017128:	eb420020 	cmpnei      	r2, 32
 801712c:	0f37      	bf      	0x8016f9a	// 8016f9a <_ftoa+0x432>
 801712e:	e912000f 	bez      	r18, 0x801714c	// 801714c <_ftoa+0x5e4>
 8017132:	5968      	addu      	r3, r1, r2
 8017134:	c4520032 	addu      	r18, r18, r2
      buf[len++] = '0';
 8017138:	3030      	movi      	r0, 48
 801713a:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801713c:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 8017140:	a300      	st.b      	r0, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8017142:	0f2c      	bf      	0x8016f9a	// 8016f9a <_ftoa+0x432>
 8017144:	c6420480 	cmpne      	r2, r18
 8017148:	2300      	addi      	r3, 1
 801714a:	0bf8      	bt      	0x801713a	// 801713a <_ftoa+0x5d2>
      buf[len++] = '.';
 801714c:	332e      	movi      	r3, 46
 801714e:	e6620000 	addi      	r19, r2, 1
 8017152:	d4410023 	str.b      	r3, (r1, r2 << 0)
 8017156:	e800fdcf 	br      	0x8016cf4	// 8016cf4 <_ftoa+0x18c>
      buf[len++] = '0';
 801715a:	6caf      	mov      	r2, r11
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 801715c:	331f      	movi      	r3, 31
 801715e:	648c      	cmphs      	r3, r2
 8017160:	0c16      	bf      	0x801718c	// 801718c <_ftoa+0x624>
 8017162:	3301      	movi      	r3, 1
 8017164:	e800fdf4 	br      	0x8016d4c	// 8016d4c <_ftoa+0x1e4>
    else if (flags & FLAGS_SPACE) {
 8017168:	e4312008 	andi      	r1, r17, 8
 801716c:	e901000a 	bez      	r1, 0x8017180	// 8017180 <_ftoa+0x618>
      buf[len++] = ' ';
 8017170:	190c      	addi      	r1, r14, 48
 8017172:	3020      	movi      	r0, 32
 8017174:	5ac2      	addi      	r6, r2, 1
 8017176:	d4410020 	str.b      	r0, (r1, r2 << 0)
 801717a:	0715      	br      	0x8016fa4	// 8016fa4 <_ftoa+0x43c>
  while (len) {
 801717c:	6d9f      	mov      	r6, r7
 801717e:	0738      	br      	0x8016fee	// 8016fee <_ftoa+0x486>
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8017180:	6d8b      	mov      	r6, r2
 8017182:	e903ff13 	bez      	r3, 0x8016fa8	// 8016fa8 <_ftoa+0x440>
 8017186:	c4104827 	lsli      	r7, r16, 0
 801718a:	071e      	br      	0x8016fc6	// 8016fc6 <_ftoa+0x45e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801718c:	6d8b      	mov      	r6, r2
 801718e:	c4104827 	lsli      	r7, r16, 0
 8017192:	190c      	addi      	r1, r14, 48
 8017194:	071c      	br      	0x8016fcc	// 8016fcc <_ftoa+0x464>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8017196:	6d8b      	mov      	r6, r2
 8017198:	0706      	br      	0x8016fa4	// 8016fa4 <_ftoa+0x43c>
 801719a:	1048      	lrw      	r2, 0x805382c	// 80171b8 <_ftoa+0x650>
 801719c:	4363      	lsli      	r3, r3, 3
 801719e:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80171a0:	6e27      	mov      	r8, r9
 80171a2:	9340      	ld.w      	r2, (r3, 0x0)
 80171a4:	9361      	ld.w      	r3, (r3, 0x4)
 80171a6:	b845      	st.w      	r2, (r14, 0x14)
 80171a8:	b866      	st.w      	r3, (r14, 0x18)
 80171aa:	ea130000 	movi      	r19, 0
 80171ae:	e800fd2f 	br      	0x8016c0c	// 8016c0c <_ftoa+0xa4>
 80171b2:	0000      	.short	0x0000
 80171b4:	08053827 	.long	0x08053827
 80171b8:	0805382c 	.long	0x0805382c

080171bc <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 80171bc:	ebe00058 	push      	r4-r11, r15, r16-r17
 80171c0:	1439      	subi      	r14, r14, 100
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 80171c2:	3940      	cmpnei      	r1, 0
 80171c4:	10ba      	lrw      	r5, 0x8015f04	// 801722c <_vsnprintf+0x70>
{
 80171c6:	6d87      	mov      	r6, r1
 80171c8:	6dcb      	mov      	r7, r2
 80171ca:	6d0f      	mov      	r4, r3
 80171cc:	d96e2024 	ld.w      	r11, (r14, 0x90)
    out = _out_null;
 80171d0:	c4a00c40 	inct      	r5, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 80171d4:	ea110000 	movi      	r17, 0
      switch (*format) {
 80171d8:	ea880016 	lrw      	r8, 0x8053634	// 8017230 <_vsnprintf+0x74>
 80171dc:	e54e003b 	addi      	r10, r14, 60
  while (*format)
 80171e0:	8400      	ld.b      	r0, (r4, 0x0)
 80171e2:	e9000012 	bez      	r0, 0x8017206	// 8017206 <_vsnprintf+0x4a>
    if (*format != '%') {
 80171e6:	eb400025 	cmpnei      	r0, 37
 80171ea:	0c13      	bf      	0x8017210	// 8017210 <_vsnprintf+0x54>
      format++;
 80171ec:	2400      	addi      	r4, 1
      out(*format, buffer, idx++, maxlen);
 80171ee:	c4114822 	lsli      	r2, r17, 0
 80171f2:	6cdf      	mov      	r3, r7
 80171f4:	6c5b      	mov      	r1, r6
 80171f6:	7bd5      	jsr      	r5
  while (*format)
 80171f8:	8400      	ld.b      	r0, (r4, 0x0)
      out(*format, buffer, idx++, maxlen);
 80171fa:	e5310000 	addi      	r9, r17, 1
 80171fe:	c4094831 	lsli      	r17, r9, 0
  while (*format)
 8017202:	e920fff2 	bnez      	r0, 0x80171e6	// 80171e6 <_vsnprintf+0x2a>
        break;
    }
  }
  // return written chars without terminating \0
  return (int)idx;
}
 8017206:	c4114820 	lsli      	r0, r17, 0
 801720a:	1419      	addi      	r14, r14, 100
 801720c:	ebc00058 	pop      	r4-r11, r15, r16-r17
      format++;
 8017210:	5c42      	addi      	r2, r4, 1
    flags = 0U;
 8017212:	ea120000 	movi      	r18, 0
      switch (*format) {
 8017216:	8200      	ld.b      	r0, (r2, 0x0)
 8017218:	e460101f 	subi      	r3, r0, 32
 801721c:	74cc      	zextb      	r3, r3
 801721e:	3b10      	cmphsi      	r3, 17
 8017220:	c4024830 	lsli      	r16, r2, 0
 8017224:	081c      	bt      	0x801725c	// 801725c <_vsnprintf+0xa0>
 8017226:	d0680883 	ldr.w      	r3, (r8, r3 << 2)
 801722a:	780c      	jmp      	r3
 801722c:	08015f04 	.long	0x08015f04
 8017230:	08053634 	.long	0x08053634
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 8017234:	ee520001 	ori      	r18, r18, 1
 8017238:	2200      	addi      	r2, 1
 801723a:	07ee      	br      	0x8017216	// 8017216 <_vsnprintf+0x5a>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 801723c:	ee520008 	ori      	r18, r18, 8
 8017240:	2200      	addi      	r2, 1
 8017242:	07ea      	br      	0x8017216	// 8017216 <_vsnprintf+0x5a>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 8017244:	ee520010 	ori      	r18, r18, 16
 8017248:	2200      	addi      	r2, 1
 801724a:	07e6      	br      	0x8017216	// 8017216 <_vsnprintf+0x5a>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 801724c:	ee520004 	ori      	r18, r18, 4
 8017250:	2200      	addi      	r2, 1
 8017252:	07e2      	br      	0x8017216	// 8017216 <_vsnprintf+0x5a>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 8017254:	ee520002 	ori      	r18, r18, 2
 8017258:	2200      	addi      	r2, 1
 801725a:	07de      	br      	0x8017216	// 8017216 <_vsnprintf+0x5a>
  return (ch >= '0') && (ch <= '9');
 801725c:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 8017260:	74cc      	zextb      	r3, r3
 8017262:	3b09      	cmphsi      	r3, 10
 8017264:	0c56      	bf      	0x8017310	// 8017310 <_vsnprintf+0x154>
    else if (*format == '*') {
 8017266:	eb40002a 	cmpnei      	r0, 42
 801726a:	e840065c 	bf      	0x8017f22	// 8017f22 <_vsnprintf+0xd66>
    width = 0U;
 801726e:	3400      	movi      	r4, 0
    if (*format == '.') {
 8017270:	eb40002e 	cmpnei      	r0, 46
 8017274:	0c61      	bf      	0x8017336	// 8017336 <_vsnprintf+0x17a>
    precision = 0U;
 8017276:	ea090000 	movi      	r9, 0
    switch (*format) {
 801727a:	e4601067 	subi      	r3, r0, 104
 801727e:	74cc      	zextb      	r3, r3
 8017280:	3b12      	cmphsi      	r3, 19
 8017282:	080d      	bt      	0x801729c	// 801729c <_vsnprintf+0xe0>
 8017284:	1042      	lrw      	r2, 0x8053678	// 801728c <_vsnprintf+0xd0>
 8017286:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 801728a:	780c      	jmp      	r3
 801728c:	08053678 	.long	0x08053678
 8017290:	d8100001 	ld.b      	r0, (r16, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8017294:	ee520100 	ori      	r18, r18, 256
        format++;
 8017298:	e6100000 	addi      	r16, r16, 1
    switch (*format) {
 801729c:	e4601024 	subi      	r3, r0, 37
 80172a0:	74cc      	zextb      	r3, r3
 80172a2:	eb030053 	cmphsi      	r3, 84
 80172a6:	0817      	bt      	0x80172d4	// 80172d4 <_vsnprintf+0x118>
 80172a8:	1042      	lrw      	r2, 0x80536c4	// 80172b0 <_vsnprintf+0xf4>
 80172aa:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 80172ae:	780c      	jmp      	r3
 80172b0:	080536c4 	.long	0x080536c4
        if (*format == 'h') {
 80172b4:	d8100001 	ld.b      	r0, (r16, 0x1)
 80172b8:	eb400068 	cmpnei      	r0, 104
 80172bc:	e8400672 	bf      	0x8017fa0	// 8017fa0 <_vsnprintf+0xde4>
    switch (*format) {
 80172c0:	e4601024 	subi      	r3, r0, 37
 80172c4:	74cc      	zextb      	r3, r3
 80172c6:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_SHORT;
 80172ca:	ee520080 	ori      	r18, r18, 128
        format++;
 80172ce:	e6100000 	addi      	r16, r16, 1
    switch (*format) {
 80172d2:	0feb      	bf      	0x80172a8	// 80172a8 <_vsnprintf+0xec>
        out(*format, buffer, idx++, maxlen);
 80172d4:	c4114822 	lsli      	r2, r17, 0
 80172d8:	e5310000 	addi      	r9, r17, 1
 80172dc:	6cdf      	mov      	r3, r7
 80172de:	6c5b      	mov      	r1, r6
 80172e0:	7bd5      	jsr      	r5
        format++;
 80172e2:	e4900000 	addi      	r4, r16, 1
        out(*format, buffer, idx++, maxlen);
 80172e6:	c4094831 	lsli      	r17, r9, 0
        break;
 80172ea:	077b      	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
        if (*format == 'l') {
 80172ec:	d8100001 	ld.b      	r0, (r16, 0x1)
 80172f0:	eb40006c 	cmpnei      	r0, 108
 80172f4:	e840064e 	bf      	0x8017f90	// 8017f90 <_vsnprintf+0xdd4>
        flags |= FLAGS_LONG;
 80172f8:	ee520100 	ori      	r18, r18, 256
        format++;
 80172fc:	e6100000 	addi      	r16, r16, 1
 8017300:	07ce      	br      	0x801729c	// 801729c <_vsnprintf+0xe0>
 8017302:	d8100001 	ld.b      	r0, (r16, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8017306:	ee520200 	ori      	r18, r18, 512
        format++;
 801730a:	e6100000 	addi      	r16, r16, 1
        break;
 801730e:	07c7      	br      	0x801729c	// 801729c <_vsnprintf+0xe0>
 8017310:	3400      	movi      	r4, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8017312:	310a      	movi      	r1, 10
  while (_is_digit(**str)) {
 8017314:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8017316:	e6100000 	addi      	r16, r16, 1
 801731a:	f8248440 	mula.32.l      	r0, r4, r1
 801731e:	e480102f 	subi      	r4, r0, 48
  while (_is_digit(**str)) {
 8017322:	d8100000 	ld.b      	r0, (r16, 0x0)
  return (ch >= '0') && (ch <= '9');
 8017326:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 801732a:	74cc      	zextb      	r3, r3
 801732c:	64c8      	cmphs      	r2, r3
 801732e:	0bf4      	bt      	0x8017316	// 8017316 <_vsnprintf+0x15a>
    if (*format == '.') {
 8017330:	eb40002e 	cmpnei      	r0, 46
 8017334:	0ba1      	bt      	0x8017276	// 8017276 <_vsnprintf+0xba>
      if (_is_digit(*format)) {
 8017336:	d8100001 	ld.b      	r0, (r16, 0x1)
  return (ch >= '0') && (ch <= '9');
 801733a:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 801733e:	74cc      	zextb      	r3, r3
 8017340:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 8017342:	ee520400 	ori      	r18, r18, 1024
      format++;
 8017346:	e4500000 	addi      	r2, r16, 1
      if (_is_digit(*format)) {
 801734a:	0815      	bt      	0x8017374	// 8017374 <_vsnprintf+0x1b8>
 801734c:	c4024830 	lsli      	r16, r2, 0
 8017350:	ea090000 	movi      	r9, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8017354:	310a      	movi      	r1, 10
  while (_is_digit(**str)) {
 8017356:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8017358:	e6100000 	addi      	r16, r16, 1
 801735c:	f8298440 	mula.32.l      	r0, r9, r1
 8017360:	e520102f 	subi      	r9, r0, 48
  while (_is_digit(**str)) {
 8017364:	d8100000 	ld.b      	r0, (r16, 0x0)
  return (ch >= '0') && (ch <= '9');
 8017368:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 801736c:	74cc      	zextb      	r3, r3
 801736e:	64c8      	cmphs      	r2, r3
 8017370:	0bf4      	bt      	0x8017358	// 8017358 <_vsnprintf+0x19c>
 8017372:	0784      	br      	0x801727a	// 801727a <_vsnprintf+0xbe>
      else if (*format == '*') {
 8017374:	eb40002a 	cmpnei      	r0, 42
 8017378:	e84007e3 	bf      	0x801833e	// 801833e <_vsnprintf+0x1182>
      format++;
 801737c:	c4024830 	lsli      	r16, r2, 0
 8017380:	077b      	br      	0x8017276	// 8017276 <_vsnprintf+0xba>
        uint32_t ipv4 = va_arg(va, uint32_t);
 8017382:	e46b0003 	addi      	r3, r11, 4
 8017386:	d84b2000 	ld.w      	r2, (r11, 0x0)
 801738a:	b868      	st.w      	r3, (r14, 0x20)
            h = bit / 100;
 801738c:	ea130064 	movi      	r19, 100
            bit = (*inuint >> (8 * i)) & 0xff;
 8017390:	74c8      	zextb      	r3, r2
            h = bit / 100;
 8017392:	c6638021 	divu      	r1, r3, r19
 8017396:	7404      	zextb      	r0, r1
            if (h)
 8017398:	e9000653 	bez      	r0, 0x801803e	// 801803e <_vsnprintf+0xe82>
            m = (bit % 100) / 10;
 801739c:	c6618421 	mult      	r1, r1, r19
 80173a0:	60c6      	subu      	r3, r1
 80173a2:	74cc      	zextb      	r3, r3
 80173a4:	ea15000a 	movi      	r21, 10
 80173a8:	c6a38035 	divu      	r21, r3, r21
                outtxt[j++] = '0' + h;
 80173ac:	202f      	addi      	r0, 48
 80173ae:	dc0a0000 	st.b      	r0, (r10, 0x0)
            if (m)
 80173b2:	e91506e3 	bez      	r21, 0x8018178	// 8018178 <_vsnprintf+0xfbc>
 80173b6:	ea130004 	movi      	r19, 4
 80173ba:	ea160002 	movi      	r22, 2
 80173be:	ea170003 	movi      	r23, 3
 80173c2:	c4134820 	lsli      	r0, r19, 0
 80173c6:	e68e003c 	addi      	r20, r14, 61
 80173ca:	c4164821 	lsli      	r1, r22, 0
                outtxt[j++] = '0' + m;
 80173ce:	e6b5002f 	addi      	r21, r21, 48
 80173d2:	deb40000 	st.b      	r21, (r20, 0x0)
 80173d6:	c6ca0036 	addu      	r22, r10, r22
 80173da:	c4014835 	lsli      	r21, r1, 0
            l = (bit % 100) % 10;
 80173de:	ea14000a 	movi      	r20, 10
 80173e2:	c6838021 	divu      	r1, r3, r20
 80173e6:	c6818421 	mult      	r1, r1, r20
 80173ea:	60c6      	subu      	r3, r1
            outtxt[j++] = '0' + l;
 80173ec:	232f      	addi      	r3, 48
 80173ee:	dc760000 	st.b      	r3, (r22, 0x0)
            outtxt[j++] = '.';
 80173f2:	332e      	movi      	r3, 46
 80173f4:	d6ea0023 	str.b      	r3, (r10, r23 << 0)
            bit = (*inuint >> (8 * i)) & 0xff;
 80173f8:	c50255e1 	zext      	r1, r2, 15, 8
            h = bit / 100;
 80173fc:	ea170064 	movi      	r23, 100
 8017400:	c6e18023 	divu      	r3, r1, r23
 8017404:	c40354f6 	zext      	r22, r3, 7, 0
            if (h)
 8017408:	e916070f 	bez      	r22, 0x8018226	// 8018226 <_vsnprintf+0x106a>
            m = (bit % 100) / 10;
 801740c:	c6e38423 	mult      	r3, r3, r23
 8017410:	596d      	subu      	r3, r1, r3
 8017412:	744c      	zextb      	r1, r3
 8017414:	c6818034 	divu      	r20, r1, r20
                outtxt[j++] = '0' + h;
 8017418:	e4150002 	addi      	r0, r21, 3
 801741c:	e6d6002f 	addi      	r22, r22, 48
 8017420:	7400      	zextb      	r0, r0
 8017422:	d66a0036 	str.b      	r22, (r10, r19 << 0)
            if (m)
 8017426:	e9340780 	bnez      	r20, 0x8018326	// 8018326 <_vsnprintf+0x116a>
                    outtxt[j++] = '0';
 801742a:	e6b50003 	addi      	r21, r21, 4
 801742e:	3330      	movi      	r3, 48
 8017430:	d40a0023 	str.b      	r3, (r10, r0 << 0)
 8017434:	c41554e0 	zext      	r0, r21, 7, 0
 8017438:	c4004833 	lsli      	r19, r0, 0
            l = (bit % 100) % 10;
 801743c:	ea14000a 	movi      	r20, 10
 8017440:	c6818023 	divu      	r3, r1, r20
 8017444:	c6838423 	mult      	r3, r3, r20
 8017448:	596d      	subu      	r3, r1, r3
            outtxt[j++] = '0' + l;
 801744a:	232f      	addi      	r3, 48
 801744c:	d66a0023 	str.b      	r3, (r10, r19 << 0)
 8017450:	5862      	addi      	r3, r0, 1
            outtxt[j++] = '.';
 8017452:	74cc      	zextb      	r3, r3
 8017454:	ea0c002e 	movi      	r12, 46
            bit = (*inuint >> (8 * i)) & 0xff;
 8017458:	c60256f3 	zext      	r19, r2, 23, 16
            h = bit / 100;
 801745c:	ea170064 	movi      	r23, 100
            outtxt[j++] = '.';
 8017460:	d46a002c 	str.b      	r12, (r10, r3 << 0)
            h = bit / 100;
 8017464:	c6f38023 	divu      	r3, r19, r23
 8017468:	c40354f6 	zext      	r22, r3, 7, 0
            outtxt[j++] = '.';
 801746c:	5826      	addi      	r1, r0, 2
 801746e:	7444      	zextb      	r1, r1
            if (h)
 8017470:	e91606b3 	bez      	r22, 0x80181d6	// 80181d6 <_vsnprintf+0x101a>
            m = (bit % 100) / 10;
 8017474:	c6e38423 	mult      	r3, r3, r23
 8017478:	c4730083 	subu      	r3, r19, r3
 801747c:	c40354f3 	zext      	r19, r3, 7, 0
 8017480:	c6938034 	divu      	r20, r19, r20
                outtxt[j++] = '0' + h;
 8017484:	e6a00002 	addi      	r21, r0, 3
 8017488:	e6d6002f 	addi      	r22, r22, 48
 801748c:	c41554f5 	zext      	r21, r21, 7, 0
 8017490:	d42a0036 	str.b      	r22, (r10, r1 << 0)
            if (m)
 8017494:	e9340746 	bnez      	r20, 0x8018320	// 8018320 <_vsnprintf+0x1164>
                    outtxt[j++] = '0';
 8017498:	582e      	addi      	r1, r0, 4
 801749a:	3330      	movi      	r3, 48
 801749c:	7444      	zextb      	r1, r1
 801749e:	d6aa0023 	str.b      	r3, (r10, r21 << 0)
            l = (bit % 100) % 10;
 80174a2:	300a      	movi      	r0, 10
 80174a4:	c4138023 	divu      	r3, r19, r0
 80174a8:	7cc0      	mult      	r3, r0
 80174aa:	c4730083 	subu      	r3, r19, r3
            outtxt[j++] = '0' + l;
 80174ae:	e6610000 	addi      	r19, r1, 1
 80174b2:	232f      	addi      	r3, 48
            outtxt[j++] = '.';
 80174b4:	c41354f3 	zext      	r19, r19, 7, 0
 80174b8:	ea0c002e 	movi      	r12, 46
            bit = (*inuint >> (8 * i)) & 0xff;
 80174bc:	4a58      	lsri      	r2, r2, 24
            h = bit / 100;
 80174be:	ea160064 	movi      	r22, 100
            outtxt[j++] = '0' + l;
 80174c2:	d42a0023 	str.b      	r3, (r10, r1 << 0)
            outtxt[j++] = '.';
 80174c6:	d66a002c 	str.b      	r12, (r10, r19 << 0)
            h = bit / 100;
 80174ca:	c6c28033 	divu      	r19, r2, r22
 80174ce:	c41354f4 	zext      	r20, r19, 7, 0
            outtxt[j++] = '.';
 80174d2:	5966      	addi      	r3, r1, 2
 80174d4:	74cc      	zextb      	r3, r3
            if (h)
 80174d6:	e9140698 	bez      	r20, 0x8018206	// 8018206 <_vsnprintf+0x104a>
            m = (bit % 100) / 10;
 80174da:	c6d38433 	mult      	r19, r19, r22
 80174de:	c6620082 	subu      	r2, r2, r19
 80174e2:	7488      	zextb      	r2, r2
 80174e4:	c4028020 	divu      	r0, r2, r0
                outtxt[j++] = '0' + h;
 80174e8:	e6a10002 	addi      	r21, r1, 3
 80174ec:	e694002f 	addi      	r20, r20, 48
 80174f0:	c41554f5 	zext      	r21, r21, 7, 0
 80174f4:	d46a0034 	str.b      	r20, (r10, r3 << 0)
            if (m)
 80174f8:	e920071a 	bnez      	r0, 0x801832c	// 801832c <_vsnprintf+0x1170>
                    outtxt[j++] = '0';
 80174fc:	596e      	addi      	r3, r1, 4
 80174fe:	3130      	movi      	r1, 48
 8017500:	74cc      	zextb      	r3, r3
 8017502:	d6aa0021 	str.b      	r1, (r10, r21 << 0)
            l = (bit % 100) % 10;
 8017506:	300a      	movi      	r0, 10
 8017508:	c4028021 	divu      	r1, r2, r0
 801750c:	7c40      	mult      	r1, r0
 801750e:	6086      	subu      	r2, r1
            outtxt[j++] = '0' + l;
 8017510:	222f      	addi      	r2, 48
 8017512:	d46a0022 	str.b      	r2, (r10, r3 << 0)
            outtxt[j++] = '.';
 8017516:	e5630001 	addi      	r11, r3, 2
            outtxt[j++] = '0' + l;
 801751a:	2300      	addi      	r3, 1
            outtxt[j++] = '.';
 801751c:	74cc      	zextb      	r3, r3
 801751e:	322e      	movi      	r2, 46
 8017520:	d46a0022 	str.b      	r2, (r10, r3 << 0)
    outtxt[j - 1] = 0;
 8017524:	e46e003a 	addi      	r3, r14, 59
            outtxt[j++] = '.';
 8017528:	76ec      	zextb      	r11, r11
    outtxt[j - 1] = 0;
 801752a:	3200      	movi      	r2, 0
 801752c:	d5630022 	str.b      	r2, (r3, r11 << 0)
    return j - 1;
 8017530:	e46b1000 	subi      	r3, r11, 1
        if (flags & FLAGS_PRECISION) {
 8017534:	e4522400 	andi      	r2, r18, 1024
    return j - 1;
 8017538:	6c4f      	mov      	r1, r3
          l = (l < precision ? l : precision);
 801753a:	3a40      	cmpnei      	r2, 0
 801753c:	f923cd23 	min.u32      	r3, r3, r9
        if (flags & FLAGS_PRECISION) {
 8017540:	b847      	st.w      	r2, (r14, 0x1c)
          l = (l < precision ? l : precision);
 8017542:	6c87      	mov      	r2, r1
 8017544:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8017548:	e4722002 	andi      	r3, r18, 2
          l = (l < precision ? l : precision);
 801754c:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 801754e:	b86a      	st.w      	r3, (r14, 0x28)
 8017550:	e9230655 	bnez      	r3, 0x80181fa	// 80181fa <_vsnprintf+0x103e>
          while (l++ < width) {
 8017554:	6508      	cmphs      	r2, r4
 8017556:	6ccb      	mov      	r3, r2
 8017558:	2300      	addi      	r3, 1
 801755a:	e860089f 	bt      	0x8018698	// 8018698 <_vsnprintf+0x14dc>
 801755e:	c6240023 	addu      	r3, r4, r17
 8017562:	c443008b 	subu      	r11, r3, r2
 8017566:	c4114822 	lsli      	r2, r17, 0
            out(' ', buffer, idx++, maxlen);
 801756a:	e6310000 	addi      	r17, r17, 1
 801756e:	6cdf      	mov      	r3, r7
 8017570:	6c5b      	mov      	r1, r6
 8017572:	3020      	movi      	r0, 32
 8017574:	7bd5      	jsr      	r5
          while (l++ < width) {
 8017576:	c5710480 	cmpne      	r17, r11
 801757a:	c4114822 	lsli      	r2, r17, 0
 801757e:	0bf6      	bt      	0x801756a	// 801756a <_vsnprintf+0x3ae>
 8017580:	5c62      	addi      	r3, r4, 1
 8017582:	b869      	st.w      	r3, (r14, 0x24)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017584:	d80a0000 	ld.b      	r0, (r10, 0x0)
 8017588:	e9000034 	bez      	r0, 0x80175f0	// 80175f0 <_vsnprintf+0x434>
 801758c:	9867      	ld.w      	r3, (r14, 0x1c)
 801758e:	e9030610 	bez      	r3, 0x80181ae	// 80181ae <_vsnprintf+0xff2>
 8017592:	c6290023 	addu      	r3, r9, r17
 8017596:	b867      	st.w      	r3, (r14, 0x1c)
          while (l++ < width) {
 8017598:	6e6b      	mov      	r9, r10
 801759a:	0411      	br      	0x80175bc	// 80175bc <_vsnprintf+0x400>
          out(*(pstr++), buffer, idx++, maxlen);
 801759c:	e5290000 	addi      	r9, r9, 1
 80175a0:	6cdf      	mov      	r3, r7
 80175a2:	c4114822 	lsli      	r2, r17, 0
 80175a6:	6c5b      	mov      	r1, r6
 80175a8:	7bd5      	jsr      	r5
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80175aa:	d8090000 	ld.b      	r0, (r9, 0x0)
          out(*(pstr++), buffer, idx++, maxlen);
 80175ae:	e5710000 	addi      	r11, r17, 1
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80175b2:	e900060e 	bez      	r0, 0x80181ce	// 80181ce <_vsnprintf+0x1012>
          out(*(pstr++), buffer, idx++, maxlen);
 80175b6:	c40b4831 	lsli      	r17, r11, 0
 80175ba:	9867      	ld.w      	r3, (r14, 0x1c)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80175bc:	c6230480 	cmpne      	r3, r17
 80175c0:	0bee      	bt      	0x801759c	// 801759c <_vsnprintf+0x3e0>
        if (flags & FLAGS_LEFT) {
 80175c2:	986a      	ld.w      	r3, (r14, 0x28)
 80175c4:	e9030016 	bez      	r3, 0x80175f0	// 80175f0 <_vsnprintf+0x434>
          while (l++ < width) {
 80175c8:	9869      	ld.w      	r3, (r14, 0x24)
 80175ca:	650c      	cmphs      	r3, r4
 80175cc:	0812      	bt      	0x80175f0	// 80175f0 <_vsnprintf+0x434>
 80175ce:	c6240024 	addu      	r4, r4, r17
 80175d2:	c464008b 	subu      	r11, r4, r3
 80175d6:	c4114822 	lsli      	r2, r17, 0
            out(' ', buffer, idx++, maxlen);
 80175da:	e6310000 	addi      	r17, r17, 1
 80175de:	6cdf      	mov      	r3, r7
 80175e0:	6c5b      	mov      	r1, r6
 80175e2:	3020      	movi      	r0, 32
 80175e4:	7bd5      	jsr      	r5
          while (l++ < width) {
 80175e6:	c5710480 	cmpne      	r17, r11
 80175ea:	c4114822 	lsli      	r2, r17, 0
 80175ee:	0bf6      	bt      	0x80175da	// 80175da <_vsnprintf+0x41e>
        format++;
 80175f0:	e4900000 	addi      	r4, r16, 1
        uint32_t ipv4 = va_arg(va, uint32_t);
 80175f4:	d96e2008 	ld.w      	r11, (r14, 0x20)
 80175f8:	e800fdf4 	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
        const char* p = va_arg(va, char*);
 80175fc:	da6b2000 	ld.w      	r19, (r11, 0x0)
 8017600:	e46b0003 	addi      	r3, r11, 4
 8017604:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 8017606:	d8130000 	ld.b      	r0, (r19, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 801760a:	3300      	movi      	r3, 0
 801760c:	2b00      	subi      	r3, 1
 801760e:	eb490000 	cmpnei      	r9, 0
 8017612:	c4690c40 	inct      	r3, r9, 0
  for (s = str; *s && maxsize--; ++s);
 8017616:	c413482b 	lsli      	r11, r19, 0
 801761a:	e9200006 	bnez      	r0, 0x8017626	// 8017626 <_vsnprintf+0x46a>
 801761e:	040a      	br      	0x8017632	// 8017632 <_vsnprintf+0x476>
 8017620:	2b00      	subi      	r3, 1
 8017622:	e9030008 	bez      	r3, 0x8017632	// 8017632 <_vsnprintf+0x476>
 8017626:	e56b0000 	addi      	r11, r11, 1
 801762a:	d84b0000 	ld.b      	r2, (r11, 0x0)
 801762e:	e922fff9 	bnez      	r2, 0x8017620	// 8017620 <_vsnprintf+0x464>
  return (unsigned int)(s - str);
 8017632:	c66b0083 	subu      	r3, r11, r19
        if (flags & FLAGS_PRECISION) {
 8017636:	e4522400 	andi      	r2, r18, 1024
  return (unsigned int)(s - str);
 801763a:	6c4f      	mov      	r1, r3
          l = (l < precision ? l : precision);
 801763c:	3a40      	cmpnei      	r2, 0
 801763e:	f923cd23 	min.u32      	r3, r3, r9
        if (flags & FLAGS_PRECISION) {
 8017642:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8017644:	6c87      	mov      	r2, r1
 8017646:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 801764a:	e4722002 	andi      	r3, r18, 2
          l = (l < precision ? l : precision);
 801764e:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 8017650:	b86b      	st.w      	r3, (r14, 0x2c)
 8017652:	e92304e6 	bnez      	r3, 0x801801e	// 801801e <_vsnprintf+0xe62>
          while (l++ < width) {
 8017656:	6508      	cmphs      	r2, r4
 8017658:	6ccb      	mov      	r3, r2
 801765a:	2300      	addi      	r3, 1
 801765c:	e8600821 	bt      	0x801869e	// 801869e <_vsnprintf+0x14e2>
 8017660:	c6240023 	addu      	r3, r4, r17
 8017664:	c443008b 	subu      	r11, r3, r2
 8017668:	c4114822 	lsli      	r2, r17, 0
 801766c:	de6e2007 	st.w      	r19, (r14, 0x1c)
            out(' ', buffer, idx++, maxlen);
 8017670:	e6310000 	addi      	r17, r17, 1
 8017674:	6cdf      	mov      	r3, r7
 8017676:	6c5b      	mov      	r1, r6
 8017678:	3020      	movi      	r0, 32
 801767a:	7bd5      	jsr      	r5
          while (l++ < width) {
 801767c:	c5710480 	cmpne      	r17, r11
 8017680:	c4114822 	lsli      	r2, r17, 0
 8017684:	da6e2007 	ld.w      	r19, (r14, 0x1c)
 8017688:	0bf2      	bt      	0x801766c	// 801766c <_vsnprintf+0x4b0>
 801768a:	5c62      	addi      	r3, r4, 1
 801768c:	b869      	st.w      	r3, (r14, 0x24)
 801768e:	d8130000 	ld.b      	r0, (r19, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017692:	e900ffaf 	bez      	r0, 0x80175f0	// 80175f0 <_vsnprintf+0x434>
 8017696:	986a      	ld.w      	r3, (r14, 0x28)
 8017698:	e9030413 	bez      	r3, 0x8017ebe	// 8017ebe <_vsnprintf+0xd02>
 801769c:	c6290029 	addu      	r9, r9, r17
 80176a0:	0414      	br      	0x80176c8	// 80176c8 <_vsnprintf+0x50c>
          out(*(p++), buffer, idx++, maxlen);
 80176a2:	e6730000 	addi      	r19, r19, 1
 80176a6:	de6e2007 	st.w      	r19, (r14, 0x1c)
 80176aa:	6cdf      	mov      	r3, r7
 80176ac:	c4114822 	lsli      	r2, r17, 0
 80176b0:	6c5b      	mov      	r1, r6
 80176b2:	7bd5      	jsr      	r5
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80176b4:	da6e2007 	ld.w      	r19, (r14, 0x1c)
          out(*(p++), buffer, idx++, maxlen);
 80176b8:	e5710000 	addi      	r11, r17, 1
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80176bc:	d8130000 	ld.b      	r0, (r19, 0x0)
 80176c0:	e9000412 	bez      	r0, 0x8017ee4	// 8017ee4 <_vsnprintf+0xd28>
          out(*(p++), buffer, idx++, maxlen);
 80176c4:	c40b4831 	lsli      	r17, r11, 0
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80176c8:	c6290480 	cmpne      	r9, r17
 80176cc:	0beb      	bt      	0x80176a2	// 80176a2 <_vsnprintf+0x4e6>
        if (flags & FLAGS_LEFT) {
 80176ce:	986b      	ld.w      	r3, (r14, 0x2c)
 80176d0:	e903ff90 	bez      	r3, 0x80175f0	// 80175f0 <_vsnprintf+0x434>
          while (l++ < width) {
 80176d4:	9869      	ld.w      	r3, (r14, 0x24)
 80176d6:	650c      	cmphs      	r3, r4
 80176d8:	0b8c      	bt      	0x80175f0	// 80175f0 <_vsnprintf+0x434>
 80176da:	c6240024 	addu      	r4, r4, r17
 80176de:	c464008b 	subu      	r11, r4, r3
 80176e2:	c4114822 	lsli      	r2, r17, 0
            out(' ', buffer, idx++, maxlen);
 80176e6:	e6310000 	addi      	r17, r17, 1
 80176ea:	6cdf      	mov      	r3, r7
 80176ec:	6c5b      	mov      	r1, r6
 80176ee:	3020      	movi      	r0, 32
 80176f0:	7bd5      	jsr      	r5
          while (l++ < width) {
 80176f2:	c5710480 	cmpne      	r17, r11
 80176f6:	c4114822 	lsli      	r2, r17, 0
 80176fa:	0bf6      	bt      	0x80176e6	// 80176e6 <_vsnprintf+0x52a>
        format++;
 80176fc:	e4900000 	addi      	r4, r16, 1
        uint32_t ipv4 = va_arg(va, uint32_t);
 8017700:	d96e2008 	ld.w      	r11, (r14, 0x20)
 8017704:	e800fd6e 	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8017708:	d86b2000 	ld.w      	r3, (r11, 0x0)
 801770c:	e66b0003 	addi      	r19, r11, 4
  if (!value) {
 8017710:	e903048b 	bez      	r3, 0x8018026	// 8018026 <_vsnprintf+0xe6a>
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 8017714:	eeb20021 	ori      	r21, r18, 33
 8017718:	6c2b      	mov      	r0, r10
          while (l++ < width) {
 801771a:	ea140000 	movi      	r20, 0
 801771e:	ea120020 	movi      	r18, 32
      const char digit = (char)(value % base);
 8017722:	e423200f 	andi      	r1, r3, 15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8017726:	3909      	cmphsi      	r1, 10
      const char digit = (char)(value % base);
 8017728:	7484      	zextb      	r2, r1
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801772a:	e6940000 	addi      	r20, r20, 1
 801772e:	e86003f7 	bt      	0x8017f1c	// 8017f1c <_vsnprintf+0xd60>
 8017732:	222f      	addi      	r2, 48
      value /= base;
 8017734:	4b64      	lsri      	r3, r3, 4
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8017736:	a040      	st.b      	r2, (r0, 0x0)
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8017738:	e9030005 	bez      	r3, 0x8017742	// 8017742 <_vsnprintf+0x586>
 801773c:	2000      	addi      	r0, 1
 801773e:	e832fff2 	bnezad      	r18, 0x8017722	// 8017722 <_vsnprintf+0x566>
  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8017742:	3308      	movi      	r3, 8
 8017744:	b865      	st.w      	r3, (r14, 0x14)
 8017746:	3310      	movi      	r3, 16
 8017748:	b863      	st.w      	r3, (r14, 0xc)
 801774a:	3300      	movi      	r3, 0
 801774c:	c413482b 	lsli      	r11, r19, 0
 8017750:	deae2006 	st.w      	r21, (r14, 0x18)
 8017754:	dd2e2004 	st.w      	r9, (r14, 0x10)
 8017758:	b862      	st.w      	r3, (r14, 0x8)
 801775a:	de8e2001 	st.w      	r20, (r14, 0x4)
 801775e:	c4114822 	lsli      	r2, r17, 0
 8017762:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8017766:	6cdf      	mov      	r3, r7
 8017768:	6c5b      	mov      	r1, r6
 801776a:	6c17      	mov      	r0, r5
 801776c:	e3fff3ce 	bsr      	0x8015f08	// 8015f08 <_ntoa_format>
 8017770:	c4004831 	lsli      	r17, r0, 0
 8017774:	0423      	br      	0x80177ba	// 80177ba <_vsnprintf+0x5fe>
        if (!(flags & FLAGS_LEFT)) {
 8017776:	e6522002 	andi      	r18, r18, 2
 801777a:	e932047a 	bnez      	r18, 0x801806e	// 801806e <_vsnprintf+0xeb2>
          while (l++ < width) {
 801777e:	3301      	movi      	r3, 1
 8017780:	650c      	cmphs      	r3, r4
 8017782:	e8600794 	bt      	0x80186aa	// 80186aa <_vsnprintf+0x14ee>
 8017786:	e4711000 	subi      	r3, r17, 1
 801778a:	610c      	addu      	r4, r3
            out(' ', buffer, idx++, maxlen);
 801778c:	e5310000 	addi      	r9, r17, 1
 8017790:	c4114822 	lsli      	r2, r17, 0
 8017794:	6cdf      	mov      	r3, r7
 8017796:	6c5b      	mov      	r1, r6
 8017798:	3020      	movi      	r0, 32
 801779a:	7bd5      	jsr      	r5
          while (l++ < width) {
 801779c:	6526      	cmpne      	r9, r4
 801779e:	c4094831 	lsli      	r17, r9, 0
 80177a2:	0bf5      	bt      	0x801778c	// 801778c <_vsnprintf+0x5d0>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80177a4:	d80b0000 	ld.b      	r0, (r11, 0x0)
 80177a8:	e48b0003 	addi      	r4, r11, 4
 80177ac:	6cdf      	mov      	r3, r7
 80177ae:	6ca7      	mov      	r2, r9
 80177b0:	6c5b      	mov      	r1, r6
 80177b2:	e6290000 	addi      	r17, r9, 1
 80177b6:	7bd5      	jsr      	r5
 80177b8:	6ed3      	mov      	r11, r4
        format++;
 80177ba:	e4900000 	addi      	r4, r16, 1
        break;
 80177be:	e800fd11 	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
        char *ipv6 = va_arg(va, char*);
 80177c2:	d84b2000 	ld.w      	r2, (r11, 0x0)
 80177c6:	e46b0003 	addi      	r3, r11, 4
 80177ca:	b869      	st.w      	r3, (r14, 0x24)
                m = (*inuint >> (8 * i)) & 0xff;
 80177cc:	9260      	ld.w      	r3, (r2, 0x0)
 80177ce:	744c      	zextb      	r1, r3
                h = m >> 4;
 80177d0:	c4814853 	lsri      	r19, r1, 4
                if (h > 9)
 80177d4:	eb130009 	cmphsi      	r19, 10
                l = m & 0xf;
 80177d8:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 80177dc:	e86004c0 	bt      	0x801815c	// 801815c <_vsnprintf+0xfa0>
                    outtxt[j++]= '0' + h;
 80177e0:	e673002f 	addi      	r19, r19, 48
                if (l > 9)
 80177e4:	3009      	movi      	r0, 9
 80177e6:	6440      	cmphs      	r0, r1
 80177e8:	de6a0000 	st.b      	r19, (r10, 0x0)
 80177ec:	e86004b5 	bt      	0x8018156	// 8018156 <_vsnprintf+0xf9a>
                    outtxt[j++] = 'A' + l - 10;
 80177f0:	2136      	addi      	r1, 55
 80177f2:	dc2a0001 	st.b      	r1, (r10, 0x1)
                m = (*inuint >> (8 * i)) & 0xff;
 80177f6:	c50355e1 	zext      	r1, r3, 15, 8
                h = m >> 4;
 80177fa:	4904      	lsri      	r0, r1, 4
                if (h > 9)
 80177fc:	3809      	cmphsi      	r0, 10
                l = m & 0xf;
 80177fe:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 8017802:	e86004a7 	bt      	0x8018150	// 8018150 <_vsnprintf+0xf94>
                    outtxt[j++]= '0' + h;
 8017806:	202f      	addi      	r0, 48
 8017808:	dc0a0002 	st.b      	r0, (r10, 0x2)
                if (l > 9)
 801780c:	3009      	movi      	r0, 9
 801780e:	6440      	cmphs      	r0, r1
 8017810:	e860049d 	bt      	0x801814a	// 801814a <_vsnprintf+0xf8e>
                    outtxt[j++] = 'A' + l - 10;
 8017814:	2136      	addi      	r1, 55
 8017816:	dc2a0003 	st.b      	r1, (r10, 0x3)
                    outtxt[j++] = ':';
 801781a:	313a      	movi      	r1, 58
 801781c:	dc2a0004 	st.b      	r1, (r10, 0x4)
                m = (*inuint >> (8 * i)) & 0xff;
 8017820:	c60356e1 	zext      	r1, r3, 23, 16
                h = m >> 4;
 8017824:	4904      	lsri      	r0, r1, 4
                if (h > 9)
 8017826:	3809      	cmphsi      	r0, 10
                l = m & 0xf;
 8017828:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 801782c:	e860048c 	bt      	0x8018144	// 8018144 <_vsnprintf+0xf88>
                    outtxt[j++]= '0' + h;
 8017830:	202f      	addi      	r0, 48
 8017832:	dc0a0005 	st.b      	r0, (r10, 0x5)
                if (l > 9)
 8017836:	3009      	movi      	r0, 9
 8017838:	6440      	cmphs      	r0, r1
 801783a:	e8600482 	bt      	0x801813e	// 801813e <_vsnprintf+0xf82>
                    outtxt[j++] = 'A' + l - 10;
 801783e:	2136      	addi      	r1, 55
                m = (*inuint >> (8 * i)) & 0xff;
 8017840:	4b78      	lsri      	r3, r3, 24
 8017842:	dc2a0006 	st.b      	r1, (r10, 0x6)
                h = m >> 4;
 8017846:	4b24      	lsri      	r1, r3, 4
                if (h > 9)
 8017848:	3909      	cmphsi      	r1, 10
                l = m & 0xf;
 801784a:	e463200f 	andi      	r3, r3, 15
                if (h > 9)
 801784e:	e8600475 	bt      	0x8018138	// 8018138 <_vsnprintf+0xf7c>
                    outtxt[j++]= '0' + h;
 8017852:	212f      	addi      	r1, 48
 8017854:	dc2a0007 	st.b      	r1, (r10, 0x7)
                if (l > 9)
 8017858:	3109      	movi      	r1, 9
 801785a:	64c4      	cmphs      	r1, r3
 801785c:	e860046b 	bt      	0x8018132	// 8018132 <_vsnprintf+0xf76>
                    outtxt[j++] = 'A' + l - 10;
 8017860:	2336      	addi      	r3, 55
 8017862:	dc6a0008 	st.b      	r3, (r10, 0x8)
                    outtxt[j++] = ':';
 8017866:	333a      	movi      	r3, 58
 8017868:	dc6a0009 	st.b      	r3, (r10, 0x9)
                m = (*inuint >> (8 * i)) & 0xff;
 801786c:	9261      	ld.w      	r3, (r2, 0x4)
 801786e:	744c      	zextb      	r1, r3
                h = m >> 4;
 8017870:	4904      	lsri      	r0, r1, 4
                if (h > 9)
 8017872:	3809      	cmphsi      	r0, 10
                l = m & 0xf;
 8017874:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 8017878:	e860045a 	bt      	0x801812c	// 801812c <_vsnprintf+0xf70>
                    outtxt[j++]= '0' + h;
 801787c:	202f      	addi      	r0, 48
 801787e:	dc0a000a 	st.b      	r0, (r10, 0xa)
                if (l > 9)
 8017882:	3009      	movi      	r0, 9
 8017884:	6440      	cmphs      	r0, r1
 8017886:	e8600450 	bt      	0x8018126	// 8018126 <_vsnprintf+0xf6a>
                    outtxt[j++] = 'A' + l - 10;
 801788a:	2136      	addi      	r1, 55
 801788c:	dc2a000b 	st.b      	r1, (r10, 0xb)
                m = (*inuint >> (8 * i)) & 0xff;
 8017890:	c50355e1 	zext      	r1, r3, 15, 8
                h = m >> 4;
 8017894:	4904      	lsri      	r0, r1, 4
                if (h > 9)
 8017896:	3809      	cmphsi      	r0, 10
                l = m & 0xf;
 8017898:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 801789c:	e8600442 	bt      	0x8018120	// 8018120 <_vsnprintf+0xf64>
                    outtxt[j++]= '0' + h;
 80178a0:	202f      	addi      	r0, 48
 80178a2:	dc0a000c 	st.b      	r0, (r10, 0xc)
                if (l > 9)
 80178a6:	3009      	movi      	r0, 9
 80178a8:	6440      	cmphs      	r0, r1
 80178aa:	e8600438 	bt      	0x801811a	// 801811a <_vsnprintf+0xf5e>
                    outtxt[j++] = 'A' + l - 10;
 80178ae:	2136      	addi      	r1, 55
 80178b0:	dc2a000d 	st.b      	r1, (r10, 0xd)
                    outtxt[j++] = ':';
 80178b4:	313a      	movi      	r1, 58
 80178b6:	dc2a000e 	st.b      	r1, (r10, 0xe)
                m = (*inuint >> (8 * i)) & 0xff;
 80178ba:	c60356e1 	zext      	r1, r3, 23, 16
                h = m >> 4;
 80178be:	4904      	lsri      	r0, r1, 4
                if (h > 9)
 80178c0:	3809      	cmphsi      	r0, 10
                l = m & 0xf;
 80178c2:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 80178c6:	e8600427 	bt      	0x8018114	// 8018114 <_vsnprintf+0xf58>
                    outtxt[j++]= '0' + h;
 80178ca:	202f      	addi      	r0, 48
 80178cc:	dc0a000f 	st.b      	r0, (r10, 0xf)
                if (l > 9)
 80178d0:	3009      	movi      	r0, 9
 80178d2:	6440      	cmphs      	r0, r1
 80178d4:	e860041d 	bt      	0x801810e	// 801810e <_vsnprintf+0xf52>
                    outtxt[j++] = 'A' + l - 10;
 80178d8:	2136      	addi      	r1, 55
                m = (*inuint >> (8 * i)) & 0xff;
 80178da:	4b78      	lsri      	r3, r3, 24
 80178dc:	dc2a0010 	st.b      	r1, (r10, 0x10)
                h = m >> 4;
 80178e0:	4b24      	lsri      	r1, r3, 4
                if (h > 9)
 80178e2:	3909      	cmphsi      	r1, 10
                l = m & 0xf;
 80178e4:	e463200f 	andi      	r3, r3, 15
                if (h > 9)
 80178e8:	e8600410 	bt      	0x8018108	// 8018108 <_vsnprintf+0xf4c>
                    outtxt[j++]= '0' + h;
 80178ec:	212f      	addi      	r1, 48
 80178ee:	dc2a0011 	st.b      	r1, (r10, 0x11)
                if (l > 9)
 80178f2:	3109      	movi      	r1, 9
 80178f4:	64c4      	cmphs      	r1, r3
 80178f6:	e8600406 	bt      	0x8018102	// 8018102 <_vsnprintf+0xf46>
                    outtxt[j++] = 'A' + l - 10;
 80178fa:	2336      	addi      	r3, 55
 80178fc:	dc6a0012 	st.b      	r3, (r10, 0x12)
                    outtxt[j++] = ':';
 8017900:	333a      	movi      	r3, 58
 8017902:	dc6a0013 	st.b      	r3, (r10, 0x13)
                m = (*inuint >> (8 * i)) & 0xff;
 8017906:	9262      	ld.w      	r3, (r2, 0x8)
 8017908:	744c      	zextb      	r1, r3
                h = m >> 4;
 801790a:	4904      	lsri      	r0, r1, 4
                if (h > 9)
 801790c:	3809      	cmphsi      	r0, 10
                l = m & 0xf;
 801790e:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 8017912:	e8600383 	bt      	0x8018018	// 8018018 <_vsnprintf+0xe5c>
                    outtxt[j++]= '0' + h;
 8017916:	202f      	addi      	r0, 48
 8017918:	dc0a0014 	st.b      	r0, (r10, 0x14)
                if (l > 9)
 801791c:	3009      	movi      	r0, 9
 801791e:	6440      	cmphs      	r0, r1
 8017920:	e8600379 	bt      	0x8018012	// 8018012 <_vsnprintf+0xe56>
                    outtxt[j++] = 'A' + l - 10;
 8017924:	2136      	addi      	r1, 55
 8017926:	dc2a0015 	st.b      	r1, (r10, 0x15)
                m = (*inuint >> (8 * i)) & 0xff;
 801792a:	c50355e1 	zext      	r1, r3, 15, 8
                h = m >> 4;
 801792e:	4904      	lsri      	r0, r1, 4
                if (h > 9)
 8017930:	3809      	cmphsi      	r0, 10
                l = m & 0xf;
 8017932:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 8017936:	e860036b 	bt      	0x801800c	// 801800c <_vsnprintf+0xe50>
                    outtxt[j++]= '0' + h;
 801793a:	202f      	addi      	r0, 48
 801793c:	dc0a0016 	st.b      	r0, (r10, 0x16)
                if (l > 9)
 8017940:	3009      	movi      	r0, 9
 8017942:	6440      	cmphs      	r0, r1
 8017944:	e8600361 	bt      	0x8018006	// 8018006 <_vsnprintf+0xe4a>
                    outtxt[j++] = 'A' + l - 10;
 8017948:	2136      	addi      	r1, 55
 801794a:	dc2a0017 	st.b      	r1, (r10, 0x17)
                    outtxt[j++] = ':';
 801794e:	313a      	movi      	r1, 58
 8017950:	dc2a0018 	st.b      	r1, (r10, 0x18)
                m = (*inuint >> (8 * i)) & 0xff;
 8017954:	c60356e1 	zext      	r1, r3, 23, 16
                h = m >> 4;
 8017958:	4904      	lsri      	r0, r1, 4
                if (h > 9)
 801795a:	3809      	cmphsi      	r0, 10
                l = m & 0xf;
 801795c:	e421200f 	andi      	r1, r1, 15
                if (h > 9)
 8017960:	e8600350 	bt      	0x8018000	// 8018000 <_vsnprintf+0xe44>
                    outtxt[j++]= '0' + h;
 8017964:	202f      	addi      	r0, 48
 8017966:	dc0a0019 	st.b      	r0, (r10, 0x19)
                if (l > 9)
 801796a:	3009      	movi      	r0, 9
 801796c:	6440      	cmphs      	r0, r1
 801796e:	e8600346 	bt      	0x8017ffa	// 8017ffa <_vsnprintf+0xe3e>
                    outtxt[j++] = 'A' + l - 10;
 8017972:	2136      	addi      	r1, 55
                m = (*inuint >> (8 * i)) & 0xff;
 8017974:	4b78      	lsri      	r3, r3, 24
 8017976:	dc2a001a 	st.b      	r1, (r10, 0x1a)
                h = m >> 4;
 801797a:	4b24      	lsri      	r1, r3, 4
                if (h > 9)
 801797c:	3909      	cmphsi      	r1, 10
                l = m & 0xf;
 801797e:	e463200f 	andi      	r3, r3, 15
                if (h > 9)
 8017982:	e8600339 	bt      	0x8017ff4	// 8017ff4 <_vsnprintf+0xe38>
                    outtxt[j++]= '0' + h;
 8017986:	212f      	addi      	r1, 48
 8017988:	dc2a001b 	st.b      	r1, (r10, 0x1b)
                if (l > 9)
 801798c:	3109      	movi      	r1, 9
 801798e:	64c4      	cmphs      	r1, r3
 8017990:	e860032f 	bt      	0x8017fee	// 8017fee <_vsnprintf+0xe32>
                    outtxt[j++] = 'A' + l - 10;
 8017994:	2336      	addi      	r3, 55
 8017996:	dc6a001c 	st.b      	r3, (r10, 0x1c)
                    outtxt[j++] = ':';
 801799a:	333a      	movi      	r3, 58
 801799c:	dc6a001d 	st.b      	r3, (r10, 0x1d)
                m = (*inuint >> (8 * i)) & 0xff;
 80179a0:	9263      	ld.w      	r3, (r2, 0xc)
 80179a2:	748c      	zextb      	r2, r3
                h = m >> 4;
 80179a4:	4a24      	lsri      	r1, r2, 4
                if (h > 9)
 80179a6:	3909      	cmphsi      	r1, 10
                l = m & 0xf;
 80179a8:	e442200f 	andi      	r2, r2, 15
                if (h > 9)
 80179ac:	e860031e 	bt      	0x8017fe8	// 8017fe8 <_vsnprintf+0xe2c>
                    outtxt[j++]= '0' + h;
 80179b0:	212f      	addi      	r1, 48
 80179b2:	dc2a001e 	st.b      	r1, (r10, 0x1e)
                if (l > 9)
 80179b6:	3109      	movi      	r1, 9
 80179b8:	6484      	cmphs      	r1, r2
 80179ba:	e8600314 	bt      	0x8017fe2	// 8017fe2 <_vsnprintf+0xe26>
                    outtxt[j++] = 'A' + l - 10;
 80179be:	2236      	addi      	r2, 55
 80179c0:	dc4a001f 	st.b      	r2, (r10, 0x1f)
                m = (*inuint >> (8 * i)) & 0xff;
 80179c4:	c50355e2 	zext      	r2, r3, 15, 8
                h = m >> 4;
 80179c8:	4a24      	lsri      	r1, r2, 4
                if (h > 9)
 80179ca:	3909      	cmphsi      	r1, 10
                l = m & 0xf;
 80179cc:	e442200f 	andi      	r2, r2, 15
                if (h > 9)
 80179d0:	e8600306 	bt      	0x8017fdc	// 8017fdc <_vsnprintf+0xe20>
                    outtxt[j++]= '0' + h;
 80179d4:	212f      	addi      	r1, 48
 80179d6:	dc2a0020 	st.b      	r1, (r10, 0x20)
                if (l > 9)
 80179da:	3109      	movi      	r1, 9
 80179dc:	6484      	cmphs      	r1, r2
 80179de:	e86002fc 	bt      	0x8017fd6	// 8017fd6 <_vsnprintf+0xe1a>
                    outtxt[j++] = 'A' + l - 10;
 80179e2:	2236      	addi      	r2, 55
 80179e4:	dc4a0021 	st.b      	r2, (r10, 0x21)
                    outtxt[j++] = ':';
 80179e8:	323a      	movi      	r2, 58
 80179ea:	dc4a0022 	st.b      	r2, (r10, 0x22)
                m = (*inuint >> (8 * i)) & 0xff;
 80179ee:	c60356e2 	zext      	r2, r3, 23, 16
                h = m >> 4;
 80179f2:	4a24      	lsri      	r1, r2, 4
                if (h > 9)
 80179f4:	3909      	cmphsi      	r1, 10
                l = m & 0xf;
 80179f6:	e442200f 	andi      	r2, r2, 15
                if (h > 9)
 80179fa:	e86002eb 	bt      	0x8017fd0	// 8017fd0 <_vsnprintf+0xe14>
                    outtxt[j++]= '0' + h;
 80179fe:	212f      	addi      	r1, 48
 8017a00:	dc2a0023 	st.b      	r1, (r10, 0x23)
                if (l > 9)
 8017a04:	3109      	movi      	r1, 9
 8017a06:	6484      	cmphs      	r1, r2
 8017a08:	e86002e1 	bt      	0x8017fca	// 8017fca <_vsnprintf+0xe0e>
                    outtxt[j++] = 'A' + l - 10;
 8017a0c:	2236      	addi      	r2, 55
                m = (*inuint >> (8 * i)) & 0xff;
 8017a0e:	4b78      	lsri      	r3, r3, 24
 8017a10:	dc4a0024 	st.b      	r2, (r10, 0x24)
                h = m >> 4;
 8017a14:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 8017a16:	3a09      	cmphsi      	r2, 10
                l = m & 0xf;
 8017a18:	e463200f 	andi      	r3, r3, 15
                if (h > 9)
 8017a1c:	e86002d4 	bt      	0x8017fc4	// 8017fc4 <_vsnprintf+0xe08>
                    outtxt[j++]= '0' + h;
 8017a20:	222f      	addi      	r2, 48
 8017a22:	dc4a0025 	st.b      	r2, (r10, 0x25)
                if (l > 9)
 8017a26:	3209      	movi      	r2, 9
 8017a28:	64c8      	cmphs      	r2, r3
 8017a2a:	e86002ca 	bt      	0x8017fbe	// 8017fbe <_vsnprintf+0xe02>
                    outtxt[j++] = 'A' + l - 10;
 8017a2e:	2336      	addi      	r3, 55
 8017a30:	dc6a0026 	st.b      	r3, (r10, 0x26)
    outtxt[j - 1] = 0;
 8017a34:	3300      	movi      	r3, 0
 8017a36:	dc6a0027 	st.b      	r3, (r10, 0x27)
        if (flags & FLAGS_PRECISION) {
 8017a3a:	e4722400 	andi      	r3, r18, 1024
 8017a3e:	b86a      	st.w      	r3, (r14, 0x28)
 8017a40:	e90302bb 	bez      	r3, 0x8017fb6	// 8017fb6 <_vsnprintf+0xdfa>
          l = (l < precision ? l : precision);
 8017a44:	ea0b0027 	movi      	r11, 39
 8017a48:	f969cd23 	min.u32      	r3, r9, r11
 8017a4c:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8017a4e:	e4722002 	andi      	r3, r18, 2
 8017a52:	b86b      	st.w      	r3, (r14, 0x2c)
 8017a54:	e923001f 	bnez      	r3, 0x8017a92	// 8017a92 <_vsnprintf+0x8d6>
          while (l++ < width) {
 8017a58:	9848      	ld.w      	r2, (r14, 0x20)
 8017a5a:	6508      	cmphs      	r2, r4
 8017a5c:	6ccb      	mov      	r3, r2
 8017a5e:	2300      	addi      	r3, 1
 8017a60:	e8600629 	bt      	0x80186b2	// 80186b2 <_vsnprintf+0x14f6>
 8017a64:	c6240023 	addu      	r3, r4, r17
 8017a68:	c443008b 	subu      	r11, r3, r2
 8017a6c:	c4114822 	lsli      	r2, r17, 0
 8017a70:	de6e2007 	st.w      	r19, (r14, 0x1c)
            out(' ', buffer, idx++, maxlen);
 8017a74:	e6310000 	addi      	r17, r17, 1
 8017a78:	6cdf      	mov      	r3, r7
 8017a7a:	6c5b      	mov      	r1, r6
 8017a7c:	3020      	movi      	r0, 32
 8017a7e:	7bd5      	jsr      	r5
          while (l++ < width) {
 8017a80:	c5710480 	cmpne      	r17, r11
 8017a84:	c4114822 	lsli      	r2, r17, 0
 8017a88:	da6e2007 	ld.w      	r19, (r14, 0x1c)
 8017a8c:	0bf2      	bt      	0x8017a70	// 8017a70 <_vsnprintf+0x8b4>
 8017a8e:	5c62      	addi      	r3, r4, 1
 8017a90:	b868      	st.w      	r3, (r14, 0x20)
 8017a92:	986a      	ld.w      	r3, (r14, 0x28)
 8017a94:	e9030268 	bez      	r3, 0x8017f64	// 8017f64 <_vsnprintf+0xda8>
 8017a98:	c6290023 	addu      	r3, r9, r17
 8017a9c:	b867      	st.w      	r3, (r14, 0x1c)
 8017a9e:	6e6b      	mov      	r9, r10
 8017aa0:	0413      	br      	0x8017ac6	// 8017ac6 <_vsnprintf+0x90a>
          out(*(pstr++), buffer, idx++, maxlen);
 8017aa2:	e5290000 	addi      	r9, r9, 1
 8017aa6:	c4134820 	lsli      	r0, r19, 0
 8017aaa:	6cdf      	mov      	r3, r7
 8017aac:	c4114822 	lsli      	r2, r17, 0
 8017ab0:	6c5b      	mov      	r1, r6
 8017ab2:	7bd5      	jsr      	r5
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017ab4:	da690000 	ld.b      	r19, (r9, 0x0)
          out(*(pstr++), buffer, idx++, maxlen);
 8017ab8:	e5710000 	addi      	r11, r17, 1
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017abc:	e9130266 	bez      	r19, 0x8017f88	// 8017f88 <_vsnprintf+0xdcc>
          out(*(pstr++), buffer, idx++, maxlen);
 8017ac0:	c40b4831 	lsli      	r17, r11, 0
 8017ac4:	9867      	ld.w      	r3, (r14, 0x1c)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017ac6:	c6230480 	cmpne      	r3, r17
 8017aca:	0bec      	bt      	0x8017aa2	// 8017aa2 <_vsnprintf+0x8e6>
        if (flags & FLAGS_LEFT) {
 8017acc:	986b      	ld.w      	r3, (r14, 0x2c)
 8017ace:	e9030016 	bez      	r3, 0x8017afa	// 8017afa <_vsnprintf+0x93e>
          while (l++ < width) {
 8017ad2:	9868      	ld.w      	r3, (r14, 0x20)
 8017ad4:	650c      	cmphs      	r3, r4
 8017ad6:	0812      	bt      	0x8017afa	// 8017afa <_vsnprintf+0x93e>
 8017ad8:	c6240024 	addu      	r4, r4, r17
 8017adc:	c464008b 	subu      	r11, r4, r3
 8017ae0:	c4114822 	lsli      	r2, r17, 0
            out(' ', buffer, idx++, maxlen);
 8017ae4:	e6310000 	addi      	r17, r17, 1
 8017ae8:	6cdf      	mov      	r3, r7
 8017aea:	6c5b      	mov      	r1, r6
 8017aec:	3020      	movi      	r0, 32
 8017aee:	7bd5      	jsr      	r5
          while (l++ < width) {
 8017af0:	c5710480 	cmpne      	r17, r11
 8017af4:	c4114822 	lsli      	r2, r17, 0
 8017af8:	0bf6      	bt      	0x8017ae4	// 8017ae4 <_vsnprintf+0x928>
        format++;
 8017afa:	e4900000 	addi      	r4, r16, 1
        char *ipv6 = va_arg(va, char*);
 8017afe:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8017b02:	e800fb6f 	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
        const char* p = va_arg(va, char*);
 8017b06:	d84b2000 	ld.w      	r2, (r11, 0x0)
 8017b0a:	e46b0003 	addi      	r3, r11, 4
 8017b0e:	b869      	st.w      	r3, (r14, 0x24)
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8017b10:	8260      	ld.b      	r3, (r2, 0x0)
 8017b12:	c4834853 	lsri      	r19, r3, 4
        if (hbit > 9)
 8017b16:	eb130009 	cmphsi      	r19, 10
        lbit = *(inchar + i ) & 0x0f;
 8017b1a:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8017b1e:	e86002ee 	bt      	0x80180fa	// 80180fa <_vsnprintf+0xf3e>
            outtxt[3 * i]= '0' + hbit;
 8017b22:	e673002f 	addi      	r19, r19, 48
        if (lbit > 9)
 8017b26:	3b09      	cmphsi      	r3, 10
 8017b28:	de6a0000 	st.b      	r19, (r10, 0x0)
 8017b2c:	e86002e4 	bt      	0x80180f4	// 80180f4 <_vsnprintf+0xf38>
            outtxt[3 * i + 1] = '0' + lbit;
 8017b30:	232f      	addi      	r3, 48
 8017b32:	dc6a0001 	st.b      	r3, (r10, 0x1)
        outtxt[3 * i + 2] = '-';
 8017b36:	332d      	movi      	r3, 45
 8017b38:	dc6a0002 	st.b      	r3, (r10, 0x2)
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8017b3c:	8261      	ld.b      	r3, (r2, 0x1)
 8017b3e:	4b24      	lsri      	r1, r3, 4
        if (hbit > 9)
 8017b40:	3909      	cmphsi      	r1, 10
        lbit = *(inchar + i ) & 0x0f;
 8017b42:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8017b46:	e86002d4 	bt      	0x80180ee	// 80180ee <_vsnprintf+0xf32>
            outtxt[3 * i]= '0' + hbit;
 8017b4a:	212f      	addi      	r1, 48
        if (lbit > 9)
 8017b4c:	3b09      	cmphsi      	r3, 10
 8017b4e:	dc2a0003 	st.b      	r1, (r10, 0x3)
 8017b52:	e86002cb 	bt      	0x80180e8	// 80180e8 <_vsnprintf+0xf2c>
            outtxt[3 * i + 1] = '0' + lbit;
 8017b56:	232f      	addi      	r3, 48
 8017b58:	dc6a0004 	st.b      	r3, (r10, 0x4)
        outtxt[3 * i + 2] = '-';
 8017b5c:	332d      	movi      	r3, 45
 8017b5e:	dc6a0005 	st.b      	r3, (r10, 0x5)
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8017b62:	8262      	ld.b      	r3, (r2, 0x2)
 8017b64:	4b24      	lsri      	r1, r3, 4
        if (hbit > 9)
 8017b66:	3909      	cmphsi      	r1, 10
        lbit = *(inchar + i ) & 0x0f;
 8017b68:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8017b6c:	e86002bb 	bt      	0x80180e2	// 80180e2 <_vsnprintf+0xf26>
            outtxt[3 * i]= '0' + hbit;
 8017b70:	212f      	addi      	r1, 48
        if (lbit > 9)
 8017b72:	3b09      	cmphsi      	r3, 10
 8017b74:	dc2a0006 	st.b      	r1, (r10, 0x6)
 8017b78:	e86002b2 	bt      	0x80180dc	// 80180dc <_vsnprintf+0xf20>
            outtxt[3 * i + 1] = '0' + lbit;
 8017b7c:	232f      	addi      	r3, 48
 8017b7e:	dc6a0007 	st.b      	r3, (r10, 0x7)
        outtxt[3 * i + 2] = '-';
 8017b82:	332d      	movi      	r3, 45
 8017b84:	dc6a0008 	st.b      	r3, (r10, 0x8)
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8017b88:	8263      	ld.b      	r3, (r2, 0x3)
 8017b8a:	4b24      	lsri      	r1, r3, 4
        if (hbit > 9)
 8017b8c:	3909      	cmphsi      	r1, 10
        lbit = *(inchar + i ) & 0x0f;
 8017b8e:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8017b92:	e86002a2 	bt      	0x80180d6	// 80180d6 <_vsnprintf+0xf1a>
            outtxt[3 * i]= '0' + hbit;
 8017b96:	212f      	addi      	r1, 48
        if (lbit > 9)
 8017b98:	3b09      	cmphsi      	r3, 10
 8017b9a:	dc2a0009 	st.b      	r1, (r10, 0x9)
 8017b9e:	e8600299 	bt      	0x80180d0	// 80180d0 <_vsnprintf+0xf14>
            outtxt[3 * i + 1] = '0' + lbit;
 8017ba2:	232f      	addi      	r3, 48
 8017ba4:	dc6a000a 	st.b      	r3, (r10, 0xa)
        outtxt[3 * i + 2] = '-';
 8017ba8:	332d      	movi      	r3, 45
 8017baa:	dc6a000b 	st.b      	r3, (r10, 0xb)
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8017bae:	8264      	ld.b      	r3, (r2, 0x4)
 8017bb0:	4b24      	lsri      	r1, r3, 4
        if (hbit > 9)
 8017bb2:	3909      	cmphsi      	r1, 10
        lbit = *(inchar + i ) & 0x0f;
 8017bb4:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8017bb8:	e8600289 	bt      	0x80180ca	// 80180ca <_vsnprintf+0xf0e>
            outtxt[3 * i]= '0' + hbit;
 8017bbc:	212f      	addi      	r1, 48
        if (lbit > 9)
 8017bbe:	3b09      	cmphsi      	r3, 10
 8017bc0:	dc2a000c 	st.b      	r1, (r10, 0xc)
 8017bc4:	e8600280 	bt      	0x80180c4	// 80180c4 <_vsnprintf+0xf08>
            outtxt[3 * i + 1] = '0' + lbit;
 8017bc8:	232f      	addi      	r3, 48
 8017bca:	dc6a000d 	st.b      	r3, (r10, 0xd)
        outtxt[3 * i + 2] = '-';
 8017bce:	332d      	movi      	r3, 45
 8017bd0:	dc6a000e 	st.b      	r3, (r10, 0xe)
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8017bd4:	8265      	ld.b      	r3, (r2, 0x5)
 8017bd6:	4b44      	lsri      	r2, r3, 4
        if (hbit > 9)
 8017bd8:	3a09      	cmphsi      	r2, 10
        lbit = *(inchar + i ) & 0x0f;
 8017bda:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8017bde:	e8600270 	bt      	0x80180be	// 80180be <_vsnprintf+0xf02>
            outtxt[3 * i]= '0' + hbit;
 8017be2:	222f      	addi      	r2, 48
        if (lbit > 9)
 8017be4:	3b09      	cmphsi      	r3, 10
 8017be6:	dc4a000f 	st.b      	r2, (r10, 0xf)
 8017bea:	e8600267 	bt      	0x80180b8	// 80180b8 <_vsnprintf+0xefc>
            outtxt[3 * i + 1] = '0' + lbit;
 8017bee:	232f      	addi      	r3, 48
 8017bf0:	dc6a0010 	st.b      	r3, (r10, 0x10)
    outtxt[3 * (i - 1) + 2] = 0;
 8017bf4:	3300      	movi      	r3, 0
 8017bf6:	dc6a0011 	st.b      	r3, (r10, 0x11)
        if (flags & FLAGS_PRECISION) {
 8017bfa:	e4722400 	andi      	r3, r18, 1024
 8017bfe:	b86a      	st.w      	r3, (r14, 0x28)
 8017c00:	e90301d8 	bez      	r3, 0x8017fb0	// 8017fb0 <_vsnprintf+0xdf4>
          l = (l < precision ? l : precision);
 8017c04:	ea0b0011 	movi      	r11, 17
 8017c08:	f969cd23 	min.u32      	r3, r9, r11
 8017c0c:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8017c0e:	e4722002 	andi      	r3, r18, 2
 8017c12:	b86b      	st.w      	r3, (r14, 0x2c)
 8017c14:	e923001f 	bnez      	r3, 0x8017c52	// 8017c52 <_vsnprintf+0xa96>
          while (l++ < width) {
 8017c18:	9848      	ld.w      	r2, (r14, 0x20)
 8017c1a:	6508      	cmphs      	r2, r4
 8017c1c:	6ccb      	mov      	r3, r2
 8017c1e:	2300      	addi      	r3, 1
 8017c20:	e8600542 	bt      	0x80186a4	// 80186a4 <_vsnprintf+0x14e8>
 8017c24:	c6240023 	addu      	r3, r4, r17
 8017c28:	c443008b 	subu      	r11, r3, r2
 8017c2c:	c4114822 	lsli      	r2, r17, 0
 8017c30:	de6e2007 	st.w      	r19, (r14, 0x1c)
            out(' ', buffer, idx++, maxlen);
 8017c34:	e6310000 	addi      	r17, r17, 1
 8017c38:	6cdf      	mov      	r3, r7
 8017c3a:	6c5b      	mov      	r1, r6
 8017c3c:	3020      	movi      	r0, 32
 8017c3e:	7bd5      	jsr      	r5
          while (l++ < width) {
 8017c40:	c5710480 	cmpne      	r17, r11
 8017c44:	c4114822 	lsli      	r2, r17, 0
 8017c48:	da6e2007 	ld.w      	r19, (r14, 0x1c)
 8017c4c:	0bf2      	bt      	0x8017c30	// 8017c30 <_vsnprintf+0xa74>
 8017c4e:	5c62      	addi      	r3, r4, 1
 8017c50:	b868      	st.w      	r3, (r14, 0x20)
 8017c52:	986a      	ld.w      	r3, (r14, 0x28)
 8017c54:	e9030173 	bez      	r3, 0x8017f3a	// 8017f3a <_vsnprintf+0xd7e>
 8017c58:	c6290023 	addu      	r3, r9, r17
 8017c5c:	b867      	st.w      	r3, (r14, 0x1c)
 8017c5e:	6e6b      	mov      	r9, r10
 8017c60:	0413      	br      	0x8017c86	// 8017c86 <_vsnprintf+0xaca>
          out(*(pstr++), buffer, idx++, maxlen);
 8017c62:	e5290000 	addi      	r9, r9, 1
 8017c66:	c4134820 	lsli      	r0, r19, 0
 8017c6a:	6cdf      	mov      	r3, r7
 8017c6c:	c4114822 	lsli      	r2, r17, 0
 8017c70:	6c5b      	mov      	r1, r6
 8017c72:	7bd5      	jsr      	r5
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017c74:	da690000 	ld.b      	r19, (r9, 0x0)
          out(*(pstr++), buffer, idx++, maxlen);
 8017c78:	e5710000 	addi      	r11, r17, 1
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017c7c:	e9130171 	bez      	r19, 0x8017f5e	// 8017f5e <_vsnprintf+0xda2>
          out(*(pstr++), buffer, idx++, maxlen);
 8017c80:	c40b4831 	lsli      	r17, r11, 0
 8017c84:	9867      	ld.w      	r3, (r14, 0x1c)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017c86:	c6230480 	cmpne      	r3, r17
 8017c8a:	0bec      	bt      	0x8017c62	// 8017c62 <_vsnprintf+0xaa6>
        if (flags & FLAGS_LEFT) {
 8017c8c:	986b      	ld.w      	r3, (r14, 0x2c)
 8017c8e:	e903ff36 	bez      	r3, 0x8017afa	// 8017afa <_vsnprintf+0x93e>
          while (l++ < width) {
 8017c92:	9868      	ld.w      	r3, (r14, 0x20)
 8017c94:	650c      	cmphs      	r3, r4
 8017c96:	0b32      	bt      	0x8017afa	// 8017afa <_vsnprintf+0x93e>
 8017c98:	c6240024 	addu      	r4, r4, r17
 8017c9c:	c464008b 	subu      	r11, r4, r3
 8017ca0:	c4114822 	lsli      	r2, r17, 0
            out(' ', buffer, idx++, maxlen);
 8017ca4:	e6310000 	addi      	r17, r17, 1
 8017ca8:	6cdf      	mov      	r3, r7
 8017caa:	6c5b      	mov      	r1, r6
 8017cac:	3020      	movi      	r0, 32
 8017cae:	7bd5      	jsr      	r5
          while (l++ < width) {
 8017cb0:	c5710480 	cmpne      	r17, r11
 8017cb4:	c4114822 	lsli      	r2, r17, 0
 8017cb8:	0bf6      	bt      	0x8017ca4	// 8017ca4 <_vsnprintf+0xae8>
        format++;
 8017cba:	e4900000 	addi      	r4, r16, 1
        char *ipv6 = va_arg(va, char*);
 8017cbe:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8017cc2:	e800fa8f 	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8017cc6:	eb400046 	cmpnei      	r0, 70
 8017cca:	e8400327 	bf      	0x8018318	// 8018318 <_vsnprintf+0x115c>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8017cce:	de4e2004 	st.w      	r18, (r14, 0x10)
 8017cd2:	b883      	st.w      	r4, (r14, 0xc)
 8017cd4:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8017cd8:	d86b2000 	ld.w      	r3, (r11, 0x0)
 8017cdc:	d88b2001 	ld.w      	r4, (r11, 0x4)
 8017ce0:	e66b0007 	addi      	r19, r11, 8
 8017ce4:	b860      	st.w      	r3, (r14, 0x0)
 8017ce6:	b881      	st.w      	r4, (r14, 0x4)
 8017ce8:	c4114822 	lsli      	r2, r17, 0
 8017cec:	6cdf      	mov      	r3, r7
 8017cee:	6c5b      	mov      	r1, r6
 8017cf0:	6c17      	mov      	r0, r5
 8017cf2:	de6e2007 	st.w      	r19, (r14, 0x1c)
 8017cf6:	e3fff739 	bsr      	0x8016b68	// 8016b68 <_ftoa>
 8017cfa:	da6e2007 	ld.w      	r19, (r14, 0x1c)
 8017cfe:	c4004831 	lsli      	r17, r0, 0
        format++;
 8017d02:	e4900000 	addi      	r4, r16, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8017d06:	c413482b 	lsli      	r11, r19, 0
        break;
 8017d0a:	e800fa6b 	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
        out('%', buffer, idx++, maxlen);
 8017d0e:	c4114822 	lsli      	r2, r17, 0
 8017d12:	e5310000 	addi      	r9, r17, 1
 8017d16:	6cdf      	mov      	r3, r7
 8017d18:	6c5b      	mov      	r1, r6
 8017d1a:	3025      	movi      	r0, 37
 8017d1c:	7bd5      	jsr      	r5
        format++;
 8017d1e:	e4900000 	addi      	r4, r16, 1
        out('%', buffer, idx++, maxlen);
 8017d22:	c4094831 	lsli      	r17, r9, 0
        break;
 8017d26:	e800fa5d 	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
        if (*format == 'x' || *format == 'X') {
 8017d2a:	eb400078 	cmpnei      	r0, 120
 8017d2e:	e84002f2 	bf      	0x8018312	// 8018312 <_vsnprintf+0x1156>
 8017d32:	eb400058 	cmpnei      	r0, 88
 8017d36:	e84002e0 	bf      	0x80182f6	// 80182f6 <_vsnprintf+0x113a>
        else if (*format == 'o') {
 8017d3a:	eb40006f 	cmpnei      	r0, 111
 8017d3e:	e840022c 	bf      	0x8018196	// 8018196 <_vsnprintf+0xfda>
        else if (*format == 'b') {
 8017d42:	eb400062 	cmpnei      	r0, 98
 8017d46:	e840041d 	bf      	0x8018580	// 8018580 <_vsnprintf+0x13c4>
        if ((*format != 'i') && (*format != 'd')) {
 8017d4a:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8017d4e:	c4922823 	bclri      	r3, r18, 4
 8017d52:	b867      	st.w      	r3, (r14, 0x1c)
        if ((*format != 'i') && (*format != 'd')) {
 8017d54:	e860027b 	bt      	0x801824a	// 801824a <_vsnprintf+0x108e>
        if (flags & FLAGS_PRECISION) {
 8017d58:	e6522400 	andi      	r18, r18, 1024
          base = 10U;
 8017d5c:	ea13000a 	movi      	r19, 10
        if (flags & FLAGS_PRECISION) {
 8017d60:	e9120280 	bez      	r18, 0x8018260	// 8018260 <_vsnprintf+0x10a4>
          flags &= ~FLAGS_ZEROPAD;
 8017d64:	3b80      	bclri      	r3, 0
 8017d66:	b867      	st.w      	r3, (r14, 0x1c)
        if ((*format == 'i') || (*format == 'd')) {
 8017d68:	eb400069 	cmpnei      	r0, 105
 8017d6c:	e840027a 	bf      	0x8018260	// 8018260 <_vsnprintf+0x10a4>
 8017d70:	eb400064 	cmpnei      	r0, 100
 8017d74:	e8400276 	bf      	0x8018260	// 8018260 <_vsnprintf+0x10a4>
          if (flags & FLAGS_LONG_LONG) {
 8017d78:	9867      	ld.w      	r3, (r14, 0x1c)
 8017d7a:	e4032200 	andi      	r0, r3, 512
 8017d7e:	e92002ed 	bnez      	r0, 0x8018358	// 8018358 <_vsnprintf+0x119c>
          else if (flags & FLAGS_LONG) {
 8017d82:	e4232100 	andi      	r1, r3, 256
 8017d86:	e92103d2 	bnez      	r1, 0x801852a	// 801852a <_vsnprintf+0x136e>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8017d8a:	e4632040 	andi      	r3, r3, 64
 8017d8e:	e923047f 	bnez      	r3, 0x801868c	// 801868c <_vsnprintf+0x14d0>
 8017d92:	9867      	ld.w      	r3, (r14, 0x1c)
 8017d94:	e4632080 	andi      	r3, r3, 128
 8017d98:	e92303f7 	bnez      	r3, 0x8018586	// 8018586 <_vsnprintf+0x13ca>
 8017d9c:	d86b2000 	ld.w      	r3, (r11, 0x0)
 8017da0:	e56b0003 	addi      	r11, r11, 4
  if (!value) {
 8017da4:	e923000a 	bnez      	r3, 0x8017db8	// 8017db8 <_vsnprintf+0xbfc>
    flags &= ~FLAGS_HASH;
 8017da8:	9807      	ld.w      	r0, (r14, 0x1c)
 8017daa:	c4802822 	bclri      	r2, r0, 4
  if (!(flags & FLAGS_PRECISION) || value) {
 8017dae:	e4002400 	andi      	r0, r0, 1024
    flags &= ~FLAGS_HASH;
 8017db2:	b847      	st.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION) || value) {
 8017db4:	e920040c 	bnez      	r0, 0x80185cc	// 80185cc <_vsnprintf+0x1410>
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8017db8:	9847      	ld.w      	r2, (r14, 0x1c)
 8017dba:	e4422020 	andi      	r2, r2, 32
 8017dbe:	3a40      	cmpnei      	r2, 0
 8017dc0:	ea140041 	movi      	r20, 65
 8017dc4:	3261      	movi      	r2, 97
 8017dc6:	c6820c20 	incf      	r20, r2, 0
 8017dca:	c40a4832 	lsli      	r18, r10, 0
 8017dce:	e6941009 	subi      	r20, r20, 10
 8017dd2:	040f      	br      	0x8017df0	// 8017df0 <_vsnprintf+0xc34>
 8017dd4:	e462002f 	addi      	r3, r2, 48
 8017dd8:	74cc      	zextb      	r3, r3
 8017dda:	dc720000 	st.b      	r3, (r18, 0x0)
      value /= base;
 8017dde:	6cc3      	mov      	r3, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8017de0:	e90003f6 	bez      	r0, 0x80185cc	// 80185cc <_vsnprintf+0x1410>
 8017de4:	eb410020 	cmpnei      	r1, 32
 8017de8:	e6520000 	addi      	r18, r18, 1
 8017dec:	e84003f0 	bf      	0x80185cc	// 80185cc <_vsnprintf+0x1410>
      const char digit = (char)(value % base);
 8017df0:	c6638020 	divu      	r0, r3, r19
 8017df4:	c6608422 	mult      	r2, r0, r19
 8017df8:	60ca      	subu      	r3, r2
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8017dfa:	3b09      	cmphsi      	r3, 10
      const char digit = (char)(value % base);
 8017dfc:	748c      	zextb      	r2, r3
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8017dfe:	2100      	addi      	r1, 1
 8017e00:	0fea      	bf      	0x8017dd4	// 8017dd4 <_vsnprintf+0xc18>
 8017e02:	c6820023 	addu      	r3, r2, r20
 8017e06:	74cc      	zextb      	r3, r3
 8017e08:	07e9      	br      	0x8017dda	// 8017dda <_vsnprintf+0xc1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 8017e0a:	e46020df 	andi      	r3, r0, 223
 8017e0e:	eb430047 	cmpnei      	r3, 71
 8017e12:	0805      	bt      	0x8017e1c	// 8017e1c <_vsnprintf+0xc60>
 8017e14:	ee520800 	ori      	r18, r18, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 8017e18:	e40020fd 	andi      	r0, r0, 253
 8017e1c:	eb400045 	cmpnei      	r0, 69
 8017e20:	0803      	bt      	0x8017e26	// 8017e26 <_vsnprintf+0xc6a>
 8017e22:	ee520020 	ori      	r18, r18, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8017e26:	da6b2000 	ld.w      	r19, (r11, 0x0)
 8017e2a:	e46b0007 	addi      	r3, r11, 8
 8017e2e:	d96b2001 	ld.w      	r11, (r11, 0x4)
 8017e32:	b867      	st.w      	r3, (r14, 0x1c)
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 8017e34:	c4134822 	lsli      	r2, r19, 0
 8017e38:	c4134820 	lsli      	r0, r19, 0
 8017e3c:	6cef      	mov      	r3, r11
 8017e3e:	6c6f      	mov      	r1, r11
 8017e40:	de4e2009 	st.w      	r18, (r14, 0x24)
 8017e44:	de6e2008 	st.w      	r19, (r14, 0x20)
 8017e48:	e3ffca9c 	bsr      	0x8011380	// 8011380 <__nedf2>
 8017e4c:	da6e2008 	ld.w      	r19, (r14, 0x20)
 8017e50:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8017e54:	e920004c 	bnez      	r0, 0x8017eec	// 8017eec <_vsnprintf+0xd30>
 8017e58:	3200      	movi      	r2, 0
 8017e5a:	ea237ff0 	movih      	r3, 32752
 8017e5e:	c4134820 	lsli      	r0, r19, 0
 8017e62:	2a00      	subi      	r2, 1
 8017e64:	2b00      	subi      	r3, 1
 8017e66:	6c6f      	mov      	r1, r11
 8017e68:	e3ffcaa8 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8017e6c:	da6e2008 	ld.w      	r19, (r14, 0x20)
 8017e70:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8017e74:	e940003c 	bhz      	r0, 0x8017eec	// 8017eec <_vsnprintf+0xd30>
 8017e78:	3200      	movi      	r2, 0
 8017e7a:	ea23fff0 	movih      	r3, 65520
 8017e7e:	c4134820 	lsli      	r0, r19, 0
 8017e82:	2a00      	subi      	r2, 1
 8017e84:	2b00      	subi      	r3, 1
 8017e86:	6c6f      	mov      	r1, r11
 8017e88:	e3ffcad8 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8017e8c:	da6e2008 	ld.w      	r19, (r14, 0x20)
 8017e90:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8017e94:	e980002c 	blz      	r0, 0x8017eec	// 8017eec <_vsnprintf+0xd30>
 8017e98:	c4114822 	lsli      	r2, r17, 0
 8017e9c:	de4e2004 	st.w      	r18, (r14, 0x10)
 8017ea0:	b883      	st.w      	r4, (r14, 0xc)
 8017ea2:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8017ea6:	de6e2000 	st.w      	r19, (r14, 0x0)
 8017eaa:	dd6e2001 	st.w      	r11, (r14, 0x4)
 8017eae:	6cdf      	mov      	r3, r7
 8017eb0:	6c5b      	mov      	r1, r6
 8017eb2:	6c17      	mov      	r0, r5
 8017eb4:	e3fff130 	bsr      	0x8016114	// 8016114 <_etoa.part.0>
 8017eb8:	c4004831 	lsli      	r17, r0, 0
 8017ebc:	042a      	br      	0x8017f10	// 8017f10 <_vsnprintf+0xd54>
          out(*(p++), buffer, idx++, maxlen);
 8017ebe:	e6730000 	addi      	r19, r19, 1
 8017ec2:	c4134829 	lsli      	r9, r19, 0
 8017ec6:	c4114822 	lsli      	r2, r17, 0
 8017eca:	6cdf      	mov      	r3, r7
 8017ecc:	6c5b      	mov      	r1, r6
 8017ece:	7bd5      	jsr      	r5
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017ed0:	d8090000 	ld.b      	r0, (r9, 0x0)
          out(*(p++), buffer, idx++, maxlen);
 8017ed4:	e5710000 	addi      	r11, r17, 1
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017ed8:	c4094833 	lsli      	r19, r9, 0
          out(*(p++), buffer, idx++, maxlen);
 8017edc:	c40b4831 	lsli      	r17, r11, 0
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017ee0:	e920ffef 	bnez      	r0, 0x8017ebe	// 8017ebe <_vsnprintf+0xd02>
          out(*(p++), buffer, idx++, maxlen);
 8017ee4:	c40b4831 	lsli      	r17, r11, 0
 8017ee8:	e800fbf3 	br      	0x80176ce	// 80176ce <_vsnprintf+0x512>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8017eec:	c4114822 	lsli      	r2, r17, 0
 8017ef0:	de4e2004 	st.w      	r18, (r14, 0x10)
 8017ef4:	b883      	st.w      	r4, (r14, 0xc)
 8017ef6:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8017efa:	de6e2000 	st.w      	r19, (r14, 0x0)
 8017efe:	dd6e2001 	st.w      	r11, (r14, 0x4)
 8017f02:	6cdf      	mov      	r3, r7
 8017f04:	6c5b      	mov      	r1, r6
 8017f06:	6c17      	mov      	r0, r5
 8017f08:	e3fff630 	bsr      	0x8016b68	// 8016b68 <_ftoa>
 8017f0c:	c4004831 	lsli      	r17, r0, 0
        format++;
 8017f10:	e4900000 	addi      	r4, r16, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8017f14:	d96e2007 	ld.w      	r11, (r14, 0x1c)
        break;
 8017f18:	e800f964 	br      	0x80171e0	// 80171e0 <_vsnprintf+0x24>
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8017f1c:	2236      	addi      	r2, 55
 8017f1e:	e800fc0b 	br      	0x8017734	// 8017734 <_vsnprintf+0x578>
      const int w = va_arg(va, int);
 8017f22:	d88b2000 	ld.w      	r4, (r11, 0x0)
 8017f26:	e46b0003 	addi      	r3, r11, 4
      if (w < 0) {
 8017f2a:	e9840204 	blz      	r4, 0x8018332	// 8018332 <_vsnprintf+0x1176>
 8017f2e:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 8017f30:	6ecf      	mov      	r11, r3
      format++;
 8017f32:	e6020000 	addi      	r16, r2, 1
 8017f36:	e800f99d 	br      	0x8017270	// 8017270 <_vsnprintf+0xb4>
          out(*(pstr++), buffer, idx++, maxlen);
 8017f3a:	6e6b      	mov      	r9, r10
 8017f3c:	e5290000 	addi      	r9, r9, 1
 8017f40:	c4114822 	lsli      	r2, r17, 0
 8017f44:	c4134820 	lsli      	r0, r19, 0
 8017f48:	6cdf      	mov      	r3, r7
 8017f4a:	6c5b      	mov      	r1, r6
 8017f4c:	7bd5      	jsr      	r5
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017f4e:	da690000 	ld.b      	r19, (r9, 0x0)
          out(*(pstr++), buffer, idx++, maxlen);
 8017f52:	e5710000 	addi      	r11, r17, 1
 8017f56:	c40b4831 	lsli      	r17, r11, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017f5a:	e933fff1 	bnez      	r19, 0x8017f3c	// 8017f3c <_vsnprintf+0xd80>
          out(*(pstr++), buffer, idx++, maxlen);
 8017f5e:	c40b4831 	lsli      	r17, r11, 0
 8017f62:	0695      	br      	0x8017c8c	// 8017c8c <_vsnprintf+0xad0>
          out(*(pstr++), buffer, idx++, maxlen);
 8017f64:	6e6b      	mov      	r9, r10
 8017f66:	e5290000 	addi      	r9, r9, 1
 8017f6a:	c4114822 	lsli      	r2, r17, 0
 8017f6e:	c4134820 	lsli      	r0, r19, 0
 8017f72:	6cdf      	mov      	r3, r7
 8017f74:	6c5b      	mov      	r1, r6
 8017f76:	7bd5      	jsr      	r5
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017f78:	da690000 	ld.b      	r19, (r9, 0x0)
          out(*(pstr++), buffer, idx++, maxlen);
 8017f7c:	e5710000 	addi      	r11, r17, 1
 8017f80:	c40b4831 	lsli      	r17, r11, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8017f84:	e933fff1 	bnez      	r19, 0x8017f66	// 8017f66 <_vsnprintf+0xdaa>
          out(*(pstr++), buffer, idx++, maxlen);
 8017f88:	c40b4831 	lsli      	r17, r11, 0
 8017f8c:	e800fda0 	br      	0x8017acc	// 8017acc <_vsnprintf+0x910>
 8017f90:	d8100002 	ld.b      	r0, (r16, 0x2)
          flags |= FLAGS_LONG_LONG;
 8017f94:	ee520300 	ori      	r18, r18, 768
          format++;
 8017f98:	e6100001 	addi      	r16, r16, 2
 8017f9c:	e800f980 	br      	0x801729c	// 801729c <_vsnprintf+0xe0>
 8017fa0:	d8100002 	ld.b      	r0, (r16, 0x2)
          flags |= FLAGS_CHAR;
 8017fa4:	ee5200c0 	ori      	r18, r18, 192
          format++;
 8017fa8:	e6100001 	addi      	r16, r16, 2
 8017fac:	e800f978 	br      	0x801729c	// 801729c <_vsnprintf+0xe0>
        unsigned int l = __mac2str((unsigned char *)p, store);
 8017fb0:	3311      	movi      	r3, 17
 8017fb2:	b868      	st.w      	r3, (r14, 0x20)
 8017fb4:	062d      	br      	0x8017c0e	// 8017c0e <_vsnprintf+0xa52>
        unsigned int l = __ip2str(6, (unsigned int *)ipv6, store);
 8017fb6:	3327      	movi      	r3, 39
 8017fb8:	b868      	st.w      	r3, (r14, 0x20)
 8017fba:	e800fd4a 	br      	0x8017a4e	// 8017a4e <_vsnprintf+0x892>
                    outtxt[j++] = '0' + l;
 8017fbe:	232f      	addi      	r3, 48
 8017fc0:	e800fd38 	br      	0x8017a30	// 8017a30 <_vsnprintf+0x874>
                    outtxt[j++] = 'A' + h - 10;
 8017fc4:	2236      	addi      	r2, 55
 8017fc6:	e800fd2e 	br      	0x8017a22	// 8017a22 <_vsnprintf+0x866>
                    outtxt[j++] = '0' + l;
 8017fca:	222f      	addi      	r2, 48
 8017fcc:	e800fd21 	br      	0x8017a0e	// 8017a0e <_vsnprintf+0x852>
                    outtxt[j++] = 'A' + h - 10;
 8017fd0:	2136      	addi      	r1, 55
 8017fd2:	e800fd17 	br      	0x8017a00	// 8017a00 <_vsnprintf+0x844>
                    outtxt[j++] = '0' + l;
 8017fd6:	222f      	addi      	r2, 48
 8017fd8:	e800fd06 	br      	0x80179e4	// 80179e4 <_vsnprintf+0x828>
                    outtxt[j++] = 'A' + h - 10;
 8017fdc:	2136      	addi      	r1, 55
 8017fde:	e800fcfc 	br      	0x80179d6	// 80179d6 <_vsnprintf+0x81a>
                    outtxt[j++] = '0' + l;
 8017fe2:	222f      	addi      	r2, 48
 8017fe4:	e800fcee 	br      	0x80179c0	// 80179c0 <_vsnprintf+0x804>
                    outtxt[j++] = 'A' + h - 10;
 8017fe8:	2136      	addi      	r1, 55
 8017fea:	e800fce4 	br      	0x80179b2	// 80179b2 <_vsnprintf+0x7f6>
                    outtxt[j++] = '0' + l;
 8017fee:	232f      	addi      	r3, 48
 8017ff0:	e800fcd3 	br      	0x8017996	// 8017996 <_vsnprintf+0x7da>
                    outtxt[j++] = 'A' + h - 10;
 8017ff4:	2136      	addi      	r1, 55
 8017ff6:	e800fcc9 	br      	0x8017988	// 8017988 <_vsnprintf+0x7cc>
                    outtxt[j++] = '0' + l;
 8017ffa:	212f      	addi      	r1, 48
 8017ffc:	e800fcbc 	br      	0x8017974	// 8017974 <_vsnprintf+0x7b8>
                    outtxt[j++] = 'A' + h - 10;
 8018000:	2036      	addi      	r0, 55
 8018002:	e800fcb2 	br      	0x8017966	// 8017966 <_vsnprintf+0x7aa>
                    outtxt[j++] = '0' + l;
 8018006:	212f      	addi      	r1, 48
 8018008:	e800fca1 	br      	0x801794a	// 801794a <_vsnprintf+0x78e>
                    outtxt[j++] = 'A' + h - 10;
 801800c:	2036      	addi      	r0, 55
 801800e:	e800fc97 	br      	0x801793c	// 801793c <_vsnprintf+0x780>
                    outtxt[j++] = '0' + l;
 8018012:	212f      	addi      	r1, 48
 8018014:	e800fc89 	br      	0x8017926	// 8017926 <_vsnprintf+0x76a>
                    outtxt[j++] = 'A' + h - 10;
 8018018:	2036      	addi      	r0, 55
 801801a:	e800fc7f 	br      	0x8017918	// 8017918 <_vsnprintf+0x75c>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801801e:	e920fb3c 	bnez      	r0, 0x8017696	// 8017696 <_vsnprintf+0x4da>
 8018022:	e800fb59 	br      	0x80176d4	// 80176d4 <_vsnprintf+0x518>
    flags &= ~FLAGS_HASH;
 8018026:	c4922835 	bclri      	r21, r18, 4
  if (!(flags & FLAGS_PRECISION) || value) {
 801802a:	e6522400 	andi      	r18, r18, 1024
    flags &= ~FLAGS_HASH;
 801802e:	eeb50021 	ori      	r21, r21, 33
  if (!(flags & FLAGS_PRECISION) || value) {
 8018032:	e912fb73 	bez      	r18, 0x8017718	// 8017718 <_vsnprintf+0x55c>
  size_t len = 0U;
 8018036:	c4034834 	lsli      	r20, r3, 0
 801803a:	e800fb84 	br      	0x8017742	// 8017742 <_vsnprintf+0x586>
            m = (bit % 100) / 10;
 801803e:	c6618421 	mult      	r1, r1, r19
 8018042:	60c6      	subu      	r3, r1
 8018044:	74cc      	zextb      	r3, r3
 8018046:	ea15000a 	movi      	r21, 10
 801804a:	c6a38035 	divu      	r21, r3, r21
            if (m)
 801804e:	e915008b 	bez      	r21, 0x8018164	// 8018164 <_vsnprintf+0xfa8>
 8018052:	ea130003 	movi      	r19, 3
 8018056:	ea160001 	movi      	r22, 1
 801805a:	ea170002 	movi      	r23, 2
 801805e:	c4134820 	lsli      	r0, r19, 0
 8018062:	c40a4834 	lsli      	r20, r10, 0
 8018066:	c4164821 	lsli      	r1, r22, 0
 801806a:	e800f9b2 	br      	0x80173ce	// 80173ce <_vsnprintf+0x212>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 801806e:	e6510000 	addi      	r18, r17, 1
 8018072:	de4e2007 	st.w      	r18, (r14, 0x1c)
 8018076:	6cdf      	mov      	r3, r7
 8018078:	c4114822 	lsli      	r2, r17, 0
 801807c:	6c5b      	mov      	r1, r6
 801807e:	d80b0000 	ld.b      	r0, (r11, 0x0)
 8018082:	7bd5      	jsr      	r5
          while (l++ < width) {
 8018084:	3c01      	cmphsi      	r4, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8018086:	e52b0003 	addi      	r9, r11, 4
          while (l++ < width) {
 801808a:	da4e2007 	ld.w      	r18, (r14, 0x1c)
 801808e:	e8400315 	bf      	0x80186b8	// 80186b8 <_vsnprintf+0x14fc>
 8018092:	c6240024 	addu      	r4, r4, r17
            out(' ', buffer, idx++, maxlen);
 8018096:	e5720000 	addi      	r11, r18, 1
 801809a:	c4124822 	lsli      	r2, r18, 0
 801809e:	6cdf      	mov      	r3, r7
 80180a0:	6c5b      	mov      	r1, r6
 80180a2:	3020      	movi      	r0, 32
 80180a4:	7bd5      	jsr      	r5
          while (l++ < width) {
 80180a6:	652e      	cmpne      	r11, r4
 80180a8:	c40b4832 	lsli      	r18, r11, 0
 80180ac:	0bf5      	bt      	0x8018096	// 8018096 <_vsnprintf+0xeda>
 80180ae:	c40b4831 	lsli      	r17, r11, 0
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80180b2:	6ee7      	mov      	r11, r9
 80180b4:	e800fb83 	br      	0x80177ba	// 80177ba <_vsnprintf+0x5fe>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80180b8:	2336      	addi      	r3, 55
 80180ba:	e800fd9b 	br      	0x8017bf0	// 8017bf0 <_vsnprintf+0xa34>
            outtxt[3 * i] = 'A' + hbit - 10;
 80180be:	2236      	addi      	r2, 55
 80180c0:	e800fd92 	br      	0x8017be4	// 8017be4 <_vsnprintf+0xa28>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80180c4:	2336      	addi      	r3, 55
 80180c6:	e800fd82 	br      	0x8017bca	// 8017bca <_vsnprintf+0xa0e>
            outtxt[3 * i] = 'A' + hbit - 10;
 80180ca:	2136      	addi      	r1, 55
 80180cc:	e800fd79 	br      	0x8017bbe	// 8017bbe <_vsnprintf+0xa02>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80180d0:	2336      	addi      	r3, 55
 80180d2:	e800fd69 	br      	0x8017ba4	// 8017ba4 <_vsnprintf+0x9e8>
            outtxt[3 * i] = 'A' + hbit - 10;
 80180d6:	2136      	addi      	r1, 55
 80180d8:	e800fd60 	br      	0x8017b98	// 8017b98 <_vsnprintf+0x9dc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80180dc:	2336      	addi      	r3, 55
 80180de:	e800fd50 	br      	0x8017b7e	// 8017b7e <_vsnprintf+0x9c2>
            outtxt[3 * i] = 'A' + hbit - 10;
 80180e2:	2136      	addi      	r1, 55
 80180e4:	e800fd47 	br      	0x8017b72	// 8017b72 <_vsnprintf+0x9b6>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80180e8:	2336      	addi      	r3, 55
 80180ea:	e800fd37 	br      	0x8017b58	// 8017b58 <_vsnprintf+0x99c>
            outtxt[3 * i] = 'A' + hbit - 10;
 80180ee:	2136      	addi      	r1, 55
 80180f0:	e800fd2e 	br      	0x8017b4c	// 8017b4c <_vsnprintf+0x990>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80180f4:	2336      	addi      	r3, 55
 80180f6:	e800fd1e 	br      	0x8017b32	// 8017b32 <_vsnprintf+0x976>
            outtxt[3 * i] = 'A' + hbit - 10;
 80180fa:	e6730036 	addi      	r19, r19, 55
 80180fe:	e800fd14 	br      	0x8017b26	// 8017b26 <_vsnprintf+0x96a>
                    outtxt[j++] = '0' + l;
 8018102:	232f      	addi      	r3, 48
 8018104:	e800fbfc 	br      	0x80178fc	// 80178fc <_vsnprintf+0x740>
                    outtxt[j++] = 'A' + h - 10;
 8018108:	2136      	addi      	r1, 55
 801810a:	e800fbf2 	br      	0x80178ee	// 80178ee <_vsnprintf+0x732>
                    outtxt[j++] = '0' + l;
 801810e:	212f      	addi      	r1, 48
 8018110:	e800fbe5 	br      	0x80178da	// 80178da <_vsnprintf+0x71e>
                    outtxt[j++] = 'A' + h - 10;
 8018114:	2036      	addi      	r0, 55
 8018116:	e800fbdb 	br      	0x80178cc	// 80178cc <_vsnprintf+0x710>
                    outtxt[j++] = '0' + l;
 801811a:	212f      	addi      	r1, 48
 801811c:	e800fbca 	br      	0x80178b0	// 80178b0 <_vsnprintf+0x6f4>
                    outtxt[j++] = 'A' + h - 10;
 8018120:	2036      	addi      	r0, 55
 8018122:	e800fbc0 	br      	0x80178a2	// 80178a2 <_vsnprintf+0x6e6>
                    outtxt[j++] = '0' + l;
 8018126:	212f      	addi      	r1, 48
 8018128:	e800fbb2 	br      	0x801788c	// 801788c <_vsnprintf+0x6d0>
                    outtxt[j++] = 'A' + h - 10;
 801812c:	2036      	addi      	r0, 55
 801812e:	e800fba8 	br      	0x801787e	// 801787e <_vsnprintf+0x6c2>
                    outtxt[j++] = '0' + l;
 8018132:	232f      	addi      	r3, 48
 8018134:	e800fb97 	br      	0x8017862	// 8017862 <_vsnprintf+0x6a6>
                    outtxt[j++] = 'A' + h - 10;
 8018138:	2136      	addi      	r1, 55
 801813a:	e800fb8d 	br      	0x8017854	// 8017854 <_vsnprintf+0x698>
                    outtxt[j++] = '0' + l;
 801813e:	212f      	addi      	r1, 48
 8018140:	e800fb80 	br      	0x8017840	// 8017840 <_vsnprintf+0x684>
                    outtxt[j++] = 'A' + h - 10;
 8018144:	2036      	addi      	r0, 55
 8018146:	e800fb76 	br      	0x8017832	// 8017832 <_vsnprintf+0x676>
                    outtxt[j++] = '0' + l;
 801814a:	212f      	addi      	r1, 48
 801814c:	e800fb65 	br      	0x8017816	// 8017816 <_vsnprintf+0x65a>
                    outtxt[j++] = 'A' + h - 10;
 8018150:	2036      	addi      	r0, 55
 8018152:	e800fb5b 	br      	0x8017808	// 8017808 <_vsnprintf+0x64c>
                    outtxt[j++] = '0' + l;
 8018156:	212f      	addi      	r1, 48
 8018158:	e800fb4d 	br      	0x80177f2	// 80177f2 <_vsnprintf+0x636>
                    outtxt[j++] = 'A' + h - 10;
 801815c:	e6730036 	addi      	r19, r19, 55
 8018160:	e800fb42 	br      	0x80177e4	// 80177e4 <_vsnprintf+0x628>
            if (m)
 8018164:	ea130002 	movi      	r19, 2
 8018168:	ea170001 	movi      	r23, 1
 801816c:	c4134820 	lsli      	r0, r19, 0
 8018170:	c40a4836 	lsli      	r22, r10, 0
 8018174:	e800f935 	br      	0x80173de	// 80173de <_vsnprintf+0x222>
                    outtxt[j++] = '0';
 8018178:	3130      	movi      	r1, 48
 801817a:	ea130004 	movi      	r19, 4
 801817e:	dc2a0001 	st.b      	r1, (r10, 0x1)
 8018182:	ea170003 	movi      	r23, 3
 8018186:	c4134820 	lsli      	r0, r19, 0
 801818a:	e6ce003d 	addi      	r22, r14, 62
 801818e:	ea150002 	movi      	r21, 2
 8018192:	e800f926 	br      	0x80173de	// 80173de <_vsnprintf+0x222>
          base =  8U;
 8018196:	ea130008 	movi      	r19, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 801819a:	c4522823 	bclri      	r3, r18, 2
 801819e:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80181a0:	e6522400 	andi      	r18, r18, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 80181a4:	b867      	st.w      	r3, (r14, 0x1c)
        if (flags & FLAGS_PRECISION) {
 80181a6:	e912fde1 	bez      	r18, 0x8017d68	// 8017d68 <_vsnprintf+0xbac>
 80181aa:	e800fddd 	br      	0x8017d64	// 8017d64 <_vsnprintf+0xba8>
          out(*(pstr++), buffer, idx++, maxlen);
 80181ae:	6e6b      	mov      	r9, r10
 80181b0:	e5290000 	addi      	r9, r9, 1
 80181b4:	c4114822 	lsli      	r2, r17, 0
 80181b8:	6cdf      	mov      	r3, r7
 80181ba:	6c5b      	mov      	r1, r6
 80181bc:	7bd5      	jsr      	r5
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80181be:	d8090000 	ld.b      	r0, (r9, 0x0)
          out(*(pstr++), buffer, idx++, maxlen);
 80181c2:	e5710000 	addi      	r11, r17, 1
 80181c6:	c40b4831 	lsli      	r17, r11, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80181ca:	e920fff3 	bnez      	r0, 0x80181b0	// 80181b0 <_vsnprintf+0xff4>
          out(*(pstr++), buffer, idx++, maxlen);
 80181ce:	c40b4831 	lsli      	r17, r11, 0
 80181d2:	e800f9f8 	br      	0x80175c2	// 80175c2 <_vsnprintf+0x406>
            m = (bit % 100) / 10;
 80181d6:	c6e38423 	mult      	r3, r3, r23
 80181da:	c4730083 	subu      	r3, r19, r3
 80181de:	c40354f3 	zext      	r19, r3, 7, 0
 80181e2:	c6938034 	divu      	r20, r19, r20
            if (m)
 80181e6:	e914f95e 	bez      	r20, 0x80174a2	// 80174a2 <_vsnprintf+0x2e6>
                outtxt[j++] = '0' + m;
 80181ea:	5962      	addi      	r3, r1, 1
 80181ec:	e694002f 	addi      	r20, r20, 48
 80181f0:	d42a0034 	str.b      	r20, (r10, r1 << 0)
 80181f4:	744c      	zextb      	r1, r3
 80181f6:	e800f956 	br      	0x80174a2	// 80174a2 <_vsnprintf+0x2e6>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80181fa:	d80a0000 	ld.b      	r0, (r10, 0x0)
 80181fe:	e920f9c7 	bnez      	r0, 0x801758c	// 801758c <_vsnprintf+0x3d0>
 8018202:	e800f9e3 	br      	0x80175c8	// 80175c8 <_vsnprintf+0x40c>
            m = (bit % 100) / 10;
 8018206:	c6d38433 	mult      	r19, r19, r22
 801820a:	c6620082 	subu      	r2, r2, r19
 801820e:	7488      	zextb      	r2, r2
 8018210:	c4028020 	divu      	r0, r2, r0
            if (m)
 8018214:	e900f979 	bez      	r0, 0x8017506	// 8017506 <_vsnprintf+0x34a>
                outtxt[j++] = '0' + m;
 8018218:	5b22      	addi      	r1, r3, 1
 801821a:	202f      	addi      	r0, 48
 801821c:	d46a0020 	str.b      	r0, (r10, r3 << 0)
 8018220:	74c4      	zextb      	r3, r1
 8018222:	e800f972 	br      	0x8017506	// 8017506 <_vsnprintf+0x34a>
            m = (bit % 100) / 10;
 8018226:	c6e38423 	mult      	r3, r3, r23
 801822a:	596d      	subu      	r3, r1, r3
 801822c:	744c      	zextb      	r1, r3
 801822e:	c6818034 	divu      	r20, r1, r20
            if (m)
 8018232:	e914f905 	bez      	r20, 0x801743c	// 801743c <_vsnprintf+0x280>
                outtxt[j++] = '0' + m;
 8018236:	2000      	addi      	r0, 1
 8018238:	7400      	zextb      	r0, r0
 801823a:	e694002f 	addi      	r20, r20, 48
 801823e:	d66a0034 	str.b      	r20, (r10, r19 << 0)
 8018242:	c4004833 	lsli      	r19, r0, 0
 8018246:	e800f8fb 	br      	0x801743c	// 801743c <_vsnprintf+0x280>
        if ((*format != 'i') && (*format != 'd')) {
 801824a:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 801824e:	c4034832 	lsli      	r18, r3, 0
          base = 10U;
 8018252:	ea13000a 	movi      	r19, 10
        if ((*format != 'i') && (*format != 'd')) {
 8018256:	0ba2      	bt      	0x801819a	// 801819a <_vsnprintf+0xfde>
        if (flags & FLAGS_PRECISION) {
 8018258:	e6432400 	andi      	r18, r3, 1024
 801825c:	e932fd84 	bnez      	r18, 0x8017d64	// 8017d64 <_vsnprintf+0xba8>
          if (flags & FLAGS_LONG_LONG) {
 8018260:	9867      	ld.w      	r3, (r14, 0x1c)
 8018262:	e4032200 	andi      	r0, r3, 512
 8018266:	e92000f1 	bnez      	r0, 0x8018448	// 8018448 <_vsnprintf+0x128c>
          else if (flags & FLAGS_LONG) {
 801826a:	e4232100 	andi      	r1, r3, 256
 801826e:	e92101c5 	bnez      	r1, 0x80185f8	// 80185f8 <_vsnprintf+0x143c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8018272:	e4632040 	andi      	r3, r3, 64
 8018276:	e9230204 	bnez      	r3, 0x801867e	// 801867e <_vsnprintf+0x14c2>
 801827a:	9867      	ld.w      	r3, (r14, 0x1c)
 801827c:	e4632080 	andi      	r3, r3, 128
 8018280:	e9230189 	bnez      	r3, 0x8018592	// 8018592 <_vsnprintf+0x13d6>
 8018284:	d84b2000 	ld.w      	r2, (r11, 0x0)
 8018288:	c7e24855 	lsri      	r21, r2, 31
 801828c:	e56b0003 	addi      	r11, r11, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8018290:	c4020203 	abs      	r3, r2
  if (!value) {
 8018294:	e922000a 	bnez      	r2, 0x80182a8	// 80182a8 <_vsnprintf+0x10ec>
    flags &= ~FLAGS_HASH;
 8018298:	9807      	ld.w      	r0, (r14, 0x1c)
 801829a:	c4802822 	bclri      	r2, r0, 4
  if (!(flags & FLAGS_PRECISION) || value) {
 801829e:	e4002400 	andi      	r0, r0, 1024
    flags &= ~FLAGS_HASH;
 80182a2:	b847      	st.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION) || value) {
 80182a4:	e92001a0 	bnez      	r0, 0x80185e4	// 80185e4 <_vsnprintf+0x1428>
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80182a8:	9847      	ld.w      	r2, (r14, 0x1c)
 80182aa:	e4422020 	andi      	r2, r2, 32
 80182ae:	3a40      	cmpnei      	r2, 0
 80182b0:	ea140041 	movi      	r20, 65
 80182b4:	3261      	movi      	r2, 97
 80182b6:	c6820c20 	incf      	r20, r2, 0
 80182ba:	c40a4832 	lsli      	r18, r10, 0
 80182be:	e6941009 	subi      	r20, r20, 10
 80182c2:	040d      	br      	0x80182dc	// 80182dc <_vsnprintf+0x1120>
 80182c4:	232f      	addi      	r3, 48
 80182c6:	74cc      	zextb      	r3, r3
 80182c8:	dc720000 	st.b      	r3, (r18, 0x0)
      value /= base;
 80182cc:	6cc3      	mov      	r3, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80182ce:	e900018b 	bez      	r0, 0x80185e4	// 80185e4 <_vsnprintf+0x1428>
 80182d2:	eb410020 	cmpnei      	r1, 32
 80182d6:	e6520000 	addi      	r18, r18, 1
 80182da:	0d85      	bf      	0x80185e4	// 80185e4 <_vsnprintf+0x1428>
      const char digit = (char)(value % base);
 80182dc:	c6638020 	divu      	r0, r3, r19
 80182e0:	c6608422 	mult      	r2, r0, r19
 80182e4:	5b49      	subu      	r2, r3, r2
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80182e6:	3a09      	cmphsi      	r2, 10
      const char digit = (char)(value % base);
 80182e8:	74c8      	zextb      	r3, r2
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80182ea:	2100      	addi      	r1, 1
 80182ec:	0fec      	bf      	0x80182c4	// 80182c4 <_vsnprintf+0x1108>
 80182ee:	c6830023 	addu      	r3, r3, r20
 80182f2:	74cc      	zextb      	r3, r3
 80182f4:	07ea      	br      	0x80182c8	// 80182c8 <_vsnprintf+0x110c>
 80182f6:	c4522823 	bclri      	r3, r18, 2
 80182fa:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80182fc:	e6522400 	andi      	r18, r18, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8018300:	ec630020 	ori      	r3, r3, 32
 8018304:	b867      	st.w      	r3, (r14, 0x1c)
          base = 16U;
 8018306:	ea130010 	movi      	r19, 16
        if (flags & FLAGS_PRECISION) {
 801830a:	e932fd2d 	bnez      	r18, 0x8017d64	// 8017d64 <_vsnprintf+0xba8>
 801830e:	e800fd35 	br      	0x8017d78	// 8017d78 <_vsnprintf+0xbbc>
          base = 16U;
 8018312:	ea130010 	movi      	r19, 16
 8018316:	0742      	br      	0x801819a	// 801819a <_vsnprintf+0xfde>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8018318:	ee520020 	ori      	r18, r18, 32
 801831c:	e800fcd9 	br      	0x8017cce	// 8017cce <_vsnprintf+0xb12>
                outtxt[j++] = '0' + h;
 8018320:	c4154821 	lsli      	r1, r21, 0
 8018324:	0763      	br      	0x80181ea	// 80181ea <_vsnprintf+0x102e>
 8018326:	c4004833 	lsli      	r19, r0, 0
 801832a:	0786      	br      	0x8018236	// 8018236 <_vsnprintf+0x107a>
 801832c:	c4154823 	lsli      	r3, r21, 0
 8018330:	0774      	br      	0x8018218	// 8018218 <_vsnprintf+0x105c>
        width = (unsigned int)-w;
 8018332:	3100      	movi      	r1, 0
        flags |= FLAGS_LEFT;    // reverse padding
 8018334:	ee520002 	ori      	r18, r18, 2
        width = (unsigned int)-w;
 8018338:	5991      	subu      	r4, r1, r4
 801833a:	e800fdfa 	br      	0x8017f2e	// 8017f2e <_vsnprintf+0xd72>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 801833e:	d92b2000 	ld.w      	r9, (r11, 0x0)
 8018342:	3300      	movi      	r3, 0
 8018344:	d8100002 	ld.b      	r0, (r16, 0x2)
 8018348:	f869cca9 	max.s32      	r9, r9, r3
        const int prec = (int)va_arg(va, int);
 801834c:	e56b0003 	addi      	r11, r11, 4
        format++;
 8018350:	e6100001 	addi      	r16, r16, 2
 8018354:	e800f793 	br      	0x801727a	// 801727a <_vsnprintf+0xbe>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8018358:	da4b2000 	ld.w      	r18, (r11, 0x0)
 801835c:	da8b2001 	ld.w      	r20, (r11, 0x4)
 8018360:	e46b0007 	addi      	r3, r11, 8
  if (!value) {
 8018364:	c692242b 	or      	r11, r18, r20
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8018368:	b86d      	st.w      	r3, (r14, 0x34)
  if (!value) {
 801836a:	e90b004d 	bez      	r11, 0x8018404	// 8018404 <_vsnprintf+0x1248>
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801836e:	9867      	ld.w      	r3, (r14, 0x1c)
 8018370:	e4632020 	andi      	r3, r3, 32
 8018374:	3b40      	cmpnei      	r3, 0
 8018376:	3261      	movi      	r2, 97
 8018378:	3341      	movi      	r3, 65
 801837a:	c4620c20 	incf      	r3, r2, 0
 801837e:	2b09      	subi      	r3, 10
 8018380:	dd4e2008 	st.w      	r10, (r14, 0x20)
 8018384:	ea0b0000 	movi      	r11, 0
 8018388:	b86c      	st.w      	r3, (r14, 0x30)
 801838a:	041f      	br      	0x80183c8	// 80183c8 <_vsnprintf+0x120c>
 801838c:	232f      	addi      	r3, 48
 801838e:	74cc      	zextb      	r3, r3
 8018390:	9848      	ld.w      	r2, (r14, 0x20)
      value /= base;
 8018392:	c4124820 	lsli      	r0, r18, 0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8018396:	a260      	st.b      	r3, (r2, 0x0)
      value /= base;
 8018398:	c4144821 	lsli      	r1, r20, 0
 801839c:	c4134822 	lsli      	r2, r19, 0
 80183a0:	3300      	movi      	r3, 0
 80183a2:	de6e2009 	st.w      	r19, (r14, 0x24)
 80183a6:	e3ffc187 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 80183aa:	c4014834 	lsli      	r20, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80183ae:	6c40      	or      	r1, r0
      value /= base;
 80183b0:	c4004832 	lsli      	r18, r0, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80183b4:	da6e2009 	ld.w      	r19, (r14, 0x24)
 80183b8:	e901002e 	bez      	r1, 0x8018414	// 8018414 <_vsnprintf+0x1258>
 80183bc:	9868      	ld.w      	r3, (r14, 0x20)
 80183be:	eb4b0020 	cmpnei      	r11, 32
 80183c2:	2300      	addi      	r3, 1
 80183c4:	b868      	st.w      	r3, (r14, 0x20)
 80183c6:	0c27      	bf      	0x8018414	// 8018414 <_vsnprintf+0x1258>
      const char digit = (char)(value % base);
 80183c8:	c4134822 	lsli      	r2, r19, 0
 80183cc:	3300      	movi      	r3, 0
 80183ce:	c4124820 	lsli      	r0, r18, 0
 80183d2:	c4144821 	lsli      	r1, r20, 0
 80183d6:	de6e200b 	st.w      	r19, (r14, 0x2c)
 80183da:	de4e200a 	st.w      	r18, (r14, 0x28)
 80183de:	de8e2009 	st.w      	r20, (r14, 0x24)
 80183e2:	e3ffc303 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 80183e6:	74c0      	zextb      	r3, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80183e8:	3b09      	cmphsi      	r3, 10
 80183ea:	e56b0000 	addi      	r11, r11, 1
 80183ee:	da8e2009 	ld.w      	r20, (r14, 0x24)
 80183f2:	da4e200a 	ld.w      	r18, (r14, 0x28)
 80183f6:	da6e200b 	ld.w      	r19, (r14, 0x2c)
 80183fa:	0fc9      	bf      	0x801838c	// 801838c <_vsnprintf+0x11d0>
 80183fc:	984c      	ld.w      	r2, (r14, 0x30)
 80183fe:	60c8      	addu      	r3, r2
 8018400:	74cc      	zextb      	r3, r3
 8018402:	07c7      	br      	0x8018390	// 8018390 <_vsnprintf+0x11d4>
    flags &= ~FLAGS_HASH;
 8018404:	9847      	ld.w      	r2, (r14, 0x1c)
 8018406:	c4822823 	bclri      	r3, r2, 4
  if (!(flags & FLAGS_PRECISION) || value) {
 801840a:	e4422400 	andi      	r2, r2, 1024
    flags &= ~FLAGS_HASH;
 801840e:	b867      	st.w      	r3, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION) || value) {
 8018410:	e902ffaf 	bez      	r2, 0x801836e	// 801836e <_vsnprintf+0x11b2>
  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8018414:	9867      	ld.w      	r3, (r14, 0x1c)
 8018416:	b866      	st.w      	r3, (r14, 0x18)
 8018418:	b885      	st.w      	r4, (r14, 0x14)
 801841a:	dd2e2004 	st.w      	r9, (r14, 0x10)
 801841e:	de6e2003 	st.w      	r19, (r14, 0xc)
 8018422:	3300      	movi      	r3, 0
 8018424:	b862      	st.w      	r3, (r14, 0x8)
 8018426:	dd6e2001 	st.w      	r11, (r14, 0x4)
 801842a:	c4114822 	lsli      	r2, r17, 0
 801842e:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8018432:	6cdf      	mov      	r3, r7
 8018434:	6c5b      	mov      	r1, r6
 8018436:	6c17      	mov      	r0, r5
 8018438:	e3ffed68 	bsr      	0x8015f08	// 8015f08 <_ntoa_format>
 801843c:	c4004831 	lsli      	r17, r0, 0
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8018440:	d96e200d 	ld.w      	r11, (r14, 0x34)
 8018444:	e800f9bb 	br      	0x80177ba	// 80177ba <_vsnprintf+0x5fe>
            const long long value = va_arg(va, long long);
 8018448:	e46b0007 	addi      	r3, r11, 8
 801844c:	d82b2000 	ld.w      	r1, (r11, 0x0)
 8018450:	d96b2001 	ld.w      	r11, (r11, 0x4)
 8018454:	b86d      	st.w      	r3, (r14, 0x34)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8018456:	6c87      	mov      	r2, r1
 8018458:	6cef      	mov      	r3, r11
 801845a:	e98b0134 	blz      	r11, 0x80186c2	// 80186c2 <_vsnprintf+0x1506>
 801845e:	c4034834 	lsli      	r20, r3, 0
 8018462:	c7eb4843 	lsri      	r3, r11, 31
  if (!value) {
 8018466:	6ec4      	or      	r11, r1
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8018468:	c4024832 	lsli      	r18, r2, 0
 801846c:	b86e      	st.w      	r3, (r14, 0x38)
  if (!value) {
 801846e:	e90b004d 	bez      	r11, 0x8018508	// 8018508 <_vsnprintf+0x134c>
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8018472:	9867      	ld.w      	r3, (r14, 0x1c)
 8018474:	e4632020 	andi      	r3, r3, 32
 8018478:	3b40      	cmpnei      	r3, 0
 801847a:	3261      	movi      	r2, 97
 801847c:	3341      	movi      	r3, 65
 801847e:	c4620c20 	incf      	r3, r2, 0
 8018482:	2b09      	subi      	r3, 10
 8018484:	dd4e2008 	st.w      	r10, (r14, 0x20)
 8018488:	ea0b0000 	movi      	r11, 0
 801848c:	b86c      	st.w      	r3, (r14, 0x30)
 801848e:	041f      	br      	0x80184cc	// 80184cc <_vsnprintf+0x1310>
 8018490:	232f      	addi      	r3, 48
 8018492:	74cc      	zextb      	r3, r3
 8018494:	9848      	ld.w      	r2, (r14, 0x20)
      value /= base;
 8018496:	c4124820 	lsli      	r0, r18, 0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801849a:	a260      	st.b      	r3, (r2, 0x0)
      value /= base;
 801849c:	c4144821 	lsli      	r1, r20, 0
 80184a0:	c4134822 	lsli      	r2, r19, 0
 80184a4:	3300      	movi      	r3, 0
 80184a6:	de6e2009 	st.w      	r19, (r14, 0x24)
 80184aa:	e3ffc105 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 80184ae:	c4014834 	lsli      	r20, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80184b2:	6c40      	or      	r1, r0
      value /= base;
 80184b4:	c4004832 	lsli      	r18, r0, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80184b8:	da6e2009 	ld.w      	r19, (r14, 0x24)
 80184bc:	e901002e 	bez      	r1, 0x8018518	// 8018518 <_vsnprintf+0x135c>
 80184c0:	9868      	ld.w      	r3, (r14, 0x20)
 80184c2:	eb4b0020 	cmpnei      	r11, 32
 80184c6:	2300      	addi      	r3, 1
 80184c8:	b868      	st.w      	r3, (r14, 0x20)
 80184ca:	0c27      	bf      	0x8018518	// 8018518 <_vsnprintf+0x135c>
      const char digit = (char)(value % base);
 80184cc:	c4134822 	lsli      	r2, r19, 0
 80184d0:	3300      	movi      	r3, 0
 80184d2:	c4124820 	lsli      	r0, r18, 0
 80184d6:	c4144821 	lsli      	r1, r20, 0
 80184da:	de6e200b 	st.w      	r19, (r14, 0x2c)
 80184de:	de4e200a 	st.w      	r18, (r14, 0x28)
 80184e2:	de8e2009 	st.w      	r20, (r14, 0x24)
 80184e6:	e3ffc281 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 80184ea:	74c0      	zextb      	r3, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80184ec:	3b09      	cmphsi      	r3, 10
 80184ee:	e56b0000 	addi      	r11, r11, 1
 80184f2:	da8e2009 	ld.w      	r20, (r14, 0x24)
 80184f6:	da4e200a 	ld.w      	r18, (r14, 0x28)
 80184fa:	da6e200b 	ld.w      	r19, (r14, 0x2c)
 80184fe:	0fc9      	bf      	0x8018490	// 8018490 <_vsnprintf+0x12d4>
 8018500:	984c      	ld.w      	r2, (r14, 0x30)
 8018502:	60c8      	addu      	r3, r2
 8018504:	74cc      	zextb      	r3, r3
 8018506:	07c7      	br      	0x8018494	// 8018494 <_vsnprintf+0x12d8>
    flags &= ~FLAGS_HASH;
 8018508:	9847      	ld.w      	r2, (r14, 0x1c)
 801850a:	c4822823 	bclri      	r3, r2, 4
  if (!(flags & FLAGS_PRECISION) || value) {
 801850e:	e4422400 	andi      	r2, r2, 1024
    flags &= ~FLAGS_HASH;
 8018512:	b867      	st.w      	r3, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION) || value) {
 8018514:	e902ffaf 	bez      	r2, 0x8018472	// 8018472 <_vsnprintf+0x12b6>
  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8018518:	9867      	ld.w      	r3, (r14, 0x1c)
 801851a:	b866      	st.w      	r3, (r14, 0x18)
 801851c:	b885      	st.w      	r4, (r14, 0x14)
 801851e:	dd2e2004 	st.w      	r9, (r14, 0x10)
 8018522:	de6e2003 	st.w      	r19, (r14, 0xc)
 8018526:	986e      	ld.w      	r3, (r14, 0x38)
 8018528:	077e      	br      	0x8018424	// 8018424 <_vsnprintf+0x1268>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 801852a:	d86b2000 	ld.w      	r3, (r11, 0x0)
 801852e:	e64b0003 	addi      	r18, r11, 4
  if (!value) {
 8018532:	e9030037 	bez      	r3, 0x80185a0	// 80185a0 <_vsnprintf+0x13e4>
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8018536:	9847      	ld.w      	r2, (r14, 0x1c)
 8018538:	e4422020 	andi      	r2, r2, 32
 801853c:	3a40      	cmpnei      	r2, 0
 801853e:	ea150041 	movi      	r21, 65
 8018542:	3261      	movi      	r2, 97
 8018544:	c6a20c20 	incf      	r21, r2, 0
 8018548:	6c6b      	mov      	r1, r10
 801854a:	e6b51009 	subi      	r21, r21, 10
 801854e:	040c      	br      	0x8018566	// 8018566 <_vsnprintf+0x13aa>
 8018550:	232f      	addi      	r3, 48
 8018552:	74cc      	zextb      	r3, r3
 8018554:	a160      	st.b      	r3, (r1, 0x0)
      value /= base;
 8018556:	c4144823 	lsli      	r3, r20, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 801855a:	e914002b 	bez      	r20, 0x80185b0	// 80185b0 <_vsnprintf+0x13f4>
 801855e:	eb400020 	cmpnei      	r0, 32
 8018562:	2100      	addi      	r1, 1
 8018564:	0c26      	bf      	0x80185b0	// 80185b0 <_vsnprintf+0x13f4>
      const char digit = (char)(value % base);
 8018566:	c6638034 	divu      	r20, r3, r19
 801856a:	c6748422 	mult      	r2, r20, r19
 801856e:	5b49      	subu      	r2, r3, r2
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8018570:	3a09      	cmphsi      	r2, 10
      const char digit = (char)(value % base);
 8018572:	74c8      	zextb      	r3, r2
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8018574:	2000      	addi      	r0, 1
 8018576:	0fed      	bf      	0x8018550	// 8018550 <_vsnprintf+0x1394>
 8018578:	c6a30023 	addu      	r3, r3, r21
 801857c:	74cc      	zextb      	r3, r3
 801857e:	07eb      	br      	0x8018554	// 8018554 <_vsnprintf+0x1398>
          base =  2U;
 8018580:	ea130002 	movi      	r19, 2
 8018584:	060b      	br      	0x801819a	// 801819a <_vsnprintf+0xfde>
 8018586:	d86b1000 	ld.h      	r3, (r11, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 801858a:	e56b0003 	addi      	r11, r11, 4
 801858e:	e800fc0b 	br      	0x8017da4	// 8017da4 <_vsnprintf+0xbe8>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8018592:	d84b5000 	ld.hs      	r2, (r11, 0x0)
 8018596:	c7e24855 	lsri      	r21, r2, 31
 801859a:	e56b0003 	addi      	r11, r11, 4
 801859e:	0679      	br      	0x8018290	// 8018290 <_vsnprintf+0x10d4>
    flags &= ~FLAGS_HASH;
 80185a0:	9827      	ld.w      	r1, (r14, 0x1c)
 80185a2:	c4812822 	bclri      	r2, r1, 4
  if (!(flags & FLAGS_PRECISION) || value) {
 80185a6:	e4212400 	andi      	r1, r1, 1024
    flags &= ~FLAGS_HASH;
 80185aa:	b847      	st.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION) || value) {
 80185ac:	e901ffc5 	bez      	r1, 0x8018536	// 8018536 <_vsnprintf+0x137a>
  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80185b0:	9867      	ld.w      	r3, (r14, 0x1c)
 80185b2:	b866      	st.w      	r3, (r14, 0x18)
 80185b4:	3300      	movi      	r3, 0
 80185b6:	c412482b 	lsli      	r11, r18, 0
 80185ba:	b885      	st.w      	r4, (r14, 0x14)
 80185bc:	dd2e2004 	st.w      	r9, (r14, 0x10)
 80185c0:	de6e2003 	st.w      	r19, (r14, 0xc)
 80185c4:	b862      	st.w      	r3, (r14, 0x8)
 80185c6:	b801      	st.w      	r0, (r14, 0x4)
 80185c8:	e800f8cb 	br      	0x801775e	// 801775e <_vsnprintf+0x5a2>
 80185cc:	9867      	ld.w      	r3, (r14, 0x1c)
 80185ce:	b866      	st.w      	r3, (r14, 0x18)
 80185d0:	3300      	movi      	r3, 0
 80185d2:	b885      	st.w      	r4, (r14, 0x14)
 80185d4:	dd2e2004 	st.w      	r9, (r14, 0x10)
 80185d8:	de6e2003 	st.w      	r19, (r14, 0xc)
 80185dc:	b862      	st.w      	r3, (r14, 0x8)
 80185de:	b821      	st.w      	r1, (r14, 0x4)
 80185e0:	e800f8bf 	br      	0x801775e	// 801775e <_vsnprintf+0x5a2>
 80185e4:	9867      	ld.w      	r3, (r14, 0x1c)
 80185e6:	b866      	st.w      	r3, (r14, 0x18)
 80185e8:	b885      	st.w      	r4, (r14, 0x14)
 80185ea:	dd2e2004 	st.w      	r9, (r14, 0x10)
 80185ee:	de6e2003 	st.w      	r19, (r14, 0xc)
 80185f2:	deae2002 	st.w      	r21, (r14, 0x8)
 80185f6:	07f4      	br      	0x80185de	// 80185de <_vsnprintf+0x1422>
            const long value = va_arg(va, long);
 80185f8:	d84b2000 	ld.w      	r2, (r11, 0x0)
 80185fc:	e64b0003 	addi      	r18, r11, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8018600:	c4020203 	abs      	r3, r2
 8018604:	c7e24856 	lsri      	r22, r2, 31
  if (!value) {
 8018608:	e922000a 	bnez      	r2, 0x801861c	// 801861c <_vsnprintf+0x1460>
    flags &= ~FLAGS_HASH;
 801860c:	9827      	ld.w      	r1, (r14, 0x1c)
 801860e:	c4812822 	bclri      	r2, r1, 4
  if (!(flags & FLAGS_PRECISION) || value) {
 8018612:	e4212400 	andi      	r1, r1, 1024
    flags &= ~FLAGS_HASH;
 8018616:	b847      	st.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION) || value) {
 8018618:	e9210027 	bnez      	r1, 0x8018666	// 8018666 <_vsnprintf+0x14aa>
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801861c:	9847      	ld.w      	r2, (r14, 0x1c)
 801861e:	e4422020 	andi      	r2, r2, 32
 8018622:	3a40      	cmpnei      	r2, 0
 8018624:	ea150041 	movi      	r21, 65
 8018628:	3261      	movi      	r2, 97
 801862a:	c6a20c20 	incf      	r21, r2, 0
 801862e:	6c6b      	mov      	r1, r10
 8018630:	e6b51009 	subi      	r21, r21, 10
 8018634:	040c      	br      	0x801864c	// 801864c <_vsnprintf+0x1490>
 8018636:	232f      	addi      	r3, 48
 8018638:	74cc      	zextb      	r3, r3
 801863a:	a160      	st.b      	r3, (r1, 0x0)
      value /= base;
 801863c:	c4144823 	lsli      	r3, r20, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8018640:	e9140013 	bez      	r20, 0x8018666	// 8018666 <_vsnprintf+0x14aa>
 8018644:	eb400020 	cmpnei      	r0, 32
 8018648:	2100      	addi      	r1, 1
 801864a:	0c0e      	bf      	0x8018666	// 8018666 <_vsnprintf+0x14aa>
      const char digit = (char)(value % base);
 801864c:	c6638034 	divu      	r20, r3, r19
 8018650:	c6748422 	mult      	r2, r20, r19
 8018654:	5b49      	subu      	r2, r3, r2
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8018656:	3a09      	cmphsi      	r2, 10
      const char digit = (char)(value % base);
 8018658:	74c8      	zextb      	r3, r2
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801865a:	2000      	addi      	r0, 1
 801865c:	0fed      	bf      	0x8018636	// 8018636 <_vsnprintf+0x147a>
 801865e:	c6a30023 	addu      	r3, r3, r21
 8018662:	74cc      	zextb      	r3, r3
 8018664:	07eb      	br      	0x801863a	// 801863a <_vsnprintf+0x147e>
  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8018666:	9867      	ld.w      	r3, (r14, 0x1c)
 8018668:	c412482b 	lsli      	r11, r18, 0
 801866c:	b866      	st.w      	r3, (r14, 0x18)
 801866e:	b885      	st.w      	r4, (r14, 0x14)
 8018670:	dd2e2004 	st.w      	r9, (r14, 0x10)
 8018674:	de6e2003 	st.w      	r19, (r14, 0xc)
 8018678:	dece2002 	st.w      	r22, (r14, 0x8)
 801867c:	07a5      	br      	0x80185c6	// 80185c6 <_vsnprintf+0x140a>
 801867e:	d84b0000 	ld.b      	r2, (r11, 0x0)
 8018682:	c4014835 	lsli      	r21, r1, 0
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8018686:	e56b0003 	addi      	r11, r11, 4
 801868a:	0603      	br      	0x8018290	// 8018290 <_vsnprintf+0x10d4>
 801868c:	d86b0000 	ld.b      	r3, (r11, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8018690:	e56b0003 	addi      	r11, r11, 4
 8018694:	e800fb88 	br      	0x8017da4	// 8017da4 <_vsnprintf+0xbe8>
          while (l++ < width) {
 8018698:	b869      	st.w      	r3, (r14, 0x24)
 801869a:	e800f775 	br      	0x8017584	// 8017584 <_vsnprintf+0x3c8>
          while (l++ < width) {
 801869e:	b869      	st.w      	r3, (r14, 0x24)
 80186a0:	e800f7f9 	br      	0x8017692	// 8017692 <_vsnprintf+0x4d6>
          while (l++ < width) {
 80186a4:	b868      	st.w      	r3, (r14, 0x20)
 80186a6:	e800fad6 	br      	0x8017c52	// 8017c52 <_vsnprintf+0xa96>
          while (l++ < width) {
 80186aa:	c4114829 	lsli      	r9, r17, 0
 80186ae:	e800f87b 	br      	0x80177a4	// 80177a4 <_vsnprintf+0x5e8>
          while (l++ < width) {
 80186b2:	b868      	st.w      	r3, (r14, 0x20)
 80186b4:	e800f9ef 	br      	0x8017a92	// 8017a92 <_vsnprintf+0x8d6>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80186b8:	6ee7      	mov      	r11, r9
 80186ba:	c4124831 	lsli      	r17, r18, 0
 80186be:	e800f87e 	br      	0x80177ba	// 80177ba <_vsnprintf+0x5fe>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80186c2:	ea140000 	movi      	r20, 0
 80186c6:	ea150000 	movi      	r21, 0
 80186ca:	f854c462 	sub.64      	r2, r20, r2
 80186ce:	06c8      	br      	0x801845e	// 801845e <_vsnprintf+0x12a2>

080186d0 <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 80186d0:	1046      	lrw      	r2, 0x40010600	// 80186e8 <fputc+0x18>
 80186d2:	9267      	ld.w      	r3, (r2, 0x1c)
 80186d4:	e463203f 	andi      	r3, r3, 63
 80186d8:	3b1f      	cmphsi      	r3, 32
 80186da:	0bfc      	bt      	0x80186d2	// 80186d2 <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80186dc:	e40020ff 	andi      	r0, r0, 255
 80186e0:	b208      	st.w      	r0, (r2, 0x20)
}
 80186e2:	3000      	movi      	r0, 0
 80186e4:	783c      	jmp      	r15
 80186e6:	0000      	.short	0x0000
 80186e8:	40010600 	.long	0x40010600

080186ec <wm_printf>:
  _out_buffer((char)0, buffer, idx < count ? idx : count - 1U, count);
  return idx;
}

int wm_printf(const char *fmt,...)
{
 80186ec:	1424      	subi      	r14, r14, 16
 80186ee:	b863      	st.w      	r3, (r14, 0xc)
 80186f0:	b842      	st.w      	r2, (r14, 0x8)
 80186f2:	b821      	st.w      	r1, (r14, 0x4)
 80186f4:	b800      	st.w      	r0, (r14, 0x0)
 80186f6:	14d0      	push      	r15
 80186f8:	1421      	subi      	r14, r14, 4
 80186fa:	9862      	ld.w      	r3, (r14, 0x8)
 80186fc:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 80186fe:	1b03      	addi      	r3, r14, 12
 8018700:	b860      	st.w      	r3, (r14, 0x0)
 8018702:	6ccb      	mov      	r3, r2
 8018704:	3200      	movi      	r2, 0
 8018706:	2a00      	subi      	r2, 1
 8018708:	6c4f      	mov      	r1, r3
 801870a:	1005      	lrw      	r0, 0x8015ef0	// 801871c <wm_printf+0x30>
 801870c:	e3fff558 	bsr      	0x80171bc	// 80171bc <_vsnprintf>
	va_end(args);

	return length;
}
 8018710:	1401      	addi      	r14, r14, 4
 8018712:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8018716:	1405      	addi      	r14, r14, 20
 8018718:	783c      	jmp      	r15
 801871a:	0000      	.short	0x0000
 801871c:	08015ef0 	.long	0x08015ef0

08018720 <__cskyvprintfsprintf>:
	
	return i;
}

__attribute__((weak)) int __cskyvprintfsprintf(char *str, const char *format, ...)
{
 8018720:	1423      	subi      	r14, r14, 12
 8018722:	b862      	st.w      	r3, (r14, 0x8)
 8018724:	b841      	st.w      	r2, (r14, 0x4)
 8018726:	b820      	st.w      	r1, (r14, 0x0)
 8018728:	14d1      	push      	r4, r15
 801872a:	1421      	subi      	r14, r14, 4
 801872c:	9863      	ld.w      	r3, (r14, 0xc)
 801872e:	6c8f      	mov      	r2, r3
    va_list ap;
    int i;

	va_start(ap, format);
 8018730:	1b04      	addi      	r3, r14, 16
  size_t idx =_vsnprintf(_out_buffer, buffer, count, format, va);
 8018732:	b860      	st.w      	r3, (r14, 0x0)
 8018734:	6ccb      	mov      	r3, r2
 8018736:	3200      	movi      	r2, 0
{
 8018738:	6d03      	mov      	r4, r0
  size_t idx =_vsnprintf(_out_buffer, buffer, count, format, va);
 801873a:	6c43      	mov      	r1, r0
 801873c:	2a00      	subi      	r2, 1
 801873e:	100a      	lrw      	r0, 0x8015ee4	// 8018764 <__cskyvprintfsprintf+0x44>
 8018740:	e3fff53e 	bsr      	0x80171bc	// 80171bc <_vsnprintf>
  _out_buffer((char)0, buffer, idx < count ? idx : count - 1U, count);
 8018744:	3200      	movi      	r2, 0
 8018746:	2a00      	subi      	r2, 1
 8018748:	3300      	movi      	r3, 0
 801874a:	6482      	cmpne      	r0, r2
 801874c:	2b01      	subi      	r3, 2
 801874e:	c4600c40 	inct      	r3, r0, 0
    ((char*)buffer)[idx] = character;
 8018752:	3200      	movi      	r2, 0
 8018754:	d4640022 	str.b      	r2, (r4, r3 << 0)
	i = wm_vsnprintf(str, (size_t) - 1, format, ap);
	va_end(ap);

	return i;
}
 8018758:	1401      	addi      	r14, r14, 4
 801875a:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 801875e:	9880      	ld.w      	r4, (r14, 0x0)
 8018760:	1405      	addi      	r14, r14, 20
 8018762:	783c      	jmp      	r15
 8018764:	08015ee4 	.long	0x08015ee4

08018768 <vTaskSwitchContext>:

#endif /* configUSE_APPLICATION_TASK_TAG */
/*-----------------------------------------------------------*/

void vTaskSwitchContext( void )
{
 8018768:	14d0      	push      	r15
    if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
 801876a:	1160      	lrw      	r3, 0x20001870	// 80187e8 <vTaskSwitchContext+0x80>
 801876c:	9360      	ld.w      	r3, (r3, 0x0)
 801876e:	e9230034 	bnez      	r3, 0x80187d6	// 80187d6 <vTaskSwitchContext+0x6e>
         * switch. */
        xYieldPending = pdTRUE;
    }
    else
    {
        xYieldPending = pdFALSE;
 8018772:	105f      	lrw      	r2, 0x20001878	// 80187ec <vTaskSwitchContext+0x84>
            }
        #endif

        /* Select a new task to run using either the generic C or port
         * optimised asm code. */
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 8018774:	ea8d001f 	lrw      	r13, 0x20001874	// 80187f0 <vTaskSwitchContext+0x88>
 8018778:	3114      	movi      	r1, 20
        xYieldPending = pdFALSE;
 801877a:	b260      	st.w      	r3, (r2, 0x0)
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 801877c:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8018780:	c4238420 	mult      	r0, r3, r1
 8018784:	105c      	lrw      	r2, 0x20001384	// 80187f4 <vTaskSwitchContext+0x8c>
 8018786:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 801878a:	e900000a 	bez      	r0, 0x801879e	// 801879e <vTaskSwitchContext+0x36>
 801878e:	0411      	br      	0x80187b0	// 80187b0 <vTaskSwitchContext+0x48>
 8018790:	2b00      	subi      	r3, 1
 8018792:	c4238420 	mult      	r0, r3, r1
 8018796:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 801879a:	e920000b 	bnez      	r0, 0x80187b0	// 80187b0 <vTaskSwitchContext+0x48>
 801879e:	e923fff9 	bnez      	r3, 0x8018790	// 8018790 <vTaskSwitchContext+0x28>
 80187a2:	ea020be7 	movi      	r2, 3047
 80187a6:	1035      	lrw      	r1, 0x805387c	// 80187f8 <vTaskSwitchContext+0x90>
 80187a8:	1015      	lrw      	r0, 0x80538b8	// 80187fc <vTaskSwitchContext+0x94>
 80187aa:	e3ffffa1 	bsr      	0x80186ec	// 80186ec <wm_printf>
 80187ae:	0400      	br      	0x80187ae	// 80187ae <vTaskSwitchContext+0x46>
 80187b0:	3014      	movi      	r0, 20
 80187b2:	7c0c      	mult      	r0, r3
 80187b4:	c402002c 	addu      	r12, r2, r0
 80187b8:	2007      	addi      	r0, 8
 80187ba:	d82c2001 	ld.w      	r1, (r12, 0x4)
 80187be:	6080      	addu      	r2, r0
 80187c0:	9121      	ld.w      	r1, (r1, 0x4)
 80187c2:	6486      	cmpne      	r1, r2
 80187c4:	dc2c2001 	st.w      	r1, (r12, 0x4)
 80187c8:	0c0b      	bf      	0x80187de	// 80187de <vTaskSwitchContext+0x76>
 80187ca:	104e      	lrw      	r2, 0x20001380	// 8018800 <vTaskSwitchContext+0x98>
 80187cc:	9123      	ld.w      	r1, (r1, 0xc)
 80187ce:	b220      	st.w      	r1, (r2, 0x0)
 80187d0:	dc6d2000 	st.w      	r3, (r13, 0x0)
                 * for additional information. */
                _impure_ptr = &( pxCurrentTCB->xNewLib_reent );
            }
        #endif /* configUSE_NEWLIB_REENTRANT */
    }
}
 80187d4:	1490      	pop      	r15
        xYieldPending = pdTRUE;
 80187d6:	1066      	lrw      	r3, 0x20001878	// 80187ec <vTaskSwitchContext+0x84>
 80187d8:	3201      	movi      	r2, 1
 80187da:	b340      	st.w      	r2, (r3, 0x0)
}
 80187dc:	1490      	pop      	r15
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 80187de:	9121      	ld.w      	r1, (r1, 0x4)
 80187e0:	dc2c2001 	st.w      	r1, (r12, 0x4)
 80187e4:	07f3      	br      	0x80187ca	// 80187ca <vTaskSwitchContext+0x62>
 80187e6:	0000      	.short	0x0000
 80187e8:	20001870 	.long	0x20001870
 80187ec:	20001878 	.long	0x20001878
 80187f0:	20001874 	.long	0x20001874
 80187f4:	20001384 	.long	0x20001384
 80187f8:	0805387c 	.long	0x0805387c
 80187fc:	080538b8 	.long	0x080538b8
 8018800:	20001380 	.long	0x20001380
	...
