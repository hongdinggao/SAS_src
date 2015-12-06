data test1;
input id;
cards;
1 
2 
3 
4 
5
8 
;
data test2;
input id;
cards;
3
5
6
7
8
;
proc sort data=test1; by id;
proc sort data=test2; by id;
data all;
merge test1(in=aa) test2(in=bb);by id;
if aa and bb;
output;
data all;
set all;
b=_n_;
run;






