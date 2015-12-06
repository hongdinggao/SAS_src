data gao;
input id sire;
cards;
1 34
2 45
3 89
4 76
5 88
6 34
7 89
8 89
;
data hh;
input id;
cards;
1
3
4
9
11
13
;
proc sort data=hh;  by id;
proc sort data=gao; by id;
data ding;
merge gao(in=bb) hh(in=aa);
by id;
if ^bb and aa;
data ding2;
merge gao(in=bb) hh(in=aa);
by id;
if bb and aa;
run;
