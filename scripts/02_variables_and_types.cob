           >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION. 
PROGRAM-ID. variables.
AUTHOR. Davide.
DATE-WRITTEN. August 31st 2022
ENVIRONMENT DIVISION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 SampleData PIC X(10) VALUE "Stuff".
*> X vuol dire qualsiasi valore, 9 qualcosa da 1 a 9, 99 da 01 a 99
01 JustLetters PIC AAA Value "ABC".
01 JustNums PIC 9(4) VALUE 1234.
01 SignedInt PIC S9(4) VALUE -1234.
*> Tra parentesi il numero di cifre, signed con + o - ha S davanti
01 PayCheck PIC 9(4)V99 VALUE ZEROS.
*> V indica le cifre decimali del float (2 qua)
01 Customer.  
       02 Ident    PIC 9(3).
       02 CustName PIC X(20).
       02 DateOfBirth.
           03 MOB PIC 99.
           03 DOB PIC 99.
           03 YOB PIC 9(4).
01 Num1 PIC 9 VALUE 5.
01 Num2 PIC 9 VALUE 4.
01 Num3 PIC 9 VALUE 3.
01 Ans PIC S99V99 VALUE 0.
01 Rem PIC 9V99.

PROCEDURE DIVISION.
*> MOVE assegna valori come l'uguale in Python
MOVE "More Stuff" TO SampleData
MOVE "123" TO SampleData
MOVE 123 TO SampleData
*> Sovrascrive SampleData 3 volte
DISPLAY SampleData
DISPLAY PayCheck
MOVE "123Bob Smith           12211974" TO Customer
*> Customer ha assegnati 20 spazi quindi bisogna forzare cosi le info...
DISPLAY CustName
DISPLAY MOB "/" DOB "/" YOB

*> Qualche testo per vedere zero, space, high e low value
MOVE ZERO TO SampleData
DISPLAY SampleData
MOVE SPACE TO SampleData
DISPLAY SampleData
MOVE HIGH-VALUE TO SampleData
DISPLAY SampleData
MOVE ALL "yo" TO SampleData
DISPLAY SampleData

*> Un po di matematica
add Num1 to Num2 giving Ans
subtract Num1 from Num2 giving Ans
multiply Num1 by Num2 giving Ans
divide Num1 into Num2 giving Ans
divide Num1 into Num2 giving Ans remainder Rem
display "Remainder " Rem 

add Num1, Num1, Num3 giving Ans
display Ans
*> versione piu moderna con i classici segni, incluso **
compute Ans = Num1 + Num2
display Ans
compute Ans rounded = 33.0 + 2.005
display Ans


STOP RUN.
