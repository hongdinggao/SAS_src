data gao;
input id sire dam;
cards;
1 34 44
. 45 55
3 89 66
4 .  88
5 88 54
6 34 .
7 .  23
8 89 .
;
data gao2;
set gao;
if cmiss(of _all_) then delete; /* A fast way of removing missing */
run;
