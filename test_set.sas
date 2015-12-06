data gao;
input  sire;
cards;
 34
 45
 89
 76
 88
 34
 89
 89
;
data hh;
input sire;
cards;
34
89
100
;
data mm;
set hh gao;
ii=_n_;
call symput("nmm", _N_);
run;
proc sort; 
by sire;
data ccen;
set mm end=x;
if x then output;
proc print; 
data niubi;    /*to calculate how many obs in mm*/
set mm;
call symput("nofobs", _N_);
run;
proc print data=niubi;
data _null_;    /*to calculate how many obs in mm*/
set hh;
file "C:\test.txt";
put sire;
call symput("n2", _N_);
run;
%let sum=%eval(&nofobs+&n2);
%let sum2=%sysevalf(&nofobs+&n2+0.3);
%put &sum;
%put &sum2;
%put &n2;
%put &nmm;
%put &nofobs;
