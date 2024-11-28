OUTPUT_FORMAT("elf32-littlearm", "elf32-gigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(Reset_Handler)

/* Linker script to configure memory regions. */
MEMORY
{
  FLASH     (rx)  : ORIGIN = 0x00000000, LENGTH = 24K
  RAM0      (rwx) : ORIGIN = 0x20000000, LENGTH = 256K
  RETENTION (rwx) : ORIGIN = 0x20049C00, LENGTH = 1K
  CACHE_MEM (rwx) : ORIGIN = 0x2004A000, LENGTH = 32K
}


SECTIONS
{
	.text : {
        __text_start__ = .;
		KEEP(*(.boot_header))         /* header of bootloader */
		. = ALIGN(256);

		KEEP(*(.vectors))             /* startup code: ARM vectors */
		. = ALIGN(4);

		*(.text*)

		. = ALIGN(4);
		*(.rodata*)

		. = ALIGN(4);
		/* preinit data */
		PROVIDE_HIDDEN (__preinit_array_start = .);
		KEEP(*(.preinit_array))
		PROVIDE_HIDDEN (__preinit_array_end = .);

		. = ALIGN(4);
		/* init data */
		PROVIDE_HIDDEN (__init_array_start = .);
		KEEP(*(SORT(.init_array.*)))
		KEEP(*(.init_array))
		PROVIDE_HIDDEN (__init_array_end = .);

		. = ALIGN(4);
		/* finit data */
		PROVIDE_HIDDEN (__fini_array_start = .);
		KEEP(*(SORT(.fini_array.*)))
		KEEP(*(.fini_array))
		PROVIDE_HIDDEN (__fini_array_end = .);

		KEEP(*(.jcr*))
		. = ALIGN(4);


		KEEP(*(.init))
		KEEP(*(.fini))

		/* .ctors */
		*crtbegin.o(.ctors)
		*crtbegin?.o(.ctors)
		*(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
		*(SORT(.ctors.*))
		*(.ctors)

		/* .dtors */
 		*crtbegin.o(.dtors)
 		*crtbegin?.o(.dtors)
 		*(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
 		*(SORT(.dtors.*))
 		*(.dtors)

		. = ALIGN(4);
		*(.data)
		*(.data*)

		. = ALIGN(4);
        KEEP(*(.eh_frame*))
        __text_end__ = .;
	} >RAM0 AT>FLASH

    /*
    .data : {
		_sdata = ALIGN(4);
		*(.data)
		*(.data*)
		_edata = ALIGN(4);
    } >RAM0 AT>FLASH
    data_load_start = LOADADDR(.data);
*/

	/* .stack_dummy section doesn't contain any symbols. It is only
	* used for linker to calculate size of stack sections, and assign
	* values to stack symbols later */
	.stack_dummy (COPY): AT (0x20010000)
	{
		. = ALIGN(0x10000);
		PROVIDE(__stack_start__ = .);
		KEEP(*(.stack*))
		PROVIDE(__c_stack_top__ = .);
		PROVIDE(__stack_end__ = .);
	} >RAM0

	/* Location counter can end up 2byte aligned with narrow Thumb code but
	   __etext is assumed by startup code to be the LMA of a section in RAM
	   which must be 4byte aligned */
	__etext = ALIGN (4);


/*    .bss_ram0 (NOLOAD) : AT (0x20020000) */
    .bss_ram0 (NOLOAD) :
	{
		. = ALIGN(0x10000);
		. = ALIGN(4);
		*(.bss*)
		*(COMMON)
		. = ALIGN(4);
        __bss_ram0_end__ = .;
	} >RAM0
	__bss_ram0_start__ = LOADADDR(.bss_ram0);
	__bss_ram0_size__ = SIZEOF(.bss_ram0);


	.no_init_data (NOLOAD):
	{
		. = ALIGN(4);
		*(.no_init_data)
		*(.noinit .noinit.*)
		. = ALIGN(4);
		__retention_start__ = .;
		*(retention_data)
		. = ALIGN(4);
		__retention_end__ = .;
	} >RAM0

	/* Group unwind sections together: */
	.ARM.extab : { *(.ARM.extab*) }
	.ARM.exidx : { *(.ARM.exidx*) }

	/DISCARD/ : {
        *(.ARM.exidx.exit.text)
        *(.ARM.extab.exit.text)
        *(.ARM.exidx.devexit.text)
        *(.ARM.extab.devexit.text)
	}

	/* Set stack top to end of RAM, and stack limit move down by
	 * size of stack_dummy section */
	PROVIDE(__StackTop = __c_stack_top__);
	PROVIDE(__StackLimit = __stack_start__);
	PROVIDE(__stack = __StackTop);

	PROVIDE(end = heap0_start);
	PROVIDE(heap0_start = __bss_ram0_end__);
	PROVIDE(heap0_end = ORIGIN(RAM0) + LENGTH(RAM0)); /* RAM0 end */
	PROVIDE(heap0_len = heap0_end - heap0_start);


	/* Check if data + heap + stack exceeds RAM limit */
	/* ASSERT(__StackLimit >= __HeapLimit, "region RAM overflowed with stack") */
	ASSERT(heap0_start < heap0_end, "region RAM0 overflowed with .bss")
}

