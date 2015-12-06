data temp;
input id year month;
cards;
1 1933 3
2 1944 5
3 1855 2
4 2011 1
5 2008 11
6 1999 10
;
proc datasets library=work;
modify temp;
index create yearmo = (year month);
run;
quit;
