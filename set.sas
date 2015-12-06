data gao;
input cc id sire dam code;
keep cc id sire;
cards;
5 1 34 4 1
5 2 45 6 1
5 3 89 7 1
5 4 76 4 1
5 5 88 4 1
5 6 34 4 1
5 7 89 4 1
5 8 89 4 1
;
data hh;
input sire id;
cards;
100 34
200 89
300 100
;
data dd;
input sire id;
cards;
800 88
;
data all;
set gao hh dd;
keep id sire cc;
run;

proc sort data=hh;  by sire;
proc sort data=gao; by sire;
data ding;
merge gao(in=bb) hh(in=ra);
by sire;
*if  ^ra;
if ra and bb;
pp=_n_;
output;
run;
