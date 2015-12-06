data rr1;
input id;
if id>2 then do;
cc+1;
put cc;
end;
cards;
1
2
3
4
5
;
run;
data pp;
set rr1;
ii=_n_;
do i=1 to 3;
if _n_=i then delete;
end;
data pp;
set pp;
ii=_n_;
run;
data mm;
c+1;
m+8;
run;
data a1;
input id;
cards;
2
5
6
;
data a2;
input id;
cards;
1
4
;
data all;
set a1 a2;
by id;
run;
