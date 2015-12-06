ods output statistics=gao
           ttests=hong
		   equality=ding;
proc ttest data=sashelp.class;
class sex;
var age weight height;
run;
ods output close;
