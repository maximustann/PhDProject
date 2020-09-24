#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectUtil.sh [multiGroupGA] [ten | twenty] [150]'
	exit
endif

set algPath=../$1/$2/app$3

if(-e $algPath/allResults.csv) then
	rm $algPath/allResults.csv
endif
touch $algPath/allResults.csv

@ i = 1
foreach dir (`ls -d $algPath/*/ | sort -V`)
	cat $algPath/$i/paretoFront.csv >> $algPath/allResults.csv
	@ i = $i + 1
end

