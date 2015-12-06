
data gao;
input id sire;
cards;
1 34
2 45
3 89
4 76
4 778
5 88
6 34
7 89
7 555
8 89
;
proc sort data=gao;
by id;
data nn1;
set gao;
by id;
if first.id;
proc sort data=gao nodupkey out=nn2;
by id;
run;
