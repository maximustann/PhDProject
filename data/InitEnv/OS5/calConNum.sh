#!/bin/tcsh 

echo 'Usage: ./calConNum.sh'

@ i = 0
foreach dir (`ls | sort -V`)
	wc -l $dir/container.csv | cut -d' ' -f1 >> containerCount.txt
end
	
