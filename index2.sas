%macro test;
   %let a = 0.333;
   %let b = 0;
   %let x = %index(&a,0);
   %put x=&x;
%mend test;
%test;
run;
