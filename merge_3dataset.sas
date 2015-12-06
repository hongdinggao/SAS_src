data fortest;
input id sire code;
cards;
1 34 0
2 45 0
3 89 0
4 76 1
5 88 1
6 34 1
7 89 1
8 89 1
;
data rec;
input id sire dam;
cards;
1 99 22
9 89 55
3 50 66
88 777 345
;
data bull;
input id sire dam;
cards;
1 99 22
9 89 55
3 50 66
8 777 567
22 444 555
;
proc sort data=fortest;  by id;
proc sort data=rec; by id;
proc sort data=bull; by id;
data all; merge bull(in=rc) rec (in=b) fortest; by id;
*if rc; 
*if b;
if rc and b; *the same as upper;
run;
