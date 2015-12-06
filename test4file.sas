data gao;
keep id;
input id sire pp;

if id=2 and sire=88 then do;
pp=-999999;
output gao;
file "c:/Users/hoga/test.txt";
put id;
end;
file "c:/Users/hoga/all.txt";
put id sire pp;
cards;
1 34 3
2 45 3
2 88 3
3 89 3
4 76 3
5 88 3
6 34 3
7 89 3
8 89 3
;
run;
