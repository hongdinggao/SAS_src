data aa;
input id;
cards;
11
22
35
43
55
;
proc sort data=aa; by  id;
data bb;
input id sire;
cards;
22 777
35 888
;
proc sort; by id;
data cc;
merge aa bb(in=b);
by id;
if ^b;
*keep sire;

run;
