#!/bin/tcsh 


if($1 == '' || $2 == '') then
	echo "Usage ./runSingleExperiment.sh [Path][Run]"
	echo "Example ./runSingleExperiment.sh /local/scratch/tanboxi/VMCreationGP/nonAnyFit/ 0"
	exit
endif

# Execute
/usr/lib/jvm/sun-8/bin/java -Didea.launcher.port=36145 -Didea.launcher.bin.path=/vol/x6/jetbrains/idea-current/bin -Dfile.encoding=UTF-8 -classpath /usr/lib/jvm/sun-8/jre/lib/charsets.jar:/usr/lib/jvm/sun-8/jre/lib/deploy.jar:/usr/lib/jvm/sun-8/jre/lib/ext/cldrdata.jar:/usr/lib/jvm/sun-8/jre/lib/ext/dnsns.jar:/usr/lib/jvm/sun-8/jre/lib/ext/jaccess.jar:/usr/lib/jvm/sun-8/jre/lib/ext/jfxrt.jar:/usr/lib/jvm/sun-8/jre/lib/ext/localedata.jar:/usr/lib/jvm/sun-8/jre/lib/ext/nashorn.jar:/usr/lib/jvm/sun-8/jre/lib/ext/sunec.jar:/usr/lib/jvm/sun-8/jre/lib/ext/sunjce_provider.jar:/usr/lib/jvm/sun-8/jre/lib/ext/sunpkcs11.jar:/usr/lib/jvm/sun-8/jre/lib/ext/zipfs.jar:/usr/lib/jvm/sun-8/jre/lib/javaws.jar:/usr/lib/jvm/sun-8/jre/lib/jce.jar:/usr/lib/jvm/sun-8/jre/lib/jfr.jar:/usr/lib/jvm/sun-8/jre/lib/jfxswt.jar:/usr/lib/jvm/sun-8/jre/lib/jsse.jar:/usr/lib/jvm/sun-8/jre/lib/management-agent.jar:/usr/lib/jvm/sun-8/jre/lib/plugin.jar:/usr/lib/jvm/sun-8/jre/lib/resources.jar:/usr/lib/jvm/sun-8/jre/lib/rt.jar:/home/tanboxi/workspace/containerAllocation/out/production/containerAllocation:/home/tanboxi/workspace/opencsv-3.8.jar:/am/embassy/vol/x6/jetbrains/apps/IDEA-U/ch-0/201.7846.76/lib/idea_rt.jar com.intellij.rt.execution.application.AppMainV2 Experiment_selection_creation_combined $1 $2 > ../any.txt 
echo "execution finished " $2
