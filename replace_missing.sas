data test;
input a b c@@;
cards;
1 2 . 4 . 6 . 8 9
;
data test2;
set test;
array nums _numeric_;
do over nums;
if nums = . then nums = -999999;
end;
run;
