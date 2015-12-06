data aa;
input id;
cards;
44
88
33
66
55
;
run;
%macro repeat;
data all;
data _null_;
    set aa;
	call symput("nbull", _N_);
	run;
	%do i=1 %to &nbull;
	   data _null_;
	     set aa;
		 if _n_=&i;
		 call symput("mid", id);
		 run;
		 %put &mid;
	%end;
%mend;

%repeat;
%repeat;

run;
