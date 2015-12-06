data x;
   input x @@;
   call symputx('var',(x-48));
   %put &var; 
   if x > &var then output;
   datalines;
   88 33 40 55
   ;
   run;


proc print;
title "Report for &var";
run;
