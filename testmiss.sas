data gao;
input  sire dam;
cards;
 34 22
 45 .
 89 33
 76 .
 88 .
 34 .
 89 .
 89 .
;
data cc;
set gao;
if dam;
run;
