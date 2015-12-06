data aa;
input id;
cards;
11
22
35
43
55
;
proc sort data=aa; by descending id;
data bb;
	set aa end=x;
	if x then delete;

run;
