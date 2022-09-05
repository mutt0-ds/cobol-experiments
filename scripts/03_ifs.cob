           >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION. 
PROGRAM-ID. dataclass.
AUTHOR. Davide.
DATE-WRITTEN. August 31st 2022
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SPECIAL-NAMES.
       class PassingScore IS "A" thru "C", "D".
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 Age PIC 99 VALUE 0.
*> basta formattazione in maiuscolo adesso uso intellisense piu veloce
01 Grade pic 99 value 0.
01 Score pic x(1) value "B".
01 CanVoteFlag pic 9 value 0.
       88 CanVote value 1.
       *> 88 setta una condizione di un if statement
       88 CantVote value 0.
01 TestNumber pic x.
       88 IsPrime value "1","3","5","7".
       88 IsOdd value "1","3","5","7","9".
       88 IsEven value "2","4","6","8".
       88 LessThan5 value "1" thru "4".
       88 ANumber value "0" thru "9".
PROCEDURE DIVISION. 
display "Enter Age: " with no advancing 
accept Age
if age > 18 then 
       display "You can vote!"
else
       display "You can't vote! 💥"
end-if

*> cerca di evitare gli if else statemente, a COBOL non piacciono. Alternativa:
IF Age less than 5 then 
       display "Stay home"
end-if
if Age = 5 then
       display "Go to kindergarten"
end-if
if Age > 5 and Age < 18 then
       compute Grade = Age - 5
       display "Go to grade " Grade   
end-if  
if age greater or equal to 18
       display "Go to college"
end-if

if Score is PassingScore then 
       display "You passed"
else   
       display "You failed"
end-if

*> classificazioni
if Score is not numeric then 
       display "Not a number"
end-if

if Age > 18 then
       set CanVote to true
else 
       set CantVote to true 
end-if

display "Vote " CanVoteFlag

*> loop
display "Enter single number or X to Exit : "
accept TestNumber
perform until not ANumber
       evaluate true 
           when IsPrime display TestNumber " Prime"
           when IsOdd display TestNumber " Odd"
           when IsEven display TestNumber " Even"
           when LessThan5 display TestNumber " LessThan5"
           when other display "Default Action"
       end-evaluate
       accept TestNumber
end-perform

STOP RUN.
