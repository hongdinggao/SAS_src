data temp;
input id car;
cards;
1 33
2 44
3 55
4 66
;
filename rawr "rawr.txt";
%macro repeat;
%do i=1 %to 3;
filename per&i "per&i..txt";
filename all&i "all&i..txt";
filename red&i "red&i..txt";
data md&i;
set temp;
keep car;

/*%if &i = 1 %then %do;
if id >3;
file rawr;
put id car;
%end;*/

if id > &i then do;
car=-999999;
output md&i;
file per&i;
put id car;
end;

file all&i;
put id car;

file red&i;
if id > &i then put id car;



%if &i = 1 %then %do;
if id >3;
file rawr;
put id car;
%end;

%put &i;
%end;
%mend;

%repeat;
run;
