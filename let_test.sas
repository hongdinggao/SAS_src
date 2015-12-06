
%let exp=1395/4;
data _null_;
input id;
%let pp=2.2;
%let aa=%sysevalf(&pp**2+100);
%put &aa;
call symputx('nbull', _N_);

cards;
1
2
3
4
5
;
data oo;
     ff=&pp;
	 bb=&aa;
	 cc=&exp+&nbull;
run;
