data rr1;
input id;
cards;
1
2
3
4
;
data rr1;
set rr1 end=x;
if x then delete;
run;

data rr2;
input id;
cards;
3
;
data all;
merge rr1 rr2(in=aa);
by id;
if ^aa;
data all;
set all end=x;
if x then delete;


run;
