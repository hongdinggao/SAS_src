options symbolgen;
%let n=1;
data ped;
input  id sire dam bdate;
cards;
1 -1 -1 19500101
2 -1 -1 19500101
3 -1 -1 19500101
4 -1 -1 19500101
5 -1 -1 19500101
6 -1 -1 19500101
101 1 2 20030101
102 -1 -1 19500101
103 3 -1 20000328
104 -1 202 19500101
105 5 6 20030501
201 101 -1 20060101
202 103 102 19500101
203 -1 104 19500101
206 105 -1 20060501
301 201 -1 19500101
302 -1 203 19500101 
303 301 302 19860713
;
run;
%macro makedummy;

%let checkmean=1;
%do %until (%index(&checkmean, 0)=1);

%put 'The round is' &n;

data %str(ped&n);
set ped;

proc sort data=%str(ped&n); by sire bdate;

data sire;
set %str(ped&n);
by sire bdate;
retain ok 0;
if sire > 0;
if first.sire then ok=0;
%if &n = 1 %then
%do;if ok=0 and bdate > 19500101  then do;dummybd=bdate-10000;ok=2;end;%end;
%else
%do;if ok=0  then do;dummybd=bdate-10000;ok=2;end;%end;

if ok=2 then
do;
    id=sire;
    output;
    ok=1;
end;
keep id dummybd;

proc sort; by id;
proc print data=sire;
title 'The sire dataset, Hongding adding';

*repeat the upper for dam;
proc sort data=%str(ped&n); by dam bdate;

data dam;
set %str(ped&n);
by dam bdate;
retain ok 0;
if dam > 0;
if first.dam then ok=0;

%if &n = 1 %then
%do;if ok=0 and bdate > 19500101  then do;dummybd=bdate-10000;ok=2;end;%end;
%else
%do;if ok=0  then do;dummybd=bdate-10000;ok=2;end;%end;

if ok=2 then
do;
    id=dam;
    output;
    ok=1;
end;
keep id dummybd;

proc sort; by id;
proc print data=dam;
title 'The dam dataset, Hongding adding';

data bd_upd;
set sire dam;
by id;

proc print data=bd_upd;
title "bd_upd round &n";

proc sort data=%str(ped&n); by id;


data ped;
merge %str(ped&n)(in=a) bd_upd;
by id;
if a;
if dummybd ^= . & (bdate = 19500101 or (bdate > 19500101 & dummybd < bdate)) then bdate=dummybd;      /*update the raw pedigree with the ith dummybd*/
keep id sire dam bdate;                      /*bdate updated in ped dateset*/

proc print data=ped;
title "PED after merge with bd_upd round &n";

proc datasets library=work;
modify bd_upd;
rename id = sire
       dummybd = s_bdate;


proc sort data=ped;by sire;

data ped; merge ped(in=i1) bd_upd;by sire;
if i1;

proc datasets library=work;
modify bd_upd;
rename sire = dam
       s_bdate = d_bdate;


proc sort data=ped;by dam;
proc print data=bd_upd;
title 'check 203';
proc print data=ped;
title 'check 203 of PED';

data ped; merge ped(in=i1) bd_upd;by dam;
if i1;
if bdate = 19500101 then
do;
 if sire > 0 then
      if  dam > 0 then bdate=max(s_bdate,d_bdate)+10000;
   else bdate=s_bdate+10000;
 /*else
 if dam > 0 then bdate=d_bdate+10000;     /*problem is here, maybe comment this*/
end;
drop s_bdate d_bdate;

proc print data=ped;
title "PED after updating unknown bdate for non parent animals round &n";


data temp;
set ped;
bdate_new=bdate;
keep id bdate_new;
proc sort; by id;

proc sort data=%str(ped&n); by id;

data temp;
merge temp %str(ped&n);
by id;
diff=bdate_new-bdate;

proc means data=temp mean;
var diff;
output out=getmean mean=meandiff;

data _null_;
set getmean;
call symput('checkmean',trim(left(meandiff)));
*checkmean=int(symgetn('checkmean2'));
proc print data=ped;
title "Final PED round &n";


%let n = %eval(&n+1);
%end;

%mend makedummy;

%makedummy;

run;
proc sort data=ped; by id;
data ped888;
set ped;
by id;
if first.id;
run;
