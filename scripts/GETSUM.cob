           >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION. 
PROGRAM-ID. GETSUM.
DATA DIVISION.
LINKAGE SECTION.
       01 LNum1 PIC 9 VALUE 5.
       01 LNum2 PIC 9 VALUE 4.
       01 LSum1 PIC 99.
PROCEDURE DIVISION using LNum1, LNum2, LSum1.
       *> praticamente gli args della funzione con using
       *> ciascun valore che modifichiamo qua verrà cambiato nel programma che lo chiama
       *> proprio come una funzione di un modulo esterno importata
       COMPUTE LSum1 = LNum1 + LNum2.
*> ricorda che la compili con cobc -m non -x
EXIT PROGRAM.
