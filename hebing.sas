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
input sire;
cards;
34
89
100
;
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
