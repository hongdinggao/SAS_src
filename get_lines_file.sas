data aa;
input id;
%let pp=2.2;
%let aa=%sysevalf(&pp**2+100);
%put &aa;
cards;
1
2
3
4
5
;
data aa2;
set aa;
if id=3;
output;
proc sort;
data _null_;
set aa2;
call symputx('ng1', _N_);
%put &ng1;
run;
