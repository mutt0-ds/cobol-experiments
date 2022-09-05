           >>SOURCE FORMAT FREE
*> cobol usa gravity-driven programming, procedurale, e usa paragrafi per dividere il codice
IDENTIFICATION DIVISION. 
PROGRAM-ID. paragraphs.
AUTHOR. Davide.
DATE-WRITTEN. August 31st 2022
ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.


PROCEDURE DIVISION.
SubOne.
*> è come una funzione
       display "In Paragraph 1"
       perform SubTwo 
       display "Returned to Paragraph 1"
       perform SubFour 2 times.
       stop run.
SubThree.
       display "In Paragraph 3".
SubTwo.
       display "In Paragraph 2"
       perform SubThree
       display "Returned to Paragraph 2". 
SubFour.
       display "Repeat".

STOP RUN.
