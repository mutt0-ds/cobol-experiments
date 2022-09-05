       >>SOURCE FORMAT FREE
*> creiamo un programma con un piccolo menu per aggiornare clienti
IDENTIFICATION DIVISION.
PROGRAM-ID. firstprogram.
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT CustomerFile ASSIGN TO "customers.txt"
           *> in questo caso uso un key-value file e cambio modo
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS IDNum.
DATA DIVISION.
FILE SECTION.
*> Customer file ha sempre lo stesso schema
FD CustomerFile.
01 CustomerData.
       02 IDNum    PIC 99.
       02 FirstName    PIC X(15).
       02 LastName     PIC X(15).
    
WORKING-STORAGE SECTION.
*> tracciamo le scelte del menu dell'utente
01 Choice pic 9.
01 StayOpen PIC X value 'Y'.
01 CustExist PIC X.

PROCEDURE DIVISION.
StartPara.
       *> sia input che output
       open I-O CustomerFile.
       perform until StayOpen="N"
           display " "
           display "CUSTOMER RECORDS"
           display "1 : Add Customer"
           display "2 : Delete Customer"
           display "3 : Update Customer"
           display "4 : Get Customer"
           display "0 : Quit"
           display ": " with no advancing 
           accept Choice
           evaluate Choice
               when 1 perform AddCust
               when 2 perform DeleteCust
               when 3 perform UpdateCust
               when 4 perform GetCust
               WHEN OTHER move 'N' TO StayOpen
           end-evaluate
       end-perform
       close CustomerFile.
       stop run.

*> diverse funzioni ausiliarie che vengono chiamate dal menu
AddCust.
       display " "
       display "Enter ID: " with no advancing.
       accept IDNum.
       display "Enter First Name: " with no advancing.
       accept FirstName.
       display "Enter Last Name: " with no advancing.
       accept LastName.
       display " "
       write CustomerData
           invalid key display "ID Taken"
       end-write.

DeleteCust.
       display " "
       display "Enter Customer ID to delete: " with no advancing.
       accept IDNum.
       delete CustomerFile
           invalid key display "Key doesn't exist"
       end-delete.

UpdateCust.
       MOVE 'Y' TO CustExist.
       DISPLAY " ".
       DISPLAY "Enter ID to Update : " WITH NO ADVANCING.
       ACCEPT IDNum.
       *> Read customer or mark N if doesn't exist
       READ CustomerFile
           INVALID KEY MOVE 'N' TO CustExist
       END-READ.
       *> Display error because ID doesn't exist
       IF CustExist='N'
           DISPLAY "Customer Doesn't Exist"
       ELSE
           DISPLAY "Enter the New First Name : " WITH NO ADVANCING
           ACCEPT FirstName
           DISPLAY "Enter the New Last Name : " WITH NO ADVANCING
           ACCEPT LastName
       END-IF.
       *> Update record for matching ID
       REWRITE CustomerData
           INVALID KEY DISPLAY "Customer Not Updated"
       END-REWRITE.
 

GetCust.
       move "Y" to CustExist.
       display " "
       display "Enter Customer ID to read: " with no advancing.
       accept IDNum.
       read CustomerFile
           invalid key move "N" to CustExist
       end-read
       if CustExist = "N"
           display "Customer doesn't exist"
       else
           display "ID: " IDNum
           display "First Name: " FirstName
           display "Last Name: " LastName
       end-if.

close CustomerFile.
stop run.
