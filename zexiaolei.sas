*Analyze the data from Xiaolei Ze;
*options nodate nonumber nocenter;
*options nodate nonumber;
ods pdf file="C:\Users\hoga\Ze_results.pdf" style = theme;
data allobs30;
input m1 m2;
cards;
170	245
210	195
190	225
180	235
200	230
80	155
110	140
150	170
170	140
10	30
40	65
50	45
90	60
70	85
70	50
170	335
280	265
80	325
230	310
350	340
90	290
230	300
200	285
160	270
80	120
120	200
70	120
300	120
170	190
120	260
;
run;
*-----------------------------------------------------------------------------------------------------;
*First check the Nr of obs in the dataset;
data _null_; 
*put totalobs=F16.0-L;
put totalobs=;        /*Writes variable values to .log after the variable name and an equal sign*/
stop;                 /*here actually before execute the program is stoped*/
set allobs30 nobs=totalobs; /*when compile and before exec the set step, the totalobs is available*/
run ;
/* Observations 5, 8 and 10 */
data foo;
do pickit = 5, 8, 10;
     set allobs30 point=pickit;
     output;
end;
stop;
run;
*-----------------------------------------------------------------------------------------------------;





*analysis start from here for each experiment;
data start30;
do pickit =1 to totalobs by 3;
set allobs30 point=pickit nobs=totalobs;
output;
end;
stop;   /*Use STOP with any features that read SAS data sets using random access methods*/
run;
proc print;
title 'The dataset at the start point of 30 degree';
proc ttest data=start30 h0=0 alpha=0.05;
paired m1*m2;
data middle30;
do pickit =2 to totalobs by 3;
set allobs30 point=pickit nobs=totalobs;
output;
end;
stop;
run;
proc print;
title 'The dataset at the middle point of 30 degree';
proc ttest data=middle30 h0=0 alpha=0.05;
paired m1*m2;
data end30;
do pickit =3 to totalobs by 3;
set allobs30 point=pickit nobs=totalobs;
output;
end;
stop;
run;
proc print;
title 'The dataset at the end point of 30 degree';
proc ttest data=end30 h0=0 alpha=0.05;
paired m1*m2;
run;





data allobs37;
input m1 m2;
cards;
280	280
260	290
170	340
200	250
70	290
110	235
170	195
70	235
100	290
50	100
50	30
80	65
20	35
60	50
90	65
220	315
160	320
220	315
220	405
100	370
100	310
300	365
340	340
360	340
150	120
50	320
70	170
310	190
170	270
240	320
;
run;
data start37;
do pickit =1 to totalobs by 3;
set allobs37 point=pickit nobs=totalobs;
output;
end;
stop;   /*Use STOP with any features that read SAS data sets using random access methods*/
run;
proc print;
title 'The dataset at the start point of 37 degree';
proc ttest data=start37 h0=0 alpha=0.05;
paired m1*m2;
data middle37;
do pickit =2 to totalobs by 3;
set allobs37 point=pickit nobs=totalobs;
output;
end;
stop;
run;
proc print;
title 'The dataset at the middle point of 37 degree';
proc ttest data=middle37 h0=0 alpha=0.05;
paired m1*m2;
data end37;
do pickit =3 to totalobs by 3;
set allobs37 point=pickit nobs=totalobs;
output;
end;
stop;
run;
proc print;
title 'The dataset at the end point of 37 degree';
proc ttest data=end37 h0=0 alpha=0.05;
paired m1*m2;
run;
ods pdf close;

