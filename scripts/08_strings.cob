           >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION. 
PROGRAM-ID. strings.
AUTHOR. Davide.
DATE-WRITTEN. August 31st 2022
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SampStr     PIC X(18) VALUE 'eerie beef sneezed'.
01 NumChars    PIC 99 VALUE 0.
01 NumEs       PIC 99 VALUE 0.
01 FName       PIC X(6) VALUE 'Martin'.
01 MName       PIC X(11) VALUE 'Luther King'.
01 LName       PIC X(4) VALUE 'King'.
01 FLName      PIC X(11).
01 FMLName     PIC X(18).
01 SStr1       PIC X(7) VALUE "The egg".
01 SStr2       PIC X(9) VALUE "is #1 and".
01 Dest        PIC X(33) VALUE "is the big chicken". 
01 Ptr         PIC 9 VALUE 1.
01 SStr3       PIC X(3).
01 SStr4       PIC X(3).
 
PROCEDURE DIVISION.
*> alcune funzioni per contare righe, caratteri e convertire case
inspect SampStr tallying NumChars for characters.
display "Number of characters : " NumChars.
inspect SampStr tallying NumEs for all 'e'.
display "Number of Es : " NumChars.
display function upper-case(SampStr)
display function lower-case(SampStr)
*> delimited by specifica la fine della stringa; by Size vuol dire tutta
string FName delimited by size
       space
       LName delimited by size
       into FLName.
display "Join strings: " FLName.

*> voglio la prima parola fino a uno spazio, vedi delimited by spaces
string FName delimited by spaces
       space
       MName delimited by size
       space
       LName delimited by size
       into FMLName
       on overflow display "Overflowed".
*>! controlla che non ci sia overflow!
display "Join strings w middle: " FMLName.

string SStr1 delimited by size 
       space
       SStr2 delimited by "#"
       into Dest
       with pointer Ptr
       on overflow display "Overflowed".
display Dest

*> Replacing is used to replace strings or characters
INSPECT Dest REPLACING ALL 'egg' BY 'dog'.
DISPLAY Dest.

*> unstring splitta la stringa per delimitatore
*> qua prende i primi due
unstring SStr1 delimited by space 
into SStr3, SStr4
end-unstring.
display SStr4


STOP RUN.
