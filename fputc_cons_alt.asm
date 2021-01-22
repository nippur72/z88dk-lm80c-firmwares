
		SECTION	code_clib
		PUBLIC	fputc_cons_alt
		PUBLIC	_fputc_cons_alt

	EXTERN CHR4VID
	EXTERN CHAR2VID

.fputc_cons_alt
._fputc_cons_alt
    ld	 ix,0
    add  ix,sp
    ld	 a,(ix+2)     ; ch parameter in the stack
    ld   (CHR4VID),a
    call CHAR2VID
	ret
