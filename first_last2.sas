data pp;
input id year node;
cards;
8 1953 1
7 1953 2
11 1984 3
. 1984 1
22 1985 2
28 1985 2
33 1985 1
38 1985 3
66 1995 3
;
data yy;
set pp;
by year;
if first.year;  *save only the single record;
show_first=first.year;
show_last=last.year;
output;
proc means data=pp; *by year;
*var id;
output out=sh mean=mid;
run;
