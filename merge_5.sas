data gao;
input id sire;
cards;
1 34
2 45
3 99
4 99
5 88
6 34
7 89
8 89
9 89
;
data hh;
input sire sta;
label sire='the stupid sires';
cards;
99  444
99  888
99  333
89  666
50  777
;
proc sort data=hh;  by sire;
proc sort data=gao; by sire;
data ding;
merge gao(in=bb) hh;
by sire;
if bb;
*if  ^ra;
*if aa and bb;
pp=_n_;
put 'the nr of obs is  ' _n_;
*output;
run;
