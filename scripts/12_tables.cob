       >>SOURCE FORMAT FREE
*> le tabelle contengono diversi data items come gli array
*> gli indici sono chiamati subscript e iniziano a 1!
IDENTIFICATION DIVISION.
PROGRAM-ID. tables.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 Table1.
       02  Friend  PIC X(15) OCCURS 4 TIMES.
01 CustTable.
       02 CustName OCCURS 5 TIMES.
           03 FName PIC X(15).
           03 LName PIC X(15).
01 OrderTable.
       02 Product OCCURS 2 TIMES INDEXED BY I.
           03 ProdName2 PIC X(10).
           03 ProdSize OCCURS 3 TIMES INDEXED BY J.
               04 SizeType PIC A.

*> per prefillare una tabella usa redefines
01 ProdTable.
       02 ProdData.
           03 filler pic x(8) value "Red SML".
           03 filler pic x(8) value "Blue SML".
           03 filler pic x(8) value "GreenSML".
       02 filler redefines ProdData.
           03 Shirt occurs 3 times. 
               04 ProdName pic x(5).
               04 ProdSizes pic A occurs 3 times.
*> per cambiare formato in float o currency
01 ChangeMe.
       02 TextNum pic x(6).
       02 FloatNum redefines TextNum pic 9(4)V99.
01 StrNum PIC x(7).
01 SplitNum.
       02 WNum pic 9(4) value zero.
       02 FNum pic 99 value zero.
01 FlNum redefines SplitNum pic 9999V99.
01 DollarNum pic $$,$$9.99.


PROCEDURE DIVISION.
*> con move e le () accedi alle posizioni in array
move "broschi" to Friend(1).
move "giorgione" to Friend(2).
display Table1.

*> con childs della tabella
move "paul" to FName(1).
move "smith" to LName(1).
move "franco" to FName(2).
move "rossi" to LName(2).
display CustTable.

*> con la tabella piu complessa usando gli indici per iterare
set I J to 1.
move "Blue Shirt" to Product(1).
move "S" to ProdSize(I,J).
set J up by 1.
move "M" to ProdSize(I,J).
set J down by 1.
move "Blue ShirtSMLRed Shirt SML" to OrderTable.
perform GetProduct varying I from 1 by 1 until I>2.
go to Lookup.

GetProduct.
       display Product(I).
       perform GetSizes varying J from 1 by 1 until J>3.
GetSizes.
       display ProdSize(I,J).

Lookup.
       set I to 1.
       search Product
           at end display "Product not found"
           when ProdName(I) = 'Red Shirt'
               display "Red Shirt Found" 
       end-search.

*> prefillare la tabella
display Shirt(1).
*> nota come floatnum converte automaticamente
move '123456' to TextNum.
display FloatNum

*> converte in currency input utente con un parser
display "Enter a float: " with no advancing 
accept StrNum
*> divide in una parte int e una float
unstring StrNum
       delimited by "." or all spaces
       into WNum, FNum
Move FlNum to DollarNum
display DollarNum.

stop run.
