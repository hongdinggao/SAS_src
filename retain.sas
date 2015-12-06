DATA WITHOUT_1;
PUT "Before the INPUT statement: " _ALL_; 
INPUT X @@;
PUT "After the INPUT statement: " _ALL_ /;
DATALINES;
1 2 . 3
;
run;
DATA WITHOUT_2;
retain X;
PUT "Before the INPUT statement: " _ALL_; 
INPUT X @@;
PUT "After the INPUT statement: " _ALL_ /;
DATALINES;
1 2 . 3
;
run;
DATA WITHOUT_2;
retain X 88;
PUT "Before the INPUT statement: " _ALL_; 
INPUT X @@;
PUT "After the INPUT statement: " _ALL_ /;
DATALINES;
1 2 . 3
;
run;
DATA WITHOUT_3;
PUT "Before INPUT: " _ALL_ ;
INPUT X @@;
IF X NE . THEN OLD_X = X;
ELSE X = OLD_X;
PUT "After assignment: " _ALL_ /;
DATALINES;
1 2 . 3
;
DATA WITHOUT_4;
retain OLD_X;
PUT "Before INPUT: " _ALL_ ;
INPUT X @@;
IF X NE . THEN OLD_X = X;
ELSE X = OLD_X;
PUT "After assignment: " _ALL_ /;
DATALINES;
1 2 . 3
;
DATA WITH_5;
RETAIN SUBJECT 0; 
PUT "Before the INPUT statement: " _ALL_ ;
INPUT X @@;
SUBJECT = SUBJECT + 1; 
PUT "After the INPUT statement: " _ALL_ /;
DATALINES;
1 3 5
;
run;
