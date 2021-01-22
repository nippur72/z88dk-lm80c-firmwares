# z88dk-lm80c-firmwares

This is a helper script (Windows batch file) that allows you to
compile Z88DK C programs for the LM80C computer using a different
firmware version than default one embedded in Z88DK (R3.14 32K model)

Edit the file `mk.bat` to select the desidered firmware target.

# what it does

The script calls the `zcc` compiler with the following changes:

- a smaller CRT0 is used. The BASIC header program
  is parametric respect to the BASIC starting address (BASTXT)

- `fgetc_cons`, `fputc_cons` and `getk` are replaced with
  parametric versions of the same.

- `fputc_cons` is replaced with a custom one that uses the ROM
  routine (so printf can also print on the boot screen).





