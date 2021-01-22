@echo off

rem === Uncomment the firmware section you need ===

rem firmware 3.14
rem set FWN=314
rem set BASTXT=0x8241
rem set LASTKEYPRSD=0x822c
rem set TOKENSYS=0xAB
rem set CHR4VID=0x81EC
rem set CHAR2VID=0x06c8

rem firmware 64K 1.05
set FWN=105
set BASTXT=0x538C
set LASTKEYPRSD=0x535F
set TOKENSYS=0xAC
set CHR4VID=0x531f
set CHAR2VID=0x074b

if "%1" EQU "" echo Usage: mk filename
if "%1" EQU "" exit /b

echo compiling for Firmware %FWN%

zcc +lm80c ^
    -create-app ^
    -pragma-export:BASTXT=%BASTXT% ^
    -pragma-export:FWN=%FWN% ^
    -pragma-export:LASTKEYPRSD=%LASTKEYPRSD% ^
    -pragma-export:TOKENSYS=%TOKENSYS% ^
    -pragma-export:CHAR2VID=%CHAR2VID% ^
    -pragma-export:CHR4VID=%CHR4VID% ^
    -crt0=lm80c_crt0_alt.asm ^
    -pragma-redirect:fputc_cons=_fputc_cons_alt ^
    -pragma-redirect:fgetc_cons=_fgetc_cons_alt ^
    -pragma-redirect:getk=_getk_alt ^
    -o %1 ^
    %1.c ^
    getk_alt.asm ^
    fgetc_cons_alt.asm ^
    fputc_cons_alt.asm








