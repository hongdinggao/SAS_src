
proc corr data=sashelp.class;
*class sex;
var age weight height;
ods output  "Pearson Correlations"=gao(where=(Variable='Age'));
data gao;
set gao;
keep Weight;
run;
