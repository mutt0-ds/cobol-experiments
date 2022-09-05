       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. files.
 
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
*> Connect the name of the customer file name in this Records on separate lines
FILE-CONTROL.
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           *> indica che ogni dato in read o write ha la sua riga
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.
 
DATA DIVISION.
*> File section describes data in files
FILE SECTION.
*> FD (File Description) describes the file layout
FD CustomerFile.
*> Design the customer record
01 CustomerData.
       02 IDNum    PIC 9(5).
       02 CustName.
           03 FirstName    PIC X(15).
           03 LastName     PIC X(15).
 
WORKING-STORAGE SECTION.
01 WSCustomer.
       02 WSIDNum    PIC 9(5).
       02 WSCustName.
           03 WSFirstName    PIC X(15).
           03 WSLastName     PIC X(15).
01 WSEOF pic A(1).

PROCEDURE DIVISION.
*> COBOL focuses on working with external files or
*> databases. Here we will work with sequential files
*> which are files you must work with in order. They
*> differ from direct access files in that direct access
*> files have keys associated with data.
*> Field : Individual piece of information (First Name)
*> Record : Collection of fields for an individual object
*> File : Collection of numerous Records 
*> We process a file by loading one record into memory
*> This is called a Record Buffer
open output CustomerFile.
         move 00001 to IDNum.
         move "Bobby" to FirstName.
         move "Moretti" to LastName.
         write CustomerData
         end-write
       CLOSE CustomerFile.

*> variante b; extend non sovrascrive il file ma aggiunge      
open extend  CustomerFile.
         display "Customer ID " with no advancing 
         accept IDNum
         display "Customer Name " with no advancing 
         accept FirstName
         display "Customer Surname " with no advancing 
         accept LastName
         write CustomerData
         end-write
       CLOSE CustomerFile.

*> versione con end of file, loopa e legge le righe
open input CustomerFile.
       perform until WSEOF="Y"
           read CustomerFile into WSCustomer
               at end move "Y" to WSEOF
               not at end display WSCustomer
           end-read
       end-perform
CLOSE CustomerFile.


STOP RUN.

