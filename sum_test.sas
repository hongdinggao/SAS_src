data _null_; 
    infile 'c:\sum.txt' end=eof; 
    input x;
    sum+x;
    put x sum; 
    if eof then put sum=; 
run;
