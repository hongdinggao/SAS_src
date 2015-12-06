data my_birthday;
 infile cards;
 input var1 mmddyy10.;
 cards;
01/23/1963
;
data new_birthday; set my_birthday;
 sas_date = input(var1,mmddyy10.); 
run;
