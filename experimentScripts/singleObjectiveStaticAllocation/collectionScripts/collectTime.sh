#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectTime.sh [groupGA | dualPermutation] [ten | twenty] [200 | 500 | 1000]'
	exit
endif

set gridPath='/vol/grid-solar/sgeusers/tanboxi/'
set algPath=$gridPath$1/$2/Container$3

if (-e ../$1/$2/Container$3/time.csv) then 
	rm ../$1/$2/Container$3/time.csv
endif 

foreach file (`ls $algPath | sort -V`)
	cat $algPath/$file/time.csv >> ../$1/$2/Container$3/time.csv
end




#echo $algPath
