data traitno;
length trait $20; 
input tn trait $ h2;
b=_N_;
cards;
1 milk 0.39
2 fat  0.39
3 prot 0.39
4 growth 0.30
5 fert 0.04
6 birth 0.06
7 calv 0.03 
8 masti 0.04
9 health 0.02
10 body 0.30
11 leg 0.10
12 milkorg 0.25
13 milksp 0.26
14 temp 0.13
15 long 0.10
16 yield 0.39
17 ntm 0.39
;
data _null_;
set traitno;
file 'testput.txt';
put trait b;
proc means;
var tn h2;
output out=new mean=mtn mh2;
run;
