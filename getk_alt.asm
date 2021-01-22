
		SECTION code_clib
		PUBLIC	getk_alt
		PUBLIC	_getk_alt

                ;INCLUDE  "target/lm80c/def/lm80c.def"
		EXTERN LASTKEYPRSD

.getk_alt
._getk_alt
	ld	h,0
	ld	a,(LASTKEYPRSD)
	ld	l,a
IF STANDARDESCAPECHARS
	cp	13
	jr	nz,not_return
	ld	l,10
.not_return
ENDIF
	xor	a
	ld	(LASTKEYPRSD),a
	ret
