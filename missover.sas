data line;
infile cards missover;
input x y z;
cards;
1 2 3
4 5
7 8 9
;
proc print;
 title 'data set line using missover option';
run;
