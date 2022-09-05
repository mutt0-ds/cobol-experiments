       >>SOURCE FORMAT FREE
*> COBOL ha molti tool per generare report, è un componente fondamentale del programma
IDENTIFICATION DIVISION.
PROGRAM-ID. reports.
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT CustomerReport ASSIGN TO "CustReport.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
*> definisco lo schema del report
FD CustomerReport.
01 PrintLine PIC X(44).

FD CustomerFile.
01 CustomerData.
       02 IDNum    PIC 9(5).
       02 CustName.
           03 FirstName    PIC X(15).
           03 LastName     PIC X(15).
       88 WSEOF value high-value.
    
WORKING-STORAGE SECTION.
01 PageHeading.
       *> filler quando non devi identificare labels
       02 filler pic X(13) value "Customer List".
01 PageFooting.
       02 filler pic X(15) value space.
       02 filler pic X(7) value "Page: ".
       02 PrnPageNum pic Z9.
01 Heads pic x(36) value "IDNum     FirstName    LastName".
01 CustomerDetailLine.
       02 filler pic x value space.
       02 PrnCustID PIC 9(5).
       02 filler pic x(4) value space.
       02 PrnFirstName pic x(15).
       02 filler pic x(4) value space.
       02 PrnLastName pic x(15).
       02 filler pic x(4) value space.
01 ReportFooting pic x(13) value "End of Report".
01 LineCount pic 99 value zero.
*> se il numero di righe diventa troppo allora scatta la booleana new page
       88 NewPageRequired value 40 thru 99.
01 PageCount pic 99 value zero.

PROCEDURE DIVISION.
open input CustomerFile
open output CustomerReport

perform PrintPageHeading
read CustomerFile
       at end set WSEOF to true 
end-read
perform PrintReportBody until WSEOF
write PrintLine from ReportFooting after advancing 5 lines.

close CustomerFile, CustomerReport.
STOP RUN.

PrintPageHeading.
write PrintLine from PageHeading after advancing page 
write PrintLine from Heads after advancing 5 lines
*> traccia il numero di righe e pagine
move 3 to LineCount
add 1 to PageCount.

PrintReportBody.
if NewPageRequired
       move PageCount to PrnPageNum
       write PrintLine from PageFooting after advancing 5 lines 
       perform PrintPageHeading
end-if
move IDNum to PrnCustID
move FirstName to PrnFirstName
move LastName to PrnLastName

write PrintLine from CustomerDetailLine after advancing 1 line 
add 1 to LineCount
read CustomerFile
       at end set WSEOF to true
end-read.
