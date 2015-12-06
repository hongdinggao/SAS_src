data test;
input a b c@@;
cards;
1 2 3 4 5 6 7 8 9
;
proc corr out=par;
var a b c;
run;
