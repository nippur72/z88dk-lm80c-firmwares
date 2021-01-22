;

		SECTION	code_clib
		PUBLIC	fgetc_cons_alt
		PUBLIC	_fgetc_cons_alt
 
                ;INCLUDE  "target/lm80c/def/lm80c.def"

		EXTERN LASTKEYPRSD

.fgetc_cons_alt
._fgetc_cons_alt
.getkey1
	ld	a,(LASTKEYPRSD)
	and	a
	jr	z,getkey1
IF STANDARDESCAPECHARS
	cp	13
	jr	nz,not_return
	ld	a,10
.not_return
ENDIF
	ld	l,a
	ld	h,0
	ret
