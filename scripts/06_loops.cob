           >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION. 
PROGRAM-ID. loops.
ENVIRONMENT DIVISION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 Ind PIC 9(1) value 0.
PROCEDURE DIVISION.
*> while loop in cobol
perform OutputData with test after until Ind > 5
       go to ForLoop.

OutputData.
       display Ind.
       add 1 to Ind.  

*> secondo metodo col for loop
ForLoop.
       perform OutputData2 varying Ind from 1 BY 1 until Ind = 5
       stop run.

OutputData2.
       display Ind.
 
STOP RUN.
