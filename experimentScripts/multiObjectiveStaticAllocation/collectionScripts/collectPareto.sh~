#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectPareto.sh [multiGroupGA] [ten | twenty] 150]'
	exit
endif



set gridPath='/vol/grid-solar/sgeusers/tanboxi/'
set algPath=$gridPath$1/$2/app$3

if (-e ../$1/$2/app$3/) then 
	rm ../$1/$2/app$3/ -rf
endif 

@ i = 1
foreach file (`ls $algPath | sort -V`)
	mkdir -p ../$1/$2/app$3/$i/
	sed -n '/,99.0/p' $algPath/$file/paretoFront.csv >> ../$1/$2/app$3/$i/paretoFront.csv
	@ i = $i + 1
end
