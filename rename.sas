
data gao;
input id sire;
keep sire;  /*must refer to the old variable names since rename only affect in the end of data step*/
rename sire=bull;   /*MUST always do rename in the end*/
cards;
1 34
2 45
3 89
4 76
4 778
5 88
6 34
7 89
7 555
8 89
;
run;
