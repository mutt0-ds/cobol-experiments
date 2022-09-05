           >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION. 
PROGRAM-ID. aritmetica.
ENVIRONMENT DIVISION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
*> conversione in diversi formati
01 StartNum PIC 9(8)V99 VALUE 000011123.55.
01 NoZero   PIC ZZZZZZZZ.99.
01 NoZPlusC PIC ZZ,ZZZ,ZZ9.99.
01 Dollars  PIC $$,$$$,$$9.99.
01 BDate    PIC 9(8) VALUE 12211974.
01 ADate    PIC 99/99/9999.

*> esempio coi floats

01 Price PIC 9(4)V99.
01 TaxRate PIC V999 value .075.
01 FullPrice PIC 9(4)V99.

PROCEDURE DIVISION.
*> mostr come col MOVE si adatta lo schema definito al numero
MOVE StartNum TO NoZero
display NoZero
MOVE StartNum TO NoZPlusC
display NoZPlusC
MOVE StartNum TO Dollars
display Dollars
MOVE BDate TO ADate
display ADate

*> COBOL gestisce i float con i decimali fissati per evitare problemi di arrotondamendo
display "Enter the price: " with no ADVANCING
accept Price
compute FullPrice rounded = Price + (Price * TaxRate)
display "Price + Tax : " FullPrice.

STOP RUN.
