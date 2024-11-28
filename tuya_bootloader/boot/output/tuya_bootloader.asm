
output/tuya_bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

20000000 <boot_info>:
20000000:	00 00 00 20 ff ff 20 00 ff ff ff ff 00 01 00 20     ... .. ........ 
20000010:	43 52 50 46 ff ff ff ff 01 00 00 00 00 00 00 00     CRPF............
	...

20000100 <__Vectors>:
20000100:	00 00 01 20 d1 36 00 20 71 36 00 20 73 36 00 20     ... .6. q6. s6. 
20000110:	75 36 00 20 77 36 00 20 79 36 00 20 00 00 00 00     u6. w6. y6. ....
	...
2000012c:	7b 36 00 20 7d 36 00 20 00 00 00 00 7f 36 00 20     {6. }6. .....6. 
2000013c:	81 36 00 20 83 36 00 20 85 36 00 20 87 36 00 20     .6. .6. .6. .6. 
2000014c:	89 36 00 20 8b 36 00 20 8d 36 00 20 8f 36 00 20     .6. .6. .6. .6. 
2000015c:	91 36 00 20 93 36 00 20 95 36 00 20 97 36 00 20     .6. .6. .6. .6. 
2000016c:	99 36 00 20 9b 36 00 20 9d 36 00 20 9f 36 00 20     .6. .6. .6. .6. 
2000017c:	a1 36 00 20 a3 36 00 20 a5 36 00 20 a7 36 00 20     .6. .6. .6. .6. 
2000018c:	a9 36 00 20 ab 36 00 20 ad 36 00 20 af 36 00 20     .6. .6. .6. .6. 
2000019c:	b1 36 00 20 b3 36 00 20 b5 36 00 20 b7 36 00 20     .6. .6. .6. .6. 
200001ac:	b9 36 00 20 bb 36 00 20 bd 36 00 20 bf 36 00 20     .6. .6. .6. .6. 
200001bc:	c1 36 00 20 c3 36 00 20 c5 36 00 20 c7 36 00 20     .6. .6. .6. .6. 
200001cc:	c9 36 00 20 cb 36 00 20 cd 36 00 20 00 00 00 00     .6. .6. .6. ....
	...

20000290 <__do_global_dtors_aux>:
20000290:	b510      	push	{r4, lr}
20000292:	4c05      	ldr	r4, [pc, #20]	; (200002a8 <__do_global_dtors_aux+0x18>)
20000294:	7823      	ldrb	r3, [r4, #0]
20000296:	b933      	cbnz	r3, 200002a6 <__do_global_dtors_aux+0x16>
20000298:	4b04      	ldr	r3, [pc, #16]	; (200002ac <__do_global_dtors_aux+0x1c>)
2000029a:	b113      	cbz	r3, 200002a2 <__do_global_dtors_aux+0x12>
2000029c:	4804      	ldr	r0, [pc, #16]	; (200002b0 <__do_global_dtors_aux+0x20>)
2000029e:	f3af 8000 	nop.w
200002a2:	2301      	movs	r3, #1
200002a4:	7023      	strb	r3, [r4, #0]
200002a6:	bd10      	pop	{r4, pc}
200002a8:	20010000 	.word	0x20010000
200002ac:	00000000 	.word	0x00000000
200002b0:	20004640 	.word	0x20004640

200002b4 <frame_dummy>:
200002b4:	b508      	push	{r3, lr}
200002b6:	4b03      	ldr	r3, [pc, #12]	; (200002c4 <frame_dummy+0x10>)
200002b8:	b11b      	cbz	r3, 200002c2 <frame_dummy+0xe>
200002ba:	4903      	ldr	r1, [pc, #12]	; (200002c8 <frame_dummy+0x14>)
200002bc:	4803      	ldr	r0, [pc, #12]	; (200002cc <frame_dummy+0x18>)
200002be:	f3af 8000 	nop.w
200002c2:	bd08      	pop	{r3, pc}
200002c4:	00000000 	.word	0x00000000
200002c8:	20010004 	.word	0x20010004
200002cc:	20004640 	.word	0x20004640

200002d0 <flash_cache_init>:
200002d0:	b410      	push	{r4}
200002d2:	4a20      	ldr	r2, [pc, #128]	; (20000354 <flash_cache_init+0x84>)
200002d4:	6893      	ldr	r3, [r2, #8]
200002d6:	f36f 0300 	bfc	r3, #0, #1
200002da:	6093      	str	r3, [r2, #8]
200002dc:	6953      	ldr	r3, [r2, #20]
200002de:	2402      	movs	r4, #2
200002e0:	f364 030f 	bfi	r3, r4, #0, #16
200002e4:	6153      	str	r3, [r2, #20]
200002e6:	f8d2 30f0 	ldr.w	r3, [r2, #240]	; 0xf0
200002ea:	4c1b      	ldr	r4, [pc, #108]	; (20000358 <flash_cache_init+0x88>)
200002ec:	2101      	movs	r1, #1
200002ee:	f361 0307 	bfi	r3, r1, #0, #8
200002f2:	f8c2 30f0 	str.w	r3, [r2, #240]	; 0xf0
200002f6:	2307      	movs	r3, #7
200002f8:	6014      	str	r4, [r2, #0]
200002fa:	f244 2118 	movw	r1, #16920	; 0x4218
200002fe:	6053      	str	r3, [r2, #4]
20000300:	2300      	movs	r3, #0
20000302:	f8c2 10f4 	str.w	r1, [r2, #244]	; 0xf4
20000306:	62d3      	str	r3, [r2, #44]	; 0x2c
20000308:	6911      	ldr	r1, [r2, #16]
2000030a:	4b14      	ldr	r3, [pc, #80]	; (2000035c <flash_cache_init+0x8c>)
2000030c:	4c14      	ldr	r4, [pc, #80]	; (20000360 <flash_cache_init+0x90>)
2000030e:	f041 0101 	orr.w	r1, r1, #1
20000312:	6111      	str	r1, [r2, #16]
20000314:	6891      	ldr	r1, [r2, #8]
20000316:	f041 0101 	orr.w	r1, r1, #1
2000031a:	6091      	str	r1, [r2, #8]
2000031c:	4a11      	ldr	r2, [pc, #68]	; (20000364 <flash_cache_init+0x94>)
2000031e:	6058      	str	r0, [r3, #4]
20000320:	609c      	str	r4, [r3, #8]
20000322:	60da      	str	r2, [r3, #12]
20000324:	681a      	ldr	r2, [r3, #0]
20000326:	4910      	ldr	r1, [pc, #64]	; (20000368 <flash_cache_init+0x98>)
20000328:	f042 0201 	orr.w	r2, r2, #1
2000032c:	601a      	str	r2, [r3, #0]
2000032e:	699a      	ldr	r2, [r3, #24]
20000330:	f042 0201 	orr.w	r2, r2, #1
20000334:	619a      	str	r2, [r3, #24]
20000336:	69da      	ldr	r2, [r3, #28]
20000338:	f042 0201 	orr.w	r2, r2, #1
2000033c:	61da      	str	r2, [r3, #28]
2000033e:	6b4a      	ldr	r2, [r1, #52]	; 0x34
20000340:	f042 0201 	orr.w	r2, r2, #1
20000344:	634a      	str	r2, [r1, #52]	; 0x34
20000346:	69da      	ldr	r2, [r3, #28]
20000348:	07d2      	lsls	r2, r2, #31
2000034a:	d4fc      	bmi.n	20000346 <flash_cache_init+0x76>
2000034c:	f85d 4b04 	ldr.w	r4, [sp], #4
20000350:	4770      	bx	lr
20000352:	bf00      	nop
20000354:	40200000 	.word	0x40200000
20000358:	005f0200 	.word	0x005f0200
2000035c:	20200000 	.word	0x20200000
20000360:	40200060 	.word	0x40200060
20000364:	0002006b 	.word	0x0002006b
20000368:	40100000 	.word	0x40100000

2000036c <flash_cache_disable>:
2000036c:	4a06      	ldr	r2, [pc, #24]	; (20000388 <flash_cache_disable+0x1c>)
2000036e:	6813      	ldr	r3, [r2, #0]
20000370:	2b00      	cmp	r3, #0
20000372:	dbfc      	blt.n	2000036e <flash_cache_disable+0x2>
20000374:	6811      	ldr	r1, [r2, #0]
20000376:	4b05      	ldr	r3, [pc, #20]	; (2000038c <flash_cache_disable+0x20>)
20000378:	f36f 0100 	bfc	r1, #0, #1
2000037c:	6011      	str	r1, [r2, #0]
2000037e:	689a      	ldr	r2, [r3, #8]
20000380:	f36f 0200 	bfc	r2, #0, #1
20000384:	609a      	str	r2, [r3, #8]
20000386:	4770      	bx	lr
20000388:	20200000 	.word	0x20200000
2000038c:	40200000 	.word	0x40200000

20000390 <hal_flash_page_program_general>:
20000390:	b510      	push	{r4, lr}
20000392:	2801      	cmp	r0, #1
20000394:	b0c2      	sub	sp, #264	; 0x108
20000396:	468c      	mov	ip, r1
20000398:	bf0c      	ite	eq
2000039a:	2142      	moveq	r1, #66	; 0x42
2000039c:	2102      	movne	r1, #2
2000039e:	f88d 1004 	strb.w	r1, [sp, #4]
200003a2:	f88d c007 	strb.w	ip, [sp, #7]
200003a6:	4619      	mov	r1, r3
200003a8:	a802      	add	r0, sp, #8
200003aa:	ea4f 431c 	mov.w	r3, ip, lsr #16
200003ae:	ea4f 2c1c 	mov.w	ip, ip, lsr #8
200003b2:	4614      	mov	r4, r2
200003b4:	f88d c006 	strb.w	ip, [sp, #6]
200003b8:	f88d 3005 	strb.w	r3, [sp, #5]
200003bc:	f003 f9e4 	bl	20003788 <memcpy>
200003c0:	2306      	movs	r3, #6
200003c2:	2101      	movs	r1, #1
200003c4:	f10d 0003 	add.w	r0, sp, #3
200003c8:	f88d 3003 	strb.w	r3, [sp, #3]
200003cc:	f000 fb98 	bl	20000b00 <hal_qspi_standard_write>
200003d0:	1d21      	adds	r1, r4, #4
200003d2:	a801      	add	r0, sp, #4
200003d4:	f000 fb94 	bl	20000b00 <hal_qspi_standard_write>
200003d8:	2305      	movs	r3, #5
200003da:	f88d 3003 	strb.w	r3, [sp, #3]
200003de:	2301      	movs	r3, #1
200003e0:	4619      	mov	r1, r3
200003e2:	f10d 0203 	add.w	r2, sp, #3
200003e6:	f10d 0002 	add.w	r0, sp, #2
200003ea:	f000 faf9 	bl	200009e0 <hal_qspi_standard_read_byte>
200003ee:	f89d 3002 	ldrb.w	r3, [sp, #2]
200003f2:	07db      	lsls	r3, r3, #31
200003f4:	d4f3      	bmi.n	200003de <hal_flash_page_program_general+0x4e>
200003f6:	b042      	add	sp, #264	; 0x108
200003f8:	bd10      	pop	{r4, pc}
200003fa:	bf00      	nop

200003fc <hal_flash_program_general>:
200003fc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20000400:	f021 04ff 	bic.w	r4, r1, #255	; 0xff
20000404:	42a1      	cmp	r1, r4
20000406:	4605      	mov	r5, r0
20000408:	4616      	mov	r6, r2
2000040a:	461f      	mov	r7, r3
2000040c:	d00c      	beq.n	20000428 <hal_flash_program_general+0x2c>
2000040e:	1a64      	subs	r4, r4, r1
20000410:	f504 7480 	add.w	r4, r4, #256	; 0x100
20000414:	4294      	cmp	r4, r2
20000416:	bf28      	it	cs
20000418:	4614      	movcs	r4, r2
2000041a:	1b16      	subs	r6, r2, r4
2000041c:	4622      	mov	r2, r4
2000041e:	4688      	mov	r8, r1
20000420:	f7ff ffb6 	bl	20000390 <hal_flash_page_program_general>
20000424:	4427      	add	r7, r4
20000426:	4444      	add	r4, r8
20000428:	f3c6 230f 	ubfx	r3, r6, #8, #16
2000042c:	ea4f 2a16 	mov.w	sl, r6, lsr #8
20000430:	b323      	cbz	r3, 2000047c <hal_flash_program_general+0x80>
20000432:	3b01      	subs	r3, #1
20000434:	b29b      	uxth	r3, r3
20000436:	f504 7880 	add.w	r8, r4, #256	; 0x100
2000043a:	eb08 2803 	add.w	r8, r8, r3, lsl #8
2000043e:	eba7 0904 	sub.w	r9, r7, r4
20000442:	f44f 7280 	mov.w	r2, #256	; 0x100
20000446:	eb09 0304 	add.w	r3, r9, r4
2000044a:	4621      	mov	r1, r4
2000044c:	4628      	mov	r0, r5
2000044e:	4414      	add	r4, r2
20000450:	f7ff ff9e 	bl	20000390 <hal_flash_page_program_general>
20000454:	4544      	cmp	r4, r8
20000456:	d1f4      	bne.n	20000442 <hal_flash_program_general+0x46>
20000458:	fa1f fa8a 	uxth.w	sl, sl
2000045c:	eb07 270a 	add.w	r7, r7, sl, lsl #8
20000460:	f016 02ff 	ands.w	r2, r6, #255	; 0xff
20000464:	d102      	bne.n	2000046c <hal_flash_program_general+0x70>
20000466:	2000      	movs	r0, #0
20000468:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
2000046c:	4628      	mov	r0, r5
2000046e:	463b      	mov	r3, r7
20000470:	4641      	mov	r1, r8
20000472:	f7ff ff8d 	bl	20000390 <hal_flash_page_program_general>
20000476:	2000      	movs	r0, #0
20000478:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
2000047c:	46a0      	mov	r8, r4
2000047e:	e7ef      	b.n	20000460 <hal_flash_program_general+0x64>

20000480 <hal_flash_init>:
20000480:	b5f0      	push	{r4, r5, r6, r7, lr}
20000482:	2101      	movs	r1, #1
20000484:	b085      	sub	sp, #20
20000486:	2002      	movs	r0, #2
20000488:	f000 fa8a 	bl	200009a0 <hal_qspi_init>
2000048c:	239f      	movs	r3, #159	; 0x9f
2000048e:	f88d 3001 	strb.w	r3, [sp, #1]
20000492:	2301      	movs	r3, #1
20000494:	2400      	movs	r4, #0
20000496:	eb0d 0203 	add.w	r2, sp, r3
2000049a:	2103      	movs	r1, #3
2000049c:	a801      	add	r0, sp, #4
2000049e:	e9cd 4401 	strd	r4, r4, [sp, #4]
200004a2:	f8ad 400c 	strh.w	r4, [sp, #12]
200004a6:	f000 fa9b 	bl	200009e0 <hal_qspi_standard_read_byte>
200004aa:	f89d 3004 	ldrb.w	r3, [sp, #4]
200004ae:	2beb      	cmp	r3, #235	; 0xeb
200004b0:	d001      	beq.n	200004b6 <hal_flash_init+0x36>
200004b2:	b005      	add	sp, #20
200004b4:	bdf0      	pop	{r4, r5, r6, r7, pc}
200004b6:	2101      	movs	r1, #1
200004b8:	eb0d 0001 	add.w	r0, sp, r1
200004bc:	2333      	movs	r3, #51	; 0x33
200004be:	f88d 3001 	strb.w	r3, [sp, #1]
200004c2:	f000 fb1d 	bl	20000b00 <hal_qspi_standard_write>
200004c6:	2101      	movs	r1, #1
200004c8:	eb0d 0001 	add.w	r0, sp, r1
200004cc:	23cc      	movs	r3, #204	; 0xcc
200004ce:	f88d 3001 	strb.w	r3, [sp, #1]
200004d2:	f000 fb15 	bl	20000b00 <hal_qspi_standard_write>
200004d6:	2101      	movs	r1, #1
200004d8:	eb0d 0001 	add.w	r0, sp, r1
200004dc:	23aa      	movs	r3, #170	; 0xaa
200004de:	f88d 3001 	strb.w	r3, [sp, #1]
200004e2:	f000 fb0d 	bl	20000b00 <hal_qspi_standard_write>
200004e6:	23fa      	movs	r3, #250	; 0xfa
200004e8:	f88d 3004 	strb.w	r3, [sp, #4]
200004ec:	2320      	movs	r3, #32
200004ee:	2105      	movs	r1, #5
200004f0:	2501      	movs	r5, #1
200004f2:	f88d 3006 	strb.w	r3, [sp, #6]
200004f6:	270d      	movs	r7, #13
200004f8:	2303      	movs	r3, #3
200004fa:	a801      	add	r0, sp, #4
200004fc:	460e      	mov	r6, r1
200004fe:	f88d 3008 	strb.w	r3, [sp, #8]
20000502:	f88d 5005 	strb.w	r5, [sp, #5]
20000506:	f88d 7007 	strb.w	r7, [sp, #7]
2000050a:	f000 faf9 	bl	20000b00 <hal_qspi_standard_write>
2000050e:	2348      	movs	r3, #72	; 0x48
20000510:	f88d 3004 	strb.w	r3, [sp, #4]
20000514:	aa01      	add	r2, sp, #4
20000516:	4633      	mov	r3, r6
20000518:	4629      	mov	r1, r5
2000051a:	f10d 0009 	add.w	r0, sp, #9
2000051e:	f88d 7007 	strb.w	r7, [sp, #7]
20000522:	f88d 4005 	strb.w	r4, [sp, #5]
20000526:	f88d 6006 	strb.w	r6, [sp, #6]
2000052a:	f88d 4008 	strb.w	r4, [sp, #8]
2000052e:	f000 fa57 	bl	200009e0 <hal_qspi_standard_read_byte>
20000532:	f89d 3009 	ldrb.w	r3, [sp, #9]
20000536:	f003 037f 	and.w	r3, r3, #127	; 0x7f
2000053a:	2b7c      	cmp	r3, #124	; 0x7c
2000053c:	d057      	beq.n	200005ee <hal_flash_init+0x16e>
2000053e:	2706      	movs	r7, #6
20000540:	4629      	mov	r1, r5
20000542:	f10d 0003 	add.w	r0, sp, #3
20000546:	f88d 7003 	strb.w	r7, [sp, #3]
2000054a:	f000 fad9 	bl	20000b00 <hal_qspi_standard_write>
2000054e:	2342      	movs	r3, #66	; 0x42
20000550:	f88d 3004 	strb.w	r3, [sp, #4]
20000554:	4639      	mov	r1, r7
20000556:	23fe      	movs	r3, #254	; 0xfe
20000558:	a801      	add	r0, sp, #4
2000055a:	f88d 5006 	strb.w	r5, [sp, #6]
2000055e:	f88d 4005 	strb.w	r4, [sp, #5]
20000562:	f88d 4008 	strb.w	r4, [sp, #8]
20000566:	f88d 4009 	strb.w	r4, [sp, #9]
2000056a:	f88d 3007 	strb.w	r3, [sp, #7]
2000056e:	f000 fac7 	bl	20000b00 <hal_qspi_standard_write>
20000572:	f88d 6003 	strb.w	r6, [sp, #3]
20000576:	2301      	movs	r3, #1
20000578:	4619      	mov	r1, r3
2000057a:	f10d 0203 	add.w	r2, sp, #3
2000057e:	f10d 0002 	add.w	r0, sp, #2
20000582:	f000 fa2d 	bl	200009e0 <hal_qspi_standard_read_byte>
20000586:	f89d 3002 	ldrb.w	r3, [sp, #2]
2000058a:	f013 0401 	ands.w	r4, r3, #1
2000058e:	d1f2      	bne.n	20000576 <hal_flash_init+0xf6>
20000590:	2304      	movs	r3, #4
20000592:	25fa      	movs	r5, #250	; 0xfa
20000594:	2603      	movs	r6, #3
20000596:	2108      	movs	r1, #8
20000598:	a801      	add	r0, sp, #4
2000059a:	f88d 3006 	strb.w	r3, [sp, #6]
2000059e:	23fc      	movs	r3, #252	; 0xfc
200005a0:	f88d 3008 	strb.w	r3, [sp, #8]
200005a4:	f88d 5004 	strb.w	r5, [sp, #4]
200005a8:	f88d 6005 	strb.w	r6, [sp, #5]
200005ac:	f88d 4007 	strb.w	r4, [sp, #7]
200005b0:	f88d 5009 	strb.w	r5, [sp, #9]
200005b4:	f88d 400a 	strb.w	r4, [sp, #10]
200005b8:	f88d 400b 	strb.w	r4, [sp, #11]
200005bc:	f000 faa0 	bl	20000b00 <hal_qspi_standard_write>
200005c0:	2302      	movs	r3, #2
200005c2:	f88d 3006 	strb.w	r3, [sp, #6]
200005c6:	2279      	movs	r2, #121	; 0x79
200005c8:	23f3      	movs	r3, #243	; 0xf3
200005ca:	a801      	add	r0, sp, #4
200005cc:	2108      	movs	r1, #8
200005ce:	f88d 5004 	strb.w	r5, [sp, #4]
200005d2:	f88d 6005 	strb.w	r6, [sp, #5]
200005d6:	f88d 4007 	strb.w	r4, [sp, #7]
200005da:	f88d 400a 	strb.w	r4, [sp, #10]
200005de:	f88d 400b 	strb.w	r4, [sp, #11]
200005e2:	f88d 2008 	strb.w	r2, [sp, #8]
200005e6:	f88d 3009 	strb.w	r3, [sp, #9]
200005ea:	f000 fa89 	bl	20000b00 <hal_qspi_standard_write>
200005ee:	2101      	movs	r1, #1
200005f0:	eb0d 0001 	add.w	r0, sp, r1
200005f4:	2355      	movs	r3, #85	; 0x55
200005f6:	f88d 3001 	strb.w	r3, [sp, #1]
200005fa:	f000 fa81 	bl	20000b00 <hal_qspi_standard_write>
200005fe:	2101      	movs	r1, #1
20000600:	2388      	movs	r3, #136	; 0x88
20000602:	eb0d 0001 	add.w	r0, sp, r1
20000606:	f88d 3001 	strb.w	r3, [sp, #1]
2000060a:	f000 fa79 	bl	20000b00 <hal_qspi_standard_write>
2000060e:	b005      	add	sp, #20
20000610:	bdf0      	pop	{r4, r5, r6, r7, pc}
20000612:	bf00      	nop

20000614 <hal_flash_read>:
20000614:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20000618:	2903      	cmp	r1, #3
2000061a:	b082      	sub	sp, #8
2000061c:	460c      	mov	r4, r1
2000061e:	4605      	mov	r5, r0
20000620:	4616      	mov	r6, r2
20000622:	d937      	bls.n	20000694 <hal_flash_read+0x80>
20000624:	f012 0703 	ands.w	r7, r2, #3
20000628:	d03a      	beq.n	200006a0 <hal_flash_read+0x8c>
2000062a:	f1c7 0104 	rsb	r1, r7, #4
2000062e:	b2c9      	uxtb	r1, r1
20000630:	4427      	add	r7, r4
20000632:	1a64      	subs	r4, r4, r1
20000634:	f007 0703 	and.w	r7, r7, #3
20000638:	ea4f 0894 	mov.w	r8, r4, lsr #2
2000063c:	0c2b      	lsrs	r3, r5, #16
2000063e:	f88d 3005 	strb.w	r3, [sp, #5]
20000642:	0a2b      	lsrs	r3, r5, #8
20000644:	f88d 3006 	strb.w	r3, [sp, #6]
20000648:	2303      	movs	r3, #3
2000064a:	f88d 3004 	strb.w	r3, [sp, #4]
2000064e:	2304      	movs	r3, #4
20000650:	4630      	mov	r0, r6
20000652:	eb0d 0203 	add.w	r2, sp, r3
20000656:	f88d 5007 	strb.w	r5, [sp, #7]
2000065a:	440e      	add	r6, r1
2000065c:	440d      	add	r5, r1
2000065e:	f000 f9bf 	bl	200009e0 <hal_qspi_standard_read_byte>
20000662:	2c03      	cmp	r4, #3
20000664:	d820      	bhi.n	200006a8 <hal_flash_read+0x94>
20000666:	b18f      	cbz	r7, 2000068c <hal_flash_read+0x78>
20000668:	2203      	movs	r2, #3
2000066a:	0c2b      	lsrs	r3, r5, #16
2000066c:	f88d 2004 	strb.w	r2, [sp, #4]
20000670:	f88d 3005 	strb.w	r3, [sp, #5]
20000674:	0a2a      	lsrs	r2, r5, #8
20000676:	2304      	movs	r3, #4
20000678:	f88d 2006 	strb.w	r2, [sp, #6]
2000067c:	4639      	mov	r1, r7
2000067e:	4630      	mov	r0, r6
20000680:	eb0d 0203 	add.w	r2, sp, r3
20000684:	f88d 5007 	strb.w	r5, [sp, #7]
20000688:	f000 f9aa 	bl	200009e0 <hal_qspi_standard_read_byte>
2000068c:	2000      	movs	r0, #0
2000068e:	b002      	add	sp, #8
20000690:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20000694:	2900      	cmp	r1, #0
20000696:	d0f9      	beq.n	2000068c <hal_flash_read+0x78>
20000698:	2700      	movs	r7, #0
2000069a:	46b8      	mov	r8, r7
2000069c:	463c      	mov	r4, r7
2000069e:	e7cd      	b.n	2000063c <hal_flash_read+0x28>
200006a0:	ea4f 0891 	mov.w	r8, r1, lsr #2
200006a4:	f001 0703 	and.w	r7, r1, #3
200006a8:	462b      	mov	r3, r5
200006aa:	4630      	mov	r0, r6
200006ac:	f024 0403 	bic.w	r4, r4, #3
200006b0:	4641      	mov	r1, r8
200006b2:	2203      	movs	r2, #3
200006b4:	f000 f9d6 	bl	20000a64 <hal_qspi_standard_read_word>
200006b8:	4426      	add	r6, r4
200006ba:	4425      	add	r5, r4
200006bc:	e7d3      	b.n	20000666 <hal_flash_read+0x52>
200006be:	bf00      	nop

200006c0 <hal_flash_erase>:
200006c0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200006c4:	f5b1 4f00 	cmp.w	r1, #32768	; 0x8000
200006c8:	b085      	sub	sp, #20
200006ca:	4689      	mov	r9, r1
200006cc:	4603      	mov	r3, r0
200006ce:	d342      	bcc.n	20000756 <hal_flash_erase+0x96>
200006d0:	f420 42ff 	bic.w	r2, r0, #32640	; 0x7f80
200006d4:	f022 027f 	bic.w	r2, r2, #127	; 0x7f
200006d8:	1a12      	subs	r2, r2, r0
200006da:	f502 4100 	add.w	r1, r2, #32768	; 0x8000
200006de:	f411 2f7f 	tst.w	r1, #1044480	; 0xff000
200006e2:	9101      	str	r1, [sp, #4]
200006e4:	f3c1 3207 	ubfx	r2, r1, #12, #8
200006e8:	d079      	beq.n	200007de <hal_flash_erase+0x11e>
200006ea:	1e57      	subs	r7, r2, #1
200006ec:	b2bf      	uxth	r7, r7
200006ee:	f500 5680 	add.w	r6, r0, #4096	; 0x1000
200006f2:	eb06 3707 	add.w	r7, r6, r7, lsl #12
200006f6:	f10d 0b0b 	add.w	fp, sp, #11
200006fa:	f10d 080c 	add.w	r8, sp, #12
200006fe:	f10d 040a 	add.w	r4, sp, #10
20000702:	2520      	movs	r5, #32
20000704:	f04f 0a06 	mov.w	sl, #6
20000708:	0c19      	lsrs	r1, r3, #16
2000070a:	0a1a      	lsrs	r2, r3, #8
2000070c:	f88d 100d 	strb.w	r1, [sp, #13]
20000710:	4658      	mov	r0, fp
20000712:	2101      	movs	r1, #1
20000714:	f88d 300f 	strb.w	r3, [sp, #15]
20000718:	f88d 200e 	strb.w	r2, [sp, #14]
2000071c:	f88d 500c 	strb.w	r5, [sp, #12]
20000720:	f88d a00b 	strb.w	sl, [sp, #11]
20000724:	f000 f9ec 	bl	20000b00 <hal_qspi_standard_write>
20000728:	2104      	movs	r1, #4
2000072a:	4640      	mov	r0, r8
2000072c:	f000 f9e8 	bl	20000b00 <hal_qspi_standard_write>
20000730:	2305      	movs	r3, #5
20000732:	f88d 300b 	strb.w	r3, [sp, #11]
20000736:	2301      	movs	r3, #1
20000738:	4619      	mov	r1, r3
2000073a:	4620      	mov	r0, r4
2000073c:	465a      	mov	r2, fp
2000073e:	f000 f94f 	bl	200009e0 <hal_qspi_standard_read_byte>
20000742:	f89d 300a 	ldrb.w	r3, [sp, #10]
20000746:	07d8      	lsls	r0, r3, #31
20000748:	d4f5      	bmi.n	20000736 <hal_flash_erase+0x76>
2000074a:	42be      	cmp	r6, r7
2000074c:	4633      	mov	r3, r6
2000074e:	d047      	beq.n	200007e0 <hal_flash_erase+0x120>
20000750:	f506 5680 	add.w	r6, r6, #4096	; 0x1000
20000754:	e7d8      	b.n	20000708 <hal_flash_erase+0x48>
20000756:	f3c1 020b 	ubfx	r2, r1, #0, #12
2000075a:	ea4f 3911 	mov.w	r9, r1, lsr #12
2000075e:	2a00      	cmp	r2, #0
20000760:	bf18      	it	ne
20000762:	f109 0901 	addne.w	r9, r9, #1
20000766:	fa1f f589 	uxth.w	r5, r9
2000076a:	2d00      	cmp	r5, #0
2000076c:	f000 80aa 	beq.w	200008c4 <hal_flash_erase+0x204>
20000770:	3d01      	subs	r5, #1
20000772:	b2ad      	uxth	r5, r5
20000774:	f500 5680 	add.w	r6, r0, #4096	; 0x1000
20000778:	eb06 3505 	add.w	r5, r6, r5, lsl #12
2000077c:	f10d 0b0b 	add.w	fp, sp, #11
20000780:	f10d 080c 	add.w	r8, sp, #12
20000784:	f10d 040a 	add.w	r4, sp, #10
20000788:	f04f 0920 	mov.w	r9, #32
2000078c:	2706      	movs	r7, #6
2000078e:	ea4f 4c13 	mov.w	ip, r3, lsr #16
20000792:	0a1a      	lsrs	r2, r3, #8
20000794:	2101      	movs	r1, #1
20000796:	4658      	mov	r0, fp
20000798:	f88d 300f 	strb.w	r3, [sp, #15]
2000079c:	f88d c00d 	strb.w	ip, [sp, #13]
200007a0:	f88d 200e 	strb.w	r2, [sp, #14]
200007a4:	f88d 900c 	strb.w	r9, [sp, #12]
200007a8:	f88d 700b 	strb.w	r7, [sp, #11]
200007ac:	f000 f9a8 	bl	20000b00 <hal_qspi_standard_write>
200007b0:	2104      	movs	r1, #4
200007b2:	4640      	mov	r0, r8
200007b4:	f000 f9a4 	bl	20000b00 <hal_qspi_standard_write>
200007b8:	2305      	movs	r3, #5
200007ba:	f88d 300b 	strb.w	r3, [sp, #11]
200007be:	2301      	movs	r3, #1
200007c0:	4619      	mov	r1, r3
200007c2:	465a      	mov	r2, fp
200007c4:	4620      	mov	r0, r4
200007c6:	f000 f90b 	bl	200009e0 <hal_qspi_standard_read_byte>
200007ca:	f89d 300a 	ldrb.w	r3, [sp, #10]
200007ce:	07db      	lsls	r3, r3, #31
200007d0:	d4f5      	bmi.n	200007be <hal_flash_erase+0xfe>
200007d2:	42ae      	cmp	r6, r5
200007d4:	4633      	mov	r3, r6
200007d6:	d075      	beq.n	200008c4 <hal_flash_erase+0x204>
200007d8:	f506 5680 	add.w	r6, r6, #4096	; 0x1000
200007dc:	e7d7      	b.n	2000078e <hal_flash_erase+0xce>
200007de:	4607      	mov	r7, r0
200007e0:	9b01      	ldr	r3, [sp, #4]
200007e2:	eba9 0503 	sub.w	r5, r9, r3
200007e6:	f3c5 3602 	ubfx	r6, r5, #12, #3
200007ea:	f3c5 020b 	ubfx	r2, r5, #0, #12
200007ee:	f3c5 33cf 	ubfx	r3, r5, #15, #16
200007f2:	2a00      	cmp	r2, #0
200007f4:	bf18      	it	ne
200007f6:	3601      	addne	r6, #1
200007f8:	0bed      	lsrs	r5, r5, #15
200007fa:	2b00      	cmp	r3, #0
200007fc:	d065      	beq.n	200008ca <hal_flash_erase+0x20a>
200007fe:	b2ad      	uxth	r5, r5
20000800:	eb07 35c5 	add.w	r5, r7, r5, lsl #15
20000804:	f10d 0b0b 	add.w	fp, sp, #11
20000808:	f10d 080c 	add.w	r8, sp, #12
2000080c:	f10d 040a 	add.w	r4, sp, #10
20000810:	f04f 0a52 	mov.w	sl, #82	; 0x52
20000814:	f04f 0906 	mov.w	r9, #6
20000818:	0a3b      	lsrs	r3, r7, #8
2000081a:	0c3a      	lsrs	r2, r7, #16
2000081c:	2101      	movs	r1, #1
2000081e:	4658      	mov	r0, fp
20000820:	f88d 300e 	strb.w	r3, [sp, #14]
20000824:	f88d 200d 	strb.w	r2, [sp, #13]
20000828:	f88d 700f 	strb.w	r7, [sp, #15]
2000082c:	f88d a00c 	strb.w	sl, [sp, #12]
20000830:	f88d 900b 	strb.w	r9, [sp, #11]
20000834:	f000 f964 	bl	20000b00 <hal_qspi_standard_write>
20000838:	2104      	movs	r1, #4
2000083a:	4640      	mov	r0, r8
2000083c:	f000 f960 	bl	20000b00 <hal_qspi_standard_write>
20000840:	2305      	movs	r3, #5
20000842:	f88d 300b 	strb.w	r3, [sp, #11]
20000846:	2301      	movs	r3, #1
20000848:	4619      	mov	r1, r3
2000084a:	465a      	mov	r2, fp
2000084c:	4620      	mov	r0, r4
2000084e:	f000 f8c7 	bl	200009e0 <hal_qspi_standard_read_byte>
20000852:	f89d 300a 	ldrb.w	r3, [sp, #10]
20000856:	07d9      	lsls	r1, r3, #31
20000858:	d4f5      	bmi.n	20000846 <hal_flash_erase+0x186>
2000085a:	f507 4700 	add.w	r7, r7, #32768	; 0x8000
2000085e:	42af      	cmp	r7, r5
20000860:	d1da      	bne.n	20000818 <hal_flash_erase+0x158>
20000862:	b37e      	cbz	r6, 200008c4 <hal_flash_erase+0x204>
20000864:	eb05 3606 	add.w	r6, r5, r6, lsl #12
20000868:	f10d 0b0b 	add.w	fp, sp, #11
2000086c:	f10d 080c 	add.w	r8, sp, #12
20000870:	f10d 040a 	add.w	r4, sp, #10
20000874:	f04f 0920 	mov.w	r9, #32
20000878:	2706      	movs	r7, #6
2000087a:	0a2b      	lsrs	r3, r5, #8
2000087c:	0c2a      	lsrs	r2, r5, #16
2000087e:	2101      	movs	r1, #1
20000880:	4658      	mov	r0, fp
20000882:	f88d 300e 	strb.w	r3, [sp, #14]
20000886:	f88d 200d 	strb.w	r2, [sp, #13]
2000088a:	f88d 900c 	strb.w	r9, [sp, #12]
2000088e:	f88d 500f 	strb.w	r5, [sp, #15]
20000892:	f88d 700b 	strb.w	r7, [sp, #11]
20000896:	f000 f933 	bl	20000b00 <hal_qspi_standard_write>
2000089a:	2104      	movs	r1, #4
2000089c:	4640      	mov	r0, r8
2000089e:	f000 f92f 	bl	20000b00 <hal_qspi_standard_write>
200008a2:	2305      	movs	r3, #5
200008a4:	f88d 300b 	strb.w	r3, [sp, #11]
200008a8:	2301      	movs	r3, #1
200008aa:	465a      	mov	r2, fp
200008ac:	4619      	mov	r1, r3
200008ae:	4620      	mov	r0, r4
200008b0:	f000 f896 	bl	200009e0 <hal_qspi_standard_read_byte>
200008b4:	f89d 300a 	ldrb.w	r3, [sp, #10]
200008b8:	07da      	lsls	r2, r3, #31
200008ba:	d4f5      	bmi.n	200008a8 <hal_flash_erase+0x1e8>
200008bc:	f505 5580 	add.w	r5, r5, #4096	; 0x1000
200008c0:	42ae      	cmp	r6, r5
200008c2:	d1da      	bne.n	2000087a <hal_flash_erase+0x1ba>
200008c4:	b005      	add	sp, #20
200008c6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200008ca:	463d      	mov	r5, r7
200008cc:	e7c9      	b.n	20000862 <hal_flash_erase+0x1a2>
200008ce:	bf00      	nop

200008d0 <hal_flash_program>:
200008d0:	4613      	mov	r3, r2
200008d2:	460a      	mov	r2, r1
200008d4:	4601      	mov	r1, r0
200008d6:	2000      	movs	r0, #0
200008d8:	f7ff bd90 	b.w	200003fc <hal_flash_program_general>

200008dc <hal_flash_quad_mode_enable>:
200008dc:	b510      	push	{r4, lr}
200008de:	b084      	sub	sp, #16
200008e0:	2301      	movs	r3, #1
200008e2:	f04f 0c00 	mov.w	ip, #0
200008e6:	2405      	movs	r4, #5
200008e8:	4619      	mov	r1, r3
200008ea:	aa02      	add	r2, sp, #8
200008ec:	f88d 4008 	strb.w	r4, [sp, #8]
200008f0:	f88d c000 	strb.w	ip, [sp]
200008f4:	4604      	mov	r4, r0
200008f6:	f88d c004 	strb.w	ip, [sp, #4]
200008fa:	4668      	mov	r0, sp
200008fc:	f04f 0c35 	mov.w	ip, #53	; 0x35
20000900:	f88d c009 	strb.w	ip, [sp, #9]
20000904:	f000 f86c 	bl	200009e0 <hal_qspi_standard_read_byte>
20000908:	2301      	movs	r3, #1
2000090a:	4619      	mov	r1, r3
2000090c:	f10d 0209 	add.w	r2, sp, #9
20000910:	a801      	add	r0, sp, #4
20000912:	f000 f865 	bl	200009e0 <hal_qspi_standard_read_byte>
20000916:	f89d 3004 	ldrb.w	r3, [sp, #4]
2000091a:	f89d 2000 	ldrb.w	r2, [sp]
2000091e:	1e20      	subs	r0, r4, #0
20000920:	f003 0c40 	and.w	ip, r3, #64	; 0x40
20000924:	f022 0103 	bic.w	r1, r2, #3
20000928:	bf18      	it	ne
2000092a:	2001      	movne	r0, #1
2000092c:	ea5c 0101 	orrs.w	r1, ip, r1
20000930:	d103      	bne.n	2000093a <hal_flash_quad_mode_enable+0x5e>
20000932:	f3c3 0140 	ubfx	r1, r3, #1, #1
20000936:	4281      	cmp	r1, r0
20000938:	d00e      	beq.n	20000958 <hal_flash_quad_mode_enable+0x7c>
2000093a:	f89d 3004 	ldrb.w	r3, [sp, #4]
2000093e:	f89d 2000 	ldrb.w	r2, [sp]
20000942:	f003 03bf 	and.w	r3, r3, #191	; 0xbf
20000946:	f360 0341 	bfi	r3, r0, #1, #1
2000094a:	f002 0203 	and.w	r2, r2, #3
2000094e:	f88d 3004 	strb.w	r3, [sp, #4]
20000952:	f88d 2000 	strb.w	r2, [sp]
20000956:	b2db      	uxtb	r3, r3
20000958:	2006      	movs	r0, #6
2000095a:	2101      	movs	r1, #1
2000095c:	f88d 000b 	strb.w	r0, [sp, #11]
20000960:	f10d 000b 	add.w	r0, sp, #11
20000964:	f88d 300e 	strb.w	r3, [sp, #14]
20000968:	f88d 100c 	strb.w	r1, [sp, #12]
2000096c:	f88d 200d 	strb.w	r2, [sp, #13]
20000970:	f000 f8c6 	bl	20000b00 <hal_qspi_standard_write>
20000974:	2103      	movs	r1, #3
20000976:	a803      	add	r0, sp, #12
20000978:	f000 f8c2 	bl	20000b00 <hal_qspi_standard_write>
2000097c:	2305      	movs	r3, #5
2000097e:	f88d 300b 	strb.w	r3, [sp, #11]
20000982:	2301      	movs	r3, #1
20000984:	4619      	mov	r1, r3
20000986:	f10d 020b 	add.w	r2, sp, #11
2000098a:	f10d 000a 	add.w	r0, sp, #10
2000098e:	f000 f827 	bl	200009e0 <hal_qspi_standard_read_byte>
20000992:	f89d 300a 	ldrb.w	r3, [sp, #10]
20000996:	07db      	lsls	r3, r3, #31
20000998:	d4f3      	bmi.n	20000982 <hal_flash_quad_mode_enable+0xa6>
2000099a:	b004      	add	sp, #16
2000099c:	bd10      	pop	{r4, pc}
2000099e:	bf00      	nop

200009a0 <hal_qspi_init>:
200009a0:	b410      	push	{r4}
200009a2:	f04f 4c80 	mov.w	ip, #1073741824	; 0x40000000
200009a6:	4b0d      	ldr	r3, [pc, #52]	; (200009dc <hal_qspi_init+0x3c>)
200009a8:	f8dc 2018 	ldr.w	r2, [ip, #24]
200009ac:	f042 0220 	orr.w	r2, r2, #32
200009b0:	f8cc 2018 	str.w	r2, [ip, #24]
200009b4:	f8d3 20f0 	ldr.w	r2, [r3, #240]	; 0xf0
200009b8:	f361 0207 	bfi	r2, r1, #0, #8
200009bc:	f8c3 20f0 	str.w	r2, [r3, #240]	; 0xf0
200009c0:	689a      	ldr	r2, [r3, #8]
200009c2:	2400      	movs	r4, #0
200009c4:	f36f 0200 	bfc	r2, #0, #1
200009c8:	609a      	str	r2, [r3, #8]
200009ca:	62dc      	str	r4, [r3, #44]	; 0x2c
200009cc:	695a      	ldr	r2, [r3, #20]
200009ce:	f360 020f 	bfi	r2, r0, #0, #16
200009d2:	615a      	str	r2, [r3, #20]
200009d4:	f85d 4b04 	ldr.w	r4, [sp], #4
200009d8:	4770      	bx	lr
200009da:	bf00      	nop
200009dc:	40200000 	.word	0x40200000

200009e0 <hal_qspi_standard_read_byte>:
200009e0:	b470      	push	{r4, r5, r6}
200009e2:	4c1e      	ldr	r4, [pc, #120]	; (20000a5c <hal_qspi_standard_read_byte+0x7c>)
200009e4:	6965      	ldr	r5, [r4, #20]
200009e6:	2610      	movs	r6, #16
200009e8:	f366 050f 	bfi	r5, r6, #0, #16
200009ec:	6165      	str	r5, [r4, #20]
200009ee:	6925      	ldr	r5, [r4, #16]
200009f0:	4e1b      	ldr	r6, [pc, #108]	; (20000a60 <hal_qspi_standard_read_byte+0x80>)
200009f2:	f36f 0500 	bfc	r5, #0, #1
200009f6:	6125      	str	r5, [r4, #16]
200009f8:	1e4d      	subs	r5, r1, #1
200009fa:	b2ad      	uxth	r5, r5
200009fc:	6026      	str	r6, [r4, #0]
200009fe:	6065      	str	r5, [r4, #4]
20000a00:	6925      	ldr	r5, [r4, #16]
20000a02:	f045 0501 	orr.w	r5, r5, #1
20000a06:	6125      	str	r5, [r4, #16]
20000a08:	68a5      	ldr	r5, [r4, #8]
20000a0a:	f045 0501 	orr.w	r5, r5, #1
20000a0e:	60a5      	str	r5, [r4, #8]
20000a10:	b133      	cbz	r3, 20000a20 <hal_qspi_standard_read_byte+0x40>
20000a12:	eb02 0c03 	add.w	ip, r2, r3
20000a16:	f812 3b01 	ldrb.w	r3, [r2], #1
20000a1a:	6623      	str	r3, [r4, #96]	; 0x60
20000a1c:	4594      	cmp	ip, r2
20000a1e:	d1fa      	bne.n	20000a16 <hal_qspi_standard_read_byte+0x36>
20000a20:	4a0e      	ldr	r2, [pc, #56]	; (20000a5c <hal_qspi_standard_read_byte+0x7c>)
20000a22:	6a93      	ldr	r3, [r2, #40]	; 0x28
20000a24:	075d      	lsls	r5, r3, #29
20000a26:	d5fc      	bpl.n	20000a22 <hal_qspi_standard_read_byte+0x42>
20000a28:	b149      	cbz	r1, 20000a3e <hal_qspi_standard_read_byte+0x5e>
20000a2a:	4a0c      	ldr	r2, [pc, #48]	; (20000a5c <hal_qspi_standard_read_byte+0x7c>)
20000a2c:	4401      	add	r1, r0
20000a2e:	6a93      	ldr	r3, [r2, #40]	; 0x28
20000a30:	071c      	lsls	r4, r3, #28
20000a32:	d5fc      	bpl.n	20000a2e <hal_qspi_standard_read_byte+0x4e>
20000a34:	6e13      	ldr	r3, [r2, #96]	; 0x60
20000a36:	f800 3b01 	strb.w	r3, [r0], #1
20000a3a:	4288      	cmp	r0, r1
20000a3c:	d1f7      	bne.n	20000a2e <hal_qspi_standard_read_byte+0x4e>
20000a3e:	4a07      	ldr	r2, [pc, #28]	; (20000a5c <hal_qspi_standard_read_byte+0x7c>)
20000a40:	6a93      	ldr	r3, [r2, #40]	; 0x28
20000a42:	07db      	lsls	r3, r3, #31
20000a44:	d4fc      	bmi.n	20000a40 <hal_qspi_standard_read_byte+0x60>
20000a46:	6893      	ldr	r3, [r2, #8]
20000a48:	f36f 0300 	bfc	r3, #0, #1
20000a4c:	6093      	str	r3, [r2, #8]
20000a4e:	6953      	ldr	r3, [r2, #20]
20000a50:	2104      	movs	r1, #4
20000a52:	f361 030f 	bfi	r3, r1, #0, #16
20000a56:	6153      	str	r3, [r2, #20]
20000a58:	bc70      	pop	{r4, r5, r6}
20000a5a:	4770      	bx	lr
20000a5c:	40200000 	.word	0x40200000
20000a60:	00070300 	.word	0x00070300

20000a64 <hal_qspi_standard_read_word>:
20000a64:	b530      	push	{r4, r5, lr}
20000a66:	4c24      	ldr	r4, [pc, #144]	; (20000af8 <hal_qspi_standard_read_word+0x94>)
20000a68:	f023 437f 	bic.w	r3, r3, #4278190080	; 0xff000000
20000a6c:	ea43 6202 	orr.w	r2, r3, r2, lsl #24
20000a70:	6963      	ldr	r3, [r4, #20]
20000a72:	2510      	movs	r5, #16
20000a74:	f365 030f 	bfi	r3, r5, #0, #16
20000a78:	6163      	str	r3, [r4, #20]
20000a7a:	6923      	ldr	r3, [r4, #16]
20000a7c:	f36f 0300 	bfc	r3, #0, #1
20000a80:	6123      	str	r3, [r4, #16]
20000a82:	4b1e      	ldr	r3, [pc, #120]	; (20000afc <hal_qspi_standard_read_word+0x98>)
20000a84:	6023      	str	r3, [r4, #0]
20000a86:	1e4b      	subs	r3, r1, #1
20000a88:	b29b      	uxth	r3, r3
20000a8a:	6063      	str	r3, [r4, #4]
20000a8c:	6923      	ldr	r3, [r4, #16]
20000a8e:	f043 0301 	orr.w	r3, r3, #1
20000a92:	6123      	str	r3, [r4, #16]
20000a94:	68a3      	ldr	r3, [r4, #8]
20000a96:	f043 0301 	orr.w	r3, r3, #1
20000a9a:	60a3      	str	r3, [r4, #8]
20000a9c:	6622      	str	r2, [r4, #96]	; 0x60
20000a9e:	6aa3      	ldr	r3, [r4, #40]	; 0x28
20000aa0:	075d      	lsls	r5, r3, #29
20000aa2:	d5fc      	bpl.n	20000a9e <hal_qspi_standard_read_word+0x3a>
20000aa4:	b1c9      	cbz	r1, 20000ada <hal_qspi_standard_read_word+0x76>
20000aa6:	4a14      	ldr	r2, [pc, #80]	; (20000af8 <hal_qspi_standard_read_word+0x94>)
20000aa8:	3004      	adds	r0, #4
20000aaa:	f04f 0c00 	mov.w	ip, #0
20000aae:	6a93      	ldr	r3, [r2, #40]	; 0x28
20000ab0:	071c      	lsls	r4, r3, #28
20000ab2:	d5fc      	bpl.n	20000aae <hal_qspi_standard_read_word+0x4a>
20000ab4:	6e13      	ldr	r3, [r2, #96]	; 0x60
20000ab6:	f800 3c01 	strb.w	r3, [r0, #-1]
20000aba:	f10c 0c01 	add.w	ip, ip, #1
20000abe:	0e1d      	lsrs	r5, r3, #24
20000ac0:	ea4f 4e13 	mov.w	lr, r3, lsr #16
20000ac4:	0a1c      	lsrs	r4, r3, #8
20000ac6:	4561      	cmp	r1, ip
20000ac8:	f800 5c04 	strb.w	r5, [r0, #-4]
20000acc:	f800 ec03 	strb.w	lr, [r0, #-3]
20000ad0:	f800 4c02 	strb.w	r4, [r0, #-2]
20000ad4:	f100 0004 	add.w	r0, r0, #4
20000ad8:	d1e9      	bne.n	20000aae <hal_qspi_standard_read_word+0x4a>
20000ada:	4a07      	ldr	r2, [pc, #28]	; (20000af8 <hal_qspi_standard_read_word+0x94>)
20000adc:	6a93      	ldr	r3, [r2, #40]	; 0x28
20000ade:	07db      	lsls	r3, r3, #31
20000ae0:	d4fc      	bmi.n	20000adc <hal_qspi_standard_read_word+0x78>
20000ae2:	6893      	ldr	r3, [r2, #8]
20000ae4:	f36f 0300 	bfc	r3, #0, #1
20000ae8:	6093      	str	r3, [r2, #8]
20000aea:	6953      	ldr	r3, [r2, #20]
20000aec:	2104      	movs	r1, #4
20000aee:	f361 030f 	bfi	r3, r1, #0, #16
20000af2:	6153      	str	r3, [r2, #20]
20000af4:	bd30      	pop	{r4, r5, pc}
20000af6:	bf00      	nop
20000af8:	40200000 	.word	0x40200000
20000afc:	001f0300 	.word	0x001f0300

20000b00 <hal_qspi_standard_write>:
20000b00:	b410      	push	{r4}
20000b02:	4a19      	ldr	r2, [pc, #100]	; (20000b68 <hal_qspi_standard_write+0x68>)
20000b04:	6953      	ldr	r3, [r2, #20]
20000b06:	2410      	movs	r4, #16
20000b08:	f364 030f 	bfi	r3, r4, #0, #16
20000b0c:	6153      	str	r3, [r2, #20]
20000b0e:	6913      	ldr	r3, [r2, #16]
20000b10:	4c16      	ldr	r4, [pc, #88]	; (20000b6c <hal_qspi_standard_write+0x6c>)
20000b12:	f36f 0300 	bfc	r3, #0, #1
20000b16:	6113      	str	r3, [r2, #16]
20000b18:	6014      	str	r4, [r2, #0]
20000b1a:	6893      	ldr	r3, [r2, #8]
20000b1c:	f043 0301 	orr.w	r3, r3, #1
20000b20:	6093      	str	r3, [r2, #8]
20000b22:	6913      	ldr	r3, [r2, #16]
20000b24:	f043 0301 	orr.w	r3, r3, #1
20000b28:	6113      	str	r3, [r2, #16]
20000b2a:	b141      	cbz	r1, 20000b3e <hal_qspi_standard_write+0x3e>
20000b2c:	4401      	add	r1, r0
20000b2e:	f810 3b01 	ldrb.w	r3, [r0], #1
20000b32:	6613      	str	r3, [r2, #96]	; 0x60
20000b34:	6a93      	ldr	r3, [r2, #40]	; 0x28
20000b36:	079c      	lsls	r4, r3, #30
20000b38:	d5fc      	bpl.n	20000b34 <hal_qspi_standard_write+0x34>
20000b3a:	4288      	cmp	r0, r1
20000b3c:	d1f7      	bne.n	20000b2e <hal_qspi_standard_write+0x2e>
20000b3e:	4a0a      	ldr	r2, [pc, #40]	; (20000b68 <hal_qspi_standard_write+0x68>)
20000b40:	6a93      	ldr	r3, [r2, #40]	; 0x28
20000b42:	0759      	lsls	r1, r3, #29
20000b44:	d5fc      	bpl.n	20000b40 <hal_qspi_standard_write+0x40>
20000b46:	4a08      	ldr	r2, [pc, #32]	; (20000b68 <hal_qspi_standard_write+0x68>)
20000b48:	6a93      	ldr	r3, [r2, #40]	; 0x28
20000b4a:	07db      	lsls	r3, r3, #31
20000b4c:	d4fc      	bmi.n	20000b48 <hal_qspi_standard_write+0x48>
20000b4e:	6893      	ldr	r3, [r2, #8]
20000b50:	f36f 0300 	bfc	r3, #0, #1
20000b54:	6093      	str	r3, [r2, #8]
20000b56:	6953      	ldr	r3, [r2, #20]
20000b58:	2104      	movs	r1, #4
20000b5a:	f361 030f 	bfi	r3, r1, #0, #16
20000b5e:	6153      	str	r3, [r2, #20]
20000b60:	f85d 4b04 	ldr.w	r4, [sp], #4
20000b64:	4770      	bx	lr
20000b66:	bf00      	nop
20000b68:	40200000 	.word	0x40200000
20000b6c:	00070100 	.word	0x00070100

20000b70 <ln_chip_reboot>:
20000b70:	b508      	push	{r3, lr}
20000b72:	4b07      	ldr	r3, [pc, #28]	; (20000b90 <ln_chip_reboot+0x20>)
20000b74:	a104      	add	r1, pc, #16	; (adr r1, 20000b88 <ln_chip_reboot+0x18>)
20000b76:	e9d1 0100 	ldrd	r0, r1, [r1]
20000b7a:	e9c3 0100 	strd	r0, r1, [r3]
20000b7e:	f000 fa27 	bl	20000fd0 <hal_misc_reset_all>
20000b82:	bd08      	pop	{r3, pc}
20000b84:	f3af 8000 	nop.w
20000b88:	1234a55a 	.word	0x1234a55a
20000b8c:	5aa5dcba 	.word	0x5aa5dcba
20000b90:	200294e8 	.word	0x200294e8

20000b94 <hal_clock_init>:
20000b94:	b410      	push	{r4}
20000b96:	7801      	ldrb	r1, [r0, #0]
20000b98:	4a2f      	ldr	r2, [pc, #188]	; (20000c58 <hal_clock_init+0xc4>)
20000b9a:	6913      	ldr	r3, [r2, #16]
20000b9c:	f361 0300 	bfi	r3, r1, #0, #1
20000ba0:	6113      	str	r3, [r2, #16]
20000ba2:	7841      	ldrb	r1, [r0, #1]
20000ba4:	6f13      	ldr	r3, [r2, #112]	; 0x70
20000ba6:	f361 0304 	bfi	r3, r1, #0, #5
20000baa:	6713      	str	r3, [r2, #112]	; 0x70
20000bac:	7881      	ldrb	r1, [r0, #2]
20000bae:	3901      	subs	r1, #1
20000bb0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000bb4:	685c      	ldr	r4, [r3, #4]
20000bb6:	f361 0403 	bfi	r4, r1, #0, #4
20000bba:	605c      	str	r4, [r3, #4]
20000bbc:	78c1      	ldrb	r1, [r0, #3]
20000bbe:	3901      	subs	r1, #1
20000bc0:	6854      	ldr	r4, [r2, #4]
20000bc2:	f361 0403 	bfi	r4, r1, #0, #4
20000bc6:	6054      	str	r4, [r2, #4]
20000bc8:	6859      	ldr	r1, [r3, #4]
20000bca:	f36f 1104 	bfc	r1, #4, #1
20000bce:	6059      	str	r1, [r3, #4]
20000bd0:	6811      	ldr	r1, [r2, #0]
20000bd2:	f041 0101 	orr.w	r1, r1, #1
20000bd6:	6011      	str	r1, [r2, #0]
20000bd8:	681a      	ldr	r2, [r3, #0]
20000bda:	f042 0201 	orr.w	r2, r2, #1
20000bde:	601a      	str	r2, [r3, #0]
20000be0:	681a      	ldr	r2, [r3, #0]
20000be2:	f042 0220 	orr.w	r2, r2, #32
20000be6:	601a      	str	r2, [r3, #0]
20000be8:	7803      	ldrb	r3, [r0, #0]
20000bea:	b9ab      	cbnz	r3, 20000c18 <hal_clock_init+0x84>
20000bec:	4b1b      	ldr	r3, [pc, #108]	; (20000c5c <hal_clock_init+0xc8>)
20000bee:	2200      	movs	r2, #0
20000bf0:	701a      	strb	r2, [r3, #0]
20000bf2:	78c3      	ldrb	r3, [r0, #3]
20000bf4:	4a1a      	ldr	r2, [pc, #104]	; (20000c60 <hal_clock_init+0xcc>)
20000bf6:	fb92 f3f3 	sdiv	r3, r2, r3
20000bfa:	491a      	ldr	r1, [pc, #104]	; (20000c64 <hal_clock_init+0xd0>)
20000bfc:	600b      	str	r3, [r1, #0]
20000bfe:	78c3      	ldrb	r3, [r0, #3]
20000c00:	fb92 f3f3 	sdiv	r3, r2, r3
20000c04:	7881      	ldrb	r1, [r0, #2]
20000c06:	fb93 f3f1 	sdiv	r3, r3, r1
20000c0a:	4917      	ldr	r1, [pc, #92]	; (20000c68 <hal_clock_init+0xd4>)
20000c0c:	600b      	str	r3, [r1, #0]
20000c0e:	4b17      	ldr	r3, [pc, #92]	; (20000c6c <hal_clock_init+0xd8>)
20000c10:	601a      	str	r2, [r3, #0]
20000c12:	f85d 4b04 	ldr.w	r4, [sp], #4
20000c16:	4770      	bx	lr
20000c18:	2b01      	cmp	r3, #1
20000c1a:	d1fa      	bne.n	20000c12 <hal_clock_init+0x7e>
20000c1c:	4b0f      	ldr	r3, [pc, #60]	; (20000c5c <hal_clock_init+0xc8>)
20000c1e:	2201      	movs	r2, #1
20000c20:	701a      	strb	r2, [r3, #0]
20000c22:	7843      	ldrb	r3, [r0, #1]
20000c24:	4a12      	ldr	r2, [pc, #72]	; (20000c70 <hal_clock_init+0xdc>)
20000c26:	fb02 f303 	mul.w	r3, r2, r3
20000c2a:	78c1      	ldrb	r1, [r0, #3]
20000c2c:	fb93 f3f1 	sdiv	r3, r3, r1
20000c30:	490c      	ldr	r1, [pc, #48]	; (20000c64 <hal_clock_init+0xd0>)
20000c32:	600b      	str	r3, [r1, #0]
20000c34:	7843      	ldrb	r3, [r0, #1]
20000c36:	fb02 f303 	mul.w	r3, r2, r3
20000c3a:	78c1      	ldrb	r1, [r0, #3]
20000c3c:	fb93 f3f1 	sdiv	r3, r3, r1
20000c40:	7881      	ldrb	r1, [r0, #2]
20000c42:	fb93 f3f1 	sdiv	r3, r3, r1
20000c46:	4908      	ldr	r1, [pc, #32]	; (20000c68 <hal_clock_init+0xd4>)
20000c48:	600b      	str	r3, [r1, #0]
20000c4a:	7843      	ldrb	r3, [r0, #1]
20000c4c:	fb02 f303 	mul.w	r3, r2, r3
20000c50:	4a06      	ldr	r2, [pc, #24]	; (20000c6c <hal_clock_init+0xd8>)
20000c52:	6013      	str	r3, [r2, #0]
20000c54:	e7dd      	b.n	20000c12 <hal_clock_init+0x7e>
20000c56:	bf00      	nop
20000c58:	40100000 	.word	0x40100000
20000c5c:	20010024 	.word	0x20010024
20000c60:	02625a00 	.word	0x02625a00
20000c64:	2001001c 	.word	0x2001001c
20000c68:	20010020 	.word	0x20010020
20000c6c:	20010028 	.word	0x20010028
20000c70:	01312d00 	.word	0x01312d00

20000c74 <hal_clock_get_core_clk>:
20000c74:	4b01      	ldr	r3, [pc, #4]	; (20000c7c <hal_clock_get_core_clk+0x8>)
20000c76:	6818      	ldr	r0, [r3, #0]
20000c78:	4770      	bx	lr
20000c7a:	bf00      	nop
20000c7c:	20010028 	.word	0x20010028

20000c80 <hal_clock_get_apb0_clk>:
20000c80:	4b01      	ldr	r3, [pc, #4]	; (20000c88 <hal_clock_get_apb0_clk+0x8>)
20000c82:	6818      	ldr	r0, [r3, #0]
20000c84:	4770      	bx	lr
20000c86:	bf00      	nop
20000c88:	20010020 	.word	0x20010020

20000c8c <hal_gpio_pin_direction_set>:
20000c8c:	6983      	ldr	r3, [r0, #24]
20000c8e:	b29b      	uxth	r3, r3
20000c90:	b13a      	cbz	r2, 20000ca2 <hal_gpio_pin_direction_set+0x16>
20000c92:	2a01      	cmp	r2, #1
20000c94:	d100      	bne.n	20000c98 <hal_gpio_pin_direction_set+0xc>
20000c96:	430b      	orrs	r3, r1
20000c98:	6982      	ldr	r2, [r0, #24]
20000c9a:	f363 020f 	bfi	r2, r3, #0, #16
20000c9e:	6182      	str	r2, [r0, #24]
20000ca0:	4770      	bx	lr
20000ca2:	ea23 0301 	bic.w	r3, r3, r1
20000ca6:	e7f7      	b.n	20000c98 <hal_gpio_pin_direction_set+0xc>

20000ca8 <hal_gpio_pin_afio_select>:
20000ca8:	4b85      	ldr	r3, [pc, #532]	; (20000ec0 <hal_gpio_pin_afio_select+0x218>)
20000caa:	4298      	cmp	r0, r3
20000cac:	d004      	beq.n	20000cb8 <hal_gpio_pin_afio_select+0x10>
20000cae:	4b85      	ldr	r3, [pc, #532]	; (20000ec4 <hal_gpio_pin_afio_select+0x21c>)
20000cb0:	4298      	cmp	r0, r3
20000cb2:	f000 80c1 	beq.w	20000e38 <hal_gpio_pin_afio_select+0x190>
20000cb6:	4770      	bx	lr
20000cb8:	2940      	cmp	r1, #64	; 0x40
20000cba:	f000 80a1 	beq.w	20000e00 <hal_gpio_pin_afio_select+0x158>
20000cbe:	d912      	bls.n	20000ce6 <hal_gpio_pin_afio_select+0x3e>
20000cc0:	f5b1 6f80 	cmp.w	r1, #1024	; 0x400
20000cc4:	f000 80aa 	beq.w	20000e1c <hal_gpio_pin_afio_select+0x174>
20000cc8:	d958      	bls.n	20000d7c <hal_gpio_pin_afio_select+0xd4>
20000cca:	f5b1 6f00 	cmp.w	r1, #2048	; 0x800
20000cce:	f000 80ac 	beq.w	20000e2a <hal_gpio_pin_afio_select+0x182>
20000cd2:	f5b1 5f80 	cmp.w	r1, #4096	; 0x1000
20000cd6:	d168      	bne.n	20000daa <hal_gpio_pin_afio_select+0x102>
20000cd8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000cdc:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
20000cde:	f362 0105 	bfi	r1, r2, #0, #6
20000ce2:	62d9      	str	r1, [r3, #44]	; 0x2c
20000ce4:	4770      	bx	lr
20000ce6:	1e4b      	subs	r3, r1, #1
20000ce8:	b29b      	uxth	r3, r3
20000cea:	2b1f      	cmp	r3, #31
20000cec:	d8e3      	bhi.n	20000cb6 <hal_gpio_pin_afio_select+0xe>
20000cee:	3901      	subs	r1, #1
20000cf0:	291f      	cmp	r1, #31
20000cf2:	d8e0      	bhi.n	20000cb6 <hal_gpio_pin_afio_select+0xe>
20000cf4:	a301      	add	r3, pc, #4	; (adr r3, 20000cfc <hal_gpio_pin_afio_select+0x54>)
20000cf6:	f853 f021 	ldr.w	pc, [r3, r1, lsl #2]
20000cfa:	bf00      	nop
20000cfc:	20000dad 	.word	0x20000dad
20000d00:	20000dbb 	.word	0x20000dbb
20000d04:	20000cb7 	.word	0x20000cb7
20000d08:	20000dc9 	.word	0x20000dc9
20000d0c:	20000cb7 	.word	0x20000cb7
20000d10:	20000cb7 	.word	0x20000cb7
20000d14:	20000cb7 	.word	0x20000cb7
20000d18:	20000dd7 	.word	0x20000dd7
20000d1c:	20000cb7 	.word	0x20000cb7
20000d20:	20000cb7 	.word	0x20000cb7
20000d24:	20000cb7 	.word	0x20000cb7
20000d28:	20000cb7 	.word	0x20000cb7
20000d2c:	20000cb7 	.word	0x20000cb7
20000d30:	20000cb7 	.word	0x20000cb7
20000d34:	20000cb7 	.word	0x20000cb7
20000d38:	20000de5 	.word	0x20000de5
20000d3c:	20000cb7 	.word	0x20000cb7
20000d40:	20000cb7 	.word	0x20000cb7
20000d44:	20000cb7 	.word	0x20000cb7
20000d48:	20000cb7 	.word	0x20000cb7
20000d4c:	20000cb7 	.word	0x20000cb7
20000d50:	20000cb7 	.word	0x20000cb7
20000d54:	20000cb7 	.word	0x20000cb7
20000d58:	20000cb7 	.word	0x20000cb7
20000d5c:	20000cb7 	.word	0x20000cb7
20000d60:	20000cb7 	.word	0x20000cb7
20000d64:	20000cb7 	.word	0x20000cb7
20000d68:	20000cb7 	.word	0x20000cb7
20000d6c:	20000cb7 	.word	0x20000cb7
20000d70:	20000cb7 	.word	0x20000cb7
20000d74:	20000cb7 	.word	0x20000cb7
20000d78:	20000df3 	.word	0x20000df3
20000d7c:	f5b1 7f80 	cmp.w	r1, #256	; 0x100
20000d80:	d045      	beq.n	20000e0e <hal_gpio_pin_afio_select+0x166>
20000d82:	f5b1 7f00 	cmp.w	r1, #512	; 0x200
20000d86:	d106      	bne.n	20000d96 <hal_gpio_pin_afio_select+0xee>
20000d88:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000d8c:	6a99      	ldr	r1, [r3, #40]	; 0x28
20000d8e:	f362 210d 	bfi	r1, r2, #8, #6
20000d92:	6299      	str	r1, [r3, #40]	; 0x28
20000d94:	4770      	bx	lr
20000d96:	2980      	cmp	r1, #128	; 0x80
20000d98:	d106      	bne.n	20000da8 <hal_gpio_pin_afio_select+0x100>
20000d9a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000d9e:	6a59      	ldr	r1, [r3, #36]	; 0x24
20000da0:	f362 611d 	bfi	r1, r2, #24, #6
20000da4:	6259      	str	r1, [r3, #36]	; 0x24
20000da6:	4770      	bx	lr
20000da8:	4770      	bx	lr
20000daa:	4770      	bx	lr
20000dac:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000db0:	6a19      	ldr	r1, [r3, #32]
20000db2:	f362 0105 	bfi	r1, r2, #0, #6
20000db6:	6219      	str	r1, [r3, #32]
20000db8:	4770      	bx	lr
20000dba:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000dbe:	6a19      	ldr	r1, [r3, #32]
20000dc0:	f362 210d 	bfi	r1, r2, #8, #6
20000dc4:	6219      	str	r1, [r3, #32]
20000dc6:	4770      	bx	lr
20000dc8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000dcc:	6a19      	ldr	r1, [r3, #32]
20000dce:	f362 4115 	bfi	r1, r2, #16, #6
20000dd2:	6219      	str	r1, [r3, #32]
20000dd4:	4770      	bx	lr
20000dd6:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000dda:	6a19      	ldr	r1, [r3, #32]
20000ddc:	f362 611d 	bfi	r1, r2, #24, #6
20000de0:	6219      	str	r1, [r3, #32]
20000de2:	4770      	bx	lr
20000de4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000de8:	6a59      	ldr	r1, [r3, #36]	; 0x24
20000dea:	f362 0105 	bfi	r1, r2, #0, #6
20000dee:	6259      	str	r1, [r3, #36]	; 0x24
20000df0:	4770      	bx	lr
20000df2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000df6:	6a59      	ldr	r1, [r3, #36]	; 0x24
20000df8:	f362 210d 	bfi	r1, r2, #8, #6
20000dfc:	6259      	str	r1, [r3, #36]	; 0x24
20000dfe:	4770      	bx	lr
20000e00:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e04:	6a59      	ldr	r1, [r3, #36]	; 0x24
20000e06:	f362 4115 	bfi	r1, r2, #16, #6
20000e0a:	6259      	str	r1, [r3, #36]	; 0x24
20000e0c:	4770      	bx	lr
20000e0e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e12:	6a99      	ldr	r1, [r3, #40]	; 0x28
20000e14:	f362 0105 	bfi	r1, r2, #0, #6
20000e18:	6299      	str	r1, [r3, #40]	; 0x28
20000e1a:	4770      	bx	lr
20000e1c:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e20:	6a99      	ldr	r1, [r3, #40]	; 0x28
20000e22:	f362 4115 	bfi	r1, r2, #16, #6
20000e26:	6299      	str	r1, [r3, #40]	; 0x28
20000e28:	4770      	bx	lr
20000e2a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e2e:	6a99      	ldr	r1, [r3, #40]	; 0x28
20000e30:	f362 611d 	bfi	r1, r2, #24, #6
20000e34:	6299      	str	r1, [r3, #40]	; 0x28
20000e36:	4770      	bx	lr
20000e38:	2940      	cmp	r1, #64	; 0x40
20000e3a:	d033      	beq.n	20000ea4 <hal_gpio_pin_afio_select+0x1fc>
20000e3c:	d814      	bhi.n	20000e68 <hal_gpio_pin_afio_select+0x1c0>
20000e3e:	2910      	cmp	r1, #16
20000e40:	d029      	beq.n	20000e96 <hal_gpio_pin_afio_select+0x1ee>
20000e42:	2920      	cmp	r1, #32
20000e44:	d106      	bne.n	20000e54 <hal_gpio_pin_afio_select+0x1ac>
20000e46:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e4a:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
20000e4c:	f362 611d 	bfi	r1, r2, #24, #6
20000e50:	62d9      	str	r1, [r3, #44]	; 0x2c
20000e52:	4770      	bx	lr
20000e54:	2908      	cmp	r1, #8
20000e56:	d106      	bne.n	20000e66 <hal_gpio_pin_afio_select+0x1be>
20000e58:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e5c:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
20000e5e:	f362 210d 	bfi	r1, r2, #8, #6
20000e62:	62d9      	str	r1, [r3, #44]	; 0x2c
20000e64:	4770      	bx	lr
20000e66:	4770      	bx	lr
20000e68:	f5b1 7f80 	cmp.w	r1, #256	; 0x100
20000e6c:	d021      	beq.n	20000eb2 <hal_gpio_pin_afio_select+0x20a>
20000e6e:	f5b1 7f00 	cmp.w	r1, #512	; 0x200
20000e72:	d106      	bne.n	20000e82 <hal_gpio_pin_afio_select+0x1da>
20000e74:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e78:	6b19      	ldr	r1, [r3, #48]	; 0x30
20000e7a:	f362 611d 	bfi	r1, r2, #24, #6
20000e7e:	6319      	str	r1, [r3, #48]	; 0x30
20000e80:	e719      	b.n	20000cb6 <hal_gpio_pin_afio_select+0xe>
20000e82:	2980      	cmp	r1, #128	; 0x80
20000e84:	d106      	bne.n	20000e94 <hal_gpio_pin_afio_select+0x1ec>
20000e86:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e8a:	6b19      	ldr	r1, [r3, #48]	; 0x30
20000e8c:	f362 210d 	bfi	r1, r2, #8, #6
20000e90:	6319      	str	r1, [r3, #48]	; 0x30
20000e92:	4770      	bx	lr
20000e94:	4770      	bx	lr
20000e96:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000e9a:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
20000e9c:	f362 4115 	bfi	r1, r2, #16, #6
20000ea0:	62d9      	str	r1, [r3, #44]	; 0x2c
20000ea2:	4770      	bx	lr
20000ea4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000ea8:	6b19      	ldr	r1, [r3, #48]	; 0x30
20000eaa:	f362 0105 	bfi	r1, r2, #0, #6
20000eae:	6319      	str	r1, [r3, #48]	; 0x30
20000eb0:	4770      	bx	lr
20000eb2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000eb6:	6b19      	ldr	r1, [r3, #48]	; 0x30
20000eb8:	f362 4115 	bfi	r1, r2, #16, #6
20000ebc:	6319      	str	r1, [r3, #48]	; 0x30
20000ebe:	4770      	bx	lr
20000ec0:	4000c000 	.word	0x4000c000
20000ec4:	4000c400 	.word	0x4000c400

20000ec8 <hal_gpio_pin_afio_en>:
20000ec8:	b570      	push	{r4, r5, r6, lr}
20000eca:	4605      	mov	r5, r0
20000ecc:	460e      	mov	r6, r1
20000ece:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000ed2:	69dc      	ldr	r4, [r3, #28]
20000ed4:	f3c4 0413 	ubfx	r4, r4, #0, #20
20000ed8:	2a01      	cmp	r2, #1
20000eda:	d00c      	beq.n	20000ef6 <hal_gpio_pin_afio_en+0x2e>
20000edc:	4b10      	ldr	r3, [pc, #64]	; (20000f20 <hal_gpio_pin_afio_en+0x58>)
20000ede:	4298      	cmp	r0, r3
20000ee0:	d011      	beq.n	20000f06 <hal_gpio_pin_afio_en+0x3e>
20000ee2:	4b10      	ldr	r3, [pc, #64]	; (20000f24 <hal_gpio_pin_afio_en+0x5c>)
20000ee4:	4298      	cmp	r0, r3
20000ee6:	d011      	beq.n	20000f0c <hal_gpio_pin_afio_en+0x44>
20000ee8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000eec:	69da      	ldr	r2, [r3, #28]
20000eee:	f364 0213 	bfi	r2, r4, #0, #20
20000ef2:	61da      	str	r2, [r3, #28]
20000ef4:	bd70      	pop	{r4, r5, r6, pc}
20000ef6:	2200      	movs	r2, #0
20000ef8:	f7ff fec8 	bl	20000c8c <hal_gpio_pin_direction_set>
20000efc:	4b08      	ldr	r3, [pc, #32]	; (20000f20 <hal_gpio_pin_afio_en+0x58>)
20000efe:	429d      	cmp	r5, r3
20000f00:	d107      	bne.n	20000f12 <hal_gpio_pin_afio_en+0x4a>
20000f02:	4334      	orrs	r4, r6
20000f04:	e7f0      	b.n	20000ee8 <hal_gpio_pin_afio_en+0x20>
20000f06:	ea24 0406 	bic.w	r4, r4, r6
20000f0a:	e7ed      	b.n	20000ee8 <hal_gpio_pin_afio_en+0x20>
20000f0c:	ea24 2486 	bic.w	r4, r4, r6, lsl #10
20000f10:	e7ea      	b.n	20000ee8 <hal_gpio_pin_afio_en+0x20>
20000f12:	4b04      	ldr	r3, [pc, #16]	; (20000f24 <hal_gpio_pin_afio_en+0x5c>)
20000f14:	429d      	cmp	r5, r3
20000f16:	bf08      	it	eq
20000f18:	ea44 2486 	orreq.w	r4, r4, r6, lsl #10
20000f1c:	e7e4      	b.n	20000ee8 <hal_gpio_pin_afio_en+0x20>
20000f1e:	bf00      	nop
20000f20:	4000c000 	.word	0x4000c000
20000f24:	4000c400 	.word	0x4000c400

20000f28 <hal_misc_awo_set_r_xtal40m_cap_bit>:
20000f28:	4b02      	ldr	r3, [pc, #8]	; (20000f34 <hal_misc_awo_set_r_xtal40m_cap_bit+0xc>)
20000f2a:	695a      	ldr	r2, [r3, #20]
20000f2c:	f360 621e 	bfi	r2, r0, #24, #7
20000f30:	615a      	str	r2, [r3, #20]
20000f32:	4770      	bx	lr
20000f34:	40100000 	.word	0x40100000

20000f38 <hal_misc_awo_set_r_xtal40m_ibsel>:
20000f38:	4b02      	ldr	r3, [pc, #8]	; (20000f44 <hal_misc_awo_set_r_xtal40m_ibsel+0xc>)
20000f3a:	695a      	ldr	r2, [r3, #20]
20000f3c:	f360 5215 	bfi	r2, r0, #20, #2
20000f40:	615a      	str	r2, [r3, #20]
20000f42:	4770      	bx	lr
20000f44:	40100000 	.word	0x40100000

20000f48 <hal_misc_awo_set_r_xtal40m_ldo_vbit>:
20000f48:	4b02      	ldr	r3, [pc, #8]	; (20000f54 <hal_misc_awo_set_r_xtal40m_ldo_vbit+0xc>)
20000f4a:	695a      	ldr	r2, [r3, #20]
20000f4c:	f360 4212 	bfi	r2, r0, #16, #3
20000f50:	615a      	str	r2, [r3, #20]
20000f52:	4770      	bx	lr
20000f54:	40100000 	.word	0x40100000

20000f58 <hal_misc_awo_set_bod_vth>:
20000f58:	4b02      	ldr	r3, [pc, #8]	; (20000f64 <hal_misc_awo_set_bod_vth+0xc>)
20000f5a:	695a      	ldr	r2, [r3, #20]
20000f5c:	f360 22cc 	bfi	r2, r0, #11, #2
20000f60:	615a      	str	r2, [r3, #20]
20000f62:	4770      	bx	lr
20000f64:	40100000 	.word	0x40100000

20000f68 <hal_misc_awo_set_r_vtrim>:
20000f68:	4b02      	ldr	r3, [pc, #8]	; (20000f74 <hal_misc_awo_set_r_vtrim+0xc>)
20000f6a:	695a      	ldr	r2, [r3, #20]
20000f6c:	f360 2209 	bfi	r2, r0, #8, #2
20000f70:	615a      	str	r2, [r3, #20]
20000f72:	4770      	bx	lr
20000f74:	40100000 	.word	0x40100000

20000f78 <hal_misc_awo_get_r_idle_reg>:
20000f78:	4b01      	ldr	r3, [pc, #4]	; (20000f80 <hal_misc_awo_get_r_idle_reg+0x8>)
20000f7a:	6b98      	ldr	r0, [r3, #56]	; 0x38
20000f7c:	4770      	bx	lr
20000f7e:	bf00      	nop
20000f80:	40100000 	.word	0x40100000

20000f84 <hal_misc_awo_set_o_cpu_sleep_counter_bp>:
20000f84:	4b02      	ldr	r3, [pc, #8]	; (20000f90 <hal_misc_awo_set_o_cpu_sleep_counter_bp+0xc>)
20000f86:	6fda      	ldr	r2, [r3, #124]	; 0x7c
20000f88:	f360 32cf 	bfi	r2, r0, #15, #1
20000f8c:	67da      	str	r2, [r3, #124]	; 0x7c
20000f8e:	4770      	bx	lr
20000f90:	40100000 	.word	0x40100000

20000f94 <hal_misc_awo_set_ldo15_1_vset>:
20000f94:	4b03      	ldr	r3, [pc, #12]	; (20000fa4 <hal_misc_awo_set_ldo15_1_vset+0x10>)
20000f96:	f8d3 209c 	ldr.w	r2, [r3, #156]	; 0x9c
20000f9a:	f360 320e 	bfi	r2, r0, #12, #3
20000f9e:	f8c3 209c 	str.w	r2, [r3, #156]	; 0x9c
20000fa2:	4770      	bx	lr
20000fa4:	40100000 	.word	0x40100000

20000fa8 <hal_misc_awo_set_ldo18_4_vset>:
20000fa8:	4b03      	ldr	r3, [pc, #12]	; (20000fb8 <hal_misc_awo_set_ldo18_4_vset+0x10>)
20000faa:	f8d3 209c 	ldr.w	r2, [r3, #156]	; 0x9c
20000fae:	f360 224b 	bfi	r2, r0, #9, #3
20000fb2:	f8c3 209c 	str.w	r2, [r3, #156]	; 0x9c
20000fb6:	4770      	bx	lr
20000fb8:	40100000 	.word	0x40100000

20000fbc <hal_misc_awo_set_ldo18_2_vset>:
20000fbc:	4b03      	ldr	r3, [pc, #12]	; (20000fcc <hal_misc_awo_set_ldo18_2_vset+0x10>)
20000fbe:	f8d3 209c 	ldr.w	r2, [r3, #156]	; 0x9c
20000fc2:	f360 02c5 	bfi	r2, r0, #3, #3
20000fc6:	f8c3 209c 	str.w	r2, [r3, #156]	; 0x9c
20000fca:	4770      	bx	lr
20000fcc:	40100000 	.word	0x40100000

20000fd0 <hal_misc_reset_all>:
20000fd0:	4b04      	ldr	r3, [pc, #16]	; (20000fe4 <hal_misc_reset_all+0x14>)
20000fd2:	68da      	ldr	r2, [r3, #12]
20000fd4:	f36f 1204 	bfc	r2, #4, #1
20000fd8:	60da      	str	r2, [r3, #12]
20000fda:	68da      	ldr	r2, [r3, #12]
20000fdc:	f042 0210 	orr.w	r2, r2, #16
20000fe0:	60da      	str	r2, [r3, #12]
20000fe2:	4770      	bx	lr
20000fe4:	40100000 	.word	0x40100000

20000fe8 <hal_misc_reset_uart0>:
20000fe8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
20000fec:	695a      	ldr	r2, [r3, #20]
20000fee:	f36f 228a 	bfc	r2, #10, #1
20000ff2:	615a      	str	r2, [r3, #20]
20000ff4:	695a      	ldr	r2, [r3, #20]
20000ff6:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
20000ffa:	615a      	str	r2, [r3, #20]
20000ffc:	4770      	bx	lr
	...

20001000 <hal_uart_baudrate_set>:
20001000:	b538      	push	{r3, r4, r5, lr}
20001002:	4604      	mov	r4, r0
20001004:	460d      	mov	r5, r1
20001006:	4b10      	ldr	r3, [pc, #64]	; (20001048 <hal_uart_baudrate_set+0x48>)
20001008:	4298      	cmp	r0, r3
2000100a:	d017      	beq.n	2000103c <hal_uart_baudrate_set+0x3c>
2000100c:	f1b0 2f40 	cmp.w	r0, #1073758208	; 0x40004000
20001010:	d017      	beq.n	20001042 <hal_uart_baudrate_set+0x42>
20001012:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
20001016:	4298      	cmp	r0, r3
20001018:	d00d      	beq.n	20001036 <hal_uart_baudrate_set+0x36>
2000101a:	2000      	movs	r0, #0
2000101c:	6823      	ldr	r3, [r4, #0]
2000101e:	f413 4f00 	tst.w	r3, #32768	; 0x8000
20001022:	bf14      	ite	ne
20001024:	092d      	lsrne	r5, r5, #4
20001026:	08ed      	lsreq	r5, r5, #3
20001028:	fbb0 f0f5 	udiv	r0, r0, r5
2000102c:	68e3      	ldr	r3, [r4, #12]
2000102e:	f360 0312 	bfi	r3, r0, #0, #19
20001032:	60e3      	str	r3, [r4, #12]
20001034:	bd38      	pop	{r3, r4, r5, pc}
20001036:	f7ff fe23 	bl	20000c80 <hal_clock_get_apb0_clk>
2000103a:	e7ef      	b.n	2000101c <hal_uart_baudrate_set+0x1c>
2000103c:	f7ff fe20 	bl	20000c80 <hal_clock_get_apb0_clk>
20001040:	e7ec      	b.n	2000101c <hal_uart_baudrate_set+0x1c>
20001042:	f7ff fe1d 	bl	20000c80 <hal_clock_get_apb0_clk>
20001046:	e7e9      	b.n	2000101c <hal_uart_baudrate_set+0x1c>
20001048:	40003000 	.word	0x40003000

2000104c <hal_uart_init>:
2000104c:	b500      	push	{lr}
2000104e:	b083      	sub	sp, #12
20001050:	4b28      	ldr	r3, [pc, #160]	; (200010f4 <hal_uart_init+0xa8>)
20001052:	4298      	cmp	r0, r3
20001054:	d03a      	beq.n	200010cc <hal_uart_init+0x80>
20001056:	f1b0 2f40 	cmp.w	r0, #1073758208	; 0x40004000
2000105a:	d03e      	beq.n	200010da <hal_uart_init+0x8e>
2000105c:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
20001060:	4298      	cmp	r0, r3
20001062:	d02c      	beq.n	200010be <hal_uart_init+0x72>
20001064:	2300      	movs	r3, #0
20001066:	9301      	str	r3, [sp, #4]
20001068:	9b01      	ldr	r3, [sp, #4]
2000106a:	2b13      	cmp	r3, #19
2000106c:	dc06      	bgt.n	2000107c <hal_uart_init+0x30>
2000106e:	bf00      	nop
20001070:	9b01      	ldr	r3, [sp, #4]
20001072:	3301      	adds	r3, #1
20001074:	9301      	str	r3, [sp, #4]
20001076:	9b01      	ldr	r3, [sp, #4]
20001078:	2b13      	cmp	r3, #19
2000107a:	ddf8      	ble.n	2000106e <hal_uart_init+0x22>
2000107c:	888a      	ldrh	r2, [r1, #4]
2000107e:	6803      	ldr	r3, [r0, #0]
20001080:	f362 731c 	bfi	r3, r2, #28, #1
20001084:	6003      	str	r3, [r0, #0]
20001086:	894a      	ldrh	r2, [r1, #10]
20001088:	6803      	ldr	r3, [r0, #0]
2000108a:	f362 33cf 	bfi	r3, r2, #15, #1
2000108e:	6003      	str	r3, [r0, #0]
20001090:	890b      	ldrh	r3, [r1, #8]
20001092:	2b02      	cmp	r3, #2
20001094:	d028      	beq.n	200010e8 <hal_uart_init+0x9c>
20001096:	6803      	ldr	r3, [r0, #0]
20001098:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
2000109c:	6003      	str	r3, [r0, #0]
2000109e:	890a      	ldrh	r2, [r1, #8]
200010a0:	6803      	ldr	r3, [r0, #0]
200010a2:	f362 2349 	bfi	r3, r2, #9, #1
200010a6:	6003      	str	r3, [r0, #0]
200010a8:	88ca      	ldrh	r2, [r1, #6]
200010aa:	6843      	ldr	r3, [r0, #4]
200010ac:	f362 330d 	bfi	r3, r2, #12, #2
200010b0:	6043      	str	r3, [r0, #4]
200010b2:	6809      	ldr	r1, [r1, #0]
200010b4:	f7ff ffa4 	bl	20001000 <hal_uart_baudrate_set>
200010b8:	b003      	add	sp, #12
200010ba:	f85d fb04 	ldr.w	pc, [sp], #4
200010be:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
200010c2:	6913      	ldr	r3, [r2, #16]
200010c4:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
200010c8:	6113      	str	r3, [r2, #16]
200010ca:	e7cb      	b.n	20001064 <hal_uart_init+0x18>
200010cc:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
200010d0:	6913      	ldr	r3, [r2, #16]
200010d2:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
200010d6:	6113      	str	r3, [r2, #16]
200010d8:	e7c4      	b.n	20001064 <hal_uart_init+0x18>
200010da:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
200010de:	6913      	ldr	r3, [r2, #16]
200010e0:	f443 5380 	orr.w	r3, r3, #4096	; 0x1000
200010e4:	6113      	str	r3, [r2, #16]
200010e6:	e7bd      	b.n	20001064 <hal_uart_init+0x18>
200010e8:	6803      	ldr	r3, [r0, #0]
200010ea:	f36f 238a 	bfc	r3, #10, #1
200010ee:	6003      	str	r3, [r0, #0]
200010f0:	e7da      	b.n	200010a8 <hal_uart_init+0x5c>
200010f2:	bf00      	nop
200010f4:	40003000 	.word	0x40003000

200010f8 <hal_uart_tx_mode_en>:
200010f8:	6803      	ldr	r3, [r0, #0]
200010fa:	f361 03c3 	bfi	r3, r1, #3, #1
200010fe:	6003      	str	r3, [r0, #0]
20001100:	4770      	bx	lr

20001102 <hal_uart_en>:
20001102:	6803      	ldr	r3, [r0, #0]
20001104:	f361 0300 	bfi	r3, r1, #0, #1
20001108:	6003      	str	r3, [r0, #0]
2000110a:	4770      	bx	lr

2000110c <hal_uart_send_data>:
2000110c:	6281      	str	r1, [r0, #40]	; 0x28
2000110e:	4770      	bx	lr

20001110 <hal_uart_flag_get>:
20001110:	69c3      	ldr	r3, [r0, #28]
20001112:	4219      	tst	r1, r3
20001114:	bf14      	ite	ne
20001116:	2001      	movne	r0, #1
20001118:	2000      	moveq	r0, #0
2000111a:	4770      	bx	lr

2000111c <SystemInit>:
2000111c:	f3bf 8f5f 	dmb	sy
20001120:	4b0d      	ldr	r3, [pc, #52]	; (20001158 <SystemInit+0x3c>)
20001122:	4a0e      	ldr	r2, [pc, #56]	; (2000115c <SystemInit+0x40>)
20001124:	609a      	str	r2, [r3, #8]
20001126:	f3bf 8f4f 	dsb	sy
2000112a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
2000112e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
20001132:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
20001136:	6a5a      	ldr	r2, [r3, #36]	; 0x24
20001138:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
2000113c:	625a      	str	r2, [r3, #36]	; 0x24
2000113e:	6a5a      	ldr	r2, [r3, #36]	; 0x24
20001140:	f442 3200 	orr.w	r2, r2, #131072	; 0x20000
20001144:	625a      	str	r2, [r3, #36]	; 0x24
20001146:	6a5a      	ldr	r2, [r3, #36]	; 0x24
20001148:	f442 2280 	orr.w	r2, r2, #262144	; 0x40000
2000114c:	625a      	str	r2, [r3, #36]	; 0x24
2000114e:	695a      	ldr	r2, [r3, #20]
20001150:	f042 0210 	orr.w	r2, r2, #16
20001154:	615a      	str	r2, [r3, #20]
20001156:	4770      	bx	lr
20001158:	e000ed00 	.word	0xe000ed00
2000115c:	20000100 	.word	0x20000100

20001160 <SetSysClock>:
20001160:	b510      	push	{r4, lr}
20001162:	b082      	sub	sp, #8
20001164:	2401      	movs	r4, #1
20001166:	f88d 4004 	strb.w	r4, [sp, #4]
2000116a:	2304      	movs	r3, #4
2000116c:	f88d 3006 	strb.w	r3, [sp, #6]
20001170:	f88d 4007 	strb.w	r4, [sp, #7]
20001174:	2308      	movs	r3, #8
20001176:	f88d 3005 	strb.w	r3, [sp, #5]
2000117a:	4620      	mov	r0, r4
2000117c:	f7ff fef4 	bl	20000f68 <hal_misc_awo_set_r_vtrim>
20001180:	2003      	movs	r0, #3
20001182:	f7ff fee1 	bl	20000f48 <hal_misc_awo_set_r_xtal40m_ldo_vbit>
20001186:	2000      	movs	r0, #0
20001188:	f7ff fece 	bl	20000f28 <hal_misc_awo_set_r_xtal40m_cap_bit>
2000118c:	2000      	movs	r0, #0
2000118e:	f7ff fed3 	bl	20000f38 <hal_misc_awo_set_r_xtal40m_ibsel>
20001192:	2007      	movs	r0, #7
20001194:	f7ff ff08 	bl	20000fa8 <hal_misc_awo_set_ldo18_4_vset>
20001198:	2007      	movs	r0, #7
2000119a:	f7ff ff0f 	bl	20000fbc <hal_misc_awo_set_ldo18_2_vset>
2000119e:	2007      	movs	r0, #7
200011a0:	f7ff fef8 	bl	20000f94 <hal_misc_awo_set_ldo15_1_vset>
200011a4:	2000      	movs	r0, #0
200011a6:	f7ff feed 	bl	20000f84 <hal_misc_awo_set_o_cpu_sleep_counter_bp>
200011aa:	4620      	mov	r0, r4
200011ac:	f7ff fed4 	bl	20000f58 <hal_misc_awo_set_bod_vth>
200011b0:	a801      	add	r0, sp, #4
200011b2:	f7ff fcef 	bl	20000b94 <hal_clock_init>
200011b6:	f7ff fd5d 	bl	20000c74 <hal_clock_get_core_clk>
200011ba:	4b02      	ldr	r3, [pc, #8]	; (200011c4 <SetSysClock+0x64>)
200011bc:	6018      	str	r0, [r3, #0]
200011be:	b002      	add	sp, #8
200011c0:	bd10      	pop	{r4, pc}
200011c2:	bf00      	nop
200011c4:	200045d8 	.word	0x200045d8

200011c8 <tuya_bl_sum_check>:
200011c8:	4602      	mov	r2, r0
200011ca:	b150      	cbz	r0, 200011e2 <tuya_bl_sum_check+0x1a>
200011cc:	b159      	cbz	r1, 200011e6 <tuya_bl_sum_check+0x1e>
200011ce:	1e43      	subs	r3, r0, #1
200011d0:	1e48      	subs	r0, r1, #1
200011d2:	1811      	adds	r1, r2, r0
200011d4:	2000      	movs	r0, #0
200011d6:	f813 2f01 	ldrb.w	r2, [r3, #1]!
200011da:	4410      	add	r0, r2
200011dc:	428b      	cmp	r3, r1
200011de:	d1fa      	bne.n	200011d6 <tuya_bl_sum_check+0xe>
200011e0:	4770      	bx	lr
200011e2:	2000      	movs	r0, #0
200011e4:	4770      	bx	lr
200011e6:	4608      	mov	r0, r1
200011e8:	4770      	bx	lr
	...

200011ec <bl_conf_init>:
200011ec:	b570      	push	{r4, r5, r6, lr}
200011ee:	f44f 6000 	mov.w	r0, #2048	; 0x800
200011f2:	f002 faa9 	bl	20003748 <malloc>
200011f6:	4b2a      	ldr	r3, [pc, #168]	; (200012a0 <bl_conf_init+0xb4>)
200011f8:	6018      	str	r0, [r3, #0]
200011fa:	b1c0      	cbz	r0, 2000122e <bl_conf_init+0x42>
200011fc:	4601      	mov	r1, r0
200011fe:	f44f 6200 	mov.w	r2, #2048	; 0x800
20001202:	f44f 40c0 	mov.w	r0, #24576	; 0x6000
20001206:	f002 fa85 	bl	20003714 <port_flash_read>
2000120a:	1e04      	subs	r4, r0, #0
2000120c:	db15      	blt.n	2000123a <bl_conf_init+0x4e>
2000120e:	4b24      	ldr	r3, [pc, #144]	; (200012a0 <bl_conf_init+0xb4>)
20001210:	681d      	ldr	r5, [r3, #0]
20001212:	8829      	ldrh	r1, [r5, #0]
20001214:	f245 4359 	movw	r3, #21593	; 0x5459
20001218:	4299      	cmp	r1, r3
2000121a:	d12e      	bne.n	2000127a <bl_conf_init+0x8e>
2000121c:	4b21      	ldr	r3, [pc, #132]	; (200012a4 <bl_conf_init+0xb8>)
2000121e:	681e      	ldr	r6, [r3, #0]
20001220:	3601      	adds	r6, #1
20001222:	f105 001f 	add.w	r0, r5, #31
20001226:	2200      	movs	r2, #0
20001228:	f245 4459 	movw	r4, #21593	; 0x5459
2000122c:	e00b      	b.n	20001246 <bl_conf_init+0x5a>
2000122e:	481e      	ldr	r0, [pc, #120]	; (200012a8 <bl_conf_init+0xbc>)
20001230:	f002 f990 	bl	20003554 <port_bl_log>
20001234:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
20001238:	e01d      	b.n	20001276 <bl_conf_init+0x8a>
2000123a:	4621      	mov	r1, r4
2000123c:	481b      	ldr	r0, [pc, #108]	; (200012ac <bl_conf_init+0xc0>)
2000123e:	f002 f989 	bl	20003554 <port_bl_log>
20001242:	e018      	b.n	20001276 <bl_conf_init+0x8a>
20001244:	461e      	mov	r6, r3
20001246:	1e6b      	subs	r3, r5, #1
20001248:	f813 1f01 	ldrb.w	r1, [r3, #1]!
2000124c:	440a      	add	r2, r1
2000124e:	4283      	cmp	r3, r0
20001250:	d1fa      	bne.n	20001248 <bl_conf_init+0x5c>
20001252:	3520      	adds	r5, #32
20001254:	f8b0 1001 	ldrh.w	r1, [r0, #1]
20001258:	1c73      	adds	r3, r6, #1
2000125a:	3020      	adds	r0, #32
2000125c:	42a1      	cmp	r1, r4
2000125e:	d0f1      	beq.n	20001244 <bl_conf_init+0x58>
20001260:	4b10      	ldr	r3, [pc, #64]	; (200012a4 <bl_conf_init+0xb8>)
20001262:	601e      	str	r6, [r3, #0]
20001264:	f64e 33eb 	movw	r3, #60395	; 0xebeb
20001268:	4299      	cmp	r1, r3
2000126a:	d108      	bne.n	2000127e <bl_conf_init+0x92>
2000126c:	692b      	ldr	r3, [r5, #16]
2000126e:	4293      	cmp	r3, r2
20001270:	bf08      	it	eq
20001272:	2400      	moveq	r4, #0
20001274:	d107      	bne.n	20001286 <bl_conf_init+0x9a>
20001276:	4620      	mov	r0, r4
20001278:	bd70      	pop	{r4, r5, r6, pc}
2000127a:	2200      	movs	r2, #0
2000127c:	e7f2      	b.n	20001264 <bl_conf_init+0x78>
2000127e:	480c      	ldr	r0, [pc, #48]	; (200012b0 <bl_conf_init+0xc4>)
20001280:	f002 f968 	bl	20003554 <port_bl_log>
20001284:	e004      	b.n	20001290 <bl_conf_init+0xa4>
20001286:	f64e 31eb 	movw	r1, #60395	; 0xebeb
2000128a:	480a      	ldr	r0, [pc, #40]	; (200012b4 <bl_conf_init+0xc8>)
2000128c:	f002 f962 	bl	20003554 <port_bl_log>
20001290:	f06f 015b 	mvn.w	r1, #91	; 0x5b
20001294:	4808      	ldr	r0, [pc, #32]	; (200012b8 <bl_conf_init+0xcc>)
20001296:	f002 f95d 	bl	20003554 <port_bl_log>
2000129a:	f06f 045b 	mvn.w	r4, #91	; 0x5b
2000129e:	e7ea      	b.n	20001276 <bl_conf_init+0x8a>
200012a0:	2001002c 	.word	0x2001002c
200012a4:	20010030 	.word	0x20010030
200012a8:	20004040 	.word	0x20004040
200012ac:	2000405c 	.word	0x2000405c
200012b0:	2000407c 	.word	0x2000407c
200012b4:	20004090 	.word	0x20004090
200012b8:	200040a8 	.word	0x200040a8

200012bc <bl_get_conf_val>:
200012bc:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
200012c0:	b360      	cbz	r0, 2000131c <bl_get_conf_val+0x60>
200012c2:	4689      	mov	r9, r1
200012c4:	4693      	mov	fp, r2
200012c6:	4680      	mov	r8, r0
200012c8:	b359      	cbz	r1, 20001322 <bl_get_conf_val+0x66>
200012ca:	4b17      	ldr	r3, [pc, #92]	; (20001328 <bl_get_conf_val+0x6c>)
200012cc:	681e      	ldr	r6, [r3, #0]
200012ce:	b17e      	cbz	r6, 200012f0 <bl_get_conf_val+0x34>
200012d0:	4b16      	ldr	r3, [pc, #88]	; (2000132c <bl_get_conf_val+0x70>)
200012d2:	f8d3 a000 	ldr.w	sl, [r3]
200012d6:	f10a 0502 	add.w	r5, sl, #2
200012da:	2400      	movs	r4, #0
200012dc:	4629      	mov	r1, r5
200012de:	4640      	mov	r0, r8
200012e0:	f002 fa82 	bl	200037e8 <strcmp>
200012e4:	4607      	mov	r7, r0
200012e6:	b150      	cbz	r0, 200012fe <bl_get_conf_val+0x42>
200012e8:	3401      	adds	r4, #1
200012ea:	3520      	adds	r5, #32
200012ec:	42b4      	cmp	r4, r6
200012ee:	d1f5      	bne.n	200012dc <bl_get_conf_val+0x20>
200012f0:	4641      	mov	r1, r8
200012f2:	480f      	ldr	r0, [pc, #60]	; (20001330 <bl_get_conf_val+0x74>)
200012f4:	f002 f92e 	bl	20003554 <port_bl_log>
200012f8:	f06f 075a 	mvn.w	r7, #90	; 0x5a
200012fc:	e00b      	b.n	20001316 <bl_get_conf_val+0x5a>
200012fe:	42a6      	cmp	r6, r4
20001300:	d0f6      	beq.n	200012f0 <bl_get_conf_val+0x34>
20001302:	eb0a 1144 	add.w	r1, sl, r4, lsl #5
20001306:	465a      	mov	r2, fp
20001308:	2a10      	cmp	r2, #16
2000130a:	bf28      	it	cs
2000130c:	2210      	movcs	r2, #16
2000130e:	3110      	adds	r1, #16
20001310:	4648      	mov	r0, r9
20001312:	f002 fa39 	bl	20003788 <memcpy>
20001316:	4638      	mov	r0, r7
20001318:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
2000131c:	f06f 0762 	mvn.w	r7, #98	; 0x62
20001320:	e7f9      	b.n	20001316 <bl_get_conf_val+0x5a>
20001322:	f06f 0762 	mvn.w	r7, #98	; 0x62
20001326:	e7f6      	b.n	20001316 <bl_get_conf_val+0x5a>
20001328:	20010030 	.word	0x20010030
2000132c:	2001002c 	.word	0x2001002c
20001330:	200040c8 	.word	0x200040c8

20001334 <bl_flash_table_init>:
20001334:	b5f0      	push	{r4, r5, r6, r7, lr}
20001336:	b085      	sub	sp, #20
20001338:	2210      	movs	r2, #16
2000133a:	4669      	mov	r1, sp
2000133c:	4834      	ldr	r0, [pc, #208]	; (20001410 <bl_flash_table_init+0xdc>)
2000133e:	f7ff ffbd 	bl	200012bc <bl_get_conf_val>
20001342:	4604      	mov	r4, r0
20001344:	bb18      	cbnz	r0, 2000138e <bl_flash_table_init+0x5a>
20001346:	f44f 6000 	mov.w	r0, #2048	; 0x800
2000134a:	f002 f9fd 	bl	20003748 <malloc>
2000134e:	4b31      	ldr	r3, [pc, #196]	; (20001414 <bl_flash_table_init+0xe0>)
20001350:	6018      	str	r0, [r3, #0]
20001352:	b318      	cbz	r0, 2000139c <bl_flash_table_init+0x68>
20001354:	2210      	movs	r2, #16
20001356:	2100      	movs	r1, #0
20001358:	4668      	mov	r0, sp
2000135a:	f002 fae5 	bl	20003928 <strtol>
2000135e:	4d2d      	ldr	r5, [pc, #180]	; (20001414 <bl_flash_table_init+0xe0>)
20001360:	f44f 6200 	mov.w	r2, #2048	; 0x800
20001364:	6829      	ldr	r1, [r5, #0]
20001366:	f002 f9d5 	bl	20003714 <port_flash_read>
2000136a:	682f      	ldr	r7, [r5, #0]
2000136c:	787b      	ldrb	r3, [r7, #1]
2000136e:	783a      	ldrb	r2, [r7, #0]
20001370:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
20001374:	f64e 33eb 	movw	r3, #60395	; 0xebeb
20001378:	429a      	cmp	r2, r3
2000137a:	d043      	beq.n	20001404 <bl_flash_table_init+0xd0>
2000137c:	1e7b      	subs	r3, r7, #1
2000137e:	2100      	movs	r1, #0
20001380:	f245 4559 	movw	r5, #21593	; 0x5459
20001384:	f8df c0a4 	ldr.w	ip, [pc, #164]	; 2000142c <bl_flash_table_init+0xf8>
20001388:	f64e 36eb 	movw	r6, #60395	; 0xebeb
2000138c:	e00e      	b.n	200013ac <bl_flash_table_init+0x78>
2000138e:	4601      	mov	r1, r0
20001390:	4821      	ldr	r0, [pc, #132]	; (20001418 <bl_flash_table_init+0xe4>)
20001392:	f002 f8df 	bl	20003554 <port_bl_log>
20001396:	f06f 0459 	mvn.w	r4, #89	; 0x59
2000139a:	e024      	b.n	200013e6 <bl_flash_table_init+0xb2>
2000139c:	2100      	movs	r1, #0
2000139e:	481f      	ldr	r0, [pc, #124]	; (2000141c <bl_flash_table_init+0xe8>)
200013a0:	f002 f8d8 	bl	20003554 <port_bl_log>
200013a4:	f06f 0459 	mvn.w	r4, #89	; 0x59
200013a8:	e01d      	b.n	200013e6 <bl_flash_table_init+0xb2>
200013aa:	4603      	mov	r3, r0
200013ac:	42aa      	cmp	r2, r5
200013ae:	d11d      	bne.n	200013ec <bl_flash_table_init+0xb8>
200013b0:	f89c 2000 	ldrb.w	r2, [ip]
200013b4:	3201      	adds	r2, #1
200013b6:	b2d2      	uxtb	r2, r2
200013b8:	f88c 2000 	strb.w	r2, [ip]
200013bc:	461a      	mov	r2, r3
200013be:	f103 0020 	add.w	r0, r3, #32
200013c2:	f812 ef01 	ldrb.w	lr, [r2, #1]!
200013c6:	4471      	add	r1, lr
200013c8:	4282      	cmp	r2, r0
200013ca:	d1fa      	bne.n	200013c2 <bl_flash_table_init+0x8e>
200013cc:	f103 0721 	add.w	r7, r3, #33	; 0x21
200013d0:	f893 e022 	ldrb.w	lr, [r3, #34]	; 0x22
200013d4:	f893 2021 	ldrb.w	r2, [r3, #33]	; 0x21
200013d8:	ea42 220e 	orr.w	r2, r2, lr, lsl #8
200013dc:	42b2      	cmp	r2, r6
200013de:	d1e4      	bne.n	200013aa <bl_flash_table_init+0x76>
200013e0:	8a3a      	ldrh	r2, [r7, #16]
200013e2:	428a      	cmp	r2, r1
200013e4:	d110      	bne.n	20001408 <bl_flash_table_init+0xd4>
200013e6:	4620      	mov	r0, r4
200013e8:	b005      	add	sp, #20
200013ea:	bdf0      	pop	{r4, r5, r6, r7, pc}
200013ec:	4611      	mov	r1, r2
200013ee:	480c      	ldr	r0, [pc, #48]	; (20001420 <bl_flash_table_init+0xec>)
200013f0:	f002 f8b0 	bl	20003554 <port_bl_log>
200013f4:	f06f 0157 	mvn.w	r1, #87	; 0x57
200013f8:	480a      	ldr	r0, [pc, #40]	; (20001424 <bl_flash_table_init+0xf0>)
200013fa:	f002 f8ab 	bl	20003554 <port_bl_log>
200013fe:	f06f 0459 	mvn.w	r4, #89	; 0x59
20001402:	e7f0      	b.n	200013e6 <bl_flash_table_init+0xb2>
20001404:	2100      	movs	r1, #0
20001406:	e7eb      	b.n	200013e0 <bl_flash_table_init+0xac>
20001408:	4807      	ldr	r0, [pc, #28]	; (20001428 <bl_flash_table_init+0xf4>)
2000140a:	f002 f8a3 	bl	20003554 <port_bl_log>
2000140e:	e7f1      	b.n	200013f4 <bl_flash_table_init+0xc0>
20001410:	200040ec 	.word	0x200040ec
20001414:	20010034 	.word	0x20010034
20001418:	200040f8 	.word	0x200040f8
2000141c:	20004114 	.word	0x20004114
20001420:	20004138 	.word	0x20004138
20001424:	20004178 	.word	0x20004178
20001428:	20004164 	.word	0x20004164
2000142c:	20010038 	.word	0x20010038

20001430 <bl_lookup_flash_table>:
20001430:	2800      	cmp	r0, #0
20001432:	d03d      	beq.n	200014b0 <bl_lookup_flash_table+0x80>
20001434:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20001438:	4688      	mov	r8, r1
2000143a:	4606      	mov	r6, r0
2000143c:	2900      	cmp	r1, #0
2000143e:	d03a      	beq.n	200014b6 <bl_lookup_flash_table+0x86>
20001440:	4b1e      	ldr	r3, [pc, #120]	; (200014bc <bl_lookup_flash_table+0x8c>)
20001442:	781b      	ldrb	r3, [r3, #0]
20001444:	b393      	cbz	r3, 200014ac <bl_lookup_flash_table+0x7c>
20001446:	4b1e      	ldr	r3, [pc, #120]	; (200014c0 <bl_lookup_flash_table+0x90>)
20001448:	681c      	ldr	r4, [r3, #0]
2000144a:	2500      	movs	r5, #0
2000144c:	4f1b      	ldr	r7, [pc, #108]	; (200014bc <bl_lookup_flash_table+0x8c>)
2000144e:	f104 010e 	add.w	r1, r4, #14
20001452:	4630      	mov	r0, r6
20001454:	f002 f9c8 	bl	200037e8 <strcmp>
20001458:	b130      	cbz	r0, 20001468 <bl_lookup_flash_table+0x38>
2000145a:	3501      	adds	r5, #1
2000145c:	783b      	ldrb	r3, [r7, #0]
2000145e:	b2db      	uxtb	r3, r3
20001460:	3420      	adds	r4, #32
20001462:	42ab      	cmp	r3, r5
20001464:	dcf3      	bgt.n	2000144e <bl_lookup_flash_table+0x1e>
20001466:	e017      	b.n	20001498 <bl_lookup_flash_table+0x68>
20001468:	6820      	ldr	r0, [r4, #0]
2000146a:	6861      	ldr	r1, [r4, #4]
2000146c:	68a2      	ldr	r2, [r4, #8]
2000146e:	68e3      	ldr	r3, [r4, #12]
20001470:	f8c8 0000 	str.w	r0, [r8]
20001474:	f8c8 1004 	str.w	r1, [r8, #4]
20001478:	f8c8 2008 	str.w	r2, [r8, #8]
2000147c:	f8c8 300c 	str.w	r3, [r8, #12]
20001480:	6920      	ldr	r0, [r4, #16]
20001482:	6961      	ldr	r1, [r4, #20]
20001484:	69a2      	ldr	r2, [r4, #24]
20001486:	69e3      	ldr	r3, [r4, #28]
20001488:	f8c8 0010 	str.w	r0, [r8, #16]
2000148c:	f8c8 1014 	str.w	r1, [r8, #20]
20001490:	f8c8 2018 	str.w	r2, [r8, #24]
20001494:	f8c8 301c 	str.w	r3, [r8, #28]
20001498:	4b08      	ldr	r3, [pc, #32]	; (200014bc <bl_lookup_flash_table+0x8c>)
2000149a:	781b      	ldrb	r3, [r3, #0]
2000149c:	b2db      	uxtb	r3, r3
2000149e:	42ab      	cmp	r3, r5
200014a0:	bf14      	ite	ne
200014a2:	2000      	movne	r0, #0
200014a4:	f06f 0056 	mvneq.w	r0, #86	; 0x56
200014a8:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
200014ac:	2500      	movs	r5, #0
200014ae:	e7f3      	b.n	20001498 <bl_lookup_flash_table+0x68>
200014b0:	f06f 0062 	mvn.w	r0, #98	; 0x62
200014b4:	4770      	bx	lr
200014b6:	f06f 0062 	mvn.w	r0, #98	; 0x62
200014ba:	e7f5      	b.n	200014a8 <bl_lookup_flash_table+0x78>
200014bc:	20010038 	.word	0x20010038
200014c0:	20010034 	.word	0x20010034

200014c4 <bl_exec>:
200014c4:	b508      	push	{r3, lr}
200014c6:	f002 f8ba 	bl	2000363e <platform_do_jump>
200014ca:	bd08      	pop	{r3, pc}

200014cc <bl_exec_app>:
200014cc:	b500      	push	{lr}
200014ce:	b089      	sub	sp, #36	; 0x24
200014d0:	4669      	mov	r1, sp
200014d2:	4806      	ldr	r0, [pc, #24]	; (200014ec <bl_exec_app+0x20>)
200014d4:	f7ff ffac 	bl	20001430 <bl_lookup_flash_table>
200014d8:	f8bd 000c 	ldrh.w	r0, [sp, #12]
200014dc:	9b01      	ldr	r3, [sp, #4]
200014de:	4418      	add	r0, r3
200014e0:	f002 f8ad 	bl	2000363e <platform_do_jump>
200014e4:	b009      	add	sp, #36	; 0x24
200014e6:	f85d fb04 	ldr.w	pc, [sp], #4
200014ea:	bf00      	nop
200014ec:	20004198 	.word	0x20004198

200014f0 <call_platform_after_startup>:
200014f0:	b508      	push	{r3, lr}
200014f2:	4802      	ldr	r0, [pc, #8]	; (200014fc <call_platform_after_startup+0xc>)
200014f4:	f002 f88c 	bl	20003610 <platform_handle_after_startup>
200014f8:	bd08      	pop	{r3, pc}
200014fa:	bf00      	nop
200014fc:	200014f1 	.word	0x200014f1

20001500 <main>:
20001500:	b500      	push	{lr}
20001502:	b08d      	sub	sp, #52	; 0x34
20001504:	f002 f85a 	bl	200035bc <platform_init_hook>
20001508:	f001 ffd8 	bl	200034bc <port_log_init>
2000150c:	f002 f8f8 	bl	20003700 <port_flash_init>
20001510:	bb38      	cbnz	r0, 20001562 <main+0x62>
20001512:	492a      	ldr	r1, [pc, #168]	; (200015bc <main+0xbc>)
20001514:	482a      	ldr	r0, [pc, #168]	; (200015c0 <main+0xc0>)
20001516:	f002 f81d 	bl	20003554 <port_bl_log>
2000151a:	f7ff ffe9 	bl	200014f0 <call_platform_after_startup>
2000151e:	4601      	mov	r1, r0
20001520:	bb30      	cbnz	r0, 20001570 <main+0x70>
20001522:	f7ff fe63 	bl	200011ec <bl_conf_init>
20001526:	4601      	mov	r1, r0
20001528:	bb30      	cbnz	r0, 20001578 <main+0x78>
2000152a:	2210      	movs	r2, #16
2000152c:	4669      	mov	r1, sp
2000152e:	4825      	ldr	r0, [pc, #148]	; (200015c4 <main+0xc4>)
20001530:	f7ff fec4 	bl	200012bc <bl_get_conf_val>
20001534:	b320      	cbz	r0, 20001580 <main+0x80>
20001536:	f7ff fefd 	bl	20001334 <bl_flash_table_init>
2000153a:	a904      	add	r1, sp, #16
2000153c:	4822      	ldr	r0, [pc, #136]	; (200015c8 <main+0xc8>)
2000153e:	f7ff ff77 	bl	20001430 <bl_lookup_flash_table>
20001542:	b340      	cbz	r0, 20001596 <main+0x96>
20001544:	a804      	add	r0, sp, #16
20001546:	f000 f849 	bl	200015dc <bl_do_upgrade>
2000154a:	b970      	cbnz	r0, 2000156a <main+0x6a>
2000154c:	f000 fb7e 	bl	20001c4c <bl_peripheral_remove>
20001550:	4b1e      	ldr	r3, [pc, #120]	; (200015cc <main+0xcc>)
20001552:	681b      	ldr	r3, [r3, #0]
20001554:	bb5b      	cbnz	r3, 200015ae <main+0xae>
20001556:	f002 f8da 	bl	2000370e <port_flash_deinit>
2000155a:	2000      	movs	r0, #0
2000155c:	f002 f86e 	bl	2000363c <platform_handle_after_ota>
20001560:	e003      	b.n	2000156a <main+0x6a>
20001562:	4601      	mov	r1, r0
20001564:	481a      	ldr	r0, [pc, #104]	; (200015d0 <main+0xd0>)
20001566:	f001 fff5 	bl	20003554 <port_bl_log>
2000156a:	f7ff ffaf 	bl	200014cc <bl_exec_app>
2000156e:	e7fe      	b.n	2000156e <main+0x6e>
20001570:	4818      	ldr	r0, [pc, #96]	; (200015d4 <main+0xd4>)
20001572:	f001 ffef 	bl	20003554 <port_bl_log>
20001576:	e7f8      	b.n	2000156a <main+0x6a>
20001578:	4817      	ldr	r0, [pc, #92]	; (200015d8 <main+0xd8>)
2000157a:	f001 ffeb 	bl	20003554 <port_bl_log>
2000157e:	e7f4      	b.n	2000156a <main+0x6a>
20001580:	2210      	movs	r2, #16
20001582:	2100      	movs	r1, #0
20001584:	4668      	mov	r0, sp
20001586:	f002 f9cf 	bl	20003928 <strtol>
2000158a:	4a10      	ldr	r2, [pc, #64]	; (200015cc <main+0xcc>)
2000158c:	6010      	str	r0, [r2, #0]
2000158e:	6810      	ldr	r0, [r2, #0]
20001590:	f000 fb10 	bl	20001bb4 <bl_peripheral_status_keep>
20001594:	e7cf      	b.n	20001536 <main+0x36>
20001596:	2300      	movs	r3, #0
20001598:	9300      	str	r3, [sp, #0]
2000159a:	4669      	mov	r1, sp
2000159c:	a804      	add	r0, sp, #16
2000159e:	f002 f83b 	bl	20003618 <platform_check_ota_program>
200015a2:	2800      	cmp	r0, #0
200015a4:	d1ce      	bne.n	20001544 <main+0x44>
200015a6:	9800      	ldr	r0, [sp, #0]
200015a8:	f7ff ff8c 	bl	200014c4 <bl_exec>
200015ac:	e7ca      	b.n	20001544 <main+0x44>
200015ae:	4b07      	ldr	r3, [pc, #28]	; (200015cc <main+0xcc>)
200015b0:	6818      	ldr	r0, [r3, #0]
200015b2:	f44f 5180 	mov.w	r1, #4096	; 0x1000
200015b6:	f002 f8c1 	bl	2000373c <port_flash_erase>
200015ba:	e7cc      	b.n	20001556 <main+0x56>
200015bc:	200041b8 	.word	0x200041b8
200015c0:	200041c4 	.word	0x200041c4
200015c4:	2000421c 	.word	0x2000421c
200015c8:	20004228 	.word	0x20004228
200015cc:	2001003c 	.word	0x2001003c
200015d0:	2000419c 	.word	0x2000419c
200015d4:	200041e4 	.word	0x200041e4
200015d8:	200041fc 	.word	0x200041fc

200015dc <bl_do_upgrade>:
200015dc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200015e0:	b085      	sub	sp, #20
200015e2:	9001      	str	r0, [sp, #4]
200015e4:	6845      	ldr	r5, [r0, #4]
200015e6:	f44f 700d 	mov.w	r0, #564	; 0x234
200015ea:	f002 f8ad 	bl	20003748 <malloc>
200015ee:	4b8c      	ldr	r3, [pc, #560]	; (20001820 <bl_do_upgrade+0x244>)
200015f0:	6018      	str	r0, [r3, #0]
200015f2:	2800      	cmp	r0, #0
200015f4:	f000 82a8 	beq.w	20001b48 <bl_do_upgrade+0x56c>
200015f8:	4601      	mov	r1, r0
200015fa:	f44f 720d 	mov.w	r2, #564	; 0x234
200015fe:	4628      	mov	r0, r5
20001600:	f002 f888 	bl	20003714 <port_flash_read>
20001604:	4b86      	ldr	r3, [pc, #536]	; (20001820 <bl_do_upgrade+0x244>)
20001606:	6818      	ldr	r0, [r3, #0]
20001608:	6802      	ldr	r2, [r0, #0]
2000160a:	4b86      	ldr	r3, [pc, #536]	; (20001824 <bl_do_upgrade+0x248>)
2000160c:	429a      	cmp	r2, r3
2000160e:	f040 80b8 	bne.w	20001782 <bl_do_upgrade+0x1a6>
20001612:	7906      	ldrb	r6, [r0, #4]
20001614:	2e34      	cmp	r6, #52	; 0x34
20001616:	f040 80bd 	bne.w	20001794 <bl_do_upgrade+0x1b8>
2000161a:	4b81      	ldr	r3, [pc, #516]	; (20001820 <bl_do_upgrade+0x244>)
2000161c:	6818      	ldr	r0, [r3, #0]
2000161e:	7943      	ldrb	r3, [r0, #5]
20001620:	2b02      	cmp	r3, #2
20001622:	f040 80ce 	bne.w	200017c2 <bl_do_upgrade+0x1e6>
20001626:	2300      	movs	r3, #0
20001628:	74c3      	strb	r3, [r0, #19]
2000162a:	1f37      	subs	r7, r6, #4
2000162c:	19c3      	adds	r3, r0, r7
2000162e:	78da      	ldrb	r2, [r3, #3]
20001630:	789c      	ldrb	r4, [r3, #2]
20001632:	0424      	lsls	r4, r4, #16
20001634:	ea44 6402 	orr.w	r4, r4, r2, lsl #24
20001638:	5dc2      	ldrb	r2, [r0, r7]
2000163a:	4314      	orrs	r4, r2
2000163c:	785b      	ldrb	r3, [r3, #1]
2000163e:	ea44 2403 	orr.w	r4, r4, r3, lsl #8
20001642:	4621      	mov	r1, r4
20001644:	4878      	ldr	r0, [pc, #480]	; (20001828 <bl_do_upgrade+0x24c>)
20001646:	f001 ff85 	bl	20003554 <port_bl_log>
2000164a:	4b75      	ldr	r3, [pc, #468]	; (20001820 <bl_do_upgrade+0x244>)
2000164c:	6818      	ldr	r0, [r3, #0]
2000164e:	6943      	ldr	r3, [r0, #20]
20001650:	2b00      	cmp	r3, #0
20001652:	f000 80bf 	beq.w	200017d4 <bl_do_upgrade+0x1f8>
20001656:	4639      	mov	r1, r7
20001658:	f7ff fdb6 	bl	200011c8 <tuya_bl_sum_check>
2000165c:	4284      	cmp	r4, r0
2000165e:	f040 80c1 	bne.w	200017e4 <bl_do_upgrade+0x208>
20001662:	4631      	mov	r1, r6
20001664:	4871      	ldr	r0, [pc, #452]	; (2000182c <bl_do_upgrade+0x250>)
20001666:	f001 ff75 	bl	20003554 <port_bl_log>
2000166a:	4c6d      	ldr	r4, [pc, #436]	; (20001820 <bl_do_upgrade+0x244>)
2000166c:	6823      	ldr	r3, [r4, #0]
2000166e:	7959      	ldrb	r1, [r3, #5]
20001670:	486f      	ldr	r0, [pc, #444]	; (20001830 <bl_do_upgrade+0x254>)
20001672:	f001 ff6f 	bl	20003554 <port_bl_log>
20001676:	6821      	ldr	r1, [r4, #0]
20001678:	3106      	adds	r1, #6
2000167a:	486e      	ldr	r0, [pc, #440]	; (20001834 <bl_do_upgrade+0x258>)
2000167c:	f001 ff6a 	bl	20003554 <port_bl_log>
20001680:	6823      	ldr	r3, [r4, #0]
20001682:	6959      	ldr	r1, [r3, #20]
20001684:	486c      	ldr	r0, [pc, #432]	; (20001838 <bl_do_upgrade+0x25c>)
20001686:	f001 ff65 	bl	20003554 <port_bl_log>
2000168a:	6823      	ldr	r3, [r4, #0]
2000168c:	6a99      	ldr	r1, [r3, #40]	; 0x28
2000168e:	486b      	ldr	r0, [pc, #428]	; (2000183c <bl_do_upgrade+0x260>)
20001690:	f001 ff60 	bl	20003554 <port_bl_log>
20001694:	6821      	ldr	r1, [r4, #0]
20001696:	311c      	adds	r1, #28
20001698:	4869      	ldr	r0, [pc, #420]	; (20001840 <bl_do_upgrade+0x264>)
2000169a:	f001 ff5b 	bl	20003554 <port_bl_log>
2000169e:	2020      	movs	r0, #32
200016a0:	f002 f852 	bl	20003748 <malloc>
200016a4:	4601      	mov	r1, r0
200016a6:	4b67      	ldr	r3, [pc, #412]	; (20001844 <bl_do_upgrade+0x268>)
200016a8:	6018      	str	r0, [r3, #0]
200016aa:	2800      	cmp	r0, #0
200016ac:	f000 81fa 	beq.w	20001aa4 <bl_do_upgrade+0x4c8>
200016b0:	6820      	ldr	r0, [r4, #0]
200016b2:	3006      	adds	r0, #6
200016b4:	f7ff febc 	bl	20001430 <bl_lookup_flash_table>
200016b8:	9000      	str	r0, [sp, #0]
200016ba:	2800      	cmp	r0, #0
200016bc:	f040 809b 	bne.w	200017f6 <bl_do_upgrade+0x21a>
200016c0:	4b60      	ldr	r3, [pc, #384]	; (20001844 <bl_do_upgrade+0x268>)
200016c2:	681a      	ldr	r2, [r3, #0]
200016c4:	6851      	ldr	r1, [r2, #4]
200016c6:	4b56      	ldr	r3, [pc, #344]	; (20001820 <bl_do_upgrade+0x244>)
200016c8:	681c      	ldr	r4, [r3, #0]
200016ca:	6890      	ldr	r0, [r2, #8]
200016cc:	4408      	add	r0, r1
200016ce:	6aa3      	ldr	r3, [r4, #40]	; 0x28
200016d0:	440b      	add	r3, r1
200016d2:	8992      	ldrh	r2, [r2, #12]
200016d4:	4413      	add	r3, r2
200016d6:	4283      	cmp	r3, r0
200016d8:	f200 823e 	bhi.w	20001b58 <bl_do_upgrade+0x57c>
200016dc:	f5a0 7680 	sub.w	r6, r0, #256	; 0x100
200016e0:	2300      	movs	r3, #0
200016e2:	f88d 300e 	strb.w	r3, [sp, #14]
200016e6:	f88d 300f 	strb.w	r3, [sp, #15]
200016ea:	f44f 5080 	mov.w	r0, #4096	; 0x1000
200016ee:	f002 f82b 	bl	20003748 <malloc>
200016f2:	4607      	mov	r7, r0
200016f4:	2800      	cmp	r0, #0
200016f6:	f000 8223 	beq.w	20001b40 <bl_do_upgrade+0x564>
200016fa:	2209      	movs	r2, #9
200016fc:	4952      	ldr	r1, [pc, #328]	; (20001848 <bl_do_upgrade+0x26c>)
200016fe:	f204 1039 	addw	r0, r4, #313	; 0x139
20001702:	f002 f87b 	bl	200037fc <strncmp>
20001706:	b910      	cbnz	r0, 2000170e <bl_do_upgrade+0x132>
20001708:	2301      	movs	r3, #1
2000170a:	f88d 300e 	strb.w	r3, [sp, #14]
2000170e:	f44f 5280 	mov.w	r2, #4096	; 0x1000
20001712:	2100      	movs	r1, #0
20001714:	4638      	mov	r0, r7
20001716:	f002 f85f 	bl	200037d8 <memset>
2000171a:	f44f 7280 	mov.w	r2, #256	; 0x100
2000171e:	4639      	mov	r1, r7
20001720:	4630      	mov	r0, r6
20001722:	f001 fff7 	bl	20003714 <port_flash_read>
20001726:	2209      	movs	r2, #9
20001728:	4947      	ldr	r1, [pc, #284]	; (20001848 <bl_do_upgrade+0x26c>)
2000172a:	1d78      	adds	r0, r7, #5
2000172c:	f002 f866 	bl	200037fc <strncmp>
20001730:	b910      	cbnz	r0, 20001738 <bl_do_upgrade+0x15c>
20001732:	2301      	movs	r3, #1
20001734:	f88d 300f 	strb.w	r3, [sp, #15]
20001738:	4638      	mov	r0, r7
2000173a:	f002 f80d 	bl	20003758 <free>
2000173e:	f89d 300e 	ldrb.w	r3, [sp, #14]
20001742:	f89d 200f 	ldrb.w	r2, [sp, #15]
20001746:	b2db      	uxtb	r3, r3
20001748:	4293      	cmp	r3, r2
2000174a:	d15a      	bne.n	20001802 <bl_do_upgrade+0x226>
2000174c:	4b34      	ldr	r3, [pc, #208]	; (20001820 <bl_do_upgrade+0x244>)
2000174e:	f8d3 b000 	ldr.w	fp, [r3]
20001752:	f44f 5080 	mov.w	r0, #4096	; 0x1000
20001756:	f001 fff7 	bl	20003748 <malloc>
2000175a:	4606      	mov	r6, r0
2000175c:	2800      	cmp	r0, #0
2000175e:	f000 81a5 	beq.w	20001aac <bl_do_upgrade+0x4d0>
20001762:	f89b 4004 	ldrb.w	r4, [fp, #4]
20001766:	f504 7400 	add.w	r4, r4, #512	; 0x200
2000176a:	442c      	add	r4, r5
2000176c:	f8db 3014 	ldr.w	r3, [fp, #20]
20001770:	441d      	add	r5, r3
20001772:	42ac      	cmp	r4, r5
20001774:	d249      	bcs.n	2000180a <bl_do_upgrade+0x22e>
20001776:	f04f 0800 	mov.w	r8, #0
2000177a:	f44f 5980 	mov.w	r9, #4096	; 0x1000
2000177e:	46c2      	mov	sl, r8
20001780:	e1a3      	b.n	20001aca <bl_do_upgrade+0x4ee>
20001782:	f001 ffe9 	bl	20003758 <free>
20001786:	4b26      	ldr	r3, [pc, #152]	; (20001820 <bl_do_upgrade+0x244>)
20001788:	2200      	movs	r2, #0
2000178a:	601a      	str	r2, [r3, #0]
2000178c:	f06f 0355 	mvn.w	r3, #85	; 0x55
20001790:	9300      	str	r3, [sp, #0]
20001792:	e173      	b.n	20001a7c <bl_do_upgrade+0x4a0>
20001794:	f001 ffe0 	bl	20003758 <free>
20001798:	f506 7400 	add.w	r4, r6, #512	; 0x200
2000179c:	4620      	mov	r0, r4
2000179e:	f001 ffd3 	bl	20003748 <malloc>
200017a2:	4b1f      	ldr	r3, [pc, #124]	; (20001820 <bl_do_upgrade+0x244>)
200017a4:	6018      	str	r0, [r3, #0]
200017a6:	2800      	cmp	r0, #0
200017a8:	f000 81d2 	beq.w	20001b50 <bl_do_upgrade+0x574>
200017ac:	4621      	mov	r1, r4
200017ae:	4827      	ldr	r0, [pc, #156]	; (2000184c <bl_do_upgrade+0x270>)
200017b0:	f001 fed0 	bl	20003554 <port_bl_log>
200017b4:	4622      	mov	r2, r4
200017b6:	4b1a      	ldr	r3, [pc, #104]	; (20001820 <bl_do_upgrade+0x244>)
200017b8:	6819      	ldr	r1, [r3, #0]
200017ba:	4628      	mov	r0, r5
200017bc:	f001 ffaa 	bl	20003714 <port_flash_read>
200017c0:	e72b      	b.n	2000161a <bl_do_upgrade+0x3e>
200017c2:	f001 ffc9 	bl	20003758 <free>
200017c6:	4b16      	ldr	r3, [pc, #88]	; (20001820 <bl_do_upgrade+0x244>)
200017c8:	2200      	movs	r2, #0
200017ca:	601a      	str	r2, [r3, #0]
200017cc:	f06f 0351 	mvn.w	r3, #81	; 0x51
200017d0:	9300      	str	r3, [sp, #0]
200017d2:	e153      	b.n	20001a7c <bl_do_upgrade+0x4a0>
200017d4:	2100      	movs	r1, #0
200017d6:	481e      	ldr	r0, [pc, #120]	; (20001850 <bl_do_upgrade+0x274>)
200017d8:	f001 febc 	bl	20003554 <port_bl_log>
200017dc:	f06f 0354 	mvn.w	r3, #84	; 0x54
200017e0:	9300      	str	r3, [sp, #0]
200017e2:	e14b      	b.n	20001a7c <bl_do_upgrade+0x4a0>
200017e4:	4622      	mov	r2, r4
200017e6:	4601      	mov	r1, r0
200017e8:	481a      	ldr	r0, [pc, #104]	; (20001854 <bl_do_upgrade+0x278>)
200017ea:	f001 feb3 	bl	20003554 <port_bl_log>
200017ee:	f06f 0353 	mvn.w	r3, #83	; 0x53
200017f2:	9300      	str	r3, [sp, #0]
200017f4:	e142      	b.n	20001a7c <bl_do_upgrade+0x4a0>
200017f6:	6821      	ldr	r1, [r4, #0]
200017f8:	3106      	adds	r1, #6
200017fa:	4817      	ldr	r0, [pc, #92]	; (20001858 <bl_do_upgrade+0x27c>)
200017fc:	f001 feaa 	bl	20003554 <port_bl_log>
20001800:	e13c      	b.n	20001a7c <bl_do_upgrade+0x4a0>
20001802:	f06f 034f 	mvn.w	r3, #79	; 0x4f
20001806:	9300      	str	r3, [sp, #0]
20001808:	e138      	b.n	20001a7c <bl_do_upgrade+0x4a0>
2000180a:	f04f 0800 	mov.w	r8, #0
2000180e:	e170      	b.n	20001af2 <bl_do_upgrade+0x516>
20001810:	4641      	mov	r1, r8
20001812:	4812      	ldr	r0, [pc, #72]	; (2000185c <bl_do_upgrade+0x280>)
20001814:	f001 fe9e 	bl	20003554 <port_bl_log>
20001818:	f06f 0352 	mvn.w	r3, #82	; 0x52
2000181c:	9300      	str	r3, [sp, #0]
2000181e:	e12d      	b.n	20001a7c <bl_do_upgrade+0x4a0>
20001820:	20010048 	.word	0x20010048
20001824:	5459424c 	.word	0x5459424c
20001828:	20004248 	.word	0x20004248
2000182c:	200042a0 	.word	0x200042a0
20001830:	200042b4 	.word	0x200042b4
20001834:	200042c4 	.word	0x200042c4
20001838:	200042d4 	.word	0x200042d4
2000183c:	200042e8 	.word	0x200042e8
20001840:	200042fc 	.word	0x200042fc
20001844:	20010044 	.word	0x20010044
20001848:	20004334 	.word	0x20004334
2000184c:	2000422c 	.word	0x2000422c
20001850:	20004260 	.word	0x20004260
20001854:	2000427c 	.word	0x2000427c
20001858:	20004314 	.word	0x20004314
2000185c:	20004340 	.word	0x20004340
20001860:	7915      	ldrb	r5, [r2, #4]
20001862:	6957      	ldr	r7, [r2, #20]
20001864:	9b01      	ldr	r3, [sp, #4]
20001866:	f8d3 b004 	ldr.w	fp, [r3, #4]
2000186a:	f000 fb15 	bl	20001e98 <xz_crc32_init>
2000186e:	f44f 5180 	mov.w	r1, #4096	; 0x1000
20001872:	2002      	movs	r0, #2
20001874:	f001 fdfa 	bl	2000346c <xz_dec_init>
20001878:	4bba      	ldr	r3, [pc, #744]	; (20001b64 <bl_do_upgrade+0x588>)
2000187a:	6018      	str	r0, [r3, #0]
2000187c:	2800      	cmp	r0, #0
2000187e:	f000 818b 	beq.w	20001b98 <bl_do_upgrade+0x5bc>
20001882:	f505 7500 	add.w	r5, r5, #512	; 0x200
20001886:	44ab      	add	fp, r5
20001888:	44a2      	add	sl, r4
2000188a:	1b7f      	subs	r7, r7, r5
2000188c:	2018      	movs	r0, #24
2000188e:	f001 ff5b 	bl	20003748 <malloc>
20001892:	4605      	mov	r5, r0
20001894:	4bb4      	ldr	r3, [pc, #720]	; (20001b68 <bl_do_upgrade+0x58c>)
20001896:	6018      	str	r0, [r3, #0]
20001898:	2080      	movs	r0, #128	; 0x80
2000189a:	f001 ff55 	bl	20003748 <malloc>
2000189e:	6028      	str	r0, [r5, #0]
200018a0:	2400      	movs	r4, #0
200018a2:	606c      	str	r4, [r5, #4]
200018a4:	60ac      	str	r4, [r5, #8]
200018a6:	f44f 5080 	mov.w	r0, #4096	; 0x1000
200018aa:	f001 ff4d 	bl	20003748 <malloc>
200018ae:	60e8      	str	r0, [r5, #12]
200018b0:	612c      	str	r4, [r5, #16]
200018b2:	f44f 5380 	mov.w	r3, #4096	; 0x1000
200018b6:	616b      	str	r3, [r5, #20]
200018b8:	f000 fab8 	bl	20001e2c <xPortGetFreeHeapSize>
200018bc:	4601      	mov	r1, r0
200018be:	48ab      	ldr	r0, [pc, #684]	; (20001b6c <bl_do_upgrade+0x590>)
200018c0:	f001 fe48 	bl	20003554 <port_bl_log>
200018c4:	46a0      	mov	r8, r4
200018c6:	4ea8      	ldr	r6, [pc, #672]	; (20001b68 <bl_do_upgrade+0x58c>)
200018c8:	f8df 9298 	ldr.w	r9, [pc, #664]	; 20001b64 <bl_do_upgrade+0x588>
200018cc:	6833      	ldr	r3, [r6, #0]
200018ce:	6859      	ldr	r1, [r3, #4]
200018d0:	689a      	ldr	r2, [r3, #8]
200018d2:	4291      	cmp	r1, r2
200018d4:	d04a      	beq.n	2000196c <bl_do_upgrade+0x390>
200018d6:	6831      	ldr	r1, [r6, #0]
200018d8:	f8d9 0000 	ldr.w	r0, [r9]
200018dc:	f001 fa7e 	bl	20002ddc <xz_dec_run>
200018e0:	4605      	mov	r5, r0
200018e2:	6833      	ldr	r3, [r6, #0]
200018e4:	691a      	ldr	r2, [r3, #16]
200018e6:	f5b2 5f80 	cmp.w	r2, #4096	; 0x1000
200018ea:	d051      	beq.n	20001990 <bl_do_upgrade+0x3b4>
200018ec:	2d00      	cmp	r5, #0
200018ee:	d0ed      	beq.n	200018cc <bl_do_upgrade+0x2f0>
200018f0:	2d01      	cmp	r5, #1
200018f2:	d06e      	beq.n	200019d2 <bl_do_upgrade+0x3f6>
200018f4:	4629      	mov	r1, r5
200018f6:	489e      	ldr	r0, [pc, #632]	; (20001b70 <bl_do_upgrade+0x594>)
200018f8:	f001 fe2c 	bl	20003554 <port_bl_log>
200018fc:	f06f 044c 	mvn.w	r4, #76	; 0x4c
20001900:	4b98      	ldr	r3, [pc, #608]	; (20001b64 <bl_do_upgrade+0x588>)
20001902:	6818      	ldr	r0, [r3, #0]
20001904:	f001 fdce 	bl	200034a4 <xz_dec_end>
20001908:	f000 fa90 	bl	20001e2c <xPortGetFreeHeapSize>
2000190c:	4601      	mov	r1, r0
2000190e:	4897      	ldr	r0, [pc, #604]	; (20001b6c <bl_do_upgrade+0x590>)
20001910:	f001 fe20 	bl	20003554 <port_bl_log>
20001914:	4b94      	ldr	r3, [pc, #592]	; (20001b68 <bl_do_upgrade+0x58c>)
20001916:	681d      	ldr	r5, [r3, #0]
20001918:	6828      	ldr	r0, [r5, #0]
2000191a:	f001 ff1d 	bl	20003758 <free>
2000191e:	68e8      	ldr	r0, [r5, #12]
20001920:	f001 ff1a 	bl	20003758 <free>
20001924:	4628      	mov	r0, r5
20001926:	f001 ff17 	bl	20003758 <free>
2000192a:	b12c      	cbz	r4, 20001938 <bl_do_upgrade+0x35c>
2000192c:	4621      	mov	r1, r4
2000192e:	4891      	ldr	r0, [pc, #580]	; (20001b74 <bl_do_upgrade+0x598>)
20001930:	f001 fe10 	bl	20003554 <port_bl_log>
20001934:	f001 fe98 	bl	20003668 <platform_system_reboot>
20001938:	4b8f      	ldr	r3, [pc, #572]	; (20001b78 <bl_do_upgrade+0x59c>)
2000193a:	f8d3 b000 	ldr.w	fp, [r3]
2000193e:	f44f 5080 	mov.w	r0, #4096	; 0x1000
20001942:	f001 ff01 	bl	20003748 <malloc>
20001946:	4606      	mov	r6, r0
20001948:	2800      	cmp	r0, #0
2000194a:	d067      	beq.n	20001a1c <bl_do_upgrade+0x440>
2000194c:	4b8b      	ldr	r3, [pc, #556]	; (20001b7c <bl_do_upgrade+0x5a0>)
2000194e:	681b      	ldr	r3, [r3, #0]
20001950:	685c      	ldr	r4, [r3, #4]
20001952:	899b      	ldrh	r3, [r3, #12]
20001954:	441c      	add	r4, r3
20001956:	f8db 5028 	ldr.w	r5, [fp, #40]	; 0x28
2000195a:	4425      	add	r5, r4
2000195c:	42ac      	cmp	r4, r5
2000195e:	d249      	bcs.n	200019f4 <bl_do_upgrade+0x418>
20001960:	f04f 0900 	mov.w	r9, #0
20001964:	f44f 5880 	mov.w	r8, #4096	; 0x1000
20001968:	46ca      	mov	sl, r9
2000196a:	e066      	b.n	20001a3a <bl_do_upgrade+0x45e>
2000196c:	f104 0280 	add.w	r2, r4, #128	; 0x80
20001970:	4297      	cmp	r7, r2
20001972:	bf94      	ite	ls
20001974:	1b3d      	subls	r5, r7, r4
20001976:	2580      	movhi	r5, #128	; 0x80
20001978:	462a      	mov	r2, r5
2000197a:	6819      	ldr	r1, [r3, #0]
2000197c:	eb0b 0004 	add.w	r0, fp, r4
20001980:	f001 fec8 	bl	20003714 <port_flash_read>
20001984:	6833      	ldr	r3, [r6, #0]
20001986:	2200      	movs	r2, #0
20001988:	605a      	str	r2, [r3, #4]
2000198a:	609d      	str	r5, [r3, #8]
2000198c:	442c      	add	r4, r5
2000198e:	e7a2      	b.n	200018d6 <bl_do_upgrade+0x2fa>
20001990:	68d9      	ldr	r1, [r3, #12]
20001992:	eb0a 0008 	add.w	r0, sl, r8
20001996:	f001 fec9 	bl	2000372c <port_flash_write>
2000199a:	6833      	ldr	r3, [r6, #0]
2000199c:	2200      	movs	r2, #0
2000199e:	611a      	str	r2, [r3, #16]
200019a0:	695b      	ldr	r3, [r3, #20]
200019a2:	4498      	add	r8, r3
200019a4:	4b76      	ldr	r3, [pc, #472]	; (20001b80 <bl_do_upgrade+0x5a4>)
200019a6:	fba3 2308 	umull	r2, r3, r3, r8
200019aa:	0b9b      	lsrs	r3, r3, #14
200019ac:	f44f 4248 	mov.w	r2, #51200	; 0xc800
200019b0:	fb02 8313 	mls	r3, r2, r3, r8
200019b4:	2b00      	cmp	r3, #0
200019b6:	d199      	bne.n	200018ec <bl_do_upgrade+0x310>
200019b8:	2364      	movs	r3, #100	; 0x64
200019ba:	fb04 f303 	mul.w	r3, r4, r3
200019be:	fbb3 f1f7 	udiv	r1, r3, r7
200019c2:	fb07 3311 	mls	r3, r7, r1, r3
200019c6:	b2da      	uxtb	r2, r3
200019c8:	b2c9      	uxtb	r1, r1
200019ca:	486e      	ldr	r0, [pc, #440]	; (20001b84 <bl_do_upgrade+0x5a8>)
200019cc:	f001 fdc2 	bl	20003554 <port_bl_log>
200019d0:	e78c      	b.n	200018ec <bl_do_upgrade+0x310>
200019d2:	4b65      	ldr	r3, [pc, #404]	; (20001b68 <bl_do_upgrade+0x58c>)
200019d4:	681b      	ldr	r3, [r3, #0]
200019d6:	691a      	ldr	r2, [r3, #16]
200019d8:	68d9      	ldr	r1, [r3, #12]
200019da:	eb0a 0008 	add.w	r0, sl, r8
200019de:	f001 fea5 	bl	2000372c <port_flash_write>
200019e2:	2101      	movs	r1, #1
200019e4:	4868      	ldr	r0, [pc, #416]	; (20001b88 <bl_do_upgrade+0x5ac>)
200019e6:	f001 fdb5 	bl	20003554 <port_bl_log>
200019ea:	9c00      	ldr	r4, [sp, #0]
200019ec:	e788      	b.n	20001900 <bl_do_upgrade+0x324>
200019ee:	f06f 0451 	mvn.w	r4, #81	; 0x51
200019f2:	e79b      	b.n	2000192c <bl_do_upgrade+0x350>
200019f4:	f04f 0900 	mov.w	r9, #0
200019f8:	e033      	b.n	20001a62 <bl_do_upgrade+0x486>
200019fa:	4a5f      	ldr	r2, [pc, #380]	; (20001b78 <bl_do_upgrade+0x59c>)
200019fc:	6811      	ldr	r1, [r2, #0]
200019fe:	464a      	mov	r2, r9
20001a00:	6a89      	ldr	r1, [r1, #40]	; 0x28
20001a02:	4862      	ldr	r0, [pc, #392]	; (20001b8c <bl_do_upgrade+0x5b0>)
20001a04:	f001 fda6 	bl	20003554 <port_bl_log>
20001a08:	f06f 034d 	mvn.w	r3, #77	; 0x4d
20001a0c:	9300      	str	r3, [sp, #0]
20001a0e:	9900      	ldr	r1, [sp, #0]
20001a10:	485f      	ldr	r0, [pc, #380]	; (20001b90 <bl_do_upgrade+0x5b4>)
20001a12:	f001 fd9f 	bl	20003554 <port_bl_log>
20001a16:	f001 fe27 	bl	20003668 <platform_system_reboot>
20001a1a:	e029      	b.n	20001a70 <bl_do_upgrade+0x494>
20001a1c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
20001a20:	9300      	str	r3, [sp, #0]
20001a22:	e7f4      	b.n	20001a0e <bl_do_upgrade+0x432>
20001a24:	4642      	mov	r2, r8
20001a26:	4631      	mov	r1, r6
20001a28:	4620      	mov	r0, r4
20001a2a:	f001 fe73 	bl	20003714 <port_flash_read>
20001a2e:	4641      	mov	r1, r8
20001a30:	4630      	mov	r0, r6
20001a32:	f7ff fbc9 	bl	200011c8 <tuya_bl_sum_check>
20001a36:	4481      	add	r9, r0
20001a38:	463c      	mov	r4, r7
20001a3a:	4642      	mov	r2, r8
20001a3c:	4651      	mov	r1, sl
20001a3e:	4630      	mov	r0, r6
20001a40:	f001 feca 	bl	200037d8 <memset>
20001a44:	f504 5780 	add.w	r7, r4, #4096	; 0x1000
20001a48:	42bd      	cmp	r5, r7
20001a4a:	d8eb      	bhi.n	20001a24 <bl_do_upgrade+0x448>
20001a4c:	1b2d      	subs	r5, r5, r4
20001a4e:	462a      	mov	r2, r5
20001a50:	4631      	mov	r1, r6
20001a52:	4620      	mov	r0, r4
20001a54:	f001 fe5e 	bl	20003714 <port_flash_read>
20001a58:	4629      	mov	r1, r5
20001a5a:	4630      	mov	r0, r6
20001a5c:	f7ff fbb4 	bl	200011c8 <tuya_bl_sum_check>
20001a60:	4481      	add	r9, r0
20001a62:	4630      	mov	r0, r6
20001a64:	f001 fe78 	bl	20003758 <free>
20001a68:	f8db 3134 	ldr.w	r3, [fp, #308]	; 0x134
20001a6c:	454b      	cmp	r3, r9
20001a6e:	d1c4      	bne.n	200019fa <bl_do_upgrade+0x41e>
20001a70:	f44f 5180 	mov.w	r1, #4096	; 0x1000
20001a74:	9b01      	ldr	r3, [sp, #4]
20001a76:	6858      	ldr	r0, [r3, #4]
20001a78:	f001 fe60 	bl	2000373c <port_flash_erase>
20001a7c:	4b3e      	ldr	r3, [pc, #248]	; (20001b78 <bl_do_upgrade+0x59c>)
20001a7e:	6818      	ldr	r0, [r3, #0]
20001a80:	b108      	cbz	r0, 20001a86 <bl_do_upgrade+0x4aa>
20001a82:	f001 fe69 	bl	20003758 <free>
20001a86:	4b3c      	ldr	r3, [pc, #240]	; (20001b78 <bl_do_upgrade+0x59c>)
20001a88:	2200      	movs	r2, #0
20001a8a:	601a      	str	r2, [r3, #0]
20001a8c:	4b3b      	ldr	r3, [pc, #236]	; (20001b7c <bl_do_upgrade+0x5a0>)
20001a8e:	6818      	ldr	r0, [r3, #0]
20001a90:	b108      	cbz	r0, 20001a96 <bl_do_upgrade+0x4ba>
20001a92:	f001 fe61 	bl	20003758 <free>
20001a96:	4b39      	ldr	r3, [pc, #228]	; (20001b7c <bl_do_upgrade+0x5a0>)
20001a98:	2200      	movs	r2, #0
20001a9a:	601a      	str	r2, [r3, #0]
20001a9c:	9800      	ldr	r0, [sp, #0]
20001a9e:	b005      	add	sp, #20
20001aa0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20001aa4:	f06f 0361 	mvn.w	r3, #97	; 0x61
20001aa8:	9300      	str	r3, [sp, #0]
20001aaa:	e7e7      	b.n	20001a7c <bl_do_upgrade+0x4a0>
20001aac:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
20001ab0:	9300      	str	r3, [sp, #0]
20001ab2:	e7e3      	b.n	20001a7c <bl_do_upgrade+0x4a0>
20001ab4:	464a      	mov	r2, r9
20001ab6:	4631      	mov	r1, r6
20001ab8:	4620      	mov	r0, r4
20001aba:	f001 fe2b 	bl	20003714 <port_flash_read>
20001abe:	4649      	mov	r1, r9
20001ac0:	4630      	mov	r0, r6
20001ac2:	f7ff fb81 	bl	200011c8 <tuya_bl_sum_check>
20001ac6:	4480      	add	r8, r0
20001ac8:	463c      	mov	r4, r7
20001aca:	464a      	mov	r2, r9
20001acc:	4651      	mov	r1, sl
20001ace:	4630      	mov	r0, r6
20001ad0:	f001 fe82 	bl	200037d8 <memset>
20001ad4:	f504 5780 	add.w	r7, r4, #4096	; 0x1000
20001ad8:	42bd      	cmp	r5, r7
20001ada:	d8eb      	bhi.n	20001ab4 <bl_do_upgrade+0x4d8>
20001adc:	1b2d      	subs	r5, r5, r4
20001ade:	462a      	mov	r2, r5
20001ae0:	4631      	mov	r1, r6
20001ae2:	4620      	mov	r0, r4
20001ae4:	f001 fe16 	bl	20003714 <port_flash_read>
20001ae8:	4629      	mov	r1, r5
20001aea:	4630      	mov	r0, r6
20001aec:	f7ff fb6c 	bl	200011c8 <tuya_bl_sum_check>
20001af0:	4480      	add	r8, r0
20001af2:	4630      	mov	r0, r6
20001af4:	f001 fe30 	bl	20003758 <free>
20001af8:	f8db 2034 	ldr.w	r2, [fp, #52]	; 0x34
20001afc:	4590      	cmp	r8, r2
20001afe:	f47f ae87 	bne.w	20001810 <bl_do_upgrade+0x234>
20001b02:	4d1e      	ldr	r5, [pc, #120]	; (20001b7c <bl_do_upgrade+0x5a0>)
20001b04:	682b      	ldr	r3, [r5, #0]
20001b06:	f8d3 a004 	ldr.w	sl, [r3, #4]
20001b0a:	899c      	ldrh	r4, [r3, #12]
20001b0c:	689a      	ldr	r2, [r3, #8]
20001b0e:	0a92      	lsrs	r2, r2, #10
20001b10:	4651      	mov	r1, sl
20001b12:	4820      	ldr	r0, [pc, #128]	; (20001b94 <bl_do_upgrade+0x5b8>)
20001b14:	f001 fd1e 	bl	20003554 <port_bl_log>
20001b18:	682b      	ldr	r3, [r5, #0]
20001b1a:	6899      	ldr	r1, [r3, #8]
20001b1c:	6858      	ldr	r0, [r3, #4]
20001b1e:	f001 fe0d 	bl	2000373c <port_flash_erase>
20001b22:	4b15      	ldr	r3, [pc, #84]	; (20001b78 <bl_do_upgrade+0x59c>)
20001b24:	681a      	ldr	r2, [r3, #0]
20001b26:	7953      	ldrb	r3, [r2, #5]
20001b28:	2b02      	cmp	r3, #2
20001b2a:	f43f ae99 	beq.w	20001860 <bl_do_upgrade+0x284>
20001b2e:	2b04      	cmp	r3, #4
20001b30:	f43f af5d 	beq.w	200019ee <bl_do_upgrade+0x412>
20001b34:	2b01      	cmp	r3, #1
20001b36:	f47f aeff 	bne.w	20001938 <bl_do_upgrade+0x35c>
20001b3a:	f06f 0451 	mvn.w	r4, #81	; 0x51
20001b3e:	e6f5      	b.n	2000192c <bl_do_upgrade+0x350>
20001b40:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
20001b44:	9300      	str	r3, [sp, #0]
20001b46:	e799      	b.n	20001a7c <bl_do_upgrade+0x4a0>
20001b48:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
20001b4c:	9300      	str	r3, [sp, #0]
20001b4e:	e795      	b.n	20001a7c <bl_do_upgrade+0x4a0>
20001b50:	f06f 0361 	mvn.w	r3, #97	; 0x61
20001b54:	9300      	str	r3, [sp, #0]
20001b56:	e791      	b.n	20001a7c <bl_do_upgrade+0x4a0>
20001b58:	4b07      	ldr	r3, [pc, #28]	; (20001b78 <bl_do_upgrade+0x59c>)
20001b5a:	6818      	ldr	r0, [r3, #0]
20001b5c:	f06f 034e 	mvn.w	r3, #78	; 0x4e
20001b60:	9300      	str	r3, [sp, #0]
20001b62:	e78e      	b.n	20001a82 <bl_do_upgrade+0x4a6>
20001b64:	2001004c 	.word	0x2001004c
20001b68:	20010040 	.word	0x20010040
20001b6c:	20004360 	.word	0x20004360
20001b70:	20004398 	.word	0x20004398
20001b74:	200043a8 	.word	0x200043a8
20001b78:	20010048 	.word	0x20010048
20001b7c:	20010044 	.word	0x20010044
20001b80:	51eb851f 	.word	0x51eb851f
20001b84:	20004374 	.word	0x20004374
20001b88:	20004388 	.word	0x20004388
20001b8c:	200043d0 	.word	0x200043d0
20001b90:	200043fc 	.word	0x200043fc
20001b94:	20004420 	.word	0x20004420
20001b98:	4b05      	ldr	r3, [pc, #20]	; (20001bb0 <bl_do_upgrade+0x5d4>)
20001b9a:	681c      	ldr	r4, [r3, #0]
20001b9c:	6820      	ldr	r0, [r4, #0]
20001b9e:	f001 fddb 	bl	20003758 <free>
20001ba2:	68e0      	ldr	r0, [r4, #12]
20001ba4:	f001 fdd8 	bl	20003758 <free>
20001ba8:	4620      	mov	r0, r4
20001baa:	f001 fdd5 	bl	20003758 <free>
20001bae:	e6c3      	b.n	20001938 <bl_do_upgrade+0x35c>
20001bb0:	20010040 	.word	0x20010040

20001bb4 <bl_peripheral_status_keep>:
20001bb4:	b538      	push	{r3, r4, r5, lr}
20001bb6:	4604      	mov	r4, r0
20001bb8:	f44f 5080 	mov.w	r0, #4096	; 0x1000
20001bbc:	f001 fdc4 	bl	20003748 <malloc>
20001bc0:	4601      	mov	r1, r0
20001bc2:	4d1f      	ldr	r5, [pc, #124]	; (20001c40 <bl_peripheral_status_keep+0x8c>)
20001bc4:	6028      	str	r0, [r5, #0]
20001bc6:	f44f 5280 	mov.w	r2, #4096	; 0x1000
20001bca:	4620      	mov	r0, r4
20001bcc:	f001 fda2 	bl	20003714 <port_flash_read>
20001bd0:	6828      	ldr	r0, [r5, #0]
20001bd2:	6802      	ldr	r2, [r0, #0]
20001bd4:	4b1b      	ldr	r3, [pc, #108]	; (20001c44 <bl_peripheral_status_keep+0x90>)
20001bd6:	429a      	cmp	r2, r3
20001bd8:	d129      	bne.n	20001c2e <bl_peripheral_status_keep+0x7a>
20001bda:	6843      	ldr	r3, [r0, #4]
20001bdc:	6882      	ldr	r2, [r0, #8]
20001bde:	eb03 0c02 	add.w	ip, r3, r2
20001be2:	f11c 040c 	adds.w	r4, ip, #12
20001be6:	d01d      	beq.n	20001c24 <bl_peripheral_status_keep+0x70>
20001be8:	1e43      	subs	r3, r0, #1
20001bea:	f100 0e0b 	add.w	lr, r0, #11
20001bee:	44e6      	add	lr, ip
20001bf0:	2200      	movs	r2, #0
20001bf2:	f813 1f01 	ldrb.w	r1, [r3, #1]!
20001bf6:	440a      	add	r2, r1
20001bf8:	4573      	cmp	r3, lr
20001bfa:	d1fa      	bne.n	20001bf2 <bl_peripheral_status_keep+0x3e>
20001bfc:	4484      	add	ip, r0
20001bfe:	f89c 300f 	ldrb.w	r3, [ip, #15]
20001c02:	f89c 100e 	ldrb.w	r1, [ip, #14]
20001c06:	0409      	lsls	r1, r1, #16
20001c08:	eb01 6103 	add.w	r1, r1, r3, lsl #24
20001c0c:	f89c 300d 	ldrb.w	r3, [ip, #13]
20001c10:	eb01 2103 	add.w	r1, r1, r3, lsl #8
20001c14:	5d03      	ldrb	r3, [r0, r4]
20001c16:	4419      	add	r1, r3
20001c18:	4291      	cmp	r1, r2
20001c1a:	d105      	bne.n	20001c28 <bl_peripheral_status_keep+0x74>
20001c1c:	f001 fcfa 	bl	20003614 <platform_perip_setup>
20001c20:	2000      	movs	r0, #0
20001c22:	bd38      	pop	{r3, r4, r5, pc}
20001c24:	4622      	mov	r2, r4
20001c26:	e7e9      	b.n	20001bfc <bl_peripheral_status_keep+0x48>
20001c28:	4807      	ldr	r0, [pc, #28]	; (20001c48 <bl_peripheral_status_keep+0x94>)
20001c2a:	f001 fc93 	bl	20003554 <port_bl_log>
20001c2e:	4c04      	ldr	r4, [pc, #16]	; (20001c40 <bl_peripheral_status_keep+0x8c>)
20001c30:	6820      	ldr	r0, [r4, #0]
20001c32:	f001 fd91 	bl	20003758 <free>
20001c36:	2300      	movs	r3, #0
20001c38:	6023      	str	r3, [r4, #0]
20001c3a:	f06f 0063 	mvn.w	r0, #99	; 0x63
20001c3e:	e7f0      	b.n	20001c22 <bl_peripheral_status_keep+0x6e>
20001c40:	20010050 	.word	0x20010050
20001c44:	5459424c 	.word	0x5459424c
20001c48:	20004448 	.word	0x20004448

20001c4c <bl_peripheral_remove>:
20001c4c:	4b06      	ldr	r3, [pc, #24]	; (20001c68 <bl_peripheral_remove+0x1c>)
20001c4e:	6818      	ldr	r0, [r3, #0]
20001c50:	b148      	cbz	r0, 20001c66 <bl_peripheral_remove+0x1a>
20001c52:	b510      	push	{r4, lr}
20001c54:	f001 fcdf 	bl	20003616 <platform_perip_remove>
20001c58:	4c03      	ldr	r4, [pc, #12]	; (20001c68 <bl_peripheral_remove+0x1c>)
20001c5a:	6820      	ldr	r0, [r4, #0]
20001c5c:	f001 fd7c 	bl	20003758 <free>
20001c60:	2300      	movs	r3, #0
20001c62:	6023      	str	r3, [r4, #0]
20001c64:	bd10      	pop	{r4, pc}
20001c66:	4770      	bx	lr
20001c68:	20010050 	.word	0x20010050

20001c6c <prvInsertBlockIntoFreeList>:
20001c6c:	4b15      	ldr	r3, [pc, #84]	; (20001cc4 <prvInsertBlockIntoFreeList+0x58>)
20001c6e:	461a      	mov	r2, r3
20001c70:	681b      	ldr	r3, [r3, #0]
20001c72:	4283      	cmp	r3, r0
20001c74:	d3fb      	bcc.n	20001c6e <prvInsertBlockIntoFreeList+0x2>
20001c76:	6851      	ldr	r1, [r2, #4]
20001c78:	eb02 0c01 	add.w	ip, r2, r1
20001c7c:	4560      	cmp	r0, ip
20001c7e:	d009      	beq.n	20001c94 <prvInsertBlockIntoFreeList+0x28>
20001c80:	6841      	ldr	r1, [r0, #4]
20001c82:	eb00 0c01 	add.w	ip, r0, r1
20001c86:	4563      	cmp	r3, ip
20001c88:	d009      	beq.n	20001c9e <prvInsertBlockIntoFreeList+0x32>
20001c8a:	6003      	str	r3, [r0, #0]
20001c8c:	4290      	cmp	r0, r2
20001c8e:	bf18      	it	ne
20001c90:	6010      	strne	r0, [r2, #0]
20001c92:	4770      	bx	lr
20001c94:	6840      	ldr	r0, [r0, #4]
20001c96:	4401      	add	r1, r0
20001c98:	6051      	str	r1, [r2, #4]
20001c9a:	4610      	mov	r0, r2
20001c9c:	e7f0      	b.n	20001c80 <prvInsertBlockIntoFreeList+0x14>
20001c9e:	b410      	push	{r4}
20001ca0:	4c09      	ldr	r4, [pc, #36]	; (20001cc8 <prvInsertBlockIntoFreeList+0x5c>)
20001ca2:	6824      	ldr	r4, [r4, #0]
20001ca4:	42a3      	cmp	r3, r4
20001ca6:	d00b      	beq.n	20001cc0 <prvInsertBlockIntoFreeList+0x54>
20001ca8:	685b      	ldr	r3, [r3, #4]
20001caa:	4419      	add	r1, r3
20001cac:	6041      	str	r1, [r0, #4]
20001cae:	6813      	ldr	r3, [r2, #0]
20001cb0:	681b      	ldr	r3, [r3, #0]
20001cb2:	6003      	str	r3, [r0, #0]
20001cb4:	4290      	cmp	r0, r2
20001cb6:	bf18      	it	ne
20001cb8:	6010      	strne	r0, [r2, #0]
20001cba:	f85d 4b04 	ldr.w	r4, [sp], #4
20001cbe:	4770      	bx	lr
20001cc0:	6004      	str	r4, [r0, #0]
20001cc2:	e7f7      	b.n	20001cb4 <prvInsertBlockIntoFreeList+0x48>
20001cc4:	2002906c 	.word	0x2002906c
20001cc8:	20010054 	.word	0x20010054

20001ccc <pvPortMalloc>:
20001ccc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20001cce:	4b3d      	ldr	r3, [pc, #244]	; (20001dc4 <pvPortMalloc+0xf8>)
20001cd0:	681b      	ldr	r3, [r3, #0]
20001cd2:	b1cb      	cbz	r3, 20001d08 <pvPortMalloc+0x3c>
20001cd4:	4b3c      	ldr	r3, [pc, #240]	; (20001dc8 <pvPortMalloc+0xfc>)
20001cd6:	681d      	ldr	r5, [r3, #0]
20001cd8:	4205      	tst	r5, r0
20001cda:	d168      	bne.n	20001dae <pvPortMalloc+0xe2>
20001cdc:	1e43      	subs	r3, r0, #1
20001cde:	f113 0f0a 	cmn.w	r3, #10
20001ce2:	d867      	bhi.n	20001db4 <pvPortMalloc+0xe8>
20001ce4:	f100 0208 	add.w	r2, r0, #8
20001ce8:	f010 0f07 	tst.w	r0, #7
20001cec:	d005      	beq.n	20001cfa <pvPortMalloc+0x2e>
20001cee:	f022 0307 	bic.w	r3, r2, #7
20001cf2:	3308      	adds	r3, #8
20001cf4:	4293      	cmp	r3, r2
20001cf6:	d95f      	bls.n	20001db8 <pvPortMalloc+0xec>
20001cf8:	461a      	mov	r2, r3
20001cfa:	4b34      	ldr	r3, [pc, #208]	; (20001dcc <pvPortMalloc+0x100>)
20001cfc:	681e      	ldr	r6, [r3, #0]
20001cfe:	4296      	cmp	r6, r2
20001d00:	d35c      	bcc.n	20001dbc <pvPortMalloc+0xf0>
20001d02:	4933      	ldr	r1, [pc, #204]	; (20001dd0 <pvPortMalloc+0x104>)
20001d04:	680c      	ldr	r4, [r1, #0]
20001d06:	e027      	b.n	20001d58 <pvPortMalloc+0x8c>
20001d08:	4a32      	ldr	r2, [pc, #200]	; (20001dd4 <pvPortMalloc+0x108>)
20001d0a:	f012 0f07 	tst.w	r2, #7
20001d0e:	d007      	beq.n	20001d20 <pvPortMalloc+0x54>
20001d10:	1dd1      	adds	r1, r2, #7
20001d12:	f021 0107 	bic.w	r1, r1, #7
20001d16:	f502 33c8 	add.w	r3, r2, #102400	; 0x19000
20001d1a:	1a5b      	subs	r3, r3, r1
20001d1c:	460a      	mov	r2, r1
20001d1e:	e001      	b.n	20001d24 <pvPortMalloc+0x58>
20001d20:	f44f 33c8 	mov.w	r3, #102400	; 0x19000
20001d24:	4c2a      	ldr	r4, [pc, #168]	; (20001dd0 <pvPortMalloc+0x104>)
20001d26:	6022      	str	r2, [r4, #0]
20001d28:	2100      	movs	r1, #0
20001d2a:	6061      	str	r1, [r4, #4]
20001d2c:	4413      	add	r3, r2
20001d2e:	3b08      	subs	r3, #8
20001d30:	f023 0307 	bic.w	r3, r3, #7
20001d34:	4c23      	ldr	r4, [pc, #140]	; (20001dc4 <pvPortMalloc+0xf8>)
20001d36:	6023      	str	r3, [r4, #0]
20001d38:	6059      	str	r1, [r3, #4]
20001d3a:	6019      	str	r1, [r3, #0]
20001d3c:	1a99      	subs	r1, r3, r2
20001d3e:	6051      	str	r1, [r2, #4]
20001d40:	6013      	str	r3, [r2, #0]
20001d42:	4b25      	ldr	r3, [pc, #148]	; (20001dd8 <pvPortMalloc+0x10c>)
20001d44:	6019      	str	r1, [r3, #0]
20001d46:	4b21      	ldr	r3, [pc, #132]	; (20001dcc <pvPortMalloc+0x100>)
20001d48:	6019      	str	r1, [r3, #0]
20001d4a:	4b1f      	ldr	r3, [pc, #124]	; (20001dc8 <pvPortMalloc+0xfc>)
20001d4c:	f04f 4200 	mov.w	r2, #2147483648	; 0x80000000
20001d50:	601a      	str	r2, [r3, #0]
20001d52:	e7bf      	b.n	20001cd4 <pvPortMalloc+0x8>
20001d54:	4621      	mov	r1, r4
20001d56:	461c      	mov	r4, r3
20001d58:	6863      	ldr	r3, [r4, #4]
20001d5a:	4293      	cmp	r3, r2
20001d5c:	d202      	bcs.n	20001d64 <pvPortMalloc+0x98>
20001d5e:	6823      	ldr	r3, [r4, #0]
20001d60:	2b00      	cmp	r3, #0
20001d62:	d1f7      	bne.n	20001d54 <pvPortMalloc+0x88>
20001d64:	4b17      	ldr	r3, [pc, #92]	; (20001dc4 <pvPortMalloc+0xf8>)
20001d66:	681b      	ldr	r3, [r3, #0]
20001d68:	42a3      	cmp	r3, r4
20001d6a:	d029      	beq.n	20001dc0 <pvPortMalloc+0xf4>
20001d6c:	680f      	ldr	r7, [r1, #0]
20001d6e:	3708      	adds	r7, #8
20001d70:	6823      	ldr	r3, [r4, #0]
20001d72:	600b      	str	r3, [r1, #0]
20001d74:	6863      	ldr	r3, [r4, #4]
20001d76:	1a9b      	subs	r3, r3, r2
20001d78:	2b10      	cmp	r3, #16
20001d7a:	d812      	bhi.n	20001da2 <pvPortMalloc+0xd6>
20001d7c:	6863      	ldr	r3, [r4, #4]
20001d7e:	1af6      	subs	r6, r6, r3
20001d80:	4a12      	ldr	r2, [pc, #72]	; (20001dcc <pvPortMalloc+0x100>)
20001d82:	6016      	str	r6, [r2, #0]
20001d84:	4a14      	ldr	r2, [pc, #80]	; (20001dd8 <pvPortMalloc+0x10c>)
20001d86:	6812      	ldr	r2, [r2, #0]
20001d88:	4296      	cmp	r6, r2
20001d8a:	bf3c      	itt	cc
20001d8c:	4a12      	ldrcc	r2, [pc, #72]	; (20001dd8 <pvPortMalloc+0x10c>)
20001d8e:	6016      	strcc	r6, [r2, #0]
20001d90:	432b      	orrs	r3, r5
20001d92:	6063      	str	r3, [r4, #4]
20001d94:	2300      	movs	r3, #0
20001d96:	6023      	str	r3, [r4, #0]
20001d98:	4a10      	ldr	r2, [pc, #64]	; (20001ddc <pvPortMalloc+0x110>)
20001d9a:	6813      	ldr	r3, [r2, #0]
20001d9c:	3301      	adds	r3, #1
20001d9e:	6013      	str	r3, [r2, #0]
20001da0:	e006      	b.n	20001db0 <pvPortMalloc+0xe4>
20001da2:	18a0      	adds	r0, r4, r2
20001da4:	6043      	str	r3, [r0, #4]
20001da6:	6062      	str	r2, [r4, #4]
20001da8:	f7ff ff60 	bl	20001c6c <prvInsertBlockIntoFreeList>
20001dac:	e7e6      	b.n	20001d7c <pvPortMalloc+0xb0>
20001dae:	2700      	movs	r7, #0
20001db0:	4638      	mov	r0, r7
20001db2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20001db4:	2700      	movs	r7, #0
20001db6:	e7fb      	b.n	20001db0 <pvPortMalloc+0xe4>
20001db8:	2700      	movs	r7, #0
20001dba:	e7f9      	b.n	20001db0 <pvPortMalloc+0xe4>
20001dbc:	2700      	movs	r7, #0
20001dbe:	e7f7      	b.n	20001db0 <pvPortMalloc+0xe4>
20001dc0:	2700      	movs	r7, #0
20001dc2:	e7f5      	b.n	20001db0 <pvPortMalloc+0xe4>
20001dc4:	20010054 	.word	0x20010054
20001dc8:	20029058 	.word	0x20029058
20001dcc:	2002905c 	.word	0x2002905c
20001dd0:	2002906c 	.word	0x2002906c
20001dd4:	20010058 	.word	0x20010058
20001dd8:	20029060 	.word	0x20029060
20001ddc:	20029064 	.word	0x20029064

20001de0 <vPortFree>:
20001de0:	b1e0      	cbz	r0, 20001e1c <vPortFree+0x3c>
20001de2:	b508      	push	{r3, lr}
20001de4:	4603      	mov	r3, r0
20001de6:	f850 2c04 	ldr.w	r2, [r0, #-4]
20001dea:	490d      	ldr	r1, [pc, #52]	; (20001e20 <vPortFree+0x40>)
20001dec:	6809      	ldr	r1, [r1, #0]
20001dee:	420a      	tst	r2, r1
20001df0:	d002      	beq.n	20001df8 <vPortFree+0x18>
20001df2:	f850 0c08 	ldr.w	r0, [r0, #-8]
20001df6:	b100      	cbz	r0, 20001dfa <vPortFree+0x1a>
20001df8:	bd08      	pop	{r3, pc}
20001dfa:	ea22 0201 	bic.w	r2, r2, r1
20001dfe:	f843 2c04 	str.w	r2, [r3, #-4]
20001e02:	4808      	ldr	r0, [pc, #32]	; (20001e24 <vPortFree+0x44>)
20001e04:	6801      	ldr	r1, [r0, #0]
20001e06:	440a      	add	r2, r1
20001e08:	6002      	str	r2, [r0, #0]
20001e0a:	f1a3 0008 	sub.w	r0, r3, #8
20001e0e:	f7ff ff2d 	bl	20001c6c <prvInsertBlockIntoFreeList>
20001e12:	4a05      	ldr	r2, [pc, #20]	; (20001e28 <vPortFree+0x48>)
20001e14:	6813      	ldr	r3, [r2, #0]
20001e16:	3301      	adds	r3, #1
20001e18:	6013      	str	r3, [r2, #0]
20001e1a:	e7ed      	b.n	20001df8 <vPortFree+0x18>
20001e1c:	4770      	bx	lr
20001e1e:	bf00      	nop
20001e20:	20029058 	.word	0x20029058
20001e24:	2002905c 	.word	0x2002905c
20001e28:	20029068 	.word	0x20029068

20001e2c <xPortGetFreeHeapSize>:
20001e2c:	4b01      	ldr	r3, [pc, #4]	; (20001e34 <xPortGetFreeHeapSize+0x8>)
20001e2e:	6818      	ldr	r0, [r3, #0]
20001e30:	4770      	bx	lr
20001e32:	bf00      	nop
20001e34:	2002905c 	.word	0x2002905c

20001e38 <_malloc_r>:
20001e38:	b508      	push	{r3, lr}
20001e3a:	4608      	mov	r0, r1
20001e3c:	f7ff ff46 	bl	20001ccc <pvPortMalloc>
20001e40:	bd08      	pop	{r3, pc}

20001e42 <_realloc_r>:
20001e42:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20001e44:	460c      	mov	r4, r1
20001e46:	b182      	cbz	r2, 20001e6a <_realloc_r+0x28>
20001e48:	4606      	mov	r6, r0
20001e4a:	4617      	mov	r7, r2
20001e4c:	4610      	mov	r0, r2
20001e4e:	f7ff ff3d 	bl	20001ccc <pvPortMalloc>
20001e52:	4605      	mov	r5, r0
20001e54:	b13c      	cbz	r4, 20001e66 <_realloc_r+0x24>
20001e56:	b168      	cbz	r0, 20001e74 <_realloc_r+0x32>
20001e58:	463a      	mov	r2, r7
20001e5a:	4621      	mov	r1, r4
20001e5c:	f001 fc94 	bl	20003788 <memcpy>
20001e60:	4620      	mov	r0, r4
20001e62:	f7ff ffbd 	bl	20001de0 <vPortFree>
20001e66:	4628      	mov	r0, r5
20001e68:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20001e6a:	4608      	mov	r0, r1
20001e6c:	f7ff ffb8 	bl	20001de0 <vPortFree>
20001e70:	2500      	movs	r5, #0
20001e72:	e7f8      	b.n	20001e66 <_realloc_r+0x24>
20001e74:	230c      	movs	r3, #12
20001e76:	6033      	str	r3, [r6, #0]
20001e78:	e7f5      	b.n	20001e66 <_realloc_r+0x24>

20001e7a <_free_r>:
20001e7a:	b121      	cbz	r1, 20001e86 <_free_r+0xc>
20001e7c:	b508      	push	{r3, lr}
20001e7e:	4608      	mov	r0, r1
20001e80:	f7ff ffae 	bl	20001de0 <vPortFree>
20001e84:	bd08      	pop	{r3, pc}
20001e86:	4770      	bx	lr

20001e88 <ty_adapt_malloc>:
20001e88:	b508      	push	{r3, lr}
20001e8a:	f7ff ff1f 	bl	20001ccc <pvPortMalloc>
20001e8e:	bd08      	pop	{r3, pc}

20001e90 <ty_adapt_free>:
20001e90:	b508      	push	{r3, lr}
20001e92:	f7ff ffa5 	bl	20001de0 <vPortFree>
20001e96:	bd08      	pop	{r3, pc}

20001e98 <xz_crc32_init>:
20001e98:	b510      	push	{r4, lr}
20001e9a:	4c0d      	ldr	r4, [pc, #52]	; (20001ed0 <xz_crc32_init+0x38>)
20001e9c:	f1a4 0e04 	sub.w	lr, r4, #4
20001ea0:	f504 747f 	add.w	r4, r4, #1020	; 0x3fc
20001ea4:	f04f 0c00 	mov.w	ip, #0
20001ea8:	480a      	ldr	r0, [pc, #40]	; (20001ed4 <xz_crc32_init+0x3c>)
20001eaa:	e005      	b.n	20001eb8 <xz_crc32_init+0x20>
20001eac:	f84e 2f04 	str.w	r2, [lr, #4]!
20001eb0:	f10c 0c01 	add.w	ip, ip, #1
20001eb4:	45a6      	cmp	lr, r4
20001eb6:	d009      	beq.n	20001ecc <xz_crc32_init+0x34>
20001eb8:	4662      	mov	r2, ip
20001eba:	2108      	movs	r1, #8
20001ebc:	f342 0300 	sbfx	r3, r2, #0, #1
20001ec0:	4003      	ands	r3, r0
20001ec2:	ea83 0252 	eor.w	r2, r3, r2, lsr #1
20001ec6:	3901      	subs	r1, #1
20001ec8:	d1f8      	bne.n	20001ebc <xz_crc32_init+0x24>
20001eca:	e7ef      	b.n	20001eac <xz_crc32_init+0x14>
20001ecc:	bd10      	pop	{r4, pc}
20001ece:	bf00      	nop
20001ed0:	20029074 	.word	0x20029074
20001ed4:	edb88320 	.word	0xedb88320

20001ed8 <xz_crc32>:
20001ed8:	43d2      	mvns	r2, r2
20001eda:	b189      	cbz	r1, 20001f00 <xz_crc32+0x28>
20001edc:	b410      	push	{r4}
20001ede:	468c      	mov	ip, r1
20001ee0:	4484      	add	ip, r0
20001ee2:	4c08      	ldr	r4, [pc, #32]	; (20001f04 <xz_crc32+0x2c>)
20001ee4:	f810 3b01 	ldrb.w	r3, [r0], #1
20001ee8:	b2d1      	uxtb	r1, r2
20001eea:	404b      	eors	r3, r1
20001eec:	f854 3023 	ldr.w	r3, [r4, r3, lsl #2]
20001ef0:	ea83 2212 	eor.w	r2, r3, r2, lsr #8
20001ef4:	4584      	cmp	ip, r0
20001ef6:	d1f5      	bne.n	20001ee4 <xz_crc32+0xc>
20001ef8:	43d0      	mvns	r0, r2
20001efa:	f85d 4b04 	ldr.w	r4, [sp], #4
20001efe:	4770      	bx	lr
20001f00:	43d0      	mvns	r0, r2
20001f02:	4770      	bx	lr
20001f04:	20029074 	.word	0x20029074

20001f08 <dict_repeat>:
20001f08:	68c3      	ldr	r3, [r0, #12]
20001f0a:	4293      	cmp	r3, r2
20001f0c:	d929      	bls.n	20001f62 <dict_repeat+0x5a>
20001f0e:	6983      	ldr	r3, [r0, #24]
20001f10:	4293      	cmp	r3, r2
20001f12:	d928      	bls.n	20001f66 <dict_repeat+0x5e>
20001f14:	b470      	push	{r4, r5, r6}
20001f16:	680c      	ldr	r4, [r1, #0]
20001f18:	6903      	ldr	r3, [r0, #16]
20001f1a:	6885      	ldr	r5, [r0, #8]
20001f1c:	1b5b      	subs	r3, r3, r5
20001f1e:	42a3      	cmp	r3, r4
20001f20:	bf28      	it	cs
20001f22:	4623      	movcs	r3, r4
20001f24:	1ae4      	subs	r4, r4, r3
20001f26:	600c      	str	r4, [r1, #0]
20001f28:	6884      	ldr	r4, [r0, #8]
20001f2a:	43d1      	mvns	r1, r2
20001f2c:	4421      	add	r1, r4
20001f2e:	4294      	cmp	r4, r2
20001f30:	bf9c      	itt	ls
20001f32:	6942      	ldrls	r2, [r0, #20]
20001f34:	1889      	addls	r1, r1, r2
20001f36:	6805      	ldr	r5, [r0, #0]
20001f38:	1c4a      	adds	r2, r1, #1
20001f3a:	6884      	ldr	r4, [r0, #8]
20001f3c:	1c66      	adds	r6, r4, #1
20001f3e:	6086      	str	r6, [r0, #8]
20001f40:	5c69      	ldrb	r1, [r5, r1]
20001f42:	5529      	strb	r1, [r5, r4]
20001f44:	6944      	ldr	r4, [r0, #20]
20001f46:	4294      	cmp	r4, r2
20001f48:	bf14      	ite	ne
20001f4a:	4611      	movne	r1, r2
20001f4c:	2100      	moveq	r1, #0
20001f4e:	3b01      	subs	r3, #1
20001f50:	d1f1      	bne.n	20001f36 <dict_repeat+0x2e>
20001f52:	6883      	ldr	r3, [r0, #8]
20001f54:	68c2      	ldr	r2, [r0, #12]
20001f56:	429a      	cmp	r2, r3
20001f58:	d207      	bcs.n	20001f6a <dict_repeat+0x62>
20001f5a:	60c3      	str	r3, [r0, #12]
20001f5c:	2001      	movs	r0, #1
20001f5e:	bc70      	pop	{r4, r5, r6}
20001f60:	4770      	bx	lr
20001f62:	2000      	movs	r0, #0
20001f64:	4770      	bx	lr
20001f66:	2000      	movs	r0, #0
20001f68:	4770      	bx	lr
20001f6a:	2001      	movs	r0, #1
20001f6c:	e7f7      	b.n	20001f5e <dict_repeat+0x56>

20001f6e <lzma_len>:
20001f6e:	b570      	push	{r4, r5, r6, lr}
20001f70:	6803      	ldr	r3, [r0, #0]
20001f72:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
20001f76:	d20a      	bcs.n	20001f8e <lzma_len+0x20>
20001f78:	021b      	lsls	r3, r3, #8
20001f7a:	6003      	str	r3, [r0, #0]
20001f7c:	6845      	ldr	r5, [r0, #4]
20001f7e:	68c3      	ldr	r3, [r0, #12]
20001f80:	6904      	ldr	r4, [r0, #16]
20001f82:	1c66      	adds	r6, r4, #1
20001f84:	6106      	str	r6, [r0, #16]
20001f86:	5d1b      	ldrb	r3, [r3, r4]
20001f88:	eb03 2305 	add.w	r3, r3, r5, lsl #8
20001f8c:	6043      	str	r3, [r0, #4]
20001f8e:	6805      	ldr	r5, [r0, #0]
20001f90:	0aeb      	lsrs	r3, r5, #11
20001f92:	880c      	ldrh	r4, [r1, #0]
20001f94:	fb04 f303 	mul.w	r3, r4, r3
20001f98:	6844      	ldr	r4, [r0, #4]
20001f9a:	42a3      	cmp	r3, r4
20001f9c:	d910      	bls.n	20001fc0 <lzma_len+0x52>
20001f9e:	6003      	str	r3, [r0, #0]
20001fa0:	880b      	ldrh	r3, [r1, #0]
20001fa2:	f5c3 6400 	rsb	r4, r3, #2048	; 0x800
20001fa6:	eb03 1364 	add.w	r3, r3, r4, asr #5
20001faa:	800b      	strh	r3, [r1, #0]
20001fac:	eb01 1c02 	add.w	ip, r1, r2, lsl #4
20001fb0:	f10c 0c04 	add.w	ip, ip, #4
20001fb4:	2302      	movs	r3, #2
20001fb6:	6643      	str	r3, [r0, #100]	; 0x64
20001fb8:	f04f 0e08 	mov.w	lr, #8
20001fbc:	2201      	movs	r2, #1
20001fbe:	e047      	b.n	20002050 <lzma_len+0xe2>
20001fc0:	1aed      	subs	r5, r5, r3
20001fc2:	6005      	str	r5, [r0, #0]
20001fc4:	1ae3      	subs	r3, r4, r3
20001fc6:	6043      	str	r3, [r0, #4]
20001fc8:	880b      	ldrh	r3, [r1, #0]
20001fca:	eba3 1353 	sub.w	r3, r3, r3, lsr #5
20001fce:	800b      	strh	r3, [r1, #0]
20001fd0:	6803      	ldr	r3, [r0, #0]
20001fd2:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
20001fd6:	d20a      	bcs.n	20001fee <lzma_len+0x80>
20001fd8:	021b      	lsls	r3, r3, #8
20001fda:	6003      	str	r3, [r0, #0]
20001fdc:	6845      	ldr	r5, [r0, #4]
20001fde:	68c3      	ldr	r3, [r0, #12]
20001fe0:	6904      	ldr	r4, [r0, #16]
20001fe2:	1c66      	adds	r6, r4, #1
20001fe4:	6106      	str	r6, [r0, #16]
20001fe6:	5d1b      	ldrb	r3, [r3, r4]
20001fe8:	eb03 2305 	add.w	r3, r3, r5, lsl #8
20001fec:	6043      	str	r3, [r0, #4]
20001fee:	6805      	ldr	r5, [r0, #0]
20001ff0:	0aeb      	lsrs	r3, r5, #11
20001ff2:	884c      	ldrh	r4, [r1, #2]
20001ff4:	fb04 f303 	mul.w	r3, r4, r3
20001ff8:	6844      	ldr	r4, [r0, #4]
20001ffa:	42a3      	cmp	r3, r4
20001ffc:	d90f      	bls.n	2000201e <lzma_len+0xb0>
20001ffe:	6003      	str	r3, [r0, #0]
20002000:	884b      	ldrh	r3, [r1, #2]
20002002:	f5c3 6400 	rsb	r4, r3, #2048	; 0x800
20002006:	eb03 1364 	add.w	r3, r3, r4, asr #5
2000200a:	804b      	strh	r3, [r1, #2]
2000200c:	eb01 1c02 	add.w	ip, r1, r2, lsl #4
20002010:	f50c 7c82 	add.w	ip, ip, #260	; 0x104
20002014:	230a      	movs	r3, #10
20002016:	6643      	str	r3, [r0, #100]	; 0x64
20002018:	f04f 0e08 	mov.w	lr, #8
2000201c:	e7ce      	b.n	20001fbc <lzma_len+0x4e>
2000201e:	1aed      	subs	r5, r5, r3
20002020:	6005      	str	r5, [r0, #0]
20002022:	1ae3      	subs	r3, r4, r3
20002024:	6043      	str	r3, [r0, #4]
20002026:	884b      	ldrh	r3, [r1, #2]
20002028:	eba3 1353 	sub.w	r3, r3, r3, lsr #5
2000202c:	804b      	strh	r3, [r1, #2]
2000202e:	f501 7c01 	add.w	ip, r1, #516	; 0x204
20002032:	2312      	movs	r3, #18
20002034:	6643      	str	r3, [r0, #100]	; 0x64
20002036:	f44f 7e80 	mov.w	lr, #256	; 0x100
2000203a:	e7bf      	b.n	20001fbc <lzma_len+0x4e>
2000203c:	6003      	str	r3, [r0, #0]
2000203e:	880b      	ldrh	r3, [r1, #0]
20002040:	f5c3 6400 	rsb	r4, r3, #2048	; 0x800
20002044:	eb03 1364 	add.w	r3, r3, r4, asr #5
20002048:	800b      	strh	r3, [r1, #0]
2000204a:	0052      	lsls	r2, r2, #1
2000204c:	4596      	cmp	lr, r2
2000204e:	d923      	bls.n	20002098 <lzma_len+0x12a>
20002050:	eb0c 0142 	add.w	r1, ip, r2, lsl #1
20002054:	6803      	ldr	r3, [r0, #0]
20002056:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
2000205a:	d20a      	bcs.n	20002072 <lzma_len+0x104>
2000205c:	021b      	lsls	r3, r3, #8
2000205e:	6003      	str	r3, [r0, #0]
20002060:	6845      	ldr	r5, [r0, #4]
20002062:	68c3      	ldr	r3, [r0, #12]
20002064:	6904      	ldr	r4, [r0, #16]
20002066:	1c66      	adds	r6, r4, #1
20002068:	6106      	str	r6, [r0, #16]
2000206a:	5d1b      	ldrb	r3, [r3, r4]
2000206c:	eb03 2305 	add.w	r3, r3, r5, lsl #8
20002070:	6043      	str	r3, [r0, #4]
20002072:	6805      	ldr	r5, [r0, #0]
20002074:	0aeb      	lsrs	r3, r5, #11
20002076:	880c      	ldrh	r4, [r1, #0]
20002078:	fb04 f303 	mul.w	r3, r4, r3
2000207c:	6844      	ldr	r4, [r0, #4]
2000207e:	42a3      	cmp	r3, r4
20002080:	d8dc      	bhi.n	2000203c <lzma_len+0xce>
20002082:	1aed      	subs	r5, r5, r3
20002084:	6005      	str	r5, [r0, #0]
20002086:	1ae3      	subs	r3, r4, r3
20002088:	6043      	str	r3, [r0, #4]
2000208a:	880b      	ldrh	r3, [r1, #0]
2000208c:	eba3 1353 	sub.w	r3, r3, r3, lsr #5
20002090:	800b      	strh	r3, [r1, #0]
20002092:	0052      	lsls	r2, r2, #1
20002094:	3201      	adds	r2, #1
20002096:	e7d9      	b.n	2000204c <lzma_len+0xde>
20002098:	6e43      	ldr	r3, [r0, #100]	; 0x64
2000209a:	eba3 030e 	sub.w	r3, r3, lr
2000209e:	441a      	add	r2, r3
200020a0:	6642      	str	r2, [r0, #100]	; 0x64
200020a2:	bd70      	pop	{r4, r5, r6, pc}

200020a4 <lzma_main>:
200020a4:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
200020a8:	4604      	mov	r4, r0
200020aa:	6a01      	ldr	r1, [r0, #32]
200020ac:	6a83      	ldr	r3, [r0, #40]	; 0x28
200020ae:	4299      	cmp	r1, r3
200020b0:	f080 8313 	bcs.w	200026da <lzma_main+0x636>
200020b4:	6e43      	ldr	r3, [r0, #100]	; 0x64
200020b6:	b153      	cbz	r3, 200020ce <lzma_main+0x2a>
200020b8:	6d02      	ldr	r2, [r0, #80]	; 0x50
200020ba:	f100 0164 	add.w	r1, r0, #100	; 0x64
200020be:	3018      	adds	r0, #24
200020c0:	f7ff ff22 	bl	20001f08 <dict_repeat>
200020c4:	6a21      	ldr	r1, [r4, #32]
200020c6:	6aa3      	ldr	r3, [r4, #40]	; 0x28
200020c8:	4299      	cmp	r1, r3
200020ca:	f080 8306 	bcs.w	200026da <lzma_main+0x636>
200020ce:	f104 0a64 	add.w	sl, r4, #100	; 0x64
200020d2:	2501      	movs	r5, #1
200020d4:	e25b      	b.n	2000258e <lzma_main+0x4ea>
200020d6:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
200020d8:	3b01      	subs	r3, #1
200020da:	e28a      	b.n	200025f2 <lzma_main+0x54e>
200020dc:	46e6      	mov	lr, ip
200020de:	e291      	b.n	20002604 <lzma_main+0x560>
200020e0:	6021      	str	r1, [r4, #0]
200020e2:	5a11      	ldrh	r1, [r2, r0]
200020e4:	f5c1 6700 	rsb	r7, r1, #2048	; 0x800
200020e8:	eb01 1167 	add.w	r1, r1, r7, asr #5
200020ec:	5211      	strh	r1, [r2, r0]
200020ee:	005b      	lsls	r3, r3, #1
200020f0:	2bff      	cmp	r3, #255	; 0xff
200020f2:	d878      	bhi.n	200021e6 <lzma_main+0x142>
200020f4:	0058      	lsls	r0, r3, #1
200020f6:	6821      	ldr	r1, [r4, #0]
200020f8:	f1b1 7f80 	cmp.w	r1, #16777216	; 0x1000000
200020fc:	d20a      	bcs.n	20002114 <lzma_main+0x70>
200020fe:	0209      	lsls	r1, r1, #8
20002100:	6021      	str	r1, [r4, #0]
20002102:	6921      	ldr	r1, [r4, #16]
20002104:	1c4f      	adds	r7, r1, #1
20002106:	6127      	str	r7, [r4, #16]
20002108:	68e7      	ldr	r7, [r4, #12]
2000210a:	5c79      	ldrb	r1, [r7, r1]
2000210c:	6867      	ldr	r7, [r4, #4]
2000210e:	eb01 2107 	add.w	r1, r1, r7, lsl #8
20002112:	6061      	str	r1, [r4, #4]
20002114:	f8d4 c000 	ldr.w	ip, [r4]
20002118:	ea4f 21dc 	mov.w	r1, ip, lsr #11
2000211c:	5a17      	ldrh	r7, [r2, r0]
2000211e:	fb07 f101 	mul.w	r1, r7, r1
20002122:	6867      	ldr	r7, [r4, #4]
20002124:	42b9      	cmp	r1, r7
20002126:	d8db      	bhi.n	200020e0 <lzma_main+0x3c>
20002128:	ebac 0c01 	sub.w	ip, ip, r1
2000212c:	f8c4 c000 	str.w	ip, [r4]
20002130:	1a79      	subs	r1, r7, r1
20002132:	6061      	str	r1, [r4, #4]
20002134:	5a11      	ldrh	r1, [r2, r0]
20002136:	eba1 1151 	sub.w	r1, r1, r1, lsr #5
2000213a:	5211      	strh	r1, [r2, r0]
2000213c:	005b      	lsls	r3, r3, #1
2000213e:	3301      	adds	r3, #1
20002140:	e7d6      	b.n	200020f0 <lzma_main+0x4c>
20002142:	6d20      	ldr	r0, [r4, #80]	; 0x50
20002144:	43c3      	mvns	r3, r0
20002146:	440b      	add	r3, r1
20002148:	4288      	cmp	r0, r1
2000214a:	bf24      	itt	cs
2000214c:	6ae1      	ldrcs	r1, [r4, #44]	; 0x2c
2000214e:	185b      	addcs	r3, r3, r1
20002150:	f1bc 0f00 	cmp.w	ip, #0
20002154:	d002      	beq.n	2000215c <lzma_main+0xb8>
20002156:	69a1      	ldr	r1, [r4, #24]
20002158:	f811 c003 	ldrb.w	ip, [r1, r3]
2000215c:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
20002160:	f44f 7e80 	mov.w	lr, #256	; 0x100
20002164:	2301      	movs	r3, #1
20002166:	e00d      	b.n	20002184 <lzma_main+0xe0>
20002168:	6020      	str	r0, [r4, #0]
2000216a:	f832 0011 	ldrh.w	r0, [r2, r1, lsl #1]
2000216e:	f5c0 6700 	rsb	r7, r0, #2048	; 0x800
20002172:	eb00 1067 	add.w	r0, r0, r7, asr #5
20002176:	f822 0011 	strh.w	r0, [r2, r1, lsl #1]
2000217a:	005b      	lsls	r3, r3, #1
2000217c:	ea2e 0e08 	bic.w	lr, lr, r8
20002180:	2bff      	cmp	r3, #255	; 0xff
20002182:	d830      	bhi.n	200021e6 <lzma_main+0x142>
20002184:	ea0c 080e 	and.w	r8, ip, lr
20002188:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
2000218c:	eb0e 0103 	add.w	r1, lr, r3
20002190:	4441      	add	r1, r8
20002192:	6820      	ldr	r0, [r4, #0]
20002194:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
20002198:	d20a      	bcs.n	200021b0 <lzma_main+0x10c>
2000219a:	0200      	lsls	r0, r0, #8
2000219c:	6020      	str	r0, [r4, #0]
2000219e:	6927      	ldr	r7, [r4, #16]
200021a0:	1c78      	adds	r0, r7, #1
200021a2:	6120      	str	r0, [r4, #16]
200021a4:	68e0      	ldr	r0, [r4, #12]
200021a6:	5dc7      	ldrb	r7, [r0, r7]
200021a8:	6860      	ldr	r0, [r4, #4]
200021aa:	eb07 2000 	add.w	r0, r7, r0, lsl #8
200021ae:	6060      	str	r0, [r4, #4]
200021b0:	f8d4 9000 	ldr.w	r9, [r4]
200021b4:	ea4f 20d9 	mov.w	r0, r9, lsr #11
200021b8:	f832 7011 	ldrh.w	r7, [r2, r1, lsl #1]
200021bc:	fb07 f000 	mul.w	r0, r7, r0
200021c0:	6867      	ldr	r7, [r4, #4]
200021c2:	42b8      	cmp	r0, r7
200021c4:	d8d0      	bhi.n	20002168 <lzma_main+0xc4>
200021c6:	eba9 0900 	sub.w	r9, r9, r0
200021ca:	f8c4 9000 	str.w	r9, [r4]
200021ce:	1a38      	subs	r0, r7, r0
200021d0:	6060      	str	r0, [r4, #4]
200021d2:	f832 0011 	ldrh.w	r0, [r2, r1, lsl #1]
200021d6:	eba0 1050 	sub.w	r0, r0, r0, lsr #5
200021da:	f822 0011 	strh.w	r0, [r2, r1, lsl #1]
200021de:	005b      	lsls	r3, r3, #1
200021e0:	3301      	adds	r3, #1
200021e2:	46c6      	mov	lr, r8
200021e4:	e7cc      	b.n	20002180 <lzma_main+0xdc>
200021e6:	69a1      	ldr	r1, [r4, #24]
200021e8:	6a22      	ldr	r2, [r4, #32]
200021ea:	1c50      	adds	r0, r2, #1
200021ec:	6220      	str	r0, [r4, #32]
200021ee:	548b      	strb	r3, [r1, r2]
200021f0:	6a23      	ldr	r3, [r4, #32]
200021f2:	6a62      	ldr	r2, [r4, #36]	; 0x24
200021f4:	429a      	cmp	r2, r3
200021f6:	bf38      	it	cc
200021f8:	6263      	strcc	r3, [r4, #36]	; 0x24
200021fa:	f894 3060 	ldrb.w	r3, [r4, #96]	; 0x60
200021fe:	2b03      	cmp	r3, #3
20002200:	d803      	bhi.n	2000220a <lzma_main+0x166>
20002202:	2300      	movs	r3, #0
20002204:	f884 3060 	strb.w	r3, [r4, #96]	; 0x60
20002208:	e1bc      	b.n	20002584 <lzma_main+0x4e0>
2000220a:	2b09      	cmp	r3, #9
2000220c:	bf94      	ite	ls
2000220e:	3b03      	subls	r3, #3
20002210:	3b06      	subhi	r3, #6
20002212:	f884 3060 	strb.w	r3, [r4, #96]	; 0x60
20002216:	e1b5      	b.n	20002584 <lzma_main+0x4e0>
20002218:	1ad2      	subs	r2, r2, r3
2000221a:	6022      	str	r2, [r4, #0]
2000221c:	eba8 0303 	sub.w	r3, r8, r3
20002220:	6063      	str	r3, [r4, #4]
20002222:	ebac 1c5c 	sub.w	ip, ip, ip, lsr #5
20002226:	f8a7 c074 	strh.w	ip, [r7, #116]	; 0x74
2000222a:	f1b2 7f80 	cmp.w	r2, #16777216	; 0x1000000
2000222e:	d20a      	bcs.n	20002246 <lzma_main+0x1a2>
20002230:	0211      	lsls	r1, r2, #8
20002232:	6021      	str	r1, [r4, #0]
20002234:	6921      	ldr	r1, [r4, #16]
20002236:	1c4a      	adds	r2, r1, #1
20002238:	6122      	str	r2, [r4, #16]
2000223a:	68e2      	ldr	r2, [r4, #12]
2000223c:	f812 8001 	ldrb.w	r8, [r2, r1]
20002240:	eb08 2303 	add.w	r3, r8, r3, lsl #8
20002244:	6063      	str	r3, [r4, #4]
20002246:	6821      	ldr	r1, [r4, #0]
20002248:	eb04 0c40 	add.w	ip, r4, r0, lsl #1
2000224c:	f8bc 21f4 	ldrh.w	r2, [ip, #500]	; 0x1f4
20002250:	0acb      	lsrs	r3, r1, #11
20002252:	fb02 f303 	mul.w	r3, r2, r3
20002256:	f8d4 8004 	ldr.w	r8, [r4, #4]
2000225a:	4543      	cmp	r3, r8
2000225c:	f240 8113 	bls.w	20002486 <lzma_main+0x3e2>
20002260:	6023      	str	r3, [r4, #0]
20002262:	f5c2 6300 	rsb	r3, r2, #2048	; 0x800
20002266:	eb02 1263 	add.w	r2, r2, r3, asr #5
2000226a:	f8ac 21f4 	strh.w	r2, [ip, #500]	; 0x1f4
2000226e:	2807      	cmp	r0, #7
20002270:	bf34      	ite	cc
20002272:	2307      	movcc	r3, #7
20002274:	230a      	movcs	r3, #10
20002276:	f884 3060 	strb.w	r3, [r4, #96]	; 0x60
2000227a:	6da3      	ldr	r3, [r4, #88]	; 0x58
2000227c:	65e3      	str	r3, [r4, #92]	; 0x5c
2000227e:	6d63      	ldr	r3, [r4, #84]	; 0x54
20002280:	65a3      	str	r3, [r4, #88]	; 0x58
20002282:	6d23      	ldr	r3, [r4, #80]	; 0x50
20002284:	6563      	str	r3, [r4, #84]	; 0x54
20002286:	4672      	mov	r2, lr
20002288:	f504 61db 	add.w	r1, r4, #1752	; 0x6d8
2000228c:	4620      	mov	r0, r4
2000228e:	f7ff fe6e 	bl	20001f6e <lzma_len>
20002292:	6e63      	ldr	r3, [r4, #100]	; 0x64
20002294:	2b05      	cmp	r3, #5
20002296:	bf28      	it	cs
20002298:	2305      	movcs	r3, #5
2000229a:	ea4f 1cc3 	mov.w	ip, r3, lsl #7
2000229e:	f50c 7c35 	add.w	ip, ip, #724	; 0x2d4
200022a2:	2301      	movs	r3, #1
200022a4:	e009      	b.n	200022ba <lzma_main+0x216>
200022a6:	6022      	str	r2, [r4, #0]
200022a8:	5a62      	ldrh	r2, [r4, r1]
200022aa:	f5c2 6000 	rsb	r0, r2, #2048	; 0x800
200022ae:	eb02 1260 	add.w	r2, r2, r0, asr #5
200022b2:	5262      	strh	r2, [r4, r1]
200022b4:	005b      	lsls	r3, r3, #1
200022b6:	2b3f      	cmp	r3, #63	; 0x3f
200022b8:	d823      	bhi.n	20002302 <lzma_main+0x25e>
200022ba:	eb0c 0143 	add.w	r1, ip, r3, lsl #1
200022be:	6822      	ldr	r2, [r4, #0]
200022c0:	f1b2 7f80 	cmp.w	r2, #16777216	; 0x1000000
200022c4:	d20a      	bcs.n	200022dc <lzma_main+0x238>
200022c6:	0212      	lsls	r2, r2, #8
200022c8:	6022      	str	r2, [r4, #0]
200022ca:	6860      	ldr	r0, [r4, #4]
200022cc:	6927      	ldr	r7, [r4, #16]
200022ce:	1c7a      	adds	r2, r7, #1
200022d0:	6122      	str	r2, [r4, #16]
200022d2:	68e2      	ldr	r2, [r4, #12]
200022d4:	5dd2      	ldrb	r2, [r2, r7]
200022d6:	eb02 2200 	add.w	r2, r2, r0, lsl #8
200022da:	6062      	str	r2, [r4, #4]
200022dc:	6827      	ldr	r7, [r4, #0]
200022de:	0afa      	lsrs	r2, r7, #11
200022e0:	5a60      	ldrh	r0, [r4, r1]
200022e2:	fb00 f202 	mul.w	r2, r0, r2
200022e6:	6860      	ldr	r0, [r4, #4]
200022e8:	4282      	cmp	r2, r0
200022ea:	d8dc      	bhi.n	200022a6 <lzma_main+0x202>
200022ec:	1abf      	subs	r7, r7, r2
200022ee:	6027      	str	r7, [r4, #0]
200022f0:	1a82      	subs	r2, r0, r2
200022f2:	6062      	str	r2, [r4, #4]
200022f4:	5a62      	ldrh	r2, [r4, r1]
200022f6:	eba2 1252 	sub.w	r2, r2, r2, lsr #5
200022fa:	5262      	strh	r2, [r4, r1]
200022fc:	005b      	lsls	r3, r3, #1
200022fe:	3301      	adds	r3, #1
20002300:	e7d9      	b.n	200022b6 <lzma_main+0x212>
20002302:	3b40      	subs	r3, #64	; 0x40
20002304:	2b03      	cmp	r3, #3
20002306:	d801      	bhi.n	2000230c <lzma_main+0x268>
20002308:	6523      	str	r3, [r4, #80]	; 0x50
2000230a:	e131      	b.n	20002570 <lzma_main+0x4cc>
2000230c:	0859      	lsrs	r1, r3, #1
2000230e:	f003 0201 	and.w	r2, r3, #1
20002312:	3202      	adds	r2, #2
20002314:	2b0d      	cmp	r3, #13
20002316:	d84f      	bhi.n	200023b8 <lzma_main+0x314>
20002318:	3901      	subs	r1, #1
2000231a:	408a      	lsls	r2, r1
2000231c:	6522      	str	r2, [r4, #80]	; 0x50
2000231e:	f204 5ed4 	addw	lr, r4, #1492	; 0x5d4
20002322:	1ad3      	subs	r3, r2, r3
20002324:	f103 4300 	add.w	r3, r3, #2147483648	; 0x80000000
20002328:	3b01      	subs	r3, #1
2000232a:	f04f 0c00 	mov.w	ip, #0
2000232e:	2001      	movs	r0, #1
20002330:	e018      	b.n	20002364 <lzma_main+0x2c0>
20002332:	eba9 0902 	sub.w	r9, r9, r2
20002336:	f8c4 9000 	str.w	r9, [r4]
2000233a:	eba8 0202 	sub.w	r2, r8, r2
2000233e:	6062      	str	r2, [r4, #4]
20002340:	f83e 2017 	ldrh.w	r2, [lr, r7, lsl #1]
20002344:	eba2 1252 	sub.w	r2, r2, r2, lsr #5
20002348:	f82e 2017 	strh.w	r2, [lr, r7, lsl #1]
2000234c:	0040      	lsls	r0, r0, #1
2000234e:	3001      	adds	r0, #1
20002350:	fa05 f70c 	lsl.w	r7, r5, ip
20002354:	6d22      	ldr	r2, [r4, #80]	; 0x50
20002356:	443a      	add	r2, r7
20002358:	6522      	str	r2, [r4, #80]	; 0x50
2000235a:	f10c 0c01 	add.w	ip, ip, #1
2000235e:	4561      	cmp	r1, ip
20002360:	f000 8106 	beq.w	20002570 <lzma_main+0x4cc>
20002364:	181f      	adds	r7, r3, r0
20002366:	6822      	ldr	r2, [r4, #0]
20002368:	f1b2 7f80 	cmp.w	r2, #16777216	; 0x1000000
2000236c:	d20d      	bcs.n	2000238a <lzma_main+0x2e6>
2000236e:	0212      	lsls	r2, r2, #8
20002370:	6022      	str	r2, [r4, #0]
20002372:	6922      	ldr	r2, [r4, #16]
20002374:	f102 0901 	add.w	r9, r2, #1
20002378:	f8c4 9010 	str.w	r9, [r4, #16]
2000237c:	68e6      	ldr	r6, [r4, #12]
2000237e:	f816 8002 	ldrb.w	r8, [r6, r2]
20002382:	6862      	ldr	r2, [r4, #4]
20002384:	eb08 2202 	add.w	r2, r8, r2, lsl #8
20002388:	6062      	str	r2, [r4, #4]
2000238a:	f8d4 9000 	ldr.w	r9, [r4]
2000238e:	ea4f 22d9 	mov.w	r2, r9, lsr #11
20002392:	f83e 8017 	ldrh.w	r8, [lr, r7, lsl #1]
20002396:	fb08 f202 	mul.w	r2, r8, r2
2000239a:	f8d4 8004 	ldr.w	r8, [r4, #4]
2000239e:	4542      	cmp	r2, r8
200023a0:	d9c7      	bls.n	20002332 <lzma_main+0x28e>
200023a2:	6022      	str	r2, [r4, #0]
200023a4:	f83e 2017 	ldrh.w	r2, [lr, r7, lsl #1]
200023a8:	f5c2 6800 	rsb	r8, r2, #2048	; 0x800
200023ac:	eb02 1268 	add.w	r2, r2, r8, asr #5
200023b0:	f82e 2017 	strh.w	r2, [lr, r7, lsl #1]
200023b4:	0040      	lsls	r0, r0, #1
200023b6:	e7d0      	b.n	2000235a <lzma_main+0x2b6>
200023b8:	6522      	str	r2, [r4, #80]	; 0x50
200023ba:	3905      	subs	r1, #5
200023bc:	e010      	b.n	200023e0 <lzma_main+0x33c>
200023be:	6823      	ldr	r3, [r4, #0]
200023c0:	085b      	lsrs	r3, r3, #1
200023c2:	6023      	str	r3, [r4, #0]
200023c4:	6860      	ldr	r0, [r4, #4]
200023c6:	1ac0      	subs	r0, r0, r3
200023c8:	ea03 73e0 	and.w	r3, r3, r0, asr #31
200023cc:	4403      	add	r3, r0
200023ce:	6063      	str	r3, [r4, #4]
200023d0:	6d22      	ldr	r2, [r4, #80]	; 0x50
200023d2:	0053      	lsls	r3, r2, #1
200023d4:	3301      	adds	r3, #1
200023d6:	eb03 73e0 	add.w	r3, r3, r0, asr #31
200023da:	6523      	str	r3, [r4, #80]	; 0x50
200023dc:	3901      	subs	r1, #1
200023de:	d00f      	beq.n	20002400 <lzma_main+0x35c>
200023e0:	6823      	ldr	r3, [r4, #0]
200023e2:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
200023e6:	d2ea      	bcs.n	200023be <lzma_main+0x31a>
200023e8:	021b      	lsls	r3, r3, #8
200023ea:	6023      	str	r3, [r4, #0]
200023ec:	6860      	ldr	r0, [r4, #4]
200023ee:	68e3      	ldr	r3, [r4, #12]
200023f0:	6922      	ldr	r2, [r4, #16]
200023f2:	1c57      	adds	r7, r2, #1
200023f4:	6127      	str	r7, [r4, #16]
200023f6:	5c9b      	ldrb	r3, [r3, r2]
200023f8:	eb03 2300 	add.w	r3, r3, r0, lsl #8
200023fc:	6063      	str	r3, [r4, #4]
200023fe:	e7de      	b.n	200023be <lzma_main+0x31a>
20002400:	011b      	lsls	r3, r3, #4
20002402:	6523      	str	r3, [r4, #80]	; 0x50
20002404:	f504 6ed7 	add.w	lr, r4, #1720	; 0x6b8
20002408:	2201      	movs	r2, #1
2000240a:	e016      	b.n	2000243a <lzma_main+0x396>
2000240c:	ebac 0c03 	sub.w	ip, ip, r3
20002410:	f8c4 c000 	str.w	ip, [r4]
20002414:	1afb      	subs	r3, r7, r3
20002416:	6063      	str	r3, [r4, #4]
20002418:	f83e 3000 	ldrh.w	r3, [lr, r0]
2000241c:	eba3 1353 	sub.w	r3, r3, r3, lsr #5
20002420:	f82e 3000 	strh.w	r3, [lr, r0]
20002424:	0052      	lsls	r2, r2, #1
20002426:	3201      	adds	r2, #1
20002428:	fa05 f001 	lsl.w	r0, r5, r1
2000242c:	6d23      	ldr	r3, [r4, #80]	; 0x50
2000242e:	4403      	add	r3, r0
20002430:	6523      	str	r3, [r4, #80]	; 0x50
20002432:	3101      	adds	r1, #1
20002434:	2904      	cmp	r1, #4
20002436:	f000 809b 	beq.w	20002570 <lzma_main+0x4cc>
2000243a:	0050      	lsls	r0, r2, #1
2000243c:	6823      	ldr	r3, [r4, #0]
2000243e:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
20002442:	d20a      	bcs.n	2000245a <lzma_main+0x3b6>
20002444:	021b      	lsls	r3, r3, #8
20002446:	6023      	str	r3, [r4, #0]
20002448:	6927      	ldr	r7, [r4, #16]
2000244a:	1c7b      	adds	r3, r7, #1
2000244c:	6123      	str	r3, [r4, #16]
2000244e:	68e3      	ldr	r3, [r4, #12]
20002450:	5ddf      	ldrb	r7, [r3, r7]
20002452:	6863      	ldr	r3, [r4, #4]
20002454:	eb07 2303 	add.w	r3, r7, r3, lsl #8
20002458:	6063      	str	r3, [r4, #4]
2000245a:	f8d4 c000 	ldr.w	ip, [r4]
2000245e:	ea4f 23dc 	mov.w	r3, ip, lsr #11
20002462:	f83e 7000 	ldrh.w	r7, [lr, r0]
20002466:	fb07 f303 	mul.w	r3, r7, r3
2000246a:	6867      	ldr	r7, [r4, #4]
2000246c:	42bb      	cmp	r3, r7
2000246e:	d9cd      	bls.n	2000240c <lzma_main+0x368>
20002470:	6023      	str	r3, [r4, #0]
20002472:	f83e 3000 	ldrh.w	r3, [lr, r0]
20002476:	f5c3 6700 	rsb	r7, r3, #2048	; 0x800
2000247a:	eb03 1367 	add.w	r3, r3, r7, asr #5
2000247e:	f82e 3000 	strh.w	r3, [lr, r0]
20002482:	0052      	lsls	r2, r2, #1
20002484:	e7d5      	b.n	20002432 <lzma_main+0x38e>
20002486:	1ac9      	subs	r1, r1, r3
20002488:	6021      	str	r1, [r4, #0]
2000248a:	eba8 0303 	sub.w	r3, r8, r3
2000248e:	6063      	str	r3, [r4, #4]
20002490:	eba2 1252 	sub.w	r2, r2, r2, lsr #5
20002494:	f8ac 21f4 	strh.w	r2, [ip, #500]	; 0x1f4
20002498:	f1b1 7f80 	cmp.w	r1, #16777216	; 0x1000000
2000249c:	d20a      	bcs.n	200024b4 <lzma_main+0x410>
2000249e:	0209      	lsls	r1, r1, #8
200024a0:	6021      	str	r1, [r4, #0]
200024a2:	6921      	ldr	r1, [r4, #16]
200024a4:	1c4a      	adds	r2, r1, #1
200024a6:	6122      	str	r2, [r4, #16]
200024a8:	68e2      	ldr	r2, [r4, #12]
200024aa:	f812 8001 	ldrb.w	r8, [r2, r1]
200024ae:	eb08 2303 	add.w	r3, r8, r3, lsl #8
200024b2:	6063      	str	r3, [r4, #4]
200024b4:	6821      	ldr	r1, [r4, #0]
200024b6:	f8bc 220c 	ldrh.w	r2, [ip, #524]	; 0x20c
200024ba:	0acb      	lsrs	r3, r1, #11
200024bc:	fb02 f303 	mul.w	r3, r2, r3
200024c0:	f8d4 8004 	ldr.w	r8, [r4, #4]
200024c4:	4543      	cmp	r3, r8
200024c6:	d925      	bls.n	20002514 <lzma_main+0x470>
200024c8:	6023      	str	r3, [r4, #0]
200024ca:	f5c2 6100 	rsb	r1, r2, #2048	; 0x800
200024ce:	eb02 1261 	add.w	r2, r2, r1, asr #5
200024d2:	f8ac 220c 	strh.w	r2, [ip, #524]	; 0x20c
200024d6:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
200024da:	f0c0 80a8 	bcc.w	2000262e <lzma_main+0x58a>
200024de:	f8d4 c000 	ldr.w	ip, [r4]
200024e2:	f8b7 3254 	ldrh.w	r3, [r7, #596]	; 0x254
200024e6:	ea4f 22dc 	mov.w	r2, ip, lsr #11
200024ea:	fb03 f202 	mul.w	r2, r3, r2
200024ee:	6861      	ldr	r1, [r4, #4]
200024f0:	428a      	cmp	r2, r1
200024f2:	f240 80a7 	bls.w	20002644 <lzma_main+0x5a0>
200024f6:	6022      	str	r2, [r4, #0]
200024f8:	f5c3 6200 	rsb	r2, r3, #2048	; 0x800
200024fc:	eb03 1362 	add.w	r3, r3, r2, asr #5
20002500:	f8a7 3254 	strh.w	r3, [r7, #596]	; 0x254
20002504:	2807      	cmp	r0, #7
20002506:	bf34      	ite	cc
20002508:	2309      	movcc	r3, #9
2000250a:	230b      	movcs	r3, #11
2000250c:	f884 3060 	strb.w	r3, [r4, #96]	; 0x60
20002510:	6665      	str	r5, [r4, #100]	; 0x64
20002512:	e02d      	b.n	20002570 <lzma_main+0x4cc>
20002514:	1ac9      	subs	r1, r1, r3
20002516:	6021      	str	r1, [r4, #0]
20002518:	eba8 0303 	sub.w	r3, r8, r3
2000251c:	6063      	str	r3, [r4, #4]
2000251e:	eba2 1252 	sub.w	r2, r2, r2, lsr #5
20002522:	f8ac 220c 	strh.w	r2, [ip, #524]	; 0x20c
20002526:	f1b1 7f80 	cmp.w	r1, #16777216	; 0x1000000
2000252a:	f0c0 8096 	bcc.w	2000265a <lzma_main+0x5b6>
2000252e:	6821      	ldr	r1, [r4, #0]
20002530:	f8bc 3224 	ldrh.w	r3, [ip, #548]	; 0x224
20002534:	0aca      	lsrs	r2, r1, #11
20002536:	fb03 f202 	mul.w	r2, r3, r2
2000253a:	6867      	ldr	r7, [r4, #4]
2000253c:	42ba      	cmp	r2, r7
2000253e:	f240 8097 	bls.w	20002670 <lzma_main+0x5cc>
20002542:	6022      	str	r2, [r4, #0]
20002544:	f5c3 6200 	rsb	r2, r3, #2048	; 0x800
20002548:	eb03 1362 	add.w	r3, r3, r2, asr #5
2000254c:	f8ac 3224 	strh.w	r3, [ip, #548]	; 0x224
20002550:	6d62      	ldr	r2, [r4, #84]	; 0x54
20002552:	6d23      	ldr	r3, [r4, #80]	; 0x50
20002554:	6563      	str	r3, [r4, #84]	; 0x54
20002556:	6522      	str	r2, [r4, #80]	; 0x50
20002558:	2807      	cmp	r0, #7
2000255a:	bf34      	ite	cc
2000255c:	2308      	movcc	r3, #8
2000255e:	230b      	movcs	r3, #11
20002560:	f884 3060 	strb.w	r3, [r4, #96]	; 0x60
20002564:	4672      	mov	r2, lr
20002566:	f604 21dc 	addw	r1, r4, #2780	; 0xadc
2000256a:	4620      	mov	r0, r4
2000256c:	f7ff fcff 	bl	20001f6e <lzma_len>
20002570:	6d22      	ldr	r2, [r4, #80]	; 0x50
20002572:	4651      	mov	r1, sl
20002574:	f104 0018 	add.w	r0, r4, #24
20002578:	f7ff fcc6 	bl	20001f08 <dict_repeat>
2000257c:	4603      	mov	r3, r0
2000257e:	2800      	cmp	r0, #0
20002580:	f000 80bb 	beq.w	200026fa <lzma_main+0x656>
20002584:	6a21      	ldr	r1, [r4, #32]
20002586:	6aa3      	ldr	r3, [r4, #40]	; 0x28
20002588:	4299      	cmp	r1, r3
2000258a:	f080 80a6 	bcs.w	200026da <lzma_main+0x636>
2000258e:	6927      	ldr	r7, [r4, #16]
20002590:	6963      	ldr	r3, [r4, #20]
20002592:	429f      	cmp	r7, r3
20002594:	f200 80a1 	bhi.w	200026da <lzma_main+0x636>
20002598:	6f22      	ldr	r2, [r4, #112]	; 0x70
2000259a:	ea01 0e02 	and.w	lr, r1, r2
2000259e:	f894 0060 	ldrb.w	r0, [r4, #96]	; 0x60
200025a2:	6823      	ldr	r3, [r4, #0]
200025a4:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
200025a8:	d209      	bcs.n	200025be <lzma_main+0x51a>
200025aa:	021b      	lsls	r3, r3, #8
200025ac:	6023      	str	r3, [r4, #0]
200025ae:	6863      	ldr	r3, [r4, #4]
200025b0:	1c7a      	adds	r2, r7, #1
200025b2:	6122      	str	r2, [r4, #16]
200025b4:	68e2      	ldr	r2, [r4, #12]
200025b6:	5dd2      	ldrb	r2, [r2, r7]
200025b8:	eb02 2303 	add.w	r3, r2, r3, lsl #8
200025bc:	6063      	str	r3, [r4, #4]
200025be:	6822      	ldr	r2, [r4, #0]
200025c0:	eb0e 1700 	add.w	r7, lr, r0, lsl #4
200025c4:	eb04 0747 	add.w	r7, r4, r7, lsl #1
200025c8:	f8b7 c074 	ldrh.w	ip, [r7, #116]	; 0x74
200025cc:	0ad3      	lsrs	r3, r2, #11
200025ce:	fb0c f303 	mul.w	r3, ip, r3
200025d2:	f8d4 8004 	ldr.w	r8, [r4, #4]
200025d6:	4543      	cmp	r3, r8
200025d8:	f67f ae1e 	bls.w	20002218 <lzma_main+0x174>
200025dc:	6023      	str	r3, [r4, #0]
200025de:	f5cc 6300 	rsb	r3, ip, #2048	; 0x800
200025e2:	eb0c 1c63 	add.w	ip, ip, r3, asr #5
200025e6:	f8a7 c074 	strh.w	ip, [r7, #116]	; 0x74
200025ea:	2900      	cmp	r1, #0
200025ec:	f43f ad73 	beq.w	200020d6 <lzma_main+0x32>
200025f0:	1e4b      	subs	r3, r1, #1
200025f2:	f8d4 c024 	ldr.w	ip, [r4, #36]	; 0x24
200025f6:	f1bc 0f00 	cmp.w	ip, #0
200025fa:	f43f ad6f 	beq.w	200020dc <lzma_main+0x38>
200025fe:	69a2      	ldr	r2, [r4, #24]
20002600:	f812 e003 	ldrb.w	lr, [r2, r3]
20002604:	6ea7      	ldr	r7, [r4, #104]	; 0x68
20002606:	6ee3      	ldr	r3, [r4, #108]	; 0x6c
20002608:	ea01 0203 	and.w	r2, r1, r3
2000260c:	40ba      	lsls	r2, r7
2000260e:	f1c7 0708 	rsb	r7, r7, #8
20002612:	fa2e f707 	lsr.w	r7, lr, r7
20002616:	443a      	add	r2, r7
20002618:	eb02 0242 	add.w	r2, r2, r2, lsl #1
2000261c:	eb04 2242 	add.w	r2, r4, r2, lsl #9
20002620:	f502 626e 	add.w	r2, r2, #3808	; 0xee0
20002624:	2806      	cmp	r0, #6
20002626:	f63f ad8c 	bhi.w	20002142 <lzma_main+0x9e>
2000262a:	2301      	movs	r3, #1
2000262c:	e562      	b.n	200020f4 <lzma_main+0x50>
2000262e:	021b      	lsls	r3, r3, #8
20002630:	6023      	str	r3, [r4, #0]
20002632:	68e3      	ldr	r3, [r4, #12]
20002634:	6922      	ldr	r2, [r4, #16]
20002636:	1c51      	adds	r1, r2, #1
20002638:	6121      	str	r1, [r4, #16]
2000263a:	5c9b      	ldrb	r3, [r3, r2]
2000263c:	eb03 2308 	add.w	r3, r3, r8, lsl #8
20002640:	6063      	str	r3, [r4, #4]
20002642:	e74c      	b.n	200024de <lzma_main+0x43a>
20002644:	ebac 0c02 	sub.w	ip, ip, r2
20002648:	f8c4 c000 	str.w	ip, [r4]
2000264c:	1a8a      	subs	r2, r1, r2
2000264e:	6062      	str	r2, [r4, #4]
20002650:	eba3 1353 	sub.w	r3, r3, r3, lsr #5
20002654:	f8a7 3254 	strh.w	r3, [r7, #596]	; 0x254
20002658:	e77e      	b.n	20002558 <lzma_main+0x4b4>
2000265a:	0209      	lsls	r1, r1, #8
2000265c:	6021      	str	r1, [r4, #0]
2000265e:	68e2      	ldr	r2, [r4, #12]
20002660:	6921      	ldr	r1, [r4, #16]
20002662:	1c4f      	adds	r7, r1, #1
20002664:	6127      	str	r7, [r4, #16]
20002666:	5c52      	ldrb	r2, [r2, r1]
20002668:	eb02 2303 	add.w	r3, r2, r3, lsl #8
2000266c:	6063      	str	r3, [r4, #4]
2000266e:	e75e      	b.n	2000252e <lzma_main+0x48a>
20002670:	1a89      	subs	r1, r1, r2
20002672:	6021      	str	r1, [r4, #0]
20002674:	1aba      	subs	r2, r7, r2
20002676:	6062      	str	r2, [r4, #4]
20002678:	eba3 1353 	sub.w	r3, r3, r3, lsr #5
2000267c:	f8ac 3224 	strh.w	r3, [ip, #548]	; 0x224
20002680:	f1b1 7f80 	cmp.w	r1, #16777216	; 0x1000000
20002684:	d209      	bcs.n	2000269a <lzma_main+0x5f6>
20002686:	0209      	lsls	r1, r1, #8
20002688:	6021      	str	r1, [r4, #0]
2000268a:	68e3      	ldr	r3, [r4, #12]
2000268c:	6921      	ldr	r1, [r4, #16]
2000268e:	1c4f      	adds	r7, r1, #1
20002690:	6127      	str	r7, [r4, #16]
20002692:	5c5b      	ldrb	r3, [r3, r1]
20002694:	eb03 2202 	add.w	r2, r3, r2, lsl #8
20002698:	6062      	str	r2, [r4, #4]
2000269a:	6827      	ldr	r7, [r4, #0]
2000269c:	f8bc 323c 	ldrh.w	r3, [ip, #572]	; 0x23c
200026a0:	0afa      	lsrs	r2, r7, #11
200026a2:	fb03 f202 	mul.w	r2, r3, r2
200026a6:	6861      	ldr	r1, [r4, #4]
200026a8:	428a      	cmp	r2, r1
200026aa:	d90a      	bls.n	200026c2 <lzma_main+0x61e>
200026ac:	6022      	str	r2, [r4, #0]
200026ae:	f5c3 6200 	rsb	r2, r3, #2048	; 0x800
200026b2:	eb03 1362 	add.w	r3, r3, r2, asr #5
200026b6:	f8ac 323c 	strh.w	r3, [ip, #572]	; 0x23c
200026ba:	6da2      	ldr	r2, [r4, #88]	; 0x58
200026bc:	6d63      	ldr	r3, [r4, #84]	; 0x54
200026be:	65a3      	str	r3, [r4, #88]	; 0x58
200026c0:	e747      	b.n	20002552 <lzma_main+0x4ae>
200026c2:	1abf      	subs	r7, r7, r2
200026c4:	6027      	str	r7, [r4, #0]
200026c6:	1a8a      	subs	r2, r1, r2
200026c8:	6062      	str	r2, [r4, #4]
200026ca:	eba3 1353 	sub.w	r3, r3, r3, lsr #5
200026ce:	f8ac 323c 	strh.w	r3, [ip, #572]	; 0x23c
200026d2:	6de2      	ldr	r2, [r4, #92]	; 0x5c
200026d4:	6da3      	ldr	r3, [r4, #88]	; 0x58
200026d6:	65e3      	str	r3, [r4, #92]	; 0x5c
200026d8:	e7f0      	b.n	200026bc <lzma_main+0x618>
200026da:	6823      	ldr	r3, [r4, #0]
200026dc:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
200026e0:	d20e      	bcs.n	20002700 <lzma_main+0x65c>
200026e2:	021b      	lsls	r3, r3, #8
200026e4:	6023      	str	r3, [r4, #0]
200026e6:	6861      	ldr	r1, [r4, #4]
200026e8:	68e3      	ldr	r3, [r4, #12]
200026ea:	6922      	ldr	r2, [r4, #16]
200026ec:	1c50      	adds	r0, r2, #1
200026ee:	6120      	str	r0, [r4, #16]
200026f0:	5c9b      	ldrb	r3, [r3, r2]
200026f2:	eb03 2301 	add.w	r3, r3, r1, lsl #8
200026f6:	6063      	str	r3, [r4, #4]
200026f8:	2301      	movs	r3, #1
200026fa:	4618      	mov	r0, r3
200026fc:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20002700:	2301      	movs	r3, #1
20002702:	e7fa      	b.n	200026fa <lzma_main+0x656>

20002704 <xz_dec_lzma2_run>:
20002704:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
20002708:	4604      	mov	r4, r0
2000270a:	460d      	mov	r5, r1
2000270c:	f500 4bc0 	add.w	fp, r0, #24576	; 0x6000
20002710:	f500 48dd 	add.w	r8, r0, #28288	; 0x6e80
20002714:	f108 0864 	add.w	r8, r8, #100	; 0x64
20002718:	e166      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
2000271a:	f894 2040 	ldrb.w	r2, [r4, #64]	; 0x40
2000271e:	2a08      	cmp	r2, #8
20002720:	f200 8164 	bhi.w	200029ec <xz_dec_lzma2_run+0x2e8>
20002724:	e8df f012 	tbh	[pc, r2, lsl #1]
20002728:	00770010 	.word	0x00770010
2000272c:	008f0083 	.word	0x008f0083
20002730:	00a60099 	.word	0x00a60099
20002734:	016a010b 	.word	0x016a010b
20002738:	0009      	.short	0x0009
2000273a:	6ca2      	ldr	r2, [r4, #72]	; 0x48
2000273c:	2a00      	cmp	r2, #0
2000273e:	f000 823f 	beq.w	20002bc0 <xz_dec_lzma2_run+0x4bc>
20002742:	f04f 0900 	mov.w	r9, #0
20002746:	e200      	b.n	20002b4a <xz_dec_lzma2_run+0x446>
20002748:	682a      	ldr	r2, [r5, #0]
2000274a:	1c59      	adds	r1, r3, #1
2000274c:	6069      	str	r1, [r5, #4]
2000274e:	5cd3      	ldrb	r3, [r2, r3]
20002750:	2b00      	cmp	r3, #0
20002752:	f000 823b 	beq.w	20002bcc <xz_dec_lzma2_run+0x4c8>
20002756:	2bdf      	cmp	r3, #223	; 0xdf
20002758:	d806      	bhi.n	20002768 <xz_dec_lzma2_run+0x64>
2000275a:	2b01      	cmp	r3, #1
2000275c:	d004      	beq.n	20002768 <xz_dec_lzma2_run+0x64>
2000275e:	f894 204c 	ldrb.w	r2, [r4, #76]	; 0x4c
20002762:	b1ba      	cbz	r2, 20002794 <xz_dec_lzma2_run+0x90>
20002764:	2007      	movs	r0, #7
20002766:	e23c      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002768:	2201      	movs	r2, #1
2000276a:	f884 204d 	strb.w	r2, [r4, #77]	; 0x4d
2000276e:	2200      	movs	r2, #0
20002770:	f884 204c 	strb.w	r2, [r4, #76]	; 0x4c
20002774:	f894 203c 	ldrb.w	r2, [r4, #60]	; 0x3c
20002778:	b93a      	cbnz	r2, 2000278a <xz_dec_lzma2_run+0x86>
2000277a:	68ea      	ldr	r2, [r5, #12]
2000277c:	6929      	ldr	r1, [r5, #16]
2000277e:	440a      	add	r2, r1
20002780:	61a2      	str	r2, [r4, #24]
20002782:	696a      	ldr	r2, [r5, #20]
20002784:	6929      	ldr	r1, [r5, #16]
20002786:	1a52      	subs	r2, r2, r1
20002788:	62e2      	str	r2, [r4, #44]	; 0x2c
2000278a:	2200      	movs	r2, #0
2000278c:	61e2      	str	r2, [r4, #28]
2000278e:	6222      	str	r2, [r4, #32]
20002790:	62a2      	str	r2, [r4, #40]	; 0x28
20002792:	6262      	str	r2, [r4, #36]	; 0x24
20002794:	2b7f      	cmp	r3, #127	; 0x7f
20002796:	d934      	bls.n	20002802 <xz_dec_lzma2_run+0xfe>
20002798:	041a      	lsls	r2, r3, #16
2000279a:	f402 12f8 	and.w	r2, r2, #2031616	; 0x1f0000
2000279e:	6462      	str	r2, [r4, #68]	; 0x44
200027a0:	2201      	movs	r2, #1
200027a2:	f884 2040 	strb.w	r2, [r4, #64]	; 0x40
200027a6:	2bbf      	cmp	r3, #191	; 0xbf
200027a8:	d906      	bls.n	200027b8 <xz_dec_lzma2_run+0xb4>
200027aa:	2300      	movs	r3, #0
200027ac:	f884 304d 	strb.w	r3, [r4, #77]	; 0x4d
200027b0:	2305      	movs	r3, #5
200027b2:	f884 3041 	strb.w	r3, [r4, #65]	; 0x41
200027b6:	e117      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
200027b8:	f894 204d 	ldrb.w	r2, [r4, #77]	; 0x4d
200027bc:	2a00      	cmp	r2, #0
200027be:	f040 8207 	bne.w	20002bd0 <xz_dec_lzma2_run+0x4cc>
200027c2:	2206      	movs	r2, #6
200027c4:	f884 2041 	strb.w	r2, [r4, #65]	; 0x41
200027c8:	2b9f      	cmp	r3, #159	; 0x9f
200027ca:	f240 810d 	bls.w	200029e8 <xz_dec_lzma2_run+0x2e4>
200027ce:	2300      	movs	r3, #0
200027d0:	f884 3060 	strb.w	r3, [r4, #96]	; 0x60
200027d4:	6523      	str	r3, [r4, #80]	; 0x50
200027d6:	6563      	str	r3, [r4, #84]	; 0x54
200027d8:	65a3      	str	r3, [r4, #88]	; 0x58
200027da:	65e3      	str	r3, [r4, #92]	; 0x5c
200027dc:	f104 0372 	add.w	r3, r4, #114	; 0x72
200027e0:	f504 42dd 	add.w	r2, r4, #28288	; 0x6e80
200027e4:	325e      	adds	r2, #94	; 0x5e
200027e6:	f44f 6180 	mov.w	r1, #1024	; 0x400
200027ea:	f823 1f02 	strh.w	r1, [r3, #2]!
200027ee:	429a      	cmp	r2, r3
200027f0:	d1fb      	bne.n	200027ea <xz_dec_lzma2_run+0xe6>
200027f2:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
200027f6:	6023      	str	r3, [r4, #0]
200027f8:	2300      	movs	r3, #0
200027fa:	6063      	str	r3, [r4, #4]
200027fc:	2305      	movs	r3, #5
200027fe:	60a3      	str	r3, [r4, #8]
20002800:	e0f2      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
20002802:	2b02      	cmp	r3, #2
20002804:	f200 81e6 	bhi.w	20002bd4 <xz_dec_lzma2_run+0x4d0>
20002808:	2303      	movs	r3, #3
2000280a:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
2000280e:	2308      	movs	r3, #8
20002810:	f884 3041 	strb.w	r3, [r4, #65]	; 0x41
20002814:	e0e8      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
20002816:	682a      	ldr	r2, [r5, #0]
20002818:	1c59      	adds	r1, r3, #1
2000281a:	6069      	str	r1, [r5, #4]
2000281c:	5cd2      	ldrb	r2, [r2, r3]
2000281e:	6c63      	ldr	r3, [r4, #68]	; 0x44
20002820:	eb03 2302 	add.w	r3, r3, r2, lsl #8
20002824:	6463      	str	r3, [r4, #68]	; 0x44
20002826:	2302      	movs	r3, #2
20002828:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
2000282c:	e0dc      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
2000282e:	682a      	ldr	r2, [r5, #0]
20002830:	1c59      	adds	r1, r3, #1
20002832:	6069      	str	r1, [r5, #4]
20002834:	5cd3      	ldrb	r3, [r2, r3]
20002836:	6c62      	ldr	r2, [r4, #68]	; 0x44
20002838:	3201      	adds	r2, #1
2000283a:	4413      	add	r3, r2
2000283c:	6463      	str	r3, [r4, #68]	; 0x44
2000283e:	2303      	movs	r3, #3
20002840:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
20002844:	e0d0      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
20002846:	682a      	ldr	r2, [r5, #0]
20002848:	1c59      	adds	r1, r3, #1
2000284a:	6069      	str	r1, [r5, #4]
2000284c:	5cd3      	ldrb	r3, [r2, r3]
2000284e:	021b      	lsls	r3, r3, #8
20002850:	64a3      	str	r3, [r4, #72]	; 0x48
20002852:	2304      	movs	r3, #4
20002854:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
20002858:	e0c6      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
2000285a:	682a      	ldr	r2, [r5, #0]
2000285c:	1c59      	adds	r1, r3, #1
2000285e:	6069      	str	r1, [r5, #4]
20002860:	5cd3      	ldrb	r3, [r2, r3]
20002862:	6ca2      	ldr	r2, [r4, #72]	; 0x48
20002864:	3201      	adds	r2, #1
20002866:	4413      	add	r3, r2
20002868:	64a3      	str	r3, [r4, #72]	; 0x48
2000286a:	f894 3041 	ldrb.w	r3, [r4, #65]	; 0x41
2000286e:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
20002872:	e0b9      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
20002874:	682a      	ldr	r2, [r5, #0]
20002876:	1c59      	adds	r1, r3, #1
20002878:	6069      	str	r1, [r5, #4]
2000287a:	5cd3      	ldrb	r3, [r2, r3]
2000287c:	2be0      	cmp	r3, #224	; 0xe0
2000287e:	d81f      	bhi.n	200028c0 <xz_dec_lzma2_run+0x1bc>
20002880:	2200      	movs	r2, #0
20002882:	6722      	str	r2, [r4, #112]	; 0x70
20002884:	2b2c      	cmp	r3, #44	; 0x2c
20002886:	d905      	bls.n	20002894 <xz_dec_lzma2_run+0x190>
20002888:	3b2d      	subs	r3, #45	; 0x2d
2000288a:	b2db      	uxtb	r3, r3
2000288c:	3201      	adds	r2, #1
2000288e:	2b2c      	cmp	r3, #44	; 0x2c
20002890:	d8fa      	bhi.n	20002888 <xz_dec_lzma2_run+0x184>
20002892:	6722      	str	r2, [r4, #112]	; 0x70
20002894:	6f21      	ldr	r1, [r4, #112]	; 0x70
20002896:	2201      	movs	r2, #1
20002898:	408a      	lsls	r2, r1
2000289a:	3a01      	subs	r2, #1
2000289c:	6722      	str	r2, [r4, #112]	; 0x70
2000289e:	2200      	movs	r2, #0
200028a0:	66e2      	str	r2, [r4, #108]	; 0x6c
200028a2:	2b08      	cmp	r3, #8
200028a4:	d907      	bls.n	200028b6 <xz_dec_lzma2_run+0x1b2>
200028a6:	2201      	movs	r2, #1
200028a8:	3b09      	subs	r3, #9
200028aa:	b2db      	uxtb	r3, r3
200028ac:	4611      	mov	r1, r2
200028ae:	3201      	adds	r2, #1
200028b0:	2b08      	cmp	r3, #8
200028b2:	d8f9      	bhi.n	200028a8 <xz_dec_lzma2_run+0x1a4>
200028b4:	66e1      	str	r1, [r4, #108]	; 0x6c
200028b6:	66a3      	str	r3, [r4, #104]	; 0x68
200028b8:	6ee2      	ldr	r2, [r4, #108]	; 0x6c
200028ba:	4413      	add	r3, r2
200028bc:	2b04      	cmp	r3, #4
200028be:	d901      	bls.n	200028c4 <xz_dec_lzma2_run+0x1c0>
200028c0:	2007      	movs	r0, #7
200028c2:	e18e      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
200028c4:	2301      	movs	r3, #1
200028c6:	4093      	lsls	r3, r2
200028c8:	3b01      	subs	r3, #1
200028ca:	66e3      	str	r3, [r4, #108]	; 0x6c
200028cc:	2300      	movs	r3, #0
200028ce:	f884 3060 	strb.w	r3, [r4, #96]	; 0x60
200028d2:	6523      	str	r3, [r4, #80]	; 0x50
200028d4:	6563      	str	r3, [r4, #84]	; 0x54
200028d6:	65a3      	str	r3, [r4, #88]	; 0x58
200028d8:	65e3      	str	r3, [r4, #92]	; 0x5c
200028da:	f104 0372 	add.w	r3, r4, #114	; 0x72
200028de:	f504 42dd 	add.w	r2, r4, #28288	; 0x6e80
200028e2:	325e      	adds	r2, #94	; 0x5e
200028e4:	f44f 6180 	mov.w	r1, #1024	; 0x400
200028e8:	f823 1f02 	strh.w	r1, [r3, #2]!
200028ec:	4293      	cmp	r3, r2
200028ee:	d1fb      	bne.n	200028e8 <xz_dec_lzma2_run+0x1e4>
200028f0:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
200028f4:	6023      	str	r3, [r4, #0]
200028f6:	2300      	movs	r3, #0
200028f8:	6063      	str	r3, [r4, #4]
200028fa:	2305      	movs	r3, #5
200028fc:	60a3      	str	r3, [r4, #8]
200028fe:	2306      	movs	r3, #6
20002900:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
20002904:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20002906:	2b04      	cmp	r3, #4
20002908:	f240 8166 	bls.w	20002bd8 <xz_dec_lzma2_run+0x4d4>
2000290c:	686b      	ldr	r3, [r5, #4]
2000290e:	68aa      	ldr	r2, [r5, #8]
20002910:	4293      	cmp	r3, r2
20002912:	f000 8165 	beq.w	20002be0 <xz_dec_lzma2_run+0x4dc>
20002916:	6862      	ldr	r2, [r4, #4]
20002918:	6829      	ldr	r1, [r5, #0]
2000291a:	1c58      	adds	r0, r3, #1
2000291c:	6068      	str	r0, [r5, #4]
2000291e:	5ccb      	ldrb	r3, [r1, r3]
20002920:	eb03 2302 	add.w	r3, r3, r2, lsl #8
20002924:	6063      	str	r3, [r4, #4]
20002926:	68a3      	ldr	r3, [r4, #8]
20002928:	3b01      	subs	r3, #1
2000292a:	60a3      	str	r3, [r4, #8]
2000292c:	2b00      	cmp	r3, #0
2000292e:	d1ed      	bne.n	2000290c <xz_dec_lzma2_run+0x208>
20002930:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20002932:	3b05      	subs	r3, #5
20002934:	64a3      	str	r3, [r4, #72]	; 0x48
20002936:	2307      	movs	r3, #7
20002938:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
2000293c:	e05e      	b.n	200029fc <xz_dec_lzma2_run+0x2f8>
2000293e:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20002940:	2b04      	cmp	r3, #4
20002942:	f240 814b 	bls.w	20002bdc <xz_dec_lzma2_run+0x4d8>
20002946:	68a3      	ldr	r3, [r4, #8]
20002948:	2b00      	cmp	r3, #0
2000294a:	d1df      	bne.n	2000290c <xz_dec_lzma2_run+0x208>
2000294c:	e7f0      	b.n	20002930 <xz_dec_lzma2_run+0x22c>
2000294e:	f1c0 023f 	rsb	r2, r0, #63	; 0x3f
20002952:	2100      	movs	r1, #0
20002954:	4440      	add	r0, r8
20002956:	f000 ff3f 	bl	200037d8 <memset>
2000295a:	f8db 3ee0 	ldr.w	r3, [fp, #3808]	; 0xee0
2000295e:	4433      	add	r3, r6
20002960:	6163      	str	r3, [r4, #20]
20002962:	e07d      	b.n	20002a60 <xz_dec_lzma2_run+0x35c>
20002964:	f8cb 0ee0 	str.w	r0, [fp, #3808]	; 0xee0
20002968:	686b      	ldr	r3, [r5, #4]
2000296a:	4433      	add	r3, r6
2000296c:	606b      	str	r3, [r5, #4]
2000296e:	e010      	b.n	20002992 <xz_dec_lzma2_run+0x28e>
20002970:	1a52      	subs	r2, r2, r1
20002972:	f8cb 2ee0 	str.w	r2, [fp, #3808]	; 0xee0
20002976:	4441      	add	r1, r8
20002978:	4640      	mov	r0, r8
2000297a:	f000 ff13 	bl	200037a4 <memmove>
2000297e:	e008      	b.n	20002992 <xz_dec_lzma2_run+0x28e>
20002980:	1a5b      	subs	r3, r3, r1
20002982:	4413      	add	r3, r2
20002984:	64a3      	str	r3, [r4, #72]	; 0x48
20002986:	6069      	str	r1, [r5, #4]
20002988:	68ab      	ldr	r3, [r5, #8]
2000298a:	1a5b      	subs	r3, r3, r1
2000298c:	2b14      	cmp	r3, #20
2000298e:	f240 80a2 	bls.w	20002ad6 <xz_dec_lzma2_run+0x3d2>
20002992:	6a26      	ldr	r6, [r4, #32]
20002994:	f8d4 901c 	ldr.w	r9, [r4, #28]
20002998:	eba6 0a09 	sub.w	sl, r6, r9
2000299c:	f894 303c 	ldrb.w	r3, [r4, #60]	; 0x3c
200029a0:	2b00      	cmp	r3, #0
200029a2:	f040 80a8 	bne.w	20002af6 <xz_dec_lzma2_run+0x3f2>
200029a6:	6a23      	ldr	r3, [r4, #32]
200029a8:	61e3      	str	r3, [r4, #28]
200029aa:	692b      	ldr	r3, [r5, #16]
200029ac:	4453      	add	r3, sl
200029ae:	612b      	str	r3, [r5, #16]
200029b0:	6c63      	ldr	r3, [r4, #68]	; 0x44
200029b2:	444b      	add	r3, r9
200029b4:	1b9b      	subs	r3, r3, r6
200029b6:	6463      	str	r3, [r4, #68]	; 0x44
200029b8:	2b00      	cmp	r3, #0
200029ba:	f040 80aa 	bne.w	20002b12 <xz_dec_lzma2_run+0x40e>
200029be:	6ca3      	ldr	r3, [r4, #72]	; 0x48
200029c0:	2b00      	cmp	r3, #0
200029c2:	f040 8110 	bne.w	20002be6 <xz_dec_lzma2_run+0x4e2>
200029c6:	6e63      	ldr	r3, [r4, #100]	; 0x64
200029c8:	2b00      	cmp	r3, #0
200029ca:	f040 810e 	bne.w	20002bea <xz_dec_lzma2_run+0x4e6>
200029ce:	6863      	ldr	r3, [r4, #4]
200029d0:	2b00      	cmp	r3, #0
200029d2:	f040 810c 	bne.w	20002bee <xz_dec_lzma2_run+0x4ea>
200029d6:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
200029da:	6023      	str	r3, [r4, #0]
200029dc:	2300      	movs	r3, #0
200029de:	6063      	str	r3, [r4, #4]
200029e0:	2205      	movs	r2, #5
200029e2:	60a2      	str	r2, [r4, #8]
200029e4:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
200029e8:	686b      	ldr	r3, [r5, #4]
200029ea:	68a9      	ldr	r1, [r5, #8]
200029ec:	428b      	cmp	r3, r1
200029ee:	f4ff ae94 	bcc.w	2000271a <xz_dec_lzma2_run+0x16>
200029f2:	f894 3040 	ldrb.w	r3, [r4, #64]	; 0x40
200029f6:	2b07      	cmp	r3, #7
200029f8:	f040 80e6 	bne.w	20002bc8 <xz_dec_lzma2_run+0x4c4>
200029fc:	696b      	ldr	r3, [r5, #20]
200029fe:	692a      	ldr	r2, [r5, #16]
20002a00:	1a9b      	subs	r3, r3, r2
20002a02:	6c62      	ldr	r2, [r4, #68]	; 0x44
20002a04:	4293      	cmp	r3, r2
20002a06:	bf28      	it	cs
20002a08:	4613      	movcs	r3, r2
20002a0a:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
20002a0c:	6a21      	ldr	r1, [r4, #32]
20002a0e:	1a50      	subs	r0, r2, r1
20002a10:	4283      	cmp	r3, r0
20002a12:	bf38      	it	cc
20002a14:	185a      	addcc	r2, r3, r1
20002a16:	62a2      	str	r2, [r4, #40]	; 0x28
20002a18:	f8db 0ee0 	ldr.w	r0, [fp, #3808]	; 0xee0
20002a1c:	b910      	cbnz	r0, 20002a24 <xz_dec_lzma2_run+0x320>
20002a1e:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20002a20:	2b00      	cmp	r3, #0
20002a22:	d139      	bne.n	20002a98 <xz_dec_lzma2_run+0x394>
20002a24:	6869      	ldr	r1, [r5, #4]
20002a26:	f1c0 022a 	rsb	r2, r0, #42	; 0x2a
20002a2a:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20002a2c:	1a1b      	subs	r3, r3, r0
20002a2e:	4293      	cmp	r3, r2
20002a30:	bf28      	it	cs
20002a32:	4613      	movcs	r3, r2
20002a34:	68aa      	ldr	r2, [r5, #8]
20002a36:	1a52      	subs	r2, r2, r1
20002a38:	429a      	cmp	r2, r3
20002a3a:	bf28      	it	cs
20002a3c:	461a      	movcs	r2, r3
20002a3e:	4616      	mov	r6, r2
20002a40:	682b      	ldr	r3, [r5, #0]
20002a42:	4419      	add	r1, r3
20002a44:	4440      	add	r0, r8
20002a46:	f000 fe9f 	bl	20003788 <memcpy>
20002a4a:	f8db 0ee0 	ldr.w	r0, [fp, #3808]	; 0xee0
20002a4e:	4430      	add	r0, r6
20002a50:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20002a52:	4298      	cmp	r0, r3
20002a54:	f43f af7b 	beq.w	2000294e <xz_dec_lzma2_run+0x24a>
20002a58:	2814      	cmp	r0, #20
20002a5a:	d983      	bls.n	20002964 <xz_dec_lzma2_run+0x260>
20002a5c:	3815      	subs	r0, #21
20002a5e:	6160      	str	r0, [r4, #20]
20002a60:	f8c4 800c 	str.w	r8, [r4, #12]
20002a64:	2300      	movs	r3, #0
20002a66:	6123      	str	r3, [r4, #16]
20002a68:	4620      	mov	r0, r4
20002a6a:	f7ff fb1b 	bl	200020a4 <lzma_main>
20002a6e:	2800      	cmp	r0, #0
20002a70:	d02f      	beq.n	20002ad2 <xz_dec_lzma2_run+0x3ce>
20002a72:	6921      	ldr	r1, [r4, #16]
20002a74:	f8db 2ee0 	ldr.w	r2, [fp, #3808]	; 0xee0
20002a78:	18b3      	adds	r3, r6, r2
20002a7a:	4299      	cmp	r1, r3
20002a7c:	d829      	bhi.n	20002ad2 <xz_dec_lzma2_run+0x3ce>
20002a7e:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20002a80:	1a5b      	subs	r3, r3, r1
20002a82:	64a3      	str	r3, [r4, #72]	; 0x48
20002a84:	4291      	cmp	r1, r2
20002a86:	f4ff af73 	bcc.w	20002970 <xz_dec_lzma2_run+0x26c>
20002a8a:	686b      	ldr	r3, [r5, #4]
20002a8c:	1a9b      	subs	r3, r3, r2
20002a8e:	440b      	add	r3, r1
20002a90:	606b      	str	r3, [r5, #4]
20002a92:	2300      	movs	r3, #0
20002a94:	f8cb 3ee0 	str.w	r3, [fp, #3808]	; 0xee0
20002a98:	6869      	ldr	r1, [r5, #4]
20002a9a:	68ab      	ldr	r3, [r5, #8]
20002a9c:	1a5b      	subs	r3, r3, r1
20002a9e:	2b14      	cmp	r3, #20
20002aa0:	d919      	bls.n	20002ad6 <xz_dec_lzma2_run+0x3d2>
20002aa2:	682a      	ldr	r2, [r5, #0]
20002aa4:	60e2      	str	r2, [r4, #12]
20002aa6:	686a      	ldr	r2, [r5, #4]
20002aa8:	6122      	str	r2, [r4, #16]
20002aaa:	6ca1      	ldr	r1, [r4, #72]	; 0x48
20002aac:	f101 0015 	add.w	r0, r1, #21
20002ab0:	4283      	cmp	r3, r0
20002ab2:	bf2e      	itee	cs
20002ab4:	1852      	addcs	r2, r2, r1
20002ab6:	68aa      	ldrcc	r2, [r5, #8]
20002ab8:	3a15      	subcc	r2, #21
20002aba:	6162      	str	r2, [r4, #20]
20002abc:	4620      	mov	r0, r4
20002abe:	f7ff faf1 	bl	200020a4 <lzma_main>
20002ac2:	b130      	cbz	r0, 20002ad2 <xz_dec_lzma2_run+0x3ce>
20002ac4:	6921      	ldr	r1, [r4, #16]
20002ac6:	686b      	ldr	r3, [r5, #4]
20002ac8:	6ca2      	ldr	r2, [r4, #72]	; 0x48
20002aca:	1ac8      	subs	r0, r1, r3
20002acc:	4290      	cmp	r0, r2
20002ace:	f67f af57 	bls.w	20002980 <xz_dec_lzma2_run+0x27c>
20002ad2:	2007      	movs	r0, #7
20002ad4:	e085      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002ad6:	6ca6      	ldr	r6, [r4, #72]	; 0x48
20002ad8:	429e      	cmp	r6, r3
20002ada:	bf28      	it	cs
20002adc:	461e      	movcs	r6, r3
20002ade:	682b      	ldr	r3, [r5, #0]
20002ae0:	4632      	mov	r2, r6
20002ae2:	4419      	add	r1, r3
20002ae4:	4640      	mov	r0, r8
20002ae6:	f000 fe4f 	bl	20003788 <memcpy>
20002aea:	f8cb 6ee0 	str.w	r6, [fp, #3808]	; 0xee0
20002aee:	686b      	ldr	r3, [r5, #4]
20002af0:	4433      	add	r3, r6
20002af2:	606b      	str	r3, [r5, #4]
20002af4:	e74d      	b.n	20002992 <xz_dec_lzma2_run+0x28e>
20002af6:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
20002af8:	429e      	cmp	r6, r3
20002afa:	bf04      	itt	eq
20002afc:	2300      	moveq	r3, #0
20002afe:	6223      	streq	r3, [r4, #32]
20002b00:	68e8      	ldr	r0, [r5, #12]
20002b02:	692b      	ldr	r3, [r5, #16]
20002b04:	69a1      	ldr	r1, [r4, #24]
20002b06:	4652      	mov	r2, sl
20002b08:	4449      	add	r1, r9
20002b0a:	4418      	add	r0, r3
20002b0c:	f000 fe3c 	bl	20003788 <memcpy>
20002b10:	e749      	b.n	200029a6 <xz_dec_lzma2_run+0x2a2>
20002b12:	692a      	ldr	r2, [r5, #16]
20002b14:	696b      	ldr	r3, [r5, #20]
20002b16:	429a      	cmp	r2, r3
20002b18:	d06b      	beq.n	20002bf2 <xz_dec_lzma2_run+0x4ee>
20002b1a:	686a      	ldr	r2, [r5, #4]
20002b1c:	68ab      	ldr	r3, [r5, #8]
20002b1e:	429a      	cmp	r2, r3
20002b20:	f47f af62 	bne.w	200029e8 <xz_dec_lzma2_run+0x2e4>
20002b24:	f8db 2ee0 	ldr.w	r2, [fp, #3808]	; 0xee0
20002b28:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20002b2a:	429a      	cmp	r2, r3
20002b2c:	f4bf af5c 	bcs.w	200029e8 <xz_dec_lzma2_run+0x2e4>
20002b30:	2000      	movs	r0, #0
20002b32:	e056      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002b34:	6a23      	ldr	r3, [r4, #32]
20002b36:	61e3      	str	r3, [r4, #28]
20002b38:	692b      	ldr	r3, [r5, #16]
20002b3a:	4433      	add	r3, r6
20002b3c:	612b      	str	r3, [r5, #16]
20002b3e:	686b      	ldr	r3, [r5, #4]
20002b40:	4433      	add	r3, r6
20002b42:	606b      	str	r3, [r5, #4]
20002b44:	6ca2      	ldr	r2, [r4, #72]	; 0x48
20002b46:	2a00      	cmp	r2, #0
20002b48:	d03a      	beq.n	20002bc0 <xz_dec_lzma2_run+0x4bc>
20002b4a:	686e      	ldr	r6, [r5, #4]
20002b4c:	68a9      	ldr	r1, [r5, #8]
20002b4e:	42b1      	cmp	r1, r6
20002b50:	d935      	bls.n	20002bbe <xz_dec_lzma2_run+0x4ba>
20002b52:	6928      	ldr	r0, [r5, #16]
20002b54:	696b      	ldr	r3, [r5, #20]
20002b56:	4283      	cmp	r3, r0
20002b58:	d931      	bls.n	20002bbe <xz_dec_lzma2_run+0x4ba>
20002b5a:	1a1b      	subs	r3, r3, r0
20002b5c:	1b8e      	subs	r6, r1, r6
20002b5e:	42b3      	cmp	r3, r6
20002b60:	bf28      	it	cs
20002b62:	4633      	movcs	r3, r6
20002b64:	6a20      	ldr	r0, [r4, #32]
20002b66:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
20002b68:	1a36      	subs	r6, r6, r0
20002b6a:	429e      	cmp	r6, r3
20002b6c:	bf28      	it	cs
20002b6e:	461e      	movcs	r6, r3
20002b70:	4296      	cmp	r6, r2
20002b72:	bf28      	it	cs
20002b74:	4616      	movcs	r6, r2
20002b76:	1b92      	subs	r2, r2, r6
20002b78:	64a2      	str	r2, [r4, #72]	; 0x48
20002b7a:	69a3      	ldr	r3, [r4, #24]
20002b7c:	6869      	ldr	r1, [r5, #4]
20002b7e:	4632      	mov	r2, r6
20002b80:	682f      	ldr	r7, [r5, #0]
20002b82:	4439      	add	r1, r7
20002b84:	4418      	add	r0, r3
20002b86:	f000 fdff 	bl	20003788 <memcpy>
20002b8a:	6a23      	ldr	r3, [r4, #32]
20002b8c:	4433      	add	r3, r6
20002b8e:	6223      	str	r3, [r4, #32]
20002b90:	6a62      	ldr	r2, [r4, #36]	; 0x24
20002b92:	4293      	cmp	r3, r2
20002b94:	bf88      	it	hi
20002b96:	6263      	strhi	r3, [r4, #36]	; 0x24
20002b98:	f894 203c 	ldrb.w	r2, [r4, #60]	; 0x3c
20002b9c:	2a00      	cmp	r2, #0
20002b9e:	d0c9      	beq.n	20002b34 <xz_dec_lzma2_run+0x430>
20002ba0:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
20002ba2:	4293      	cmp	r3, r2
20002ba4:	bf08      	it	eq
20002ba6:	f8c4 9020 	streq.w	r9, [r4, #32]
20002baa:	68e8      	ldr	r0, [r5, #12]
20002bac:	692b      	ldr	r3, [r5, #16]
20002bae:	6869      	ldr	r1, [r5, #4]
20002bb0:	4632      	mov	r2, r6
20002bb2:	682f      	ldr	r7, [r5, #0]
20002bb4:	4439      	add	r1, r7
20002bb6:	4418      	add	r0, r3
20002bb8:	f000 fde6 	bl	20003788 <memcpy>
20002bbc:	e7ba      	b.n	20002b34 <xz_dec_lzma2_run+0x430>
20002bbe:	b9d2      	cbnz	r2, 20002bf6 <xz_dec_lzma2_run+0x4f2>
20002bc0:	2300      	movs	r3, #0
20002bc2:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
20002bc6:	e70f      	b.n	200029e8 <xz_dec_lzma2_run+0x2e4>
20002bc8:	2000      	movs	r0, #0
20002bca:	e00a      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bcc:	2001      	movs	r0, #1
20002bce:	e008      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bd0:	2007      	movs	r0, #7
20002bd2:	e006      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bd4:	2007      	movs	r0, #7
20002bd6:	e004      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bd8:	2007      	movs	r0, #7
20002bda:	e002      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bdc:	2007      	movs	r0, #7
20002bde:	e000      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002be0:	2000      	movs	r0, #0
20002be2:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
20002be6:	2007      	movs	r0, #7
20002be8:	e7fb      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bea:	2007      	movs	r0, #7
20002bec:	e7f9      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bee:	2007      	movs	r0, #7
20002bf0:	e7f7      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bf2:	2000      	movs	r0, #0
20002bf4:	e7f5      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>
20002bf6:	2000      	movs	r0, #0
20002bf8:	e7f3      	b.n	20002be2 <xz_dec_lzma2_run+0x4de>

20002bfa <xz_dec_lzma2_create>:
20002bfa:	b570      	push	{r4, r5, r6, lr}
20002bfc:	4604      	mov	r4, r0
20002bfe:	460e      	mov	r6, r1
20002c00:	f646 7024 	movw	r0, #28452	; 0x6f24
20002c04:	f7ff f940 	bl	20001e88 <ty_adapt_malloc>
20002c08:	4605      	mov	r5, r0
20002c0a:	b130      	cbz	r0, 20002c1a <xz_dec_lzma2_create+0x20>
20002c0c:	f880 403c 	strb.w	r4, [r0, #60]	; 0x3c
20002c10:	6346      	str	r6, [r0, #52]	; 0x34
20002c12:	2c01      	cmp	r4, #1
20002c14:	d003      	beq.n	20002c1e <xz_dec_lzma2_create+0x24>
20002c16:	2c02      	cmp	r4, #2
20002c18:	d00d      	beq.n	20002c36 <xz_dec_lzma2_create+0x3c>
20002c1a:	4628      	mov	r0, r5
20002c1c:	bd70      	pop	{r4, r5, r6, pc}
20002c1e:	4630      	mov	r0, r6
20002c20:	f7ff f932 	bl	20001e88 <ty_adapt_malloc>
20002c24:	4604      	mov	r4, r0
20002c26:	61a8      	str	r0, [r5, #24]
20002c28:	2800      	cmp	r0, #0
20002c2a:	d1f6      	bne.n	20002c1a <xz_dec_lzma2_create+0x20>
20002c2c:	4628      	mov	r0, r5
20002c2e:	f7ff f92f 	bl	20001e90 <ty_adapt_free>
20002c32:	4625      	mov	r5, r4
20002c34:	e7f1      	b.n	20002c1a <xz_dec_lzma2_create+0x20>
20002c36:	2300      	movs	r3, #0
20002c38:	6183      	str	r3, [r0, #24]
20002c3a:	6383      	str	r3, [r0, #56]	; 0x38
20002c3c:	e7ed      	b.n	20002c1a <xz_dec_lzma2_create+0x20>

20002c3e <xz_dec_lzma2_reset>:
20002c3e:	2927      	cmp	r1, #39	; 0x27
20002c40:	d82e      	bhi.n	20002ca0 <xz_dec_lzma2_reset+0x62>
20002c42:	b510      	push	{r4, lr}
20002c44:	4604      	mov	r4, r0
20002c46:	f001 0301 	and.w	r3, r1, #1
20002c4a:	3302      	adds	r3, #2
20002c4c:	0849      	lsrs	r1, r1, #1
20002c4e:	310b      	adds	r1, #11
20002c50:	fa03 f101 	lsl.w	r1, r3, r1
20002c54:	6301      	str	r1, [r0, #48]	; 0x30
20002c56:	f890 303c 	ldrb.w	r3, [r0, #60]	; 0x3c
20002c5a:	b12b      	cbz	r3, 20002c68 <xz_dec_lzma2_reset+0x2a>
20002c5c:	6b42      	ldr	r2, [r0, #52]	; 0x34
20002c5e:	4291      	cmp	r1, r2
20002c60:	d820      	bhi.n	20002ca4 <xz_dec_lzma2_reset+0x66>
20002c62:	62c1      	str	r1, [r0, #44]	; 0x2c
20002c64:	2b02      	cmp	r3, #2
20002c66:	d00b      	beq.n	20002c80 <xz_dec_lzma2_reset+0x42>
20002c68:	2000      	movs	r0, #0
20002c6a:	6660      	str	r0, [r4, #100]	; 0x64
20002c6c:	f884 0040 	strb.w	r0, [r4, #64]	; 0x40
20002c70:	2301      	movs	r3, #1
20002c72:	f884 304c 	strb.w	r3, [r4, #76]	; 0x4c
20002c76:	f504 44c0 	add.w	r4, r4, #24576	; 0x6000
20002c7a:	f8c4 0ee0 	str.w	r0, [r4, #3808]	; 0xee0
20002c7e:	bd10      	pop	{r4, pc}
20002c80:	6b83      	ldr	r3, [r0, #56]	; 0x38
20002c82:	4299      	cmp	r1, r3
20002c84:	d9f0      	bls.n	20002c68 <xz_dec_lzma2_reset+0x2a>
20002c86:	6980      	ldr	r0, [r0, #24]
20002c88:	f7ff f902 	bl	20001e90 <ty_adapt_free>
20002c8c:	6b20      	ldr	r0, [r4, #48]	; 0x30
20002c8e:	f7ff f8fb 	bl	20001e88 <ty_adapt_malloc>
20002c92:	61a0      	str	r0, [r4, #24]
20002c94:	2800      	cmp	r0, #0
20002c96:	d1e7      	bne.n	20002c68 <xz_dec_lzma2_reset+0x2a>
20002c98:	2300      	movs	r3, #0
20002c9a:	63a3      	str	r3, [r4, #56]	; 0x38
20002c9c:	2003      	movs	r0, #3
20002c9e:	e7ee      	b.n	20002c7e <xz_dec_lzma2_reset+0x40>
20002ca0:	2006      	movs	r0, #6
20002ca2:	4770      	bx	lr
20002ca4:	2004      	movs	r0, #4
20002ca6:	e7ea      	b.n	20002c7e <xz_dec_lzma2_reset+0x40>

20002ca8 <xz_dec_lzma2_end>:
20002ca8:	b510      	push	{r4, lr}
20002caa:	4604      	mov	r4, r0
20002cac:	f890 303c 	ldrb.w	r3, [r0, #60]	; 0x3c
20002cb0:	b91b      	cbnz	r3, 20002cba <xz_dec_lzma2_end+0x12>
20002cb2:	4620      	mov	r0, r4
20002cb4:	f7ff f8ec 	bl	20001e90 <ty_adapt_free>
20002cb8:	bd10      	pop	{r4, pc}
20002cba:	6980      	ldr	r0, [r0, #24]
20002cbc:	f7ff f8e8 	bl	20001e90 <ty_adapt_free>
20002cc0:	e7f7      	b.n	20002cb2 <xz_dec_lzma2_end+0xa>

20002cc2 <dec_vli>:
20002cc2:	b5f0      	push	{r4, r5, r6, r7, lr}
20002cc4:	6844      	ldr	r4, [r0, #4]
20002cc6:	b91c      	cbnz	r4, 20002cd0 <dec_vli+0xe>
20002cc8:	2400      	movs	r4, #0
20002cca:	2500      	movs	r5, #0
20002ccc:	e9c0 4502 	strd	r4, r5, [r0, #8]
20002cd0:	6814      	ldr	r4, [r2, #0]
20002cd2:	429c      	cmp	r4, r3
20002cd4:	d228      	bcs.n	20002d28 <dec_vli+0x66>
20002cd6:	5d0d      	ldrb	r5, [r1, r4]
20002cd8:	3401      	adds	r4, #1
20002cda:	6014      	str	r4, [r2, #0]
20002cdc:	6844      	ldr	r4, [r0, #4]
20002cde:	f005 0e7f 	and.w	lr, r5, #127	; 0x7f
20002ce2:	f1a4 0c20 	sub.w	ip, r4, #32
20002ce6:	f1c4 0620 	rsb	r6, r4, #32
20002cea:	fa0e fc0c 	lsl.w	ip, lr, ip
20002cee:	fa2e f606 	lsr.w	r6, lr, r6
20002cf2:	ea4c 0c06 	orr.w	ip, ip, r6
20002cf6:	fa0e fe04 	lsl.w	lr, lr, r4
20002cfa:	6887      	ldr	r7, [r0, #8]
20002cfc:	68c6      	ldr	r6, [r0, #12]
20002cfe:	ea47 070e 	orr.w	r7, r7, lr
20002d02:	ea46 060c 	orr.w	r6, r6, ip
20002d06:	6087      	str	r7, [r0, #8]
20002d08:	60c6      	str	r6, [r0, #12]
20002d0a:	f015 0f80 	tst.w	r5, #128	; 0x80
20002d0e:	d005      	beq.n	20002d1c <dec_vli+0x5a>
20002d10:	3407      	adds	r4, #7
20002d12:	6044      	str	r4, [r0, #4]
20002d14:	2c3f      	cmp	r4, #63	; 0x3f
20002d16:	d1db      	bne.n	20002cd0 <dec_vli+0xe>
20002d18:	2007      	movs	r0, #7
20002d1a:	e006      	b.n	20002d2a <dec_vli+0x68>
20002d1c:	b905      	cbnz	r5, 20002d20 <dec_vli+0x5e>
20002d1e:	b92c      	cbnz	r4, 20002d2c <dec_vli+0x6a>
20002d20:	2300      	movs	r3, #0
20002d22:	6043      	str	r3, [r0, #4]
20002d24:	2001      	movs	r0, #1
20002d26:	e000      	b.n	20002d2a <dec_vli+0x68>
20002d28:	2000      	movs	r0, #0
20002d2a:	bdf0      	pop	{r4, r5, r6, r7, pc}
20002d2c:	2007      	movs	r0, #7
20002d2e:	e7fc      	b.n	20002d2a <dec_vli+0x68>

20002d30 <index_update>:
20002d30:	b538      	push	{r3, r4, r5, lr}
20002d32:	4604      	mov	r4, r0
20002d34:	460a      	mov	r2, r1
20002d36:	6900      	ldr	r0, [r0, #16]
20002d38:	684b      	ldr	r3, [r1, #4]
20002d3a:	1a19      	subs	r1, r3, r0
20002d3c:	6f23      	ldr	r3, [r4, #112]	; 0x70
20002d3e:	6f65      	ldr	r5, [r4, #116]	; 0x74
20002d40:	185b      	adds	r3, r3, r1
20002d42:	f145 0500 	adc.w	r5, r5, #0
20002d46:	6723      	str	r3, [r4, #112]	; 0x70
20002d48:	6765      	str	r5, [r4, #116]	; 0x74
20002d4a:	6813      	ldr	r3, [r2, #0]
20002d4c:	69a2      	ldr	r2, [r4, #24]
20002d4e:	4418      	add	r0, r3
20002d50:	f7ff f8c2 	bl	20001ed8 <xz_crc32>
20002d54:	61a0      	str	r0, [r4, #24]
20002d56:	bd38      	pop	{r3, r4, r5, pc}

20002d58 <fill_temp>:
20002d58:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20002d5a:	4605      	mov	r5, r0
20002d5c:	460e      	mov	r6, r1
20002d5e:	f8d0 0098 	ldr.w	r0, [r0, #152]	; 0x98
20002d62:	6849      	ldr	r1, [r1, #4]
20002d64:	f8d5 409c 	ldr.w	r4, [r5, #156]	; 0x9c
20002d68:	1a24      	subs	r4, r4, r0
20002d6a:	68b3      	ldr	r3, [r6, #8]
20002d6c:	1a5b      	subs	r3, r3, r1
20002d6e:	429c      	cmp	r4, r3
20002d70:	bf28      	it	cs
20002d72:	461c      	movcs	r4, r3
20002d74:	f105 03a0 	add.w	r3, r5, #160	; 0xa0
20002d78:	4622      	mov	r2, r4
20002d7a:	6837      	ldr	r7, [r6, #0]
20002d7c:	4439      	add	r1, r7
20002d7e:	4418      	add	r0, r3
20002d80:	f000 fd02 	bl	20003788 <memcpy>
20002d84:	6873      	ldr	r3, [r6, #4]
20002d86:	4423      	add	r3, r4
20002d88:	6073      	str	r3, [r6, #4]
20002d8a:	f8d5 3098 	ldr.w	r3, [r5, #152]	; 0x98
20002d8e:	441c      	add	r4, r3
20002d90:	f8c5 4098 	str.w	r4, [r5, #152]	; 0x98
20002d94:	f8d5 309c 	ldr.w	r3, [r5, #156]	; 0x9c
20002d98:	429c      	cmp	r4, r3
20002d9a:	bf03      	ittte	eq
20002d9c:	2300      	moveq	r3, #0
20002d9e:	f8c5 3098 	streq.w	r3, [r5, #152]	; 0x98
20002da2:	2001      	moveq	r0, #1
20002da4:	2000      	movne	r0, #0
20002da6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

20002da8 <xz_dec_reset>:
20002da8:	b570      	push	{r4, r5, r6, lr}
20002daa:	4604      	mov	r4, r0
20002dac:	2500      	movs	r5, #0
20002dae:	7005      	strb	r5, [r0, #0]
20002db0:	7785      	strb	r5, [r0, #30]
20002db2:	6045      	str	r5, [r0, #4]
20002db4:	6185      	str	r5, [r0, #24]
20002db6:	2630      	movs	r6, #48	; 0x30
20002db8:	4632      	mov	r2, r6
20002dba:	4629      	mov	r1, r5
20002dbc:	3038      	adds	r0, #56	; 0x38
20002dbe:	f000 fd0b 	bl	200037d8 <memset>
20002dc2:	4632      	mov	r2, r6
20002dc4:	4629      	mov	r1, r5
20002dc6:	f104 0068 	add.w	r0, r4, #104	; 0x68
20002dca:	f000 fd05 	bl	200037d8 <memset>
20002dce:	f8c4 5098 	str.w	r5, [r4, #152]	; 0x98
20002dd2:	230c      	movs	r3, #12
20002dd4:	f8c4 309c 	str.w	r3, [r4, #156]	; 0x9c
20002dd8:	bd70      	pop	{r4, r5, r6, pc}
	...

20002ddc <xz_dec_run>:
20002ddc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20002de0:	b083      	sub	sp, #12
20002de2:	4604      	mov	r4, r0
20002de4:	460d      	mov	r5, r1
20002de6:	7f43      	ldrb	r3, [r0, #29]
20002de8:	b1c3      	cbz	r3, 20002e1c <xz_dec_run+0x40>
20002dea:	686f      	ldr	r7, [r5, #4]
20002dec:	f8d5 8010 	ldr.w	r8, [r5, #16]
20002df0:	6127      	str	r7, [r4, #16]
20002df2:	f04f 0900 	mov.w	r9, #0
20002df6:	f04f 0a00 	mov.w	sl, #0
20002dfa:	f04f 0b00 	mov.w	fp, #0
20002dfe:	7823      	ldrb	r3, [r4, #0]
20002e00:	2b09      	cmp	r3, #9
20002e02:	d8fd      	bhi.n	20002e00 <xz_dec_run+0x24>
20002e04:	e8df f013 	tbh	[pc, r3, lsl #1]
20002e08:	00480014 	.word	0x00480014
20002e0c:	0101005f 	.word	0x0101005f
20002e10:	01ac018f 	.word	0x01ac018f
20002e14:	0310000d 	.word	0x0310000d
20002e18:	025d0240 	.word	0x025d0240
20002e1c:	f7ff ffc4 	bl	20002da8 <xz_dec_reset>
20002e20:	e7e3      	b.n	20002dea <xz_dec_run+0xe>
20002e22:	f105 0904 	add.w	r9, r5, #4
20002e26:	f04f 0b02 	mov.w	fp, #2
20002e2a:	f104 0a80 	add.w	sl, r4, #128	; 0x80
20002e2e:	e1d7      	b.n	200031e0 <xz_dec_run+0x404>
20002e30:	4629      	mov	r1, r5
20002e32:	4620      	mov	r0, r4
20002e34:	f7ff ff90 	bl	20002d58 <fill_temp>
20002e38:	2800      	cmp	r0, #0
20002e3a:	f000 8247 	beq.w	200032cc <xz_dec_run+0x4f0>
20002e3e:	4620      	mov	r0, r4
20002e40:	2301      	movs	r3, #1
20002e42:	f800 3ba0 	strb.w	r3, [r0], #160
20002e46:	2206      	movs	r2, #6
20002e48:	4992      	ldr	r1, [pc, #584]	; (20003094 <xz_dec_run+0x2b8>)
20002e4a:	f000 fc8d 	bl	20003768 <memcmp>
20002e4e:	2800      	cmp	r0, #0
20002e50:	f040 82d8 	bne.w	20003404 <xz_dec_run+0x628>
20002e54:	464a      	mov	r2, r9
20002e56:	2102      	movs	r1, #2
20002e58:	f104 00a6 	add.w	r0, r4, #166	; 0xa6
20002e5c:	f7ff f83c 	bl	20001ed8 <xz_crc32>
20002e60:	f894 20a9 	ldrb.w	r2, [r4, #169]	; 0xa9
20002e64:	f894 30aa 	ldrb.w	r3, [r4, #170]	; 0xaa
20002e68:	041b      	lsls	r3, r3, #16
20002e6a:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
20002e6e:	f894 20a8 	ldrb.w	r2, [r4, #168]	; 0xa8
20002e72:	4313      	orrs	r3, r2
20002e74:	f894 20ab 	ldrb.w	r2, [r4, #171]	; 0xab
20002e78:	ea43 6302 	orr.w	r3, r3, r2, lsl #24
20002e7c:	4298      	cmp	r0, r3
20002e7e:	f040 82c7 	bne.w	20003410 <xz_dec_run+0x634>
20002e82:	f894 30a6 	ldrb.w	r3, [r4, #166]	; 0xa6
20002e86:	2b00      	cmp	r3, #0
20002e88:	f040 82c4 	bne.w	20003414 <xz_dec_run+0x638>
20002e8c:	f894 30a7 	ldrb.w	r3, [r4, #167]	; 0xa7
20002e90:	7723      	strb	r3, [r4, #28]
20002e92:	2b01      	cmp	r3, #1
20002e94:	f200 82c0 	bhi.w	20003418 <xz_dec_run+0x63c>
20002e98:	686b      	ldr	r3, [r5, #4]
20002e9a:	68aa      	ldr	r2, [r5, #8]
20002e9c:	4293      	cmp	r3, r2
20002e9e:	f000 82de 	beq.w	2000345e <xz_dec_run+0x682>
20002ea2:	682a      	ldr	r2, [r5, #0]
20002ea4:	5cd2      	ldrb	r2, [r2, r3]
20002ea6:	b92a      	cbnz	r2, 20002eb4 <xz_dec_run+0xd8>
20002ea8:	1c5a      	adds	r2, r3, #1
20002eaa:	606a      	str	r2, [r5, #4]
20002eac:	6123      	str	r3, [r4, #16]
20002eae:	2306      	movs	r3, #6
20002eb0:	7023      	strb	r3, [r4, #0]
20002eb2:	e7a4      	b.n	20002dfe <xz_dec_run+0x22>
20002eb4:	3201      	adds	r2, #1
20002eb6:	0092      	lsls	r2, r2, #2
20002eb8:	6322      	str	r2, [r4, #48]	; 0x30
20002eba:	f8c4 209c 	str.w	r2, [r4, #156]	; 0x9c
20002ebe:	f8c4 9098 	str.w	r9, [r4, #152]	; 0x98
20002ec2:	2302      	movs	r3, #2
20002ec4:	7023      	strb	r3, [r4, #0]
20002ec6:	4629      	mov	r1, r5
20002ec8:	4620      	mov	r0, r4
20002eca:	f7ff ff45 	bl	20002d58 <fill_temp>
20002ece:	2800      	cmp	r0, #0
20002ed0:	f000 81fc 	beq.w	200032cc <xz_dec_run+0x4f0>
20002ed4:	f8d4 109c 	ldr.w	r1, [r4, #156]	; 0x9c
20002ed8:	3904      	subs	r1, #4
20002eda:	f8c4 109c 	str.w	r1, [r4, #156]	; 0x9c
20002ede:	f104 06a0 	add.w	r6, r4, #160	; 0xa0
20002ee2:	464a      	mov	r2, r9
20002ee4:	4630      	mov	r0, r6
20002ee6:	f7fe fff7 	bl	20001ed8 <xz_crc32>
20002eea:	f8d4 309c 	ldr.w	r3, [r4, #156]	; 0x9c
20002eee:	18f1      	adds	r1, r6, r3
20002ef0:	f891 c001 	ldrb.w	ip, [r1, #1]
20002ef4:	788a      	ldrb	r2, [r1, #2]
20002ef6:	0412      	lsls	r2, r2, #16
20002ef8:	ea42 220c 	orr.w	r2, r2, ip, lsl #8
20002efc:	f816 c003 	ldrb.w	ip, [r6, r3]
20002f00:	ea42 020c 	orr.w	r2, r2, ip
20002f04:	78c9      	ldrb	r1, [r1, #3]
20002f06:	ea42 6201 	orr.w	r2, r2, r1, lsl #24
20002f0a:	4290      	cmp	r0, r2
20002f0c:	f040 8265 	bne.w	200033da <xz_dec_run+0x5fe>
20002f10:	2202      	movs	r2, #2
20002f12:	f8c4 2098 	str.w	r2, [r4, #152]	; 0x98
20002f16:	f894 20a1 	ldrb.w	r2, [r4, #161]	; 0xa1
20002f1a:	f012 0f3f 	tst.w	r2, #63	; 0x3f
20002f1e:	f040 8261 	bne.w	200033e4 <xz_dec_run+0x608>
20002f22:	f012 0f40 	tst.w	r2, #64	; 0x40
20002f26:	d14a      	bne.n	20002fbe <xz_dec_run+0x1e2>
20002f28:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
20002f2c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
20002f30:	e9c4 2308 	strd	r2, r3, [r4, #32]
20002f34:	f994 30a1 	ldrsb.w	r3, [r4, #161]	; 0xa1
20002f38:	2b00      	cmp	r3, #0
20002f3a:	db4e      	blt.n	20002fda <xz_dec_run+0x1fe>
20002f3c:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
20002f40:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
20002f44:	e9c4 230a 	strd	r2, r3, [r4, #40]	; 0x28
20002f48:	f8d4 109c 	ldr.w	r1, [r4, #156]	; 0x9c
20002f4c:	f8d4 3098 	ldr.w	r3, [r4, #152]	; 0x98
20002f50:	1aca      	subs	r2, r1, r3
20002f52:	2a01      	cmp	r2, #1
20002f54:	f240 824c 	bls.w	200033f0 <xz_dec_run+0x614>
20002f58:	1c5a      	adds	r2, r3, #1
20002f5a:	f8c4 2098 	str.w	r2, [r4, #152]	; 0x98
20002f5e:	18e0      	adds	r0, r4, r3
20002f60:	f890 00a0 	ldrb.w	r0, [r0, #160]	; 0xa0
20002f64:	2821      	cmp	r0, #33	; 0x21
20002f66:	f040 8245 	bne.w	200033f4 <xz_dec_run+0x618>
20002f6a:	1c98      	adds	r0, r3, #2
20002f6c:	f8c4 0098 	str.w	r0, [r4, #152]	; 0x98
20002f70:	4422      	add	r2, r4
20002f72:	f892 20a0 	ldrb.w	r2, [r2, #160]	; 0xa0
20002f76:	2a01      	cmp	r2, #1
20002f78:	f040 823e 	bne.w	200033f8 <xz_dec_run+0x61c>
20002f7c:	4281      	cmp	r1, r0
20002f7e:	f000 823d 	beq.w	200033fc <xz_dec_run+0x620>
20002f82:	3303      	adds	r3, #3
20002f84:	f8c4 3098 	str.w	r3, [r4, #152]	; 0x98
20002f88:	4420      	add	r0, r4
20002f8a:	f890 10a0 	ldrb.w	r1, [r0, #160]	; 0xa0
20002f8e:	f8d4 04a0 	ldr.w	r0, [r4, #1184]	; 0x4a0
20002f92:	f7ff fe54 	bl	20002c3e <xz_dec_lzma2_reset>
20002f96:	9001      	str	r0, [sp, #4]
20002f98:	2800      	cmp	r0, #0
20002f9a:	f040 8231 	bne.w	20003400 <xz_dec_run+0x624>
20002f9e:	f8d4 109c 	ldr.w	r1, [r4, #156]	; 0x9c
20002fa2:	f8d4 3098 	ldr.w	r3, [r4, #152]	; 0x98
20002fa6:	428b      	cmp	r3, r1
20002fa8:	d227      	bcs.n	20002ffa <xz_dec_run+0x21e>
20002faa:	1c5a      	adds	r2, r3, #1
20002fac:	f8c4 2098 	str.w	r2, [r4, #152]	; 0x98
20002fb0:	4423      	add	r3, r4
20002fb2:	f893 30a0 	ldrb.w	r3, [r3, #160]	; 0xa0
20002fb6:	2b00      	cmp	r3, #0
20002fb8:	d0f3      	beq.n	20002fa2 <xz_dec_run+0x1c6>
20002fba:	2606      	movs	r6, #6
20002fbc:	e20e      	b.n	200033dc <xz_dec_run+0x600>
20002fbe:	f104 0298 	add.w	r2, r4, #152	; 0x98
20002fc2:	4631      	mov	r1, r6
20002fc4:	4620      	mov	r0, r4
20002fc6:	f7ff fe7c 	bl	20002cc2 <dec_vli>
20002fca:	2801      	cmp	r0, #1
20002fcc:	f040 820c 	bne.w	200033e8 <xz_dec_run+0x60c>
20002fd0:	e9d4 2302 	ldrd	r2, r3, [r4, #8]
20002fd4:	e9c4 2308 	strd	r2, r3, [r4, #32]
20002fd8:	e7ac      	b.n	20002f34 <xz_dec_run+0x158>
20002fda:	f8d4 309c 	ldr.w	r3, [r4, #156]	; 0x9c
20002fde:	f104 0298 	add.w	r2, r4, #152	; 0x98
20002fe2:	4631      	mov	r1, r6
20002fe4:	4620      	mov	r0, r4
20002fe6:	f7ff fe6c 	bl	20002cc2 <dec_vli>
20002fea:	2801      	cmp	r0, #1
20002fec:	f040 81fe 	bne.w	200033ec <xz_dec_run+0x610>
20002ff0:	e9d4 2302 	ldrd	r2, r3, [r4, #8]
20002ff4:	e9c4 230a 	strd	r2, r3, [r4, #40]	; 0x28
20002ff8:	e7a6      	b.n	20002f48 <xz_dec_run+0x16c>
20002ffa:	f8c4 9098 	str.w	r9, [r4, #152]	; 0x98
20002ffe:	e9c4 ab0e 	strd	sl, fp, [r4, #56]	; 0x38
20003002:	e9c4 ab10 	strd	sl, fp, [r4, #64]	; 0x40
20003006:	2303      	movs	r3, #3
20003008:	7023      	strb	r3, [r4, #0]
2000300a:	686b      	ldr	r3, [r5, #4]
2000300c:	6123      	str	r3, [r4, #16]
2000300e:	692b      	ldr	r3, [r5, #16]
20003010:	6163      	str	r3, [r4, #20]
20003012:	4629      	mov	r1, r5
20003014:	f8d4 04a0 	ldr.w	r0, [r4, #1184]	; 0x4a0
20003018:	f7ff fb74 	bl	20002704 <xz_dec_lzma2_run>
2000301c:	9001      	str	r0, [sp, #4]
2000301e:	686b      	ldr	r3, [r5, #4]
20003020:	6922      	ldr	r2, [r4, #16]
20003022:	1a9b      	subs	r3, r3, r2
20003024:	6ba2      	ldr	r2, [r4, #56]	; 0x38
20003026:	6be6      	ldr	r6, [r4, #60]	; 0x3c
20003028:	189b      	adds	r3, r3, r2
2000302a:	f146 0600 	adc.w	r6, r6, #0
2000302e:	63a3      	str	r3, [r4, #56]	; 0x38
20003030:	63e6      	str	r6, [r4, #60]	; 0x3c
20003032:	f8d4 e014 	ldr.w	lr, [r4, #20]
20003036:	692a      	ldr	r2, [r5, #16]
20003038:	eba2 000e 	sub.w	r0, r2, lr
2000303c:	6c22      	ldr	r2, [r4, #64]	; 0x40
2000303e:	6c61      	ldr	r1, [r4, #68]	; 0x44
20003040:	1882      	adds	r2, r0, r2
20003042:	f141 0100 	adc.w	r1, r1, #0
20003046:	6422      	str	r2, [r4, #64]	; 0x40
20003048:	6461      	str	r1, [r4, #68]	; 0x44
2000304a:	6a20      	ldr	r0, [r4, #32]
2000304c:	4298      	cmp	r0, r3
2000304e:	6a63      	ldr	r3, [r4, #36]	; 0x24
20003050:	41b3      	sbcs	r3, r6
20003052:	f0c0 81ba 	bcc.w	200033ca <xz_dec_run+0x5ee>
20003056:	6aa0      	ldr	r0, [r4, #40]	; 0x28
20003058:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
2000305a:	4290      	cmp	r0, r2
2000305c:	418b      	sbcs	r3, r1
2000305e:	f0c0 81b6 	bcc.w	200033ce <xz_dec_run+0x5f2>
20003062:	7f23      	ldrb	r3, [r4, #28]
20003064:	2b01      	cmp	r3, #1
20003066:	d00b      	beq.n	20003080 <xz_dec_run+0x2a4>
20003068:	9b01      	ldr	r3, [sp, #4]
2000306a:	2b01      	cmp	r3, #1
2000306c:	d014      	beq.n	20003098 <xz_dec_run+0x2bc>
2000306e:	9e01      	ldr	r6, [sp, #4]
20003070:	7f63      	ldrb	r3, [r4, #29]
20003072:	2b00      	cmp	r3, #0
20003074:	f000 817c 	beq.w	20003370 <xz_dec_run+0x594>
20003078:	2e00      	cmp	r6, #0
2000307a:	f040 8192 	bne.w	200033a2 <xz_dec_run+0x5c6>
2000307e:	e18c      	b.n	2000339a <xz_dec_run+0x5be>
20003080:	6929      	ldr	r1, [r5, #16]
20003082:	68e8      	ldr	r0, [r5, #12]
20003084:	69a2      	ldr	r2, [r4, #24]
20003086:	eba1 010e 	sub.w	r1, r1, lr
2000308a:	4470      	add	r0, lr
2000308c:	f7fe ff24 	bl	20001ed8 <xz_crc32>
20003090:	61a0      	str	r0, [r4, #24]
20003092:	e7e9      	b.n	20003068 <xz_dec_run+0x28c>
20003094:	20004478 	.word	0x20004478
20003098:	6a22      	ldr	r2, [r4, #32]
2000309a:	6a63      	ldr	r3, [r4, #36]	; 0x24
2000309c:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
200030a0:	bf08      	it	eq
200030a2:	f1b2 3fff 	cmpeq.w	r2, #4294967295	; 0xffffffff
200030a6:	d006      	beq.n	200030b6 <xz_dec_run+0x2da>
200030a8:	6ba0      	ldr	r0, [r4, #56]	; 0x38
200030aa:	6be1      	ldr	r1, [r4, #60]	; 0x3c
200030ac:	428b      	cmp	r3, r1
200030ae:	bf08      	it	eq
200030b0:	4282      	cmpeq	r2, r0
200030b2:	f040 818e 	bne.w	200033d2 <xz_dec_run+0x5f6>
200030b6:	6aa2      	ldr	r2, [r4, #40]	; 0x28
200030b8:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
200030ba:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
200030be:	bf08      	it	eq
200030c0:	f1b2 3fff 	cmpeq.w	r2, #4294967295	; 0xffffffff
200030c4:	d006      	beq.n	200030d4 <xz_dec_run+0x2f8>
200030c6:	6c20      	ldr	r0, [r4, #64]	; 0x40
200030c8:	6c61      	ldr	r1, [r4, #68]	; 0x44
200030ca:	428b      	cmp	r3, r1
200030cc:	bf08      	it	eq
200030ce:	4282      	cmpeq	r2, r0
200030d0:	f040 8181 	bne.w	200033d6 <xz_dec_run+0x5fa>
200030d4:	6d23      	ldr	r3, [r4, #80]	; 0x50
200030d6:	6d62      	ldr	r2, [r4, #84]	; 0x54
200030d8:	6ba0      	ldr	r0, [r4, #56]	; 0x38
200030da:	6be1      	ldr	r1, [r4, #60]	; 0x3c
200030dc:	181b      	adds	r3, r3, r0
200030de:	eb42 0201 	adc.w	r2, r2, r1
200030e2:	6b21      	ldr	r1, [r4, #48]	; 0x30
200030e4:	185b      	adds	r3, r3, r1
200030e6:	f142 0200 	adc.w	r2, r2, #0
200030ea:	6523      	str	r3, [r4, #80]	; 0x50
200030ec:	6562      	str	r2, [r4, #84]	; 0x54
200030ee:	7f21      	ldrb	r1, [r4, #28]
200030f0:	2901      	cmp	r1, #1
200030f2:	d03b      	beq.n	2000316c <xz_dec_run+0x390>
200030f4:	6da3      	ldr	r3, [r4, #88]	; 0x58
200030f6:	6de2      	ldr	r2, [r4, #92]	; 0x5c
200030f8:	6c20      	ldr	r0, [r4, #64]	; 0x40
200030fa:	6c61      	ldr	r1, [r4, #68]	; 0x44
200030fc:	181b      	adds	r3, r3, r0
200030fe:	eb42 0201 	adc.w	r2, r2, r1
20003102:	65a3      	str	r3, [r4, #88]	; 0x58
20003104:	65e2      	str	r2, [r4, #92]	; 0x5c
20003106:	6e22      	ldr	r2, [r4, #96]	; 0x60
20003108:	2118      	movs	r1, #24
2000310a:	f104 0050 	add.w	r0, r4, #80	; 0x50
2000310e:	f7fe fee3 	bl	20001ed8 <xz_crc32>
20003112:	6620      	str	r0, [r4, #96]	; 0x60
20003114:	6ca3      	ldr	r3, [r4, #72]	; 0x48
20003116:	6ce2      	ldr	r2, [r4, #76]	; 0x4c
20003118:	3301      	adds	r3, #1
2000311a:	f142 0200 	adc.w	r2, r2, #0
2000311e:	64a3      	str	r3, [r4, #72]	; 0x48
20003120:	64e2      	str	r2, [r4, #76]	; 0x4c
20003122:	2304      	movs	r3, #4
20003124:	7023      	strb	r3, [r4, #0]
20003126:	6ba3      	ldr	r3, [r4, #56]	; 0x38
20003128:	f003 0303 	and.w	r3, r3, #3
2000312c:	b1b3      	cbz	r3, 2000315c <xz_dec_run+0x380>
2000312e:	686b      	ldr	r3, [r5, #4]
20003130:	68aa      	ldr	r2, [r5, #8]
20003132:	4293      	cmp	r3, r2
20003134:	f000 812e 	beq.w	20003394 <xz_dec_run+0x5b8>
20003138:	682a      	ldr	r2, [r5, #0]
2000313a:	1c59      	adds	r1, r3, #1
2000313c:	6069      	str	r1, [r5, #4]
2000313e:	5cd3      	ldrb	r3, [r2, r3]
20003140:	2b00      	cmp	r3, #0
20003142:	f040 8134 	bne.w	200033ae <xz_dec_run+0x5d2>
20003146:	6ba3      	ldr	r3, [r4, #56]	; 0x38
20003148:	6be2      	ldr	r2, [r4, #60]	; 0x3c
2000314a:	3301      	adds	r3, #1
2000314c:	f142 0200 	adc.w	r2, r2, #0
20003150:	63a3      	str	r3, [r4, #56]	; 0x38
20003152:	63e2      	str	r2, [r4, #60]	; 0x3c
20003154:	f003 0303 	and.w	r3, r3, #3
20003158:	2b00      	cmp	r3, #0
2000315a:	d1e8      	bne.n	2000312e <xz_dec_run+0x352>
2000315c:	2305      	movs	r3, #5
2000315e:	7023      	strb	r3, [r4, #0]
20003160:	7f23      	ldrb	r3, [r4, #28]
20003162:	2b01      	cmp	r3, #1
20003164:	d008      	beq.n	20003178 <xz_dec_run+0x39c>
20003166:	2301      	movs	r3, #1
20003168:	7023      	strb	r3, [r4, #0]
2000316a:	e648      	b.n	20002dfe <xz_dec_run+0x22>
2000316c:	3304      	adds	r3, #4
2000316e:	f142 0200 	adc.w	r2, r2, #0
20003172:	6523      	str	r3, [r4, #80]	; 0x50
20003174:	6562      	str	r2, [r4, #84]	; 0x54
20003176:	e7bd      	b.n	200030f4 <xz_dec_run+0x318>
20003178:	686a      	ldr	r2, [r5, #4]
2000317a:	68ab      	ldr	r3, [r5, #8]
2000317c:	429a      	cmp	r2, r3
2000317e:	f000 8120 	beq.w	200033c2 <xz_dec_run+0x5e6>
20003182:	69a3      	ldr	r3, [r4, #24]
20003184:	6861      	ldr	r1, [r4, #4]
20003186:	40cb      	lsrs	r3, r1
20003188:	b2db      	uxtb	r3, r3
2000318a:	6829      	ldr	r1, [r5, #0]
2000318c:	1c50      	adds	r0, r2, #1
2000318e:	6068      	str	r0, [r5, #4]
20003190:	5c8a      	ldrb	r2, [r1, r2]
20003192:	4293      	cmp	r3, r2
20003194:	f040 8117 	bne.w	200033c6 <xz_dec_run+0x5ea>
20003198:	6863      	ldr	r3, [r4, #4]
2000319a:	3308      	adds	r3, #8
2000319c:	6063      	str	r3, [r4, #4]
2000319e:	2b1f      	cmp	r3, #31
200031a0:	d9ea      	bls.n	20003178 <xz_dec_run+0x39c>
200031a2:	f8c4 9018 	str.w	r9, [r4, #24]
200031a6:	f8c4 9004 	str.w	r9, [r4, #4]
200031aa:	e7dc      	b.n	20003166 <xz_dec_run+0x38a>
200031ac:	4606      	mov	r6, r0
200031ae:	4629      	mov	r1, r5
200031b0:	4620      	mov	r0, r4
200031b2:	f7ff fdbd 	bl	20002d30 <index_update>
200031b6:	e75b      	b.n	20003070 <xz_dec_run+0x294>
200031b8:	f8d4 3080 	ldr.w	r3, [r4, #128]	; 0x80
200031bc:	f8d4 2084 	ldr.w	r2, [r4, #132]	; 0x84
200031c0:	68a0      	ldr	r0, [r4, #8]
200031c2:	68e1      	ldr	r1, [r4, #12]
200031c4:	181b      	adds	r3, r3, r0
200031c6:	eb42 0201 	adc.w	r2, r2, r1
200031ca:	f8c4 3080 	str.w	r3, [r4, #128]	; 0x80
200031ce:	f8c4 2084 	str.w	r2, [r4, #132]	; 0x84
200031d2:	f884 b068 	strb.w	fp, [r4, #104]	; 0x68
200031d6:	6fa2      	ldr	r2, [r4, #120]	; 0x78
200031d8:	6fe3      	ldr	r3, [r4, #124]	; 0x7c
200031da:	4313      	orrs	r3, r2
200031dc:	f000 8122 	beq.w	20003424 <xz_dec_run+0x648>
200031e0:	68ab      	ldr	r3, [r5, #8]
200031e2:	464a      	mov	r2, r9
200031e4:	6829      	ldr	r1, [r5, #0]
200031e6:	4620      	mov	r0, r4
200031e8:	f7ff fd6b 	bl	20002cc2 <dec_vli>
200031ec:	2801      	cmp	r0, #1
200031ee:	d1dd      	bne.n	200031ac <xz_dec_run+0x3d0>
200031f0:	f894 3068 	ldrb.w	r3, [r4, #104]	; 0x68
200031f4:	2b01      	cmp	r3, #1
200031f6:	d0df      	beq.n	200031b8 <xz_dec_run+0x3dc>
200031f8:	2b02      	cmp	r3, #2
200031fa:	d010      	beq.n	2000321e <xz_dec_run+0x442>
200031fc:	2b00      	cmp	r3, #0
200031fe:	d1ea      	bne.n	200031d6 <xz_dec_run+0x3fa>
20003200:	68a2      	ldr	r2, [r4, #8]
20003202:	68e3      	ldr	r3, [r4, #12]
20003204:	67a2      	str	r2, [r4, #120]	; 0x78
20003206:	67e3      	str	r3, [r4, #124]	; 0x7c
20003208:	6ca0      	ldr	r0, [r4, #72]	; 0x48
2000320a:	6ce1      	ldr	r1, [r4, #76]	; 0x4c
2000320c:	428b      	cmp	r3, r1
2000320e:	bf08      	it	eq
20003210:	4282      	cmpeq	r2, r0
20003212:	f040 8122 	bne.w	2000345a <xz_dec_run+0x67e>
20003216:	2301      	movs	r3, #1
20003218:	f884 3068 	strb.w	r3, [r4, #104]	; 0x68
2000321c:	e7db      	b.n	200031d6 <xz_dec_run+0x3fa>
2000321e:	f8d4 3088 	ldr.w	r3, [r4, #136]	; 0x88
20003222:	f8d4 208c 	ldr.w	r2, [r4, #140]	; 0x8c
20003226:	68a0      	ldr	r0, [r4, #8]
20003228:	68e1      	ldr	r1, [r4, #12]
2000322a:	181b      	adds	r3, r3, r0
2000322c:	eb42 0201 	adc.w	r2, r2, r1
20003230:	f8c4 3088 	str.w	r3, [r4, #136]	; 0x88
20003234:	f8c4 208c 	str.w	r2, [r4, #140]	; 0x8c
20003238:	f8d4 2090 	ldr.w	r2, [r4, #144]	; 0x90
2000323c:	2118      	movs	r1, #24
2000323e:	4650      	mov	r0, sl
20003240:	f7fe fe4a 	bl	20001ed8 <xz_crc32>
20003244:	f8c4 0090 	str.w	r0, [r4, #144]	; 0x90
20003248:	6fa3      	ldr	r3, [r4, #120]	; 0x78
2000324a:	6fe2      	ldr	r2, [r4, #124]	; 0x7c
2000324c:	3b01      	subs	r3, #1
2000324e:	f142 32ff 	adc.w	r2, r2, #4294967295	; 0xffffffff
20003252:	67a3      	str	r3, [r4, #120]	; 0x78
20003254:	67e2      	str	r2, [r4, #124]	; 0x7c
20003256:	2301      	movs	r3, #1
20003258:	f884 3068 	strb.w	r3, [r4, #104]	; 0x68
2000325c:	e7bb      	b.n	200031d6 <xz_dec_run+0x3fa>
2000325e:	4629      	mov	r1, r5
20003260:	4620      	mov	r0, r4
20003262:	f7ff fd65 	bl	20002d30 <index_update>
20003266:	e031      	b.n	200032cc <xz_dec_run+0x4f0>
20003268:	4629      	mov	r1, r5
2000326a:	4620      	mov	r0, r4
2000326c:	f7ff fd60 	bl	20002d30 <index_update>
20003270:	2218      	movs	r2, #24
20003272:	f104 0180 	add.w	r1, r4, #128	; 0x80
20003276:	f104 0050 	add.w	r0, r4, #80	; 0x50
2000327a:	f000 fa75 	bl	20003768 <memcmp>
2000327e:	2800      	cmp	r0, #0
20003280:	f040 80e6 	bne.w	20003450 <xz_dec_run+0x674>
20003284:	2308      	movs	r3, #8
20003286:	7023      	strb	r3, [r4, #0]
20003288:	686a      	ldr	r2, [r5, #4]
2000328a:	68ab      	ldr	r3, [r5, #8]
2000328c:	429a      	cmp	r2, r3
2000328e:	f000 80c5 	beq.w	2000341c <xz_dec_run+0x640>
20003292:	69a3      	ldr	r3, [r4, #24]
20003294:	6861      	ldr	r1, [r4, #4]
20003296:	40cb      	lsrs	r3, r1
20003298:	b2db      	uxtb	r3, r3
2000329a:	6829      	ldr	r1, [r5, #0]
2000329c:	1c50      	adds	r0, r2, #1
2000329e:	6068      	str	r0, [r5, #4]
200032a0:	5c8a      	ldrb	r2, [r1, r2]
200032a2:	4293      	cmp	r3, r2
200032a4:	f040 80bc 	bne.w	20003420 <xz_dec_run+0x644>
200032a8:	6863      	ldr	r3, [r4, #4]
200032aa:	3308      	adds	r3, #8
200032ac:	6063      	str	r3, [r4, #4]
200032ae:	2b1f      	cmp	r3, #31
200032b0:	d9ea      	bls.n	20003288 <xz_dec_run+0x4ac>
200032b2:	2300      	movs	r3, #0
200032b4:	61a3      	str	r3, [r4, #24]
200032b6:	6063      	str	r3, [r4, #4]
200032b8:	230c      	movs	r3, #12
200032ba:	f8c4 309c 	str.w	r3, [r4, #156]	; 0x9c
200032be:	2309      	movs	r3, #9
200032c0:	7023      	strb	r3, [r4, #0]
200032c2:	4629      	mov	r1, r5
200032c4:	4620      	mov	r0, r4
200032c6:	f7ff fd47 	bl	20002d58 <fill_temp>
200032ca:	b960      	cbnz	r0, 200032e6 <xz_dec_run+0x50a>
200032cc:	7f63      	ldrb	r3, [r4, #29]
200032ce:	2b00      	cmp	r3, #0
200032d0:	d163      	bne.n	2000339a <xz_dec_run+0x5be>
200032d2:	686e      	ldr	r6, [r5, #4]
200032d4:	68ab      	ldr	r3, [r5, #8]
200032d6:	429e      	cmp	r6, r3
200032d8:	bf0c      	ite	eq
200032da:	2607      	moveq	r6, #7
200032dc:	2608      	movne	r6, #8
200032de:	606f      	str	r7, [r5, #4]
200032e0:	f8c5 8010 	str.w	r8, [r5, #16]
200032e4:	e05f      	b.n	200033a6 <xz_dec_run+0x5ca>
200032e6:	2202      	movs	r2, #2
200032e8:	495f      	ldr	r1, [pc, #380]	; (20003468 <xz_dec_run+0x68c>)
200032ea:	f104 00aa 	add.w	r0, r4, #170	; 0xaa
200032ee:	f000 fa3b 	bl	20003768 <memcmp>
200032f2:	2800      	cmp	r0, #0
200032f4:	f040 80ac 	bne.w	20003450 <xz_dec_run+0x674>
200032f8:	2200      	movs	r2, #0
200032fa:	2106      	movs	r1, #6
200032fc:	f104 00a4 	add.w	r0, r4, #164	; 0xa4
20003300:	f7fe fdea 	bl	20001ed8 <xz_crc32>
20003304:	f894 20a1 	ldrb.w	r2, [r4, #161]	; 0xa1
20003308:	f894 30a2 	ldrb.w	r3, [r4, #162]	; 0xa2
2000330c:	041b      	lsls	r3, r3, #16
2000330e:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
20003312:	f894 20a0 	ldrb.w	r2, [r4, #160]	; 0xa0
20003316:	4313      	orrs	r3, r2
20003318:	f894 20a3 	ldrb.w	r2, [r4, #163]	; 0xa3
2000331c:	ea43 6302 	orr.w	r3, r3, r2, lsl #24
20003320:	4298      	cmp	r0, r3
20003322:	f040 8095 	bne.w	20003450 <xz_dec_run+0x674>
20003326:	6f22      	ldr	r2, [r4, #112]	; 0x70
20003328:	6f61      	ldr	r1, [r4, #116]	; 0x74
2000332a:	0892      	lsrs	r2, r2, #2
2000332c:	ea42 7281 	orr.w	r2, r2, r1, lsl #30
20003330:	0889      	lsrs	r1, r1, #2
20003332:	f894 00a5 	ldrb.w	r0, [r4, #165]	; 0xa5
20003336:	f894 30a6 	ldrb.w	r3, [r4, #166]	; 0xa6
2000333a:	041b      	lsls	r3, r3, #16
2000333c:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
20003340:	f894 00a4 	ldrb.w	r0, [r4, #164]	; 0xa4
20003344:	4303      	orrs	r3, r0
20003346:	f894 00a7 	ldrb.w	r0, [r4, #167]	; 0xa7
2000334a:	ea43 6300 	orr.w	r3, r3, r0, lsl #24
2000334e:	2900      	cmp	r1, #0
20003350:	bf08      	it	eq
20003352:	429a      	cmpeq	r2, r3
20003354:	d17c      	bne.n	20003450 <xz_dec_run+0x674>
20003356:	f894 30a8 	ldrb.w	r3, [r4, #168]	; 0xa8
2000335a:	2b00      	cmp	r3, #0
2000335c:	d178      	bne.n	20003450 <xz_dec_run+0x674>
2000335e:	f894 20a9 	ldrb.w	r2, [r4, #169]	; 0xa9
20003362:	7f23      	ldrb	r3, [r4, #28]
20003364:	429a      	cmp	r2, r3
20003366:	d173      	bne.n	20003450 <xz_dec_run+0x674>
20003368:	7f63      	ldrb	r3, [r4, #29]
2000336a:	bb43      	cbnz	r3, 200033be <xz_dec_run+0x5e2>
2000336c:	2601      	movs	r6, #1
2000336e:	e01a      	b.n	200033a6 <xz_dec_run+0x5ca>
20003370:	2e00      	cmp	r6, #0
20003372:	d0ae      	beq.n	200032d2 <xz_dec_run+0x4f6>
20003374:	e01e      	b.n	200033b4 <xz_dec_run+0x5d8>
20003376:	2607      	movs	r6, #7
20003378:	e7b1      	b.n	200032de <xz_dec_run+0x502>
2000337a:	692b      	ldr	r3, [r5, #16]
2000337c:	4543      	cmp	r3, r8
2000337e:	d001      	beq.n	20003384 <xz_dec_run+0x5a8>
20003380:	2600      	movs	r6, #0
20003382:	e00e      	b.n	200033a2 <xz_dec_run+0x5c6>
20003384:	7fa3      	ldrb	r3, [r4, #30]
20003386:	2b00      	cmp	r3, #0
20003388:	bf0c      	ite	eq
2000338a:	2600      	moveq	r6, #0
2000338c:	2608      	movne	r6, #8
2000338e:	2301      	movs	r3, #1
20003390:	77a3      	strb	r3, [r4, #30]
20003392:	e008      	b.n	200033a6 <xz_dec_run+0x5ca>
20003394:	7f63      	ldrb	r3, [r4, #29]
20003396:	2b00      	cmp	r3, #0
20003398:	d09b      	beq.n	200032d2 <xz_dec_run+0x4f6>
2000339a:	686b      	ldr	r3, [r5, #4]
2000339c:	42bb      	cmp	r3, r7
2000339e:	d0ec      	beq.n	2000337a <xz_dec_run+0x59e>
200033a0:	2600      	movs	r6, #0
200033a2:	2300      	movs	r3, #0
200033a4:	77a3      	strb	r3, [r4, #30]
200033a6:	4630      	mov	r0, r6
200033a8:	b003      	add	sp, #12
200033aa:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200033ae:	7f63      	ldrb	r3, [r4, #29]
200033b0:	b91b      	cbnz	r3, 200033ba <xz_dec_run+0x5de>
200033b2:	2607      	movs	r6, #7
200033b4:	2e01      	cmp	r6, #1
200033b6:	d0f6      	beq.n	200033a6 <xz_dec_run+0x5ca>
200033b8:	e791      	b.n	200032de <xz_dec_run+0x502>
200033ba:	2607      	movs	r6, #7
200033bc:	e7f1      	b.n	200033a2 <xz_dec_run+0x5c6>
200033be:	2601      	movs	r6, #1
200033c0:	e7ef      	b.n	200033a2 <xz_dec_run+0x5c6>
200033c2:	2600      	movs	r6, #0
200033c4:	e654      	b.n	20003070 <xz_dec_run+0x294>
200033c6:	2607      	movs	r6, #7
200033c8:	e652      	b.n	20003070 <xz_dec_run+0x294>
200033ca:	2607      	movs	r6, #7
200033cc:	e650      	b.n	20003070 <xz_dec_run+0x294>
200033ce:	2607      	movs	r6, #7
200033d0:	e64e      	b.n	20003070 <xz_dec_run+0x294>
200033d2:	2607      	movs	r6, #7
200033d4:	e64c      	b.n	20003070 <xz_dec_run+0x294>
200033d6:	2607      	movs	r6, #7
200033d8:	e64a      	b.n	20003070 <xz_dec_run+0x294>
200033da:	2607      	movs	r6, #7
200033dc:	7f63      	ldrb	r3, [r4, #29]
200033de:	2b00      	cmp	r3, #0
200033e0:	d0e8      	beq.n	200033b4 <xz_dec_run+0x5d8>
200033e2:	e649      	b.n	20003078 <xz_dec_run+0x29c>
200033e4:	2606      	movs	r6, #6
200033e6:	e7f9      	b.n	200033dc <xz_dec_run+0x600>
200033e8:	2607      	movs	r6, #7
200033ea:	e7f7      	b.n	200033dc <xz_dec_run+0x600>
200033ec:	2607      	movs	r6, #7
200033ee:	e7f5      	b.n	200033dc <xz_dec_run+0x600>
200033f0:	2607      	movs	r6, #7
200033f2:	e7f3      	b.n	200033dc <xz_dec_run+0x600>
200033f4:	2606      	movs	r6, #6
200033f6:	e7f1      	b.n	200033dc <xz_dec_run+0x600>
200033f8:	2606      	movs	r6, #6
200033fa:	e7ef      	b.n	200033dc <xz_dec_run+0x600>
200033fc:	2607      	movs	r6, #7
200033fe:	e7ed      	b.n	200033dc <xz_dec_run+0x600>
20003400:	9e01      	ldr	r6, [sp, #4]
20003402:	e7eb      	b.n	200033dc <xz_dec_run+0x600>
20003404:	2605      	movs	r6, #5
20003406:	7f63      	ldrb	r3, [r4, #29]
20003408:	2b00      	cmp	r3, #0
2000340a:	f43f af68 	beq.w	200032de <xz_dec_run+0x502>
2000340e:	e633      	b.n	20003078 <xz_dec_run+0x29c>
20003410:	2607      	movs	r6, #7
20003412:	e7f8      	b.n	20003406 <xz_dec_run+0x62a>
20003414:	2606      	movs	r6, #6
20003416:	e7f6      	b.n	20003406 <xz_dec_run+0x62a>
20003418:	2606      	movs	r6, #6
2000341a:	e7f4      	b.n	20003406 <xz_dec_run+0x62a>
2000341c:	2600      	movs	r6, #0
2000341e:	e627      	b.n	20003070 <xz_dec_run+0x294>
20003420:	2607      	movs	r6, #7
20003422:	e625      	b.n	20003070 <xz_dec_run+0x294>
20003424:	2307      	movs	r3, #7
20003426:	7023      	strb	r3, [r4, #0]
20003428:	686a      	ldr	r2, [r5, #4]
2000342a:	6923      	ldr	r3, [r4, #16]
2000342c:	1ad3      	subs	r3, r2, r3
2000342e:	6f21      	ldr	r1, [r4, #112]	; 0x70
20003430:	185b      	adds	r3, r3, r1
20003432:	f003 0303 	and.w	r3, r3, #3
20003436:	2b00      	cmp	r3, #0
20003438:	f43f af16 	beq.w	20003268 <xz_dec_run+0x48c>
2000343c:	68ab      	ldr	r3, [r5, #8]
2000343e:	4293      	cmp	r3, r2
20003440:	f43f af0d 	beq.w	2000325e <xz_dec_run+0x482>
20003444:	682b      	ldr	r3, [r5, #0]
20003446:	1c51      	adds	r1, r2, #1
20003448:	6069      	str	r1, [r5, #4]
2000344a:	5c9b      	ldrb	r3, [r3, r2]
2000344c:	2b00      	cmp	r3, #0
2000344e:	d0eb      	beq.n	20003428 <xz_dec_run+0x64c>
20003450:	7f63      	ldrb	r3, [r4, #29]
20003452:	2b00      	cmp	r3, #0
20003454:	d08f      	beq.n	20003376 <xz_dec_run+0x59a>
20003456:	2607      	movs	r6, #7
20003458:	e7a3      	b.n	200033a2 <xz_dec_run+0x5c6>
2000345a:	2607      	movs	r6, #7
2000345c:	e608      	b.n	20003070 <xz_dec_run+0x294>
2000345e:	7f63      	ldrb	r3, [r4, #29]
20003460:	2b00      	cmp	r3, #0
20003462:	d19a      	bne.n	2000339a <xz_dec_run+0x5be>
20003464:	2607      	movs	r6, #7
20003466:	e73a      	b.n	200032de <xz_dec_run+0x502>
20003468:	20004480 	.word	0x20004480

2000346c <xz_dec_init>:
2000346c:	b570      	push	{r4, r5, r6, lr}
2000346e:	4604      	mov	r4, r0
20003470:	460e      	mov	r6, r1
20003472:	f44f 6095 	mov.w	r0, #1192	; 0x4a8
20003476:	f7fe fd07 	bl	20001e88 <ty_adapt_malloc>
2000347a:	4605      	mov	r5, r0
2000347c:	b158      	cbz	r0, 20003496 <xz_dec_init+0x2a>
2000347e:	7744      	strb	r4, [r0, #29]
20003480:	4631      	mov	r1, r6
20003482:	4620      	mov	r0, r4
20003484:	f7ff fbb9 	bl	20002bfa <xz_dec_lzma2_create>
20003488:	4604      	mov	r4, r0
2000348a:	f8c5 04a0 	str.w	r0, [r5, #1184]	; 0x4a0
2000348e:	b120      	cbz	r0, 2000349a <xz_dec_init+0x2e>
20003490:	4628      	mov	r0, r5
20003492:	f7ff fc89 	bl	20002da8 <xz_dec_reset>
20003496:	4628      	mov	r0, r5
20003498:	bd70      	pop	{r4, r5, r6, pc}
2000349a:	4628      	mov	r0, r5
2000349c:	f7fe fcf8 	bl	20001e90 <ty_adapt_free>
200034a0:	4625      	mov	r5, r4
200034a2:	e7f8      	b.n	20003496 <xz_dec_init+0x2a>

200034a4 <xz_dec_end>:
200034a4:	b148      	cbz	r0, 200034ba <xz_dec_end+0x16>
200034a6:	b510      	push	{r4, lr}
200034a8:	4604      	mov	r4, r0
200034aa:	f8d0 04a0 	ldr.w	r0, [r0, #1184]	; 0x4a0
200034ae:	f7ff fbfb 	bl	20002ca8 <xz_dec_lzma2_end>
200034b2:	4620      	mov	r0, r4
200034b4:	f7fe fcec 	bl	20001e90 <ty_adapt_free>
200034b8:	bd10      	pop	{r4, pc}
200034ba:	4770      	bx	lr

200034bc <port_log_init>:
200034bc:	b538      	push	{r3, r4, r5, lr}
200034be:	4913      	ldr	r1, [pc, #76]	; (2000350c <port_log_init+0x50>)
200034c0:	4c13      	ldr	r4, [pc, #76]	; (20003510 <port_log_init+0x54>)
200034c2:	600c      	str	r4, [r1, #0]
200034c4:	f44f 2361 	mov.w	r3, #921600	; 0xe1000
200034c8:	604b      	str	r3, [r1, #4]
200034ca:	2300      	movs	r3, #0
200034cc:	810b      	strh	r3, [r1, #8]
200034ce:	2502      	movs	r5, #2
200034d0:	818d      	strh	r5, [r1, #12]
200034d2:	814b      	strh	r3, [r1, #10]
200034d4:	3104      	adds	r1, #4
200034d6:	4620      	mov	r0, r4
200034d8:	f7fd fdb8 	bl	2000104c <hal_uart_init>
200034dc:	2101      	movs	r1, #1
200034de:	4620      	mov	r0, r4
200034e0:	f7fd fe0a 	bl	200010f8 <hal_uart_tx_mode_en>
200034e4:	2101      	movs	r1, #1
200034e6:	4620      	mov	r0, r4
200034e8:	f7fd fe0b 	bl	20001102 <hal_uart_en>
200034ec:	f504 4424 	add.w	r4, r4, #41984	; 0xa400
200034f0:	462a      	mov	r2, r5
200034f2:	f44f 7100 	mov.w	r1, #512	; 0x200
200034f6:	4620      	mov	r0, r4
200034f8:	f7fd fbd6 	bl	20000ca8 <hal_gpio_pin_afio_select>
200034fc:	2201      	movs	r2, #1
200034fe:	f44f 7100 	mov.w	r1, #512	; 0x200
20003502:	4620      	mov	r0, r4
20003504:	f7fd fce0 	bl	20000ec8 <hal_gpio_pin_afio_en>
20003508:	bd38      	pop	{r3, r4, r5, pc}
2000350a:	bf00      	nop
2000350c:	20029474 	.word	0x20029474
20003510:	40002000 	.word	0x40002000

20003514 <port_log_deinit>:
20003514:	b510      	push	{r4, lr}
20003516:	f7fd fd67 	bl	20000fe8 <hal_misc_reset_uart0>
2000351a:	4b0c      	ldr	r3, [pc, #48]	; (2000354c <port_log_deinit+0x38>)
2000351c:	f44f 0280 	mov.w	r2, #4194304	; 0x400000
20003520:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
20003524:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
20003528:	f3bf 8f4f 	dsb	sy
2000352c:	f3bf 8f6f 	isb	sy
20003530:	4c07      	ldr	r4, [pc, #28]	; (20003550 <port_log_deinit+0x3c>)
20003532:	2200      	movs	r2, #0
20003534:	f44f 7180 	mov.w	r1, #256	; 0x100
20003538:	4620      	mov	r0, r4
2000353a:	f7fd fcc5 	bl	20000ec8 <hal_gpio_pin_afio_en>
2000353e:	2200      	movs	r2, #0
20003540:	f44f 7100 	mov.w	r1, #512	; 0x200
20003544:	4620      	mov	r0, r4
20003546:	f7fd fcbf 	bl	20000ec8 <hal_gpio_pin_afio_en>
2000354a:	bd10      	pop	{r4, pc}
2000354c:	e000e100 	.word	0xe000e100
20003550:	4000c400 	.word	0x4000c400

20003554 <port_bl_log>:
20003554:	b40f      	push	{r0, r1, r2, r3}
20003556:	b5f0      	push	{r4, r5, r6, r7, lr}
20003558:	b083      	sub	sp, #12
2000355a:	ac08      	add	r4, sp, #32
2000355c:	f854 7b04 	ldr.w	r7, [r4], #4
20003560:	4d14      	ldr	r5, [pc, #80]	; (200035b4 <port_bl_log+0x60>)
20003562:	2664      	movs	r6, #100	; 0x64
20003564:	4632      	mov	r2, r6
20003566:	2100      	movs	r1, #0
20003568:	4628      	mov	r0, r5
2000356a:	f000 f935 	bl	200037d8 <memset>
2000356e:	9401      	str	r4, [sp, #4]
20003570:	4623      	mov	r3, r4
20003572:	463a      	mov	r2, r7
20003574:	4631      	mov	r1, r6
20003576:	4628      	mov	r0, r5
20003578:	f000 fa0c 	bl	20003994 <vsniprintf>
2000357c:	2863      	cmp	r0, #99	; 0x63
2000357e:	dc13      	bgt.n	200035a8 <port_bl_log+0x54>
20003580:	b190      	cbz	r0, 200035a8 <port_bl_log+0x54>
20003582:	462f      	mov	r7, r5
20003584:	462e      	mov	r6, r5
20003586:	4c0c      	ldr	r4, [pc, #48]	; (200035b8 <port_bl_log+0x64>)
20003588:	f04f 7580 	mov.w	r5, #16777216	; 0x1000000
2000358c:	4407      	add	r7, r0
2000358e:	4629      	mov	r1, r5
20003590:	4620      	mov	r0, r4
20003592:	f7fd fdbd 	bl	20001110 <hal_uart_flag_get>
20003596:	2801      	cmp	r0, #1
20003598:	d0f9      	beq.n	2000358e <port_bl_log+0x3a>
2000359a:	f816 1b01 	ldrb.w	r1, [r6], #1
2000359e:	4620      	mov	r0, r4
200035a0:	f7fd fdb4 	bl	2000110c <hal_uart_send_data>
200035a4:	42b7      	cmp	r7, r6
200035a6:	d1f2      	bne.n	2000358e <port_bl_log+0x3a>
200035a8:	b003      	add	sp, #12
200035aa:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
200035ae:	b004      	add	sp, #16
200035b0:	4770      	bx	lr
200035b2:	bf00      	nop
200035b4:	20029484 	.word	0x20029484
200035b8:	40002000 	.word	0x40002000

200035bc <platform_init_hook>:
200035bc:	b510      	push	{r4, lr}
200035be:	f7fd fdcf 	bl	20001160 <SetSysClock>
200035c2:	4c10      	ldr	r4, [pc, #64]	; (20003604 <platform_init_hook+0x48>)
200035c4:	2200      	movs	r2, #0
200035c6:	2104      	movs	r1, #4
200035c8:	4620      	mov	r0, r4
200035ca:	f7fd fc7d 	bl	20000ec8 <hal_gpio_pin_afio_en>
200035ce:	2200      	movs	r2, #0
200035d0:	2108      	movs	r1, #8
200035d2:	4620      	mov	r0, r4
200035d4:	f7fd fc78 	bl	20000ec8 <hal_gpio_pin_afio_en>
200035d8:	4a0b      	ldr	r2, [pc, #44]	; (20003608 <platform_init_hook+0x4c>)
200035da:	68d3      	ldr	r3, [r2, #12]
200035dc:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
200035e0:	041b      	lsls	r3, r3, #16
200035e2:	0c1b      	lsrs	r3, r3, #16
200035e4:	f043 63bf 	orr.w	r3, r3, #100139008	; 0x5f80000
200035e8:	f443 3301 	orr.w	r3, r3, #132096	; 0x20400
200035ec:	60d3      	str	r3, [r2, #12]
200035ee:	2320      	movs	r3, #32
200035f0:	f882 3023 	strb.w	r3, [r2, #35]	; 0x23
200035f4:	4b05      	ldr	r3, [pc, #20]	; (2000360c <platform_init_hook+0x50>)
200035f6:	2280      	movs	r2, #128	; 0x80
200035f8:	f883 2316 	strb.w	r2, [r3, #790]	; 0x316
200035fc:	f883 2317 	strb.w	r2, [r3, #791]	; 0x317
20003600:	b662      	cpsie	i
20003602:	bd10      	pop	{r4, pc}
20003604:	4000c000 	.word	0x4000c000
20003608:	e000ed00 	.word	0xe000ed00
2000360c:	e000e100 	.word	0xe000e100

20003610 <platform_handle_after_startup>:
20003610:	2000      	movs	r0, #0
20003612:	4770      	bx	lr

20003614 <platform_perip_setup>:
20003614:	4770      	bx	lr

20003616 <platform_perip_remove>:
20003616:	4770      	bx	lr

20003618 <platform_check_ota_program>:
20003618:	b538      	push	{r3, r4, r5, lr}
2000361a:	4605      	mov	r5, r0
2000361c:	460c      	mov	r4, r1
2000361e:	f7fd fcab 	bl	20000f78 <hal_misc_awo_get_r_idle_reg>
20003622:	4b05      	ldr	r3, [pc, #20]	; (20003638 <platform_check_ota_program+0x20>)
20003624:	4298      	cmp	r0, r3
20003626:	d001      	beq.n	2000362c <platform_check_ota_program+0x14>
20003628:	2001      	movs	r0, #1
2000362a:	bd38      	pop	{r3, r4, r5, pc}
2000362c:	89ab      	ldrh	r3, [r5, #12]
2000362e:	3304      	adds	r3, #4
20003630:	6023      	str	r3, [r4, #0]
20003632:	2000      	movs	r0, #0
20003634:	e7f9      	b.n	2000362a <platform_check_ota_program+0x12>
20003636:	bf00      	nop
20003638:	aeaebebe 	.word	0xaeaebebe

2000363c <platform_handle_after_ota>:
2000363c:	4770      	bx	lr

2000363e <platform_do_jump>:
2000363e:	b510      	push	{r4, lr}
20003640:	4604      	mov	r4, r0
20003642:	f7ff ff67 	bl	20003514 <port_log_deinit>
20003646:	2001      	movs	r0, #1
20003648:	f7fd f948 	bl	200008dc <hal_flash_quad_mode_enable>
2000364c:	2000      	movs	r0, #0
2000364e:	f7fc fe3f 	bl	200002d0 <flash_cache_init>
20003652:	f104 5080 	add.w	r0, r4, #268435456	; 0x10000000
20003656:	6803      	ldr	r3, [r0, #0]
20003658:	f383 8808 	msr	MSP, r3
2000365c:	6844      	ldr	r4, [r0, #4]
2000365e:	2303      	movs	r3, #3
20003660:	2202      	movs	r2, #2
20003662:	2101      	movs	r1, #1
20003664:	47a0      	blx	r4
20003666:	bd10      	pop	{r4, pc}

20003668 <platform_system_reboot>:
20003668:	b508      	push	{r3, lr}
2000366a:	f7fd fa81 	bl	20000b70 <ln_chip_reboot>
2000366e:	bd08      	pop	{r3, pc}

20003670 <NMI_Handler>:
20003670:	e7fe      	b.n	20003670 <NMI_Handler>

20003672 <HardFault_Handler>:
20003672:	e7fe      	b.n	20003672 <HardFault_Handler>

20003674 <MemManage_Handler>:
20003674:	e7fe      	b.n	20003674 <MemManage_Handler>

20003676 <BusFault_Handler>:
20003676:	e7fe      	b.n	20003676 <BusFault_Handler>

20003678 <UsageFault_Handler>:
20003678:	e7fe      	b.n	20003678 <UsageFault_Handler>

2000367a <SVC_Handler>:
2000367a:	e7fe      	b.n	2000367a <SVC_Handler>

2000367c <DebugMon_Handler>:
2000367c:	e7fe      	b.n	2000367c <DebugMon_Handler>

2000367e <PendSV_Handler>:
2000367e:	e7fe      	b.n	2000367e <PendSV_Handler>

20003680 <SysTick_Handler>:
20003680:	e7fe      	b.n	20003680 <SysTick_Handler>

20003682 <WDT_IRQHandler>:
20003682:	e7fe      	b.n	20003682 <WDT_IRQHandler>

20003684 <EXT_IRQHandler>:
20003684:	e7fe      	b.n	20003684 <EXT_IRQHandler>

20003686 <RTC_IRQHandler>:
20003686:	e7fe      	b.n	20003686 <RTC_IRQHandler>

20003688 <RFSLP_IRQHandler>:
20003688:	e7fe      	b.n	20003688 <RFSLP_IRQHandler>

2000368a <MAC_IRQHandler>:
2000368a:	e7fe      	b.n	2000368a <MAC_IRQHandler>

2000368c <BLE_WAKE_IRQHandler>:
2000368c:	e7fe      	b.n	2000368c <BLE_WAKE_IRQHandler>

2000368e <BLE_ERR_IRQHandler>:
2000368e:	e7fe      	b.n	2000368e <BLE_ERR_IRQHandler>

20003690 <BLE_MAC_IRQHandler>:
20003690:	e7fe      	b.n	20003690 <BLE_MAC_IRQHandler>

20003692 <DMA_IRQHandler>:
20003692:	e7fe      	b.n	20003692 <DMA_IRQHandler>

20003694 <QSPI_IRQHandler>:
20003694:	e7fe      	b.n	20003694 <QSPI_IRQHandler>

20003696 <SDIO_F1_IRQHandler>:
20003696:	e7fe      	b.n	20003696 <SDIO_F1_IRQHandler>

20003698 <SDIO_F2_IRQHandler>:
20003698:	e7fe      	b.n	20003698 <SDIO_F2_IRQHandler>

2000369a <SDIO_F3_IRQHandler>:
2000369a:	e7fe      	b.n	2000369a <SDIO_F3_IRQHandler>

2000369c <CM4_FPIXC_IRQHandler>:
2000369c:	e7fe      	b.n	2000369c <CM4_FPIXC_IRQHandler>

2000369e <CM4_FPOFC_IRQHandler>:
2000369e:	e7fe      	b.n	2000369e <CM4_FPOFC_IRQHandler>

200036a0 <CM4_FPUFC_IRQHandler>:
200036a0:	e7fe      	b.n	200036a0 <CM4_FPUFC_IRQHandler>

200036a2 <CM4_FPIOC_IRQHandler>:
200036a2:	e7fe      	b.n	200036a2 <CM4_FPIOC_IRQHandler>

200036a4 <CM4_FPDZC_IRQHandler>:
200036a4:	e7fe      	b.n	200036a4 <CM4_FPDZC_IRQHandler>

200036a6 <CM4_FPIDC_IRQHandler>:
200036a6:	e7fe      	b.n	200036a6 <CM4_FPIDC_IRQHandler>

200036a8 <I2C_IRQHandler>:
200036a8:	e7fe      	b.n	200036a8 <I2C_IRQHandler>

200036aa <SPI0_IRQHandler>:
200036aa:	e7fe      	b.n	200036aa <SPI0_IRQHandler>

200036ac <SPI1_IRQHandler>:
200036ac:	e7fe      	b.n	200036ac <SPI1_IRQHandler>

200036ae <UART0_IRQHandler>:
200036ae:	e7fe      	b.n	200036ae <UART0_IRQHandler>

200036b0 <UART1_IRQHandler>:
200036b0:	e7fe      	b.n	200036b0 <UART1_IRQHandler>

200036b2 <UART2_IRQHandler>:
200036b2:	e7fe      	b.n	200036b2 <UART2_IRQHandler>

200036b4 <ADC_IRQHandler>:
200036b4:	e7fe      	b.n	200036b4 <ADC_IRQHandler>

200036b6 <WS_IRQHandler>:
200036b6:	e7fe      	b.n	200036b6 <WS_IRQHandler>

200036b8 <I2S_IRQHandler>:
200036b8:	e7fe      	b.n	200036b8 <I2S_IRQHandler>

200036ba <GPIOA_IRQHandler>:
200036ba:	e7fe      	b.n	200036ba <GPIOA_IRQHandler>

200036bc <GPIOB_IRQHandler>:
200036bc:	e7fe      	b.n	200036bc <GPIOB_IRQHandler>

200036be <TIMER0_IRQHandler>:
200036be:	e7fe      	b.n	200036be <TIMER0_IRQHandler>

200036c0 <TIMER1_IRQHandler>:
200036c0:	e7fe      	b.n	200036c0 <TIMER1_IRQHandler>

200036c2 <TIMER2_IRQHandler>:
200036c2:	e7fe      	b.n	200036c2 <TIMER2_IRQHandler>

200036c4 <TIMER3_IRQHandler>:
200036c4:	e7fe      	b.n	200036c4 <TIMER3_IRQHandler>

200036c6 <ADV_TIMER_IRQHandler>:
200036c6:	e7fe      	b.n	200036c6 <ADV_TIMER_IRQHandler>

200036c8 <AES_IRQHandler>:
200036c8:	e7fe      	b.n	200036c8 <AES_IRQHandler>

200036ca <TRNG_IRQHandler>:
200036ca:	e7fe      	b.n	200036ca <TRNG_IRQHandler>

200036cc <PAOTD_IRQHandler>:
200036cc:	e7fe      	b.n	200036cc <PAOTD_IRQHandler>
	...

200036d0 <Reset_Handler>:
200036d0:	b508      	push	{r3, lr}
200036d2:	4a09      	ldr	r2, [pc, #36]	; (200036f8 <Reset_Handler+0x28>)
200036d4:	4b09      	ldr	r3, [pc, #36]	; (200036fc <Reset_Handler+0x2c>)
200036d6:	429a      	cmp	r2, r3
200036d8:	d206      	bcs.n	200036e8 <Reset_Handler+0x18>
200036da:	4613      	mov	r3, r2
200036dc:	2100      	movs	r1, #0
200036de:	4a07      	ldr	r2, [pc, #28]	; (200036fc <Reset_Handler+0x2c>)
200036e0:	f803 1b01 	strb.w	r1, [r3], #1
200036e4:	4293      	cmp	r3, r2
200036e6:	d1fb      	bne.n	200036e0 <Reset_Handler+0x10>
200036e8:	f7fd fd18 	bl	2000111c <SystemInit>
200036ec:	2100      	movs	r1, #0
200036ee:	4608      	mov	r0, r1
200036f0:	f7fd ff06 	bl	20001500 <main>
200036f4:	bd08      	pop	{r3, pc}
200036f6:	bf00      	nop
200036f8:	20004644 	.word	0x20004644
200036fc:	200294e8 	.word	0x200294e8

20003700 <port_flash_init>:
20003700:	b508      	push	{r3, lr}
20003702:	f7fc febd 	bl	20000480 <hal_flash_init>
20003706:	f7fc fe31 	bl	2000036c <flash_cache_disable>
2000370a:	2000      	movs	r0, #0
2000370c:	bd08      	pop	{r3, pc}

2000370e <port_flash_deinit>:
2000370e:	f06f 0063 	mvn.w	r0, #99	; 0x63
20003712:	4770      	bx	lr

20003714 <port_flash_read>:
20003714:	b508      	push	{r3, lr}
20003716:	4613      	mov	r3, r2
20003718:	460a      	mov	r2, r1
2000371a:	4619      	mov	r1, r3
2000371c:	f7fc ff7a 	bl	20000614 <hal_flash_read>
20003720:	f242 7311 	movw	r3, #10001	; 0x2711
20003724:	3b01      	subs	r3, #1
20003726:	d1fd      	bne.n	20003724 <port_flash_read+0x10>
20003728:	2000      	movs	r0, #0
2000372a:	bd08      	pop	{r3, pc}

2000372c <port_flash_write>:
2000372c:	b508      	push	{r3, lr}
2000372e:	4613      	mov	r3, r2
20003730:	460a      	mov	r2, r1
20003732:	4619      	mov	r1, r3
20003734:	f7fd f8cc 	bl	200008d0 <hal_flash_program>
20003738:	2000      	movs	r0, #0
2000373a:	bd08      	pop	{r3, pc}

2000373c <port_flash_erase>:
2000373c:	b508      	push	{r3, lr}
2000373e:	f7fc ffbf 	bl	200006c0 <hal_flash_erase>
20003742:	2000      	movs	r0, #0
20003744:	bd08      	pop	{r3, pc}
	...

20003748 <malloc>:
20003748:	4b02      	ldr	r3, [pc, #8]	; (20003754 <malloc+0xc>)
2000374a:	4601      	mov	r1, r0
2000374c:	6818      	ldr	r0, [r3, #0]
2000374e:	f7fe bb73 	b.w	20001e38 <_malloc_r>
20003752:	bf00      	nop
20003754:	200045dc 	.word	0x200045dc

20003758 <free>:
20003758:	4b02      	ldr	r3, [pc, #8]	; (20003764 <free+0xc>)
2000375a:	4601      	mov	r1, r0
2000375c:	6818      	ldr	r0, [r3, #0]
2000375e:	f7fe bb8c 	b.w	20001e7a <_free_r>
20003762:	bf00      	nop
20003764:	200045dc 	.word	0x200045dc

20003768 <memcmp>:
20003768:	b510      	push	{r4, lr}
2000376a:	3901      	subs	r1, #1
2000376c:	4402      	add	r2, r0
2000376e:	4290      	cmp	r0, r2
20003770:	d101      	bne.n	20003776 <memcmp+0xe>
20003772:	2000      	movs	r0, #0
20003774:	e005      	b.n	20003782 <memcmp+0x1a>
20003776:	7803      	ldrb	r3, [r0, #0]
20003778:	f811 4f01 	ldrb.w	r4, [r1, #1]!
2000377c:	42a3      	cmp	r3, r4
2000377e:	d001      	beq.n	20003784 <memcmp+0x1c>
20003780:	1b18      	subs	r0, r3, r4
20003782:	bd10      	pop	{r4, pc}
20003784:	3001      	adds	r0, #1
20003786:	e7f2      	b.n	2000376e <memcmp+0x6>

20003788 <memcpy>:
20003788:	440a      	add	r2, r1
2000378a:	4291      	cmp	r1, r2
2000378c:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
20003790:	d100      	bne.n	20003794 <memcpy+0xc>
20003792:	4770      	bx	lr
20003794:	b510      	push	{r4, lr}
20003796:	f811 4b01 	ldrb.w	r4, [r1], #1
2000379a:	f803 4f01 	strb.w	r4, [r3, #1]!
2000379e:	4291      	cmp	r1, r2
200037a0:	d1f9      	bne.n	20003796 <memcpy+0xe>
200037a2:	bd10      	pop	{r4, pc}

200037a4 <memmove>:
200037a4:	4288      	cmp	r0, r1
200037a6:	b510      	push	{r4, lr}
200037a8:	eb01 0402 	add.w	r4, r1, r2
200037ac:	d902      	bls.n	200037b4 <memmove+0x10>
200037ae:	4284      	cmp	r4, r0
200037b0:	4623      	mov	r3, r4
200037b2:	d807      	bhi.n	200037c4 <memmove+0x20>
200037b4:	1e43      	subs	r3, r0, #1
200037b6:	42a1      	cmp	r1, r4
200037b8:	d008      	beq.n	200037cc <memmove+0x28>
200037ba:	f811 2b01 	ldrb.w	r2, [r1], #1
200037be:	f803 2f01 	strb.w	r2, [r3, #1]!
200037c2:	e7f8      	b.n	200037b6 <memmove+0x12>
200037c4:	4402      	add	r2, r0
200037c6:	4601      	mov	r1, r0
200037c8:	428a      	cmp	r2, r1
200037ca:	d100      	bne.n	200037ce <memmove+0x2a>
200037cc:	bd10      	pop	{r4, pc}
200037ce:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
200037d2:	f802 4d01 	strb.w	r4, [r2, #-1]!
200037d6:	e7f7      	b.n	200037c8 <memmove+0x24>

200037d8 <memset>:
200037d8:	4402      	add	r2, r0
200037da:	4603      	mov	r3, r0
200037dc:	4293      	cmp	r3, r2
200037de:	d100      	bne.n	200037e2 <memset+0xa>
200037e0:	4770      	bx	lr
200037e2:	f803 1b01 	strb.w	r1, [r3], #1
200037e6:	e7f9      	b.n	200037dc <memset+0x4>

200037e8 <strcmp>:
200037e8:	f810 2b01 	ldrb.w	r2, [r0], #1
200037ec:	f811 3b01 	ldrb.w	r3, [r1], #1
200037f0:	2a01      	cmp	r2, #1
200037f2:	bf28      	it	cs
200037f4:	429a      	cmpcs	r2, r3
200037f6:	d0f7      	beq.n	200037e8 <strcmp>
200037f8:	1ad0      	subs	r0, r2, r3
200037fa:	4770      	bx	lr

200037fc <strncmp>:
200037fc:	b510      	push	{r4, lr}
200037fe:	b17a      	cbz	r2, 20003820 <strncmp+0x24>
20003800:	4603      	mov	r3, r0
20003802:	3901      	subs	r1, #1
20003804:	1884      	adds	r4, r0, r2
20003806:	f813 0b01 	ldrb.w	r0, [r3], #1
2000380a:	f811 2f01 	ldrb.w	r2, [r1, #1]!
2000380e:	4290      	cmp	r0, r2
20003810:	d101      	bne.n	20003816 <strncmp+0x1a>
20003812:	42a3      	cmp	r3, r4
20003814:	d101      	bne.n	2000381a <strncmp+0x1e>
20003816:	1a80      	subs	r0, r0, r2
20003818:	bd10      	pop	{r4, pc}
2000381a:	2800      	cmp	r0, #0
2000381c:	d1f3      	bne.n	20003806 <strncmp+0xa>
2000381e:	e7fa      	b.n	20003816 <strncmp+0x1a>
20003820:	4610      	mov	r0, r2
20003822:	e7f9      	b.n	20003818 <strncmp+0x1c>

20003824 <_strtol_l.constprop.0>:
20003824:	2b01      	cmp	r3, #1
20003826:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
2000382a:	d001      	beq.n	20003830 <_strtol_l.constprop.0+0xc>
2000382c:	2b24      	cmp	r3, #36	; 0x24
2000382e:	d906      	bls.n	2000383e <_strtol_l.constprop.0+0x1a>
20003830:	f000 f8be 	bl	200039b0 <__errno>
20003834:	2316      	movs	r3, #22
20003836:	6003      	str	r3, [r0, #0]
20003838:	2000      	movs	r0, #0
2000383a:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
2000383e:	f8df c0e4 	ldr.w	ip, [pc, #228]	; 20003924 <_strtol_l.constprop.0+0x100>
20003842:	460d      	mov	r5, r1
20003844:	462e      	mov	r6, r5
20003846:	f815 4b01 	ldrb.w	r4, [r5], #1
2000384a:	f814 700c 	ldrb.w	r7, [r4, ip]
2000384e:	f017 0708 	ands.w	r7, r7, #8
20003852:	d1f7      	bne.n	20003844 <_strtol_l.constprop.0+0x20>
20003854:	2c2d      	cmp	r4, #45	; 0x2d
20003856:	d132      	bne.n	200038be <_strtol_l.constprop.0+0x9a>
20003858:	782c      	ldrb	r4, [r5, #0]
2000385a:	2701      	movs	r7, #1
2000385c:	1cb5      	adds	r5, r6, #2
2000385e:	2b00      	cmp	r3, #0
20003860:	d05b      	beq.n	2000391a <_strtol_l.constprop.0+0xf6>
20003862:	2b10      	cmp	r3, #16
20003864:	d109      	bne.n	2000387a <_strtol_l.constprop.0+0x56>
20003866:	2c30      	cmp	r4, #48	; 0x30
20003868:	d107      	bne.n	2000387a <_strtol_l.constprop.0+0x56>
2000386a:	782c      	ldrb	r4, [r5, #0]
2000386c:	f004 04df 	and.w	r4, r4, #223	; 0xdf
20003870:	2c58      	cmp	r4, #88	; 0x58
20003872:	d14d      	bne.n	20003910 <_strtol_l.constprop.0+0xec>
20003874:	786c      	ldrb	r4, [r5, #1]
20003876:	2310      	movs	r3, #16
20003878:	3502      	adds	r5, #2
2000387a:	f107 4800 	add.w	r8, r7, #2147483648	; 0x80000000
2000387e:	f108 38ff 	add.w	r8, r8, #4294967295	; 0xffffffff
20003882:	f04f 0c00 	mov.w	ip, #0
20003886:	fbb8 f9f3 	udiv	r9, r8, r3
2000388a:	4666      	mov	r6, ip
2000388c:	fb03 8a19 	mls	sl, r3, r9, r8
20003890:	f1a4 0e30 	sub.w	lr, r4, #48	; 0x30
20003894:	f1be 0f09 	cmp.w	lr, #9
20003898:	d816      	bhi.n	200038c8 <_strtol_l.constprop.0+0xa4>
2000389a:	4674      	mov	r4, lr
2000389c:	42a3      	cmp	r3, r4
2000389e:	dd24      	ble.n	200038ea <_strtol_l.constprop.0+0xc6>
200038a0:	f1bc 0f00 	cmp.w	ip, #0
200038a4:	db1e      	blt.n	200038e4 <_strtol_l.constprop.0+0xc0>
200038a6:	45b1      	cmp	r9, r6
200038a8:	d31c      	bcc.n	200038e4 <_strtol_l.constprop.0+0xc0>
200038aa:	d101      	bne.n	200038b0 <_strtol_l.constprop.0+0x8c>
200038ac:	45a2      	cmp	sl, r4
200038ae:	db19      	blt.n	200038e4 <_strtol_l.constprop.0+0xc0>
200038b0:	fb06 4603 	mla	r6, r6, r3, r4
200038b4:	f04f 0c01 	mov.w	ip, #1
200038b8:	f815 4b01 	ldrb.w	r4, [r5], #1
200038bc:	e7e8      	b.n	20003890 <_strtol_l.constprop.0+0x6c>
200038be:	2c2b      	cmp	r4, #43	; 0x2b
200038c0:	bf04      	itt	eq
200038c2:	782c      	ldrbeq	r4, [r5, #0]
200038c4:	1cb5      	addeq	r5, r6, #2
200038c6:	e7ca      	b.n	2000385e <_strtol_l.constprop.0+0x3a>
200038c8:	f1a4 0e41 	sub.w	lr, r4, #65	; 0x41
200038cc:	f1be 0f19 	cmp.w	lr, #25
200038d0:	d801      	bhi.n	200038d6 <_strtol_l.constprop.0+0xb2>
200038d2:	3c37      	subs	r4, #55	; 0x37
200038d4:	e7e2      	b.n	2000389c <_strtol_l.constprop.0+0x78>
200038d6:	f1a4 0e61 	sub.w	lr, r4, #97	; 0x61
200038da:	f1be 0f19 	cmp.w	lr, #25
200038de:	d804      	bhi.n	200038ea <_strtol_l.constprop.0+0xc6>
200038e0:	3c57      	subs	r4, #87	; 0x57
200038e2:	e7db      	b.n	2000389c <_strtol_l.constprop.0+0x78>
200038e4:	f04f 3cff 	mov.w	ip, #4294967295	; 0xffffffff
200038e8:	e7e6      	b.n	200038b8 <_strtol_l.constprop.0+0x94>
200038ea:	f1bc 0f00 	cmp.w	ip, #0
200038ee:	da05      	bge.n	200038fc <_strtol_l.constprop.0+0xd8>
200038f0:	2322      	movs	r3, #34	; 0x22
200038f2:	6003      	str	r3, [r0, #0]
200038f4:	4646      	mov	r6, r8
200038f6:	b942      	cbnz	r2, 2000390a <_strtol_l.constprop.0+0xe6>
200038f8:	4630      	mov	r0, r6
200038fa:	e79e      	b.n	2000383a <_strtol_l.constprop.0+0x16>
200038fc:	b107      	cbz	r7, 20003900 <_strtol_l.constprop.0+0xdc>
200038fe:	4276      	negs	r6, r6
20003900:	2a00      	cmp	r2, #0
20003902:	d0f9      	beq.n	200038f8 <_strtol_l.constprop.0+0xd4>
20003904:	f1bc 0f00 	cmp.w	ip, #0
20003908:	d000      	beq.n	2000390c <_strtol_l.constprop.0+0xe8>
2000390a:	1e69      	subs	r1, r5, #1
2000390c:	6011      	str	r1, [r2, #0]
2000390e:	e7f3      	b.n	200038f8 <_strtol_l.constprop.0+0xd4>
20003910:	2430      	movs	r4, #48	; 0x30
20003912:	2b00      	cmp	r3, #0
20003914:	d1b1      	bne.n	2000387a <_strtol_l.constprop.0+0x56>
20003916:	2308      	movs	r3, #8
20003918:	e7af      	b.n	2000387a <_strtol_l.constprop.0+0x56>
2000391a:	2c30      	cmp	r4, #48	; 0x30
2000391c:	d0a5      	beq.n	2000386a <_strtol_l.constprop.0+0x46>
2000391e:	230a      	movs	r3, #10
20003920:	e7ab      	b.n	2000387a <_strtol_l.constprop.0+0x56>
20003922:	bf00      	nop
20003924:	20004484 	.word	0x20004484

20003928 <strtol>:
20003928:	4613      	mov	r3, r2
2000392a:	460a      	mov	r2, r1
2000392c:	4601      	mov	r1, r0
2000392e:	4802      	ldr	r0, [pc, #8]	; (20003938 <strtol+0x10>)
20003930:	6800      	ldr	r0, [r0, #0]
20003932:	f7ff bf77 	b.w	20003824 <_strtol_l.constprop.0>
20003936:	bf00      	nop
20003938:	200045dc 	.word	0x200045dc

2000393c <_vsniprintf_r>:
2000393c:	b530      	push	{r4, r5, lr}
2000393e:	4614      	mov	r4, r2
20003940:	2c00      	cmp	r4, #0
20003942:	b09b      	sub	sp, #108	; 0x6c
20003944:	4605      	mov	r5, r0
20003946:	461a      	mov	r2, r3
20003948:	da05      	bge.n	20003956 <_vsniprintf_r+0x1a>
2000394a:	238b      	movs	r3, #139	; 0x8b
2000394c:	6003      	str	r3, [r0, #0]
2000394e:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
20003952:	b01b      	add	sp, #108	; 0x6c
20003954:	bd30      	pop	{r4, r5, pc}
20003956:	f44f 7302 	mov.w	r3, #520	; 0x208
2000395a:	f8ad 300c 	strh.w	r3, [sp, #12]
2000395e:	bf14      	ite	ne
20003960:	f104 33ff 	addne.w	r3, r4, #4294967295	; 0xffffffff
20003964:	4623      	moveq	r3, r4
20003966:	9302      	str	r3, [sp, #8]
20003968:	9305      	str	r3, [sp, #20]
2000396a:	f64f 73ff 	movw	r3, #65535	; 0xffff
2000396e:	9100      	str	r1, [sp, #0]
20003970:	9104      	str	r1, [sp, #16]
20003972:	f8ad 300e 	strh.w	r3, [sp, #14]
20003976:	4669      	mov	r1, sp
20003978:	9b1e      	ldr	r3, [sp, #120]	; 0x78
2000397a:	f000 f87b 	bl	20003a74 <_svfiprintf_r>
2000397e:	1c43      	adds	r3, r0, #1
20003980:	bfbc      	itt	lt
20003982:	238b      	movlt	r3, #139	; 0x8b
20003984:	602b      	strlt	r3, [r5, #0]
20003986:	2c00      	cmp	r4, #0
20003988:	d0e3      	beq.n	20003952 <_vsniprintf_r+0x16>
2000398a:	9b00      	ldr	r3, [sp, #0]
2000398c:	2200      	movs	r2, #0
2000398e:	701a      	strb	r2, [r3, #0]
20003990:	e7df      	b.n	20003952 <_vsniprintf_r+0x16>
	...

20003994 <vsniprintf>:
20003994:	b507      	push	{r0, r1, r2, lr}
20003996:	9300      	str	r3, [sp, #0]
20003998:	4613      	mov	r3, r2
2000399a:	460a      	mov	r2, r1
2000399c:	4601      	mov	r1, r0
2000399e:	4803      	ldr	r0, [pc, #12]	; (200039ac <vsniprintf+0x18>)
200039a0:	6800      	ldr	r0, [r0, #0]
200039a2:	f7ff ffcb 	bl	2000393c <_vsniprintf_r>
200039a6:	b003      	add	sp, #12
200039a8:	f85d fb04 	ldr.w	pc, [sp], #4
200039ac:	200045dc 	.word	0x200045dc

200039b0 <__errno>:
200039b0:	4b01      	ldr	r3, [pc, #4]	; (200039b8 <__errno+0x8>)
200039b2:	6818      	ldr	r0, [r3, #0]
200039b4:	4770      	bx	lr
200039b6:	bf00      	nop
200039b8:	200045dc 	.word	0x200045dc

200039bc <__ssputs_r>:
200039bc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
200039c0:	688e      	ldr	r6, [r1, #8]
200039c2:	429e      	cmp	r6, r3
200039c4:	4682      	mov	sl, r0
200039c6:	460c      	mov	r4, r1
200039c8:	4690      	mov	r8, r2
200039ca:	461f      	mov	r7, r3
200039cc:	d838      	bhi.n	20003a40 <__ssputs_r+0x84>
200039ce:	898a      	ldrh	r2, [r1, #12]
200039d0:	f412 6f90 	tst.w	r2, #1152	; 0x480
200039d4:	d032      	beq.n	20003a3c <__ssputs_r+0x80>
200039d6:	6825      	ldr	r5, [r4, #0]
200039d8:	6909      	ldr	r1, [r1, #16]
200039da:	eba5 0901 	sub.w	r9, r5, r1
200039de:	6965      	ldr	r5, [r4, #20]
200039e0:	eb05 0545 	add.w	r5, r5, r5, lsl #1
200039e4:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
200039e8:	3301      	adds	r3, #1
200039ea:	444b      	add	r3, r9
200039ec:	106d      	asrs	r5, r5, #1
200039ee:	429d      	cmp	r5, r3
200039f0:	bf38      	it	cc
200039f2:	461d      	movcc	r5, r3
200039f4:	0553      	lsls	r3, r2, #21
200039f6:	d531      	bpl.n	20003a5c <__ssputs_r+0xa0>
200039f8:	4629      	mov	r1, r5
200039fa:	f7fe fa1d 	bl	20001e38 <_malloc_r>
200039fe:	4606      	mov	r6, r0
20003a00:	b950      	cbnz	r0, 20003a18 <__ssputs_r+0x5c>
20003a02:	230c      	movs	r3, #12
20003a04:	f8ca 3000 	str.w	r3, [sl]
20003a08:	89a3      	ldrh	r3, [r4, #12]
20003a0a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
20003a0e:	81a3      	strh	r3, [r4, #12]
20003a10:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
20003a14:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20003a18:	6921      	ldr	r1, [r4, #16]
20003a1a:	464a      	mov	r2, r9
20003a1c:	f7ff feb4 	bl	20003788 <memcpy>
20003a20:	89a3      	ldrh	r3, [r4, #12]
20003a22:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
20003a26:	f043 0380 	orr.w	r3, r3, #128	; 0x80
20003a2a:	81a3      	strh	r3, [r4, #12]
20003a2c:	6126      	str	r6, [r4, #16]
20003a2e:	6165      	str	r5, [r4, #20]
20003a30:	444e      	add	r6, r9
20003a32:	eba5 0509 	sub.w	r5, r5, r9
20003a36:	6026      	str	r6, [r4, #0]
20003a38:	60a5      	str	r5, [r4, #8]
20003a3a:	463e      	mov	r6, r7
20003a3c:	42be      	cmp	r6, r7
20003a3e:	d900      	bls.n	20003a42 <__ssputs_r+0x86>
20003a40:	463e      	mov	r6, r7
20003a42:	6820      	ldr	r0, [r4, #0]
20003a44:	4632      	mov	r2, r6
20003a46:	4641      	mov	r1, r8
20003a48:	f7ff feac 	bl	200037a4 <memmove>
20003a4c:	68a3      	ldr	r3, [r4, #8]
20003a4e:	1b9b      	subs	r3, r3, r6
20003a50:	60a3      	str	r3, [r4, #8]
20003a52:	6823      	ldr	r3, [r4, #0]
20003a54:	4433      	add	r3, r6
20003a56:	6023      	str	r3, [r4, #0]
20003a58:	2000      	movs	r0, #0
20003a5a:	e7db      	b.n	20003a14 <__ssputs_r+0x58>
20003a5c:	462a      	mov	r2, r5
20003a5e:	f7fe f9f0 	bl	20001e42 <_realloc_r>
20003a62:	4606      	mov	r6, r0
20003a64:	2800      	cmp	r0, #0
20003a66:	d1e1      	bne.n	20003a2c <__ssputs_r+0x70>
20003a68:	6921      	ldr	r1, [r4, #16]
20003a6a:	4650      	mov	r0, sl
20003a6c:	f7fe fa05 	bl	20001e7a <_free_r>
20003a70:	e7c7      	b.n	20003a02 <__ssputs_r+0x46>
	...

20003a74 <_svfiprintf_r>:
20003a74:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20003a78:	4698      	mov	r8, r3
20003a7a:	898b      	ldrh	r3, [r1, #12]
20003a7c:	061b      	lsls	r3, r3, #24
20003a7e:	b09d      	sub	sp, #116	; 0x74
20003a80:	4607      	mov	r7, r0
20003a82:	460d      	mov	r5, r1
20003a84:	4614      	mov	r4, r2
20003a86:	d50e      	bpl.n	20003aa6 <_svfiprintf_r+0x32>
20003a88:	690b      	ldr	r3, [r1, #16]
20003a8a:	b963      	cbnz	r3, 20003aa6 <_svfiprintf_r+0x32>
20003a8c:	2140      	movs	r1, #64	; 0x40
20003a8e:	f7fe f9d3 	bl	20001e38 <_malloc_r>
20003a92:	6028      	str	r0, [r5, #0]
20003a94:	6128      	str	r0, [r5, #16]
20003a96:	b920      	cbnz	r0, 20003aa2 <_svfiprintf_r+0x2e>
20003a98:	230c      	movs	r3, #12
20003a9a:	603b      	str	r3, [r7, #0]
20003a9c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
20003aa0:	e0d1      	b.n	20003c46 <_svfiprintf_r+0x1d2>
20003aa2:	2340      	movs	r3, #64	; 0x40
20003aa4:	616b      	str	r3, [r5, #20]
20003aa6:	2300      	movs	r3, #0
20003aa8:	9309      	str	r3, [sp, #36]	; 0x24
20003aaa:	2320      	movs	r3, #32
20003aac:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
20003ab0:	f8cd 800c 	str.w	r8, [sp, #12]
20003ab4:	2330      	movs	r3, #48	; 0x30
20003ab6:	f8df 81a8 	ldr.w	r8, [pc, #424]	; 20003c60 <_svfiprintf_r+0x1ec>
20003aba:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
20003abe:	f04f 0901 	mov.w	r9, #1
20003ac2:	4623      	mov	r3, r4
20003ac4:	469a      	mov	sl, r3
20003ac6:	f813 2b01 	ldrb.w	r2, [r3], #1
20003aca:	b10a      	cbz	r2, 20003ad0 <_svfiprintf_r+0x5c>
20003acc:	2a25      	cmp	r2, #37	; 0x25
20003ace:	d1f9      	bne.n	20003ac4 <_svfiprintf_r+0x50>
20003ad0:	ebba 0b04 	subs.w	fp, sl, r4
20003ad4:	d00b      	beq.n	20003aee <_svfiprintf_r+0x7a>
20003ad6:	465b      	mov	r3, fp
20003ad8:	4622      	mov	r2, r4
20003ada:	4629      	mov	r1, r5
20003adc:	4638      	mov	r0, r7
20003ade:	f7ff ff6d 	bl	200039bc <__ssputs_r>
20003ae2:	3001      	adds	r0, #1
20003ae4:	f000 80aa 	beq.w	20003c3c <_svfiprintf_r+0x1c8>
20003ae8:	9a09      	ldr	r2, [sp, #36]	; 0x24
20003aea:	445a      	add	r2, fp
20003aec:	9209      	str	r2, [sp, #36]	; 0x24
20003aee:	f89a 3000 	ldrb.w	r3, [sl]
20003af2:	2b00      	cmp	r3, #0
20003af4:	f000 80a2 	beq.w	20003c3c <_svfiprintf_r+0x1c8>
20003af8:	2300      	movs	r3, #0
20003afa:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
20003afe:	e9cd 2305 	strd	r2, r3, [sp, #20]
20003b02:	f10a 0a01 	add.w	sl, sl, #1
20003b06:	9304      	str	r3, [sp, #16]
20003b08:	9307      	str	r3, [sp, #28]
20003b0a:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
20003b0e:	931a      	str	r3, [sp, #104]	; 0x68
20003b10:	4654      	mov	r4, sl
20003b12:	2205      	movs	r2, #5
20003b14:	f814 1b01 	ldrb.w	r1, [r4], #1
20003b18:	4851      	ldr	r0, [pc, #324]	; (20003c60 <_svfiprintf_r+0x1ec>)
20003b1a:	f000 fa41 	bl	20003fa0 <memchr>
20003b1e:	9a04      	ldr	r2, [sp, #16]
20003b20:	b9d8      	cbnz	r0, 20003b5a <_svfiprintf_r+0xe6>
20003b22:	06d0      	lsls	r0, r2, #27
20003b24:	bf44      	itt	mi
20003b26:	2320      	movmi	r3, #32
20003b28:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
20003b2c:	0711      	lsls	r1, r2, #28
20003b2e:	bf44      	itt	mi
20003b30:	232b      	movmi	r3, #43	; 0x2b
20003b32:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
20003b36:	f89a 3000 	ldrb.w	r3, [sl]
20003b3a:	2b2a      	cmp	r3, #42	; 0x2a
20003b3c:	d015      	beq.n	20003b6a <_svfiprintf_r+0xf6>
20003b3e:	9a07      	ldr	r2, [sp, #28]
20003b40:	4654      	mov	r4, sl
20003b42:	2000      	movs	r0, #0
20003b44:	f04f 0c0a 	mov.w	ip, #10
20003b48:	4621      	mov	r1, r4
20003b4a:	f811 3b01 	ldrb.w	r3, [r1], #1
20003b4e:	3b30      	subs	r3, #48	; 0x30
20003b50:	2b09      	cmp	r3, #9
20003b52:	d94e      	bls.n	20003bf2 <_svfiprintf_r+0x17e>
20003b54:	b1b0      	cbz	r0, 20003b84 <_svfiprintf_r+0x110>
20003b56:	9207      	str	r2, [sp, #28]
20003b58:	e014      	b.n	20003b84 <_svfiprintf_r+0x110>
20003b5a:	eba0 0308 	sub.w	r3, r0, r8
20003b5e:	fa09 f303 	lsl.w	r3, r9, r3
20003b62:	4313      	orrs	r3, r2
20003b64:	9304      	str	r3, [sp, #16]
20003b66:	46a2      	mov	sl, r4
20003b68:	e7d2      	b.n	20003b10 <_svfiprintf_r+0x9c>
20003b6a:	9b03      	ldr	r3, [sp, #12]
20003b6c:	1d19      	adds	r1, r3, #4
20003b6e:	681b      	ldr	r3, [r3, #0]
20003b70:	9103      	str	r1, [sp, #12]
20003b72:	2b00      	cmp	r3, #0
20003b74:	bfbb      	ittet	lt
20003b76:	425b      	neglt	r3, r3
20003b78:	f042 0202 	orrlt.w	r2, r2, #2
20003b7c:	9307      	strge	r3, [sp, #28]
20003b7e:	9307      	strlt	r3, [sp, #28]
20003b80:	bfb8      	it	lt
20003b82:	9204      	strlt	r2, [sp, #16]
20003b84:	7823      	ldrb	r3, [r4, #0]
20003b86:	2b2e      	cmp	r3, #46	; 0x2e
20003b88:	d10c      	bne.n	20003ba4 <_svfiprintf_r+0x130>
20003b8a:	7863      	ldrb	r3, [r4, #1]
20003b8c:	2b2a      	cmp	r3, #42	; 0x2a
20003b8e:	d135      	bne.n	20003bfc <_svfiprintf_r+0x188>
20003b90:	9b03      	ldr	r3, [sp, #12]
20003b92:	1d1a      	adds	r2, r3, #4
20003b94:	681b      	ldr	r3, [r3, #0]
20003b96:	9203      	str	r2, [sp, #12]
20003b98:	2b00      	cmp	r3, #0
20003b9a:	bfb8      	it	lt
20003b9c:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
20003ba0:	3402      	adds	r4, #2
20003ba2:	9305      	str	r3, [sp, #20]
20003ba4:	f8df a0c8 	ldr.w	sl, [pc, #200]	; 20003c70 <_svfiprintf_r+0x1fc>
20003ba8:	7821      	ldrb	r1, [r4, #0]
20003baa:	2203      	movs	r2, #3
20003bac:	4650      	mov	r0, sl
20003bae:	f000 f9f7 	bl	20003fa0 <memchr>
20003bb2:	b140      	cbz	r0, 20003bc6 <_svfiprintf_r+0x152>
20003bb4:	2340      	movs	r3, #64	; 0x40
20003bb6:	eba0 000a 	sub.w	r0, r0, sl
20003bba:	fa03 f000 	lsl.w	r0, r3, r0
20003bbe:	9b04      	ldr	r3, [sp, #16]
20003bc0:	4303      	orrs	r3, r0
20003bc2:	3401      	adds	r4, #1
20003bc4:	9304      	str	r3, [sp, #16]
20003bc6:	f814 1b01 	ldrb.w	r1, [r4], #1
20003bca:	4826      	ldr	r0, [pc, #152]	; (20003c64 <_svfiprintf_r+0x1f0>)
20003bcc:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
20003bd0:	2206      	movs	r2, #6
20003bd2:	f000 f9e5 	bl	20003fa0 <memchr>
20003bd6:	2800      	cmp	r0, #0
20003bd8:	d038      	beq.n	20003c4c <_svfiprintf_r+0x1d8>
20003bda:	4b23      	ldr	r3, [pc, #140]	; (20003c68 <_svfiprintf_r+0x1f4>)
20003bdc:	bb1b      	cbnz	r3, 20003c26 <_svfiprintf_r+0x1b2>
20003bde:	9b03      	ldr	r3, [sp, #12]
20003be0:	3307      	adds	r3, #7
20003be2:	f023 0307 	bic.w	r3, r3, #7
20003be6:	3308      	adds	r3, #8
20003be8:	9303      	str	r3, [sp, #12]
20003bea:	9b09      	ldr	r3, [sp, #36]	; 0x24
20003bec:	4433      	add	r3, r6
20003bee:	9309      	str	r3, [sp, #36]	; 0x24
20003bf0:	e767      	b.n	20003ac2 <_svfiprintf_r+0x4e>
20003bf2:	fb0c 3202 	mla	r2, ip, r2, r3
20003bf6:	460c      	mov	r4, r1
20003bf8:	2001      	movs	r0, #1
20003bfa:	e7a5      	b.n	20003b48 <_svfiprintf_r+0xd4>
20003bfc:	2300      	movs	r3, #0
20003bfe:	3401      	adds	r4, #1
20003c00:	9305      	str	r3, [sp, #20]
20003c02:	4619      	mov	r1, r3
20003c04:	f04f 0c0a 	mov.w	ip, #10
20003c08:	4620      	mov	r0, r4
20003c0a:	f810 2b01 	ldrb.w	r2, [r0], #1
20003c0e:	3a30      	subs	r2, #48	; 0x30
20003c10:	2a09      	cmp	r2, #9
20003c12:	d903      	bls.n	20003c1c <_svfiprintf_r+0x1a8>
20003c14:	2b00      	cmp	r3, #0
20003c16:	d0c5      	beq.n	20003ba4 <_svfiprintf_r+0x130>
20003c18:	9105      	str	r1, [sp, #20]
20003c1a:	e7c3      	b.n	20003ba4 <_svfiprintf_r+0x130>
20003c1c:	fb0c 2101 	mla	r1, ip, r1, r2
20003c20:	4604      	mov	r4, r0
20003c22:	2301      	movs	r3, #1
20003c24:	e7f0      	b.n	20003c08 <_svfiprintf_r+0x194>
20003c26:	ab03      	add	r3, sp, #12
20003c28:	9300      	str	r3, [sp, #0]
20003c2a:	462a      	mov	r2, r5
20003c2c:	4b0f      	ldr	r3, [pc, #60]	; (20003c6c <_svfiprintf_r+0x1f8>)
20003c2e:	a904      	add	r1, sp, #16
20003c30:	4638      	mov	r0, r7
20003c32:	f3af 8000 	nop.w
20003c36:	1c42      	adds	r2, r0, #1
20003c38:	4606      	mov	r6, r0
20003c3a:	d1d6      	bne.n	20003bea <_svfiprintf_r+0x176>
20003c3c:	89ab      	ldrh	r3, [r5, #12]
20003c3e:	065b      	lsls	r3, r3, #25
20003c40:	f53f af2c 	bmi.w	20003a9c <_svfiprintf_r+0x28>
20003c44:	9809      	ldr	r0, [sp, #36]	; 0x24
20003c46:	b01d      	add	sp, #116	; 0x74
20003c48:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20003c4c:	ab03      	add	r3, sp, #12
20003c4e:	9300      	str	r3, [sp, #0]
20003c50:	462a      	mov	r2, r5
20003c52:	4b06      	ldr	r3, [pc, #24]	; (20003c6c <_svfiprintf_r+0x1f8>)
20003c54:	a904      	add	r1, sp, #16
20003c56:	4638      	mov	r0, r7
20003c58:	f000 f87a 	bl	20003d50 <_printf_i>
20003c5c:	e7eb      	b.n	20003c36 <_svfiprintf_r+0x1c2>
20003c5e:	bf00      	nop
20003c60:	20004584 	.word	0x20004584
20003c64:	2000458e 	.word	0x2000458e
20003c68:	00000000 	.word	0x00000000
20003c6c:	200039bd 	.word	0x200039bd
20003c70:	2000458a 	.word	0x2000458a

20003c74 <_printf_common>:
20003c74:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20003c78:	4616      	mov	r6, r2
20003c7a:	4699      	mov	r9, r3
20003c7c:	688a      	ldr	r2, [r1, #8]
20003c7e:	690b      	ldr	r3, [r1, #16]
20003c80:	f8dd 8020 	ldr.w	r8, [sp, #32]
20003c84:	4293      	cmp	r3, r2
20003c86:	bfb8      	it	lt
20003c88:	4613      	movlt	r3, r2
20003c8a:	6033      	str	r3, [r6, #0]
20003c8c:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
20003c90:	4607      	mov	r7, r0
20003c92:	460c      	mov	r4, r1
20003c94:	b10a      	cbz	r2, 20003c9a <_printf_common+0x26>
20003c96:	3301      	adds	r3, #1
20003c98:	6033      	str	r3, [r6, #0]
20003c9a:	6823      	ldr	r3, [r4, #0]
20003c9c:	0699      	lsls	r1, r3, #26
20003c9e:	bf42      	ittt	mi
20003ca0:	6833      	ldrmi	r3, [r6, #0]
20003ca2:	3302      	addmi	r3, #2
20003ca4:	6033      	strmi	r3, [r6, #0]
20003ca6:	6825      	ldr	r5, [r4, #0]
20003ca8:	f015 0506 	ands.w	r5, r5, #6
20003cac:	d106      	bne.n	20003cbc <_printf_common+0x48>
20003cae:	f104 0a19 	add.w	sl, r4, #25
20003cb2:	68e3      	ldr	r3, [r4, #12]
20003cb4:	6832      	ldr	r2, [r6, #0]
20003cb6:	1a9b      	subs	r3, r3, r2
20003cb8:	42ab      	cmp	r3, r5
20003cba:	dc26      	bgt.n	20003d0a <_printf_common+0x96>
20003cbc:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
20003cc0:	1e13      	subs	r3, r2, #0
20003cc2:	6822      	ldr	r2, [r4, #0]
20003cc4:	bf18      	it	ne
20003cc6:	2301      	movne	r3, #1
20003cc8:	0692      	lsls	r2, r2, #26
20003cca:	d42b      	bmi.n	20003d24 <_printf_common+0xb0>
20003ccc:	f104 0243 	add.w	r2, r4, #67	; 0x43
20003cd0:	4649      	mov	r1, r9
20003cd2:	4638      	mov	r0, r7
20003cd4:	47c0      	blx	r8
20003cd6:	3001      	adds	r0, #1
20003cd8:	d01e      	beq.n	20003d18 <_printf_common+0xa4>
20003cda:	6823      	ldr	r3, [r4, #0]
20003cdc:	68e5      	ldr	r5, [r4, #12]
20003cde:	6832      	ldr	r2, [r6, #0]
20003ce0:	f003 0306 	and.w	r3, r3, #6
20003ce4:	2b04      	cmp	r3, #4
20003ce6:	bf08      	it	eq
20003ce8:	1aad      	subeq	r5, r5, r2
20003cea:	68a3      	ldr	r3, [r4, #8]
20003cec:	6922      	ldr	r2, [r4, #16]
20003cee:	bf0c      	ite	eq
20003cf0:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
20003cf4:	2500      	movne	r5, #0
20003cf6:	4293      	cmp	r3, r2
20003cf8:	bfc4      	itt	gt
20003cfa:	1a9b      	subgt	r3, r3, r2
20003cfc:	18ed      	addgt	r5, r5, r3
20003cfe:	2600      	movs	r6, #0
20003d00:	341a      	adds	r4, #26
20003d02:	42b5      	cmp	r5, r6
20003d04:	d11a      	bne.n	20003d3c <_printf_common+0xc8>
20003d06:	2000      	movs	r0, #0
20003d08:	e008      	b.n	20003d1c <_printf_common+0xa8>
20003d0a:	2301      	movs	r3, #1
20003d0c:	4652      	mov	r2, sl
20003d0e:	4649      	mov	r1, r9
20003d10:	4638      	mov	r0, r7
20003d12:	47c0      	blx	r8
20003d14:	3001      	adds	r0, #1
20003d16:	d103      	bne.n	20003d20 <_printf_common+0xac>
20003d18:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
20003d1c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20003d20:	3501      	adds	r5, #1
20003d22:	e7c6      	b.n	20003cb2 <_printf_common+0x3e>
20003d24:	18e1      	adds	r1, r4, r3
20003d26:	1c5a      	adds	r2, r3, #1
20003d28:	2030      	movs	r0, #48	; 0x30
20003d2a:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
20003d2e:	4422      	add	r2, r4
20003d30:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
20003d34:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
20003d38:	3302      	adds	r3, #2
20003d3a:	e7c7      	b.n	20003ccc <_printf_common+0x58>
20003d3c:	2301      	movs	r3, #1
20003d3e:	4622      	mov	r2, r4
20003d40:	4649      	mov	r1, r9
20003d42:	4638      	mov	r0, r7
20003d44:	47c0      	blx	r8
20003d46:	3001      	adds	r0, #1
20003d48:	d0e6      	beq.n	20003d18 <_printf_common+0xa4>
20003d4a:	3601      	adds	r6, #1
20003d4c:	e7d9      	b.n	20003d02 <_printf_common+0x8e>
	...

20003d50 <_printf_i>:
20003d50:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
20003d54:	7e0f      	ldrb	r7, [r1, #24]
20003d56:	9d0c      	ldr	r5, [sp, #48]	; 0x30
20003d58:	2f78      	cmp	r7, #120	; 0x78
20003d5a:	4691      	mov	r9, r2
20003d5c:	4680      	mov	r8, r0
20003d5e:	460c      	mov	r4, r1
20003d60:	469a      	mov	sl, r3
20003d62:	f101 0243 	add.w	r2, r1, #67	; 0x43
20003d66:	d807      	bhi.n	20003d78 <_printf_i+0x28>
20003d68:	2f62      	cmp	r7, #98	; 0x62
20003d6a:	d80a      	bhi.n	20003d82 <_printf_i+0x32>
20003d6c:	2f00      	cmp	r7, #0
20003d6e:	f000 80d8 	beq.w	20003f22 <_printf_i+0x1d2>
20003d72:	2f58      	cmp	r7, #88	; 0x58
20003d74:	f000 80a3 	beq.w	20003ebe <_printf_i+0x16e>
20003d78:	f104 0542 	add.w	r5, r4, #66	; 0x42
20003d7c:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
20003d80:	e03a      	b.n	20003df8 <_printf_i+0xa8>
20003d82:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
20003d86:	2b15      	cmp	r3, #21
20003d88:	d8f6      	bhi.n	20003d78 <_printf_i+0x28>
20003d8a:	a101      	add	r1, pc, #4	; (adr r1, 20003d90 <_printf_i+0x40>)
20003d8c:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
20003d90:	20003de9 	.word	0x20003de9
20003d94:	20003dfd 	.word	0x20003dfd
20003d98:	20003d79 	.word	0x20003d79
20003d9c:	20003d79 	.word	0x20003d79
20003da0:	20003d79 	.word	0x20003d79
20003da4:	20003d79 	.word	0x20003d79
20003da8:	20003dfd 	.word	0x20003dfd
20003dac:	20003d79 	.word	0x20003d79
20003db0:	20003d79 	.word	0x20003d79
20003db4:	20003d79 	.word	0x20003d79
20003db8:	20003d79 	.word	0x20003d79
20003dbc:	20003f09 	.word	0x20003f09
20003dc0:	20003e2d 	.word	0x20003e2d
20003dc4:	20003eeb 	.word	0x20003eeb
20003dc8:	20003d79 	.word	0x20003d79
20003dcc:	20003d79 	.word	0x20003d79
20003dd0:	20003f2b 	.word	0x20003f2b
20003dd4:	20003d79 	.word	0x20003d79
20003dd8:	20003e2d 	.word	0x20003e2d
20003ddc:	20003d79 	.word	0x20003d79
20003de0:	20003d79 	.word	0x20003d79
20003de4:	20003ef3 	.word	0x20003ef3
20003de8:	682b      	ldr	r3, [r5, #0]
20003dea:	1d1a      	adds	r2, r3, #4
20003dec:	681b      	ldr	r3, [r3, #0]
20003dee:	602a      	str	r2, [r5, #0]
20003df0:	f104 0542 	add.w	r5, r4, #66	; 0x42
20003df4:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
20003df8:	2301      	movs	r3, #1
20003dfa:	e0a3      	b.n	20003f44 <_printf_i+0x1f4>
20003dfc:	6820      	ldr	r0, [r4, #0]
20003dfe:	6829      	ldr	r1, [r5, #0]
20003e00:	0606      	lsls	r6, r0, #24
20003e02:	f101 0304 	add.w	r3, r1, #4
20003e06:	d50a      	bpl.n	20003e1e <_printf_i+0xce>
20003e08:	680e      	ldr	r6, [r1, #0]
20003e0a:	602b      	str	r3, [r5, #0]
20003e0c:	2e00      	cmp	r6, #0
20003e0e:	da03      	bge.n	20003e18 <_printf_i+0xc8>
20003e10:	232d      	movs	r3, #45	; 0x2d
20003e12:	4276      	negs	r6, r6
20003e14:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
20003e18:	485e      	ldr	r0, [pc, #376]	; (20003f94 <_printf_i+0x244>)
20003e1a:	230a      	movs	r3, #10
20003e1c:	e019      	b.n	20003e52 <_printf_i+0x102>
20003e1e:	680e      	ldr	r6, [r1, #0]
20003e20:	602b      	str	r3, [r5, #0]
20003e22:	f010 0f40 	tst.w	r0, #64	; 0x40
20003e26:	bf18      	it	ne
20003e28:	b236      	sxthne	r6, r6
20003e2a:	e7ef      	b.n	20003e0c <_printf_i+0xbc>
20003e2c:	682b      	ldr	r3, [r5, #0]
20003e2e:	6820      	ldr	r0, [r4, #0]
20003e30:	1d19      	adds	r1, r3, #4
20003e32:	6029      	str	r1, [r5, #0]
20003e34:	0601      	lsls	r1, r0, #24
20003e36:	d501      	bpl.n	20003e3c <_printf_i+0xec>
20003e38:	681e      	ldr	r6, [r3, #0]
20003e3a:	e002      	b.n	20003e42 <_printf_i+0xf2>
20003e3c:	0646      	lsls	r6, r0, #25
20003e3e:	d5fb      	bpl.n	20003e38 <_printf_i+0xe8>
20003e40:	881e      	ldrh	r6, [r3, #0]
20003e42:	4854      	ldr	r0, [pc, #336]	; (20003f94 <_printf_i+0x244>)
20003e44:	2f6f      	cmp	r7, #111	; 0x6f
20003e46:	bf0c      	ite	eq
20003e48:	2308      	moveq	r3, #8
20003e4a:	230a      	movne	r3, #10
20003e4c:	2100      	movs	r1, #0
20003e4e:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
20003e52:	6865      	ldr	r5, [r4, #4]
20003e54:	60a5      	str	r5, [r4, #8]
20003e56:	2d00      	cmp	r5, #0
20003e58:	bfa2      	ittt	ge
20003e5a:	6821      	ldrge	r1, [r4, #0]
20003e5c:	f021 0104 	bicge.w	r1, r1, #4
20003e60:	6021      	strge	r1, [r4, #0]
20003e62:	b90e      	cbnz	r6, 20003e68 <_printf_i+0x118>
20003e64:	2d00      	cmp	r5, #0
20003e66:	d04d      	beq.n	20003f04 <_printf_i+0x1b4>
20003e68:	4615      	mov	r5, r2
20003e6a:	fbb6 f1f3 	udiv	r1, r6, r3
20003e6e:	fb03 6711 	mls	r7, r3, r1, r6
20003e72:	5dc7      	ldrb	r7, [r0, r7]
20003e74:	f805 7d01 	strb.w	r7, [r5, #-1]!
20003e78:	4637      	mov	r7, r6
20003e7a:	42bb      	cmp	r3, r7
20003e7c:	460e      	mov	r6, r1
20003e7e:	d9f4      	bls.n	20003e6a <_printf_i+0x11a>
20003e80:	2b08      	cmp	r3, #8
20003e82:	d10b      	bne.n	20003e9c <_printf_i+0x14c>
20003e84:	6823      	ldr	r3, [r4, #0]
20003e86:	07de      	lsls	r6, r3, #31
20003e88:	d508      	bpl.n	20003e9c <_printf_i+0x14c>
20003e8a:	6923      	ldr	r3, [r4, #16]
20003e8c:	6861      	ldr	r1, [r4, #4]
20003e8e:	4299      	cmp	r1, r3
20003e90:	bfde      	ittt	le
20003e92:	2330      	movle	r3, #48	; 0x30
20003e94:	f805 3c01 	strble.w	r3, [r5, #-1]
20003e98:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
20003e9c:	1b52      	subs	r2, r2, r5
20003e9e:	6122      	str	r2, [r4, #16]
20003ea0:	f8cd a000 	str.w	sl, [sp]
20003ea4:	464b      	mov	r3, r9
20003ea6:	aa03      	add	r2, sp, #12
20003ea8:	4621      	mov	r1, r4
20003eaa:	4640      	mov	r0, r8
20003eac:	f7ff fee2 	bl	20003c74 <_printf_common>
20003eb0:	3001      	adds	r0, #1
20003eb2:	d14c      	bne.n	20003f4e <_printf_i+0x1fe>
20003eb4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
20003eb8:	b004      	add	sp, #16
20003eba:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20003ebe:	4835      	ldr	r0, [pc, #212]	; (20003f94 <_printf_i+0x244>)
20003ec0:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
20003ec4:	6829      	ldr	r1, [r5, #0]
20003ec6:	6823      	ldr	r3, [r4, #0]
20003ec8:	f851 6b04 	ldr.w	r6, [r1], #4
20003ecc:	6029      	str	r1, [r5, #0]
20003ece:	061d      	lsls	r5, r3, #24
20003ed0:	d514      	bpl.n	20003efc <_printf_i+0x1ac>
20003ed2:	07df      	lsls	r7, r3, #31
20003ed4:	bf44      	itt	mi
20003ed6:	f043 0320 	orrmi.w	r3, r3, #32
20003eda:	6023      	strmi	r3, [r4, #0]
20003edc:	b91e      	cbnz	r6, 20003ee6 <_printf_i+0x196>
20003ede:	6823      	ldr	r3, [r4, #0]
20003ee0:	f023 0320 	bic.w	r3, r3, #32
20003ee4:	6023      	str	r3, [r4, #0]
20003ee6:	2310      	movs	r3, #16
20003ee8:	e7b0      	b.n	20003e4c <_printf_i+0xfc>
20003eea:	6823      	ldr	r3, [r4, #0]
20003eec:	f043 0320 	orr.w	r3, r3, #32
20003ef0:	6023      	str	r3, [r4, #0]
20003ef2:	2378      	movs	r3, #120	; 0x78
20003ef4:	4828      	ldr	r0, [pc, #160]	; (20003f98 <_printf_i+0x248>)
20003ef6:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
20003efa:	e7e3      	b.n	20003ec4 <_printf_i+0x174>
20003efc:	0659      	lsls	r1, r3, #25
20003efe:	bf48      	it	mi
20003f00:	b2b6      	uxthmi	r6, r6
20003f02:	e7e6      	b.n	20003ed2 <_printf_i+0x182>
20003f04:	4615      	mov	r5, r2
20003f06:	e7bb      	b.n	20003e80 <_printf_i+0x130>
20003f08:	682b      	ldr	r3, [r5, #0]
20003f0a:	6826      	ldr	r6, [r4, #0]
20003f0c:	6961      	ldr	r1, [r4, #20]
20003f0e:	1d18      	adds	r0, r3, #4
20003f10:	6028      	str	r0, [r5, #0]
20003f12:	0635      	lsls	r5, r6, #24
20003f14:	681b      	ldr	r3, [r3, #0]
20003f16:	d501      	bpl.n	20003f1c <_printf_i+0x1cc>
20003f18:	6019      	str	r1, [r3, #0]
20003f1a:	e002      	b.n	20003f22 <_printf_i+0x1d2>
20003f1c:	0670      	lsls	r0, r6, #25
20003f1e:	d5fb      	bpl.n	20003f18 <_printf_i+0x1c8>
20003f20:	8019      	strh	r1, [r3, #0]
20003f22:	2300      	movs	r3, #0
20003f24:	6123      	str	r3, [r4, #16]
20003f26:	4615      	mov	r5, r2
20003f28:	e7ba      	b.n	20003ea0 <_printf_i+0x150>
20003f2a:	682b      	ldr	r3, [r5, #0]
20003f2c:	1d1a      	adds	r2, r3, #4
20003f2e:	602a      	str	r2, [r5, #0]
20003f30:	681d      	ldr	r5, [r3, #0]
20003f32:	6862      	ldr	r2, [r4, #4]
20003f34:	2100      	movs	r1, #0
20003f36:	4628      	mov	r0, r5
20003f38:	f000 f832 	bl	20003fa0 <memchr>
20003f3c:	b108      	cbz	r0, 20003f42 <_printf_i+0x1f2>
20003f3e:	1b40      	subs	r0, r0, r5
20003f40:	6060      	str	r0, [r4, #4]
20003f42:	6863      	ldr	r3, [r4, #4]
20003f44:	6123      	str	r3, [r4, #16]
20003f46:	2300      	movs	r3, #0
20003f48:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
20003f4c:	e7a8      	b.n	20003ea0 <_printf_i+0x150>
20003f4e:	6923      	ldr	r3, [r4, #16]
20003f50:	462a      	mov	r2, r5
20003f52:	4649      	mov	r1, r9
20003f54:	4640      	mov	r0, r8
20003f56:	47d0      	blx	sl
20003f58:	3001      	adds	r0, #1
20003f5a:	d0ab      	beq.n	20003eb4 <_printf_i+0x164>
20003f5c:	6823      	ldr	r3, [r4, #0]
20003f5e:	079b      	lsls	r3, r3, #30
20003f60:	d413      	bmi.n	20003f8a <_printf_i+0x23a>
20003f62:	68e0      	ldr	r0, [r4, #12]
20003f64:	9b03      	ldr	r3, [sp, #12]
20003f66:	4298      	cmp	r0, r3
20003f68:	bfb8      	it	lt
20003f6a:	4618      	movlt	r0, r3
20003f6c:	e7a4      	b.n	20003eb8 <_printf_i+0x168>
20003f6e:	2301      	movs	r3, #1
20003f70:	4632      	mov	r2, r6
20003f72:	4649      	mov	r1, r9
20003f74:	4640      	mov	r0, r8
20003f76:	47d0      	blx	sl
20003f78:	3001      	adds	r0, #1
20003f7a:	d09b      	beq.n	20003eb4 <_printf_i+0x164>
20003f7c:	3501      	adds	r5, #1
20003f7e:	68e3      	ldr	r3, [r4, #12]
20003f80:	9903      	ldr	r1, [sp, #12]
20003f82:	1a5b      	subs	r3, r3, r1
20003f84:	42ab      	cmp	r3, r5
20003f86:	dcf2      	bgt.n	20003f6e <_printf_i+0x21e>
20003f88:	e7eb      	b.n	20003f62 <_printf_i+0x212>
20003f8a:	2500      	movs	r5, #0
20003f8c:	f104 0619 	add.w	r6, r4, #25
20003f90:	e7f5      	b.n	20003f7e <_printf_i+0x22e>
20003f92:	bf00      	nop
20003f94:	20004595 	.word	0x20004595
20003f98:	200045a6 	.word	0x200045a6
20003f9c:	00000000 	.word	0x00000000

20003fa0 <memchr>:
20003fa0:	f001 01ff 	and.w	r1, r1, #255	; 0xff
20003fa4:	2a10      	cmp	r2, #16
20003fa6:	db2b      	blt.n	20004000 <memchr+0x60>
20003fa8:	f010 0f07 	tst.w	r0, #7
20003fac:	d008      	beq.n	20003fc0 <memchr+0x20>
20003fae:	f810 3b01 	ldrb.w	r3, [r0], #1
20003fb2:	3a01      	subs	r2, #1
20003fb4:	428b      	cmp	r3, r1
20003fb6:	d02d      	beq.n	20004014 <memchr+0x74>
20003fb8:	f010 0f07 	tst.w	r0, #7
20003fbc:	b342      	cbz	r2, 20004010 <memchr+0x70>
20003fbe:	d1f6      	bne.n	20003fae <memchr+0xe>
20003fc0:	b4f0      	push	{r4, r5, r6, r7}
20003fc2:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
20003fc6:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
20003fca:	f022 0407 	bic.w	r4, r2, #7
20003fce:	f07f 0700 	mvns.w	r7, #0
20003fd2:	2300      	movs	r3, #0
20003fd4:	e8f0 5602 	ldrd	r5, r6, [r0], #8
20003fd8:	3c08      	subs	r4, #8
20003fda:	ea85 0501 	eor.w	r5, r5, r1
20003fde:	ea86 0601 	eor.w	r6, r6, r1
20003fe2:	fa85 f547 	uadd8	r5, r5, r7
20003fe6:	faa3 f587 	sel	r5, r3, r7
20003fea:	fa86 f647 	uadd8	r6, r6, r7
20003fee:	faa5 f687 	sel	r6, r5, r7
20003ff2:	b98e      	cbnz	r6, 20004018 <memchr+0x78>
20003ff4:	d1ee      	bne.n	20003fd4 <memchr+0x34>
20003ff6:	bcf0      	pop	{r4, r5, r6, r7}
20003ff8:	f001 01ff 	and.w	r1, r1, #255	; 0xff
20003ffc:	f002 0207 	and.w	r2, r2, #7
20004000:	b132      	cbz	r2, 20004010 <memchr+0x70>
20004002:	f810 3b01 	ldrb.w	r3, [r0], #1
20004006:	3a01      	subs	r2, #1
20004008:	ea83 0301 	eor.w	r3, r3, r1
2000400c:	b113      	cbz	r3, 20004014 <memchr+0x74>
2000400e:	d1f8      	bne.n	20004002 <memchr+0x62>
20004010:	2000      	movs	r0, #0
20004012:	4770      	bx	lr
20004014:	3801      	subs	r0, #1
20004016:	4770      	bx	lr
20004018:	2d00      	cmp	r5, #0
2000401a:	bf06      	itte	eq
2000401c:	4635      	moveq	r5, r6
2000401e:	3803      	subeq	r0, #3
20004020:	3807      	subne	r0, #7
20004022:	f015 0f01 	tst.w	r5, #1
20004026:	d107      	bne.n	20004038 <memchr+0x98>
20004028:	3001      	adds	r0, #1
2000402a:	f415 7f80 	tst.w	r5, #256	; 0x100
2000402e:	bf02      	ittt	eq
20004030:	3001      	addeq	r0, #1
20004032:	f415 3fc0 	tsteq.w	r5, #98304	; 0x18000
20004036:	3001      	addeq	r0, #1
20004038:	bcf0      	pop	{r4, r5, r6, r7}
2000403a:	3801      	subs	r0, #1
2000403c:	4770      	bx	lr
2000403e:	bf00      	nop
20004040:	6c6c616d 	.word	0x6c6c616d
20004044:	6620636f 	.word	0x6620636f
20004048:	6320726f 	.word	0x6320726f
2000404c:	69666e6f 	.word	0x69666e6f
20004050:	61662067 	.word	0x61662067
20004054:	64656c69 	.word	0x64656c69
20004058:	00000a0d 	.word	0x00000a0d
2000405c:	64616572 	.word	0x64616572
20004060:	6e6f6320 	.word	0x6e6f6320
20004064:	65682066 	.word	0x65682066
20004068:	72656461 	.word	0x72656461
2000406c:	69616620 	.word	0x69616620
20004070:	2c64656c 	.word	0x2c64656c
20004074:	0d642520 	.word	0x0d642520
20004078:	0000000a 	.word	0x0000000a
2000407c:	666e6f63 	.word	0x666e6f63
20004080:	6e206769 	.word	0x6e206769
20004084:	6e65206f 	.word	0x6e65206f
20004088:	78252064 	.word	0x78252064
2000408c:	00000a0d 	.word	0x00000a0d
20004090:	666e6f63 	.word	0x666e6f63
20004094:	63206769 	.word	0x63206769
20004098:	6b636568 	.word	0x6b636568
2000409c:	72726520 	.word	0x72726520
200040a0:	2520726f 	.word	0x2520726f
200040a4:	000a0d78 	.word	0x000a0d78
200040a8:	666e6f63 	.word	0x666e6f63
200040ac:	61656820 	.word	0x61656820
200040b0:	20726564 	.word	0x20726564
200040b4:	63656863 	.word	0x63656863
200040b8:	7265206b 	.word	0x7265206b
200040bc:	2c726f72 	.word	0x2c726f72
200040c0:	0d642520 	.word	0x0d642520
200040c4:	0000000a 	.word	0x0000000a
200040c8:	666e6f63 	.word	0x666e6f63
200040cc:	69206769 	.word	0x69206769
200040d0:	206d6574 	.word	0x206d6574
200040d4:	20746f6e 	.word	0x20746f6e
200040d8:	6e756f66 	.word	0x6e756f66
200040dc:	73252064 	.word	0x73252064
200040e0:	6c617620 	.word	0x6c617620
200040e4:	0a0d6575 	.word	0x0a0d6575
200040e8:	00000000 	.word	0x00000000
200040ec:	73616c66 	.word	0x73616c66
200040f0:	61745f68 	.word	0x61745f68
200040f4:	00656c62 	.word	0x00656c62
200040f8:	20746567 	.word	0x20746567
200040fc:	73616c66 	.word	0x73616c66
20004100:	61742068 	.word	0x61742068
20004104:	20656c62 	.word	0x20656c62
20004108:	6f727265 	.word	0x6f727265
2000410c:	25202c72 	.word	0x25202c72
20004110:	000a0d64 	.word	0x000a0d64
20004114:	6c6c616d 	.word	0x6c6c616d
20004118:	6620636f 	.word	0x6620636f
2000411c:	6620726f 	.word	0x6620726f
20004120:	6873616c 	.word	0x6873616c
20004124:	62617420 	.word	0x62617420
20004128:	6520656c 	.word	0x6520656c
2000412c:	726f7272 	.word	0x726f7272
20004130:	6425202c 	.word	0x6425202c
20004134:	00000a0d 	.word	0x00000a0d
20004138:	73616c66 	.word	0x73616c66
2000413c:	61742068 	.word	0x61742068
20004140:	20656c62 	.word	0x20656c62
20004144:	63656863 	.word	0x63656863
20004148:	75202c6b 	.word	0x75202c6b
2000414c:	6665646e 	.word	0x6665646e
20004150:	64656e69 	.word	0x64656e69
20004154:	67616d20 	.word	0x67616d20
20004158:	202c6369 	.word	0x202c6369
2000415c:	0a0d7825 	.word	0x0a0d7825
20004160:	00000000 	.word	0x00000000
20004164:	63656863 	.word	0x63656863
20004168:	7573206b 	.word	0x7573206b
2000416c:	25202c6d 	.word	0x25202c6d
20004170:	78252078 	.word	0x78252078
20004174:	00000a0d 	.word	0x00000a0d
20004178:	73616c66 	.word	0x73616c66
2000417c:	61742068 	.word	0x61742068
20004180:	20656c62 	.word	0x20656c62
20004184:	63656863 	.word	0x63656863
20004188:	7265206b 	.word	0x7265206b
2000418c:	2c726f72 	.word	0x2c726f72
20004190:	0d642520 	.word	0x0d642520
20004194:	0000000a 	.word	0x0000000a
20004198:	00707061 	.word	0x00707061
2000419c:	746f6f62 	.word	0x746f6f62
200041a0:	64616f6c 	.word	0x64616f6c
200041a4:	69207265 	.word	0x69207265
200041a8:	2074696e 	.word	0x2074696e
200041ac:	6f727265 	.word	0x6f727265
200041b0:	25202c72 	.word	0x25202c72
200041b4:	000a0d64 	.word	0x000a0d64
200041b8:	353a3032 	.word	0x353a3032
200041bc:	32333a35 	.word	0x32333a35
200041c0:	00000000 	.word	0x00000000
200041c4:	6f620a0d 	.word	0x6f620a0d
200041c8:	6f6c746f 	.word	0x6f6c746f
200041cc:	72656461 	.word	0x72656461
200041d0:	69756220 	.word	0x69756220
200041d4:	7420646c 	.word	0x7420646c
200041d8:	3a656d69 	.word	0x3a656d69
200041dc:	0d732520 	.word	0x0d732520
200041e0:	0000000a 	.word	0x0000000a
200041e4:	74616c70 	.word	0x74616c70
200041e8:	6d726f66 	.word	0x6d726f66
200041ec:	72726520 	.word	0x72726520
200041f0:	202c726f 	.word	0x202c726f
200041f4:	0a0d6425 	.word	0x0a0d6425
200041f8:	00000000 	.word	0x00000000
200041fc:	64616572 	.word	0x64616572
20004200:	6e6f6320 	.word	0x6e6f6320
20004204:	75676966 	.word	0x75676966
20004208:	69746172 	.word	0x69746172
2000420c:	65206e6f 	.word	0x65206e6f
20004210:	726f7272 	.word	0x726f7272
20004214:	6425202c 	.word	0x6425202c
20004218:	00000a0d 	.word	0x00000a0d
2000421c:	69726570 	.word	0x69726570
20004220:	61705f70 	.word	0x61705f70
20004224:	006d6172 	.word	0x006d6172
20004228:	0061746f 	.word	0x0061746f
2000422c:	722d6572 	.word	0x722d6572
20004230:	20646165 	.word	0x20646165
20004234:	2061746f 	.word	0x2061746f
20004238:	64616568 	.word	0x64616568
2000423c:	203a7265 	.word	0x203a7265
20004240:	0a0d7825 	.word	0x0a0d7825
20004244:	00000000 	.word	0x00000000
20004248:	64616568 	.word	0x64616568
2000424c:	63207265 	.word	0x63207265
20004250:	6b636568 	.word	0x6b636568
20004254:	6d757320 	.word	0x6d757320
20004258:	7825203a 	.word	0x7825203a
2000425c:	00000a0d 	.word	0x00000a0d
20004260:	61766e49 	.word	0x61766e49
20004264:	2064696c 	.word	0x2064696c
20004268:	2061746f 	.word	0x2061746f
2000426c:	676e656c 	.word	0x676e656c
20004270:	202c6874 	.word	0x202c6874
20004274:	0a0d6425 	.word	0x0a0d6425
20004278:	00000000 	.word	0x00000000
2000427c:	61766e49 	.word	0x61766e49
20004280:	2064696c 	.word	0x2064696c
20004284:	2061746f 	.word	0x2061746f
20004288:	64616568 	.word	0x64616568
2000428c:	202c7265 	.word	0x202c7265
20004290:	3a6d7573 	.word	0x3a6d7573
20004294:	2c782520 	.word	0x2c782520
20004298:	0d782520 	.word	0x0d782520
2000429c:	0000000a 	.word	0x0000000a
200042a0:	64616568 	.word	0x64616568
200042a4:	6c207265 	.word	0x6c207265
200042a8:	74676e65 	.word	0x74676e65
200042ac:	25203a68 	.word	0x25203a68
200042b0:	000a0d64 	.word	0x000a0d64
200042b4:	5f61746f 	.word	0x5f61746f
200042b8:	65707974 	.word	0x65707974
200042bc:	7825203a 	.word	0x7825203a
200042c0:	00000a0d 	.word	0x00000a0d
200042c4:	5f61746f 	.word	0x5f61746f
200042c8:	74736564 	.word	0x74736564
200042cc:	7325203a 	.word	0x7325203a
200042d0:	00000a0d 	.word	0x00000a0d
200042d4:	2061746f 	.word	0x2061746f
200042d8:	656c6966 	.word	0x656c6966
200042dc:	6e656c20 	.word	0x6e656c20
200042e0:	7825203a 	.word	0x7825203a
200042e4:	00000a0d 	.word	0x00000a0d
200042e8:	20776172 	.word	0x20776172
200042ec:	656c6966 	.word	0x656c6966
200042f0:	6e656c20 	.word	0x6e656c20
200042f4:	7825203a 	.word	0x7825203a
200042f8:	00000a0d 	.word	0x00000a0d
200042fc:	20776172 	.word	0x20776172
20004300:	656c6966 	.word	0x656c6966
20004304:	72657620 	.word	0x72657620
20004308:	6e6f6973 	.word	0x6e6f6973
2000430c:	7325203a 	.word	0x7325203a
20004310:	00000a0d 	.word	0x00000a0d
20004314:	20746f6e 	.word	0x20746f6e
20004318:	6e756f66 	.word	0x6e756f66
2000431c:	70752064 	.word	0x70752064
20004320:	64617267 	.word	0x64617267
20004324:	65642065 	.word	0x65642065
20004328:	202c7473 	.word	0x202c7473
2000432c:	0a0d7325 	.word	0x0a0d7325
20004330:	00000000 	.word	0x00000000
20004334:	3d474953 	.word	0x3d474953
20004338:	41595554 	.word	0x41595554
2000433c:	0000002c 	.word	0x0000002c
20004340:	2061746f 	.word	0x2061746f
20004344:	656c6966 	.word	0x656c6966
20004348:	6d757320 	.word	0x6d757320
2000434c:	72726520 	.word	0x72726520
20004350:	202c726f 	.word	0x202c726f
20004354:	206d7573 	.word	0x206d7573
20004358:	25207825 	.word	0x25207825
2000435c:	000a0d78 	.word	0x000a0d78
20004360:	65657246 	.word	0x65657246
20004364:	70616548 	.word	0x70616548
20004368:	657a6953 	.word	0x657a6953
2000436c:	6425203a 	.word	0x6425203a
20004370:	00000a0d 	.word	0x00000a0d
20004374:	636f7270 	.word	0x636f7270
20004378:	3a737365 	.word	0x3a737365
2000437c:	2e642520 	.word	0x2e642520
20004380:	25256425 	.word	0x25256425
20004384:	00000a0d 	.word	0x00000a0d
20004388:	66207a78 	.word	0x66207a78
2000438c:	73696e69 	.word	0x73696e69
20004390:	64252068 	.word	0x64252068
20004394:	00000a0d 	.word	0x00000a0d
20004398:	65207a78 	.word	0x65207a78
2000439c:	726f7272 	.word	0x726f7272
200043a0:	0d642520 	.word	0x0d642520
200043a4:	0000000a 	.word	0x0000000a
200043a8:	72677075 	.word	0x72677075
200043ac:	20656461 	.word	0x20656461
200043b0:	6c696166 	.word	0x6c696166
200043b4:	202c6465 	.word	0x202c6465
200043b8:	6f626572 	.word	0x6f626572
200043bc:	6120746f 	.word	0x6120746f
200043c0:	7220646e 	.word	0x7220646e
200043c4:	79727465 	.word	0x79727465
200043c8:	6425202c 	.word	0x6425202c
200043cc:	00000a0d 	.word	0x00000a0d
200043d0:	20776172 	.word	0x20776172
200043d4:	61746164 	.word	0x61746164
200043d8:	6d757320 	.word	0x6d757320
200043dc:	72726520 	.word	0x72726520
200043e0:	202c726f 	.word	0x202c726f
200043e4:	676e656c 	.word	0x676e656c
200043e8:	25206874 	.word	0x25206874
200043ec:	73202c64 	.word	0x73202c64
200043f0:	25206d75 	.word	0x25206d75
200043f4:	64252064 	.word	0x64252064
200043f8:	00000a0d 	.word	0x00000a0d
200043fc:	63656863 	.word	0x63656863
20004400:	6166206b 	.word	0x6166206b
20004404:	64656c69 	.word	0x64656c69
20004408:	6572202c 	.word	0x6572202c
2000440c:	746f6f62 	.word	0x746f6f62
20004410:	646e6120 	.word	0x646e6120
20004414:	74657220 	.word	0x74657220
20004418:	0a0d7972 	.word	0x0a0d7972
2000441c:	00000000 	.word	0x00000000
20004420:	73617245 	.word	0x73617245
20004424:	73202c65 	.word	0x73202c65
20004428:	74726174 	.word	0x74726174
2000442c:	64646120 	.word	0x64646120
20004430:	73736572 	.word	0x73736572
20004434:	2c782520 	.word	0x2c782520
20004438:	6e656c20 	.word	0x6e656c20
2000443c:	20687467 	.word	0x20687467
20004440:	2e6b6425 	.word	0x2e6b6425
20004444:	00000a0d 	.word	0x00000a0d
20004448:	6c625f5f 	.word	0x6c625f5f
2000444c:	7265705f 	.word	0x7265705f
20004450:	65687069 	.word	0x65687069
20004454:	5f6c6172 	.word	0x5f6c6172
20004458:	7065656b 	.word	0x7065656b
2000445c:	6568635f 	.word	0x6568635f
20004460:	73206b63 	.word	0x73206b63
20004464:	65206d75 	.word	0x65206d75
20004468:	203a7272 	.word	0x203a7272
2000446c:	202c7825 	.word	0x202c7825
20004470:	0d782520 	.word	0x0d782520
20004474:	0000000a 	.word	0x0000000a
20004478:	587a37fd 	.word	0x587a37fd
2000447c:	0000005a 	.word	0x0000005a
20004480:	5a59      	.short	0x5a59
	...

20004483 <_ctype_>:
20004483:	2000 2020 2020 2020 2020 2828 2828 2028     .         ((((( 
20004493:	2020 2020 2020 2020 2020 2020 2020 2020                     
200044a3:	8820 1010 1010 1010 1010 1010 1010 1010      ...............
200044b3:	0410 0404 0404 0404 0404 1004 1010 1010     ................
200044c3:	1010 4141 4141 4141 0101 0101 0101 0101     ..AAAAAA........
200044d3:	0101 0101 0101 0101 0101 0101 1010 1010     ................
200044e3:	1010 4242 4242 4242 0202 0202 0202 0202     ..BBBBBB........
200044f3:	0202 0202 0202 0202 0202 0202 1010 1010     ................
20004503:	0020 0000 0000 0000 0000 0000 0000 0000      ...............
	...
20004583:	2300 302d 202b 6800 4c6c 6500 6766 4645     .#-0+ .hlL.efgEF
20004593:	0047 3130 3332 3534 3736 3938 4241 4443     G.0123456789ABCD
200045a3:	4645 3000 3231 3433 3635 3837 6139 6362     EF.0123456789abc
200045b3:	6564 0066                                    def..

200045b8 <__frame_dummy_init_array_entry>:
200045b8:	02b5 2000                                   ... 

200045bc <__do_global_dtors_aux_fini_array_entry>:
200045bc:	0291 2000                                   ... 

200045c0 <_init>:
200045c0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
200045c2:	bf00      	nop
200045c4:	bcf8      	pop	{r3, r4, r5, r6, r7}
200045c6:	bc08      	pop	{r3}
200045c8:	469e      	mov	lr, r3
200045ca:	4770      	bx	lr

200045cc <_fini>:
200045cc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
200045ce:	bf00      	nop
200045d0:	bcf8      	pop	{r3, r4, r5, r6, r7}
200045d2:	bc08      	pop	{r3}
200045d4:	469e      	mov	lr, r3
200045d6:	4770      	bx	lr

200045d8 <SystemCoreClock>:
200045d8:	5a00 0262                                   .Zb.

200045dc <_impure_ptr>:
200045dc:	45e0 2000                                   .E. 

200045e0 <impure_data>:
	...

20004640 <__EH_FRAME_BEGIN__>:
20004640:	0000 0000                                   ....
