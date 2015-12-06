data class;
input name $ sex $ age;
cards;
alice F 13
barrad F 13
adfsdf F 14
joiu F 12
louise F 12
mnbbsdf F 14
kkkdr F 11
bbggss M 10
sfdfdfs M 15
sddfd M 11
sfdfgg M 12
dssdff M 14
dfdgg M 13
;
data new;
set class;
keep mm;
mm=age;
run;












