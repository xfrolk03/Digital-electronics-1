# Aritmeticko logická jednotka

## Zadání projektu
Samostatné nastudování zadané problematiky, návrh řešení a jeho simulace v prostředí Xilinx ISE.

Vlastní ALU (Arithmetic Logic Unit) jednotka. Možnost výběru instrukcí a vstupních hodnot za chodu aplikace. Výstup na 7segmentovém displeji.


Základní struktura projektu:
+ Hex_to_7seg.vhd   -- výstup na sedmisegmentovém displeji
+ Clock_enable.vhd  -- udává výstup hodinovému signálu
+ ALU.vhd           -- provádí zpracování operací

## Úvod do problematiky

Aritmeticko-Logická jednotka je základní stavební jednotkou výkonnostních zařízení. Provádí sčítání, odčítání, násobení, dělení,bitový posun a základní logické operace jako jsou konjunkce, disjunkce, negace, XOR, XNOR a jiné.





## Literatura

https://moodle.sspbrno.cz/pluginfile.php/3103/mod_resource/content/0/Procesory_a_jejich_strojovy_kod.pdf

https://is.muni.cz/el/1433/podzim2004/PB151/um/index.html

https://en.wikipedia.org/wiki/Arithmetic_logic_unit

https://r.search.yahoo.com/_ylt=AwrEeB34i6peHg8A2wMPxQt.;_ylu=X3oDMTBydWNmY2MwBGNvbG8DYmYxBHBvcwM0BHZ0aWQDBHNlYwNzcg--/RV=2/RE=1588264056/RO=10/RU=https%3a%2f%2fwww.asicentrum.cz%2ffile%2fdownloads%2ffiles%2f3dil_a07808_440.pdf/RK=2/RS=gqs_idkdRRaRLrZ3sKbqZR8W6.8-

https://stackoverflow.com/questions/43177341/how-to-implement-a-4-bit-alu-in-vhdl-using-an-opcode

https://electronics.stackexchange.com/questions/403678/vhdl-multiplication-for-std-logic-vector?fbclid=IwAR1OlKfRpCJlGJws7PwdrLcSbD7NVw7uhc9sngfJLhvd6KWRN0-JJYuYHok

https://www.bitweenie.com/listings/vhdl-type-conversion/?fbclid=IwAR3dGbnlIFnWptk7d-CAELUwEmx3g3Y7BUlvEjUbB-SzkGYhmYrNE3eoQXE
