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
array orig v2 - v3 ;
do over orig ;
 if orig < 0.5 then orig = 0;
end;
proc print ;
run ;
