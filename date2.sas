data _null_;
    format test yymmddn8.;   /*The 'n' means no separator.*/
    test=today();
    put test=;
run;
