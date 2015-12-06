title1 'array1.sas' ;
options compress = yes nodate ;
data one;
input v1 - v3 ;
cards ;
.2 .3 .4 
.5 .6 .321 
.21 .3 .4 
.15 .36 .13 
;
data two; set one ;
a1 = v1 * 100 ;
a2 = v2 * 100 ;
a3 = v3 * 100 ;
array orig v1 - v3 ;
array perc p1 - p3 ;
do over orig ;
 perc = orig * 100 ;
end;
proc print ;
run ;
