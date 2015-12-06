data ff;
do mon = 'jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep';
select;
when (mon in ('jun', 'jul', 'aug')) put 'summer ' mon=;
when (mon in ('mar', 'apr', 'may')) put 'spring ' mon=;
otherwise put 'fall or winter ' mon=;
end;
end;
run;
