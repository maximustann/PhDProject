#!/bin/tcsh 

echo 'Usage: ./calVmNum.sh'

@ i = 0
foreach dir (`ls | sort -V`)
	wc -l $dir/vm.csv | cut -d' ' -f1 >> vmCount.txt
end
	
