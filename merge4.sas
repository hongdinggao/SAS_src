data fortest;
input id sire mm;
cards;
1 34 4
2 45 4
3 89 4
4 76 4
5 88 4
6 34 5
7 89 5
8 89 5
;
data rec;
input id sire dam;
cards;
1 99 22
9 89 55
3 50 66
88 777 345
;

proc sort data=fortest;  by id;
proc sort data=rec; by id;

data all; merge  rec (in=b) fortest; by id;
if b;
run;
