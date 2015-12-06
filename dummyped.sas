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
102 3 4 20030201
103 -1 -1 19500101
104 5 4 20030401
105 5 6 20030501
201 101 102 20060101
202 103 102 19500101
203 -1 104 19990301
204 105 104 19990101
206 105 102 20060501
301 201 202 19500101
302 203 202 20080601
303 203 204 20080301
;
run;
%macro makedummy;

%let checkmean=1;
%do %until (&checkmean=0);

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
if ok=0 and bdate > 19500101 then dummybd&n=bdate-10000;
do;
    output;
    ok=1;
end;

data sire;
set sire;
id=sire;
keep id dummybd&n;

proc sort; by id;


*repeat the upper for dam;
proc sort data=%str(ped&n); by dam bdate;

data dam;
set %str(ped&n);
by dam bdate;
retain ok 0;
if dam > 0;
if first.dam then ok=0;
if ok=0 and bdate > 19500101 then dummybd&n=bdate-10000;
do;
    output;
    ok=1;
end;

data dam;
set dam;
id=dam;
keep id dummybd&n;

proc sort; by id;

data bd_upd;
set sire dam;
by id;

proc sort data=%str(ped&n); by id;

data ped;
merge %str(ped&n)(in=a) bd_upd;
by id;
if a;
if dummybd&n ^= . then bdate=dummybd&n;      /*update the raw pedigree with the ith dummybd*/
keep id sire dam bdate;                      /*bdate updated in ped dateset*/

proc print data=ped;
title "PED after merge with bd_upd";


proc sort data=ped;                       *adding today;
by id;

data ped;
set ped;
by id;
if first.id;


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

proc print data=ped;
title "Final PED round &n";

%let n = %eval(&n+1);
%end;

%mend makedummy;

%makedummy;
/*proc sort data=ped; by id;
data ped;
set ped;
by id;
if first.id;*/

run;

proc sort data=ped; by id;
data ped888;
set ped;
by id;
if first.id;
run;

