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
input id sire dam;
cards;
1 99 22
9 89 55
3 50 66
;
proc sort data=hh;  by id;
proc sort data=gao; by id;
data ding;
merge gao(in=bb) hh(in=aa);
by id;
*if  ^ra;
*if aa and bb;
pp=_n_;
output;
run;
