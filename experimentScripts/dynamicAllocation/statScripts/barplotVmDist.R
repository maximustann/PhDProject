library(ggplot2)
library(reshape2)

cat('Usage: barplotVmDist(base, vmNo= 10 | 20) \n')
barplotVmDist <- function(base, vmNo){

	
	vmDistFile <- paste(base, 'vmDist.csv', sep='')
	rawData <- read.csv(vmDistFile, header=T, sep=',') * 100
	algorithm <- c(rep("X", vmNo), rep("Y", vmNo), rep("Z", vmNo))
	vmDist <- c(rawData[, 3], rawData[, 2], rawData[, 1])
	x_axis <- seq(1, vmNo)
	data <- data.frame(x = x_axis, y = vmDist, algorithm)

	p <- ggplot(data, aes(x=x, y = vmDist)) + geom_bar(stat="identity", width=0.3, aes(fill=algorithm), position=position_dodge()) + scale_x_continuous(breaks=1:vmNo)+ scale_fill_manual(values=c("#fa9d22", "#86b3dd", "#812c2c"), labels=c("sub&Just-Fit/FF", "evo/FF", "evo/evo")) + xlab("VM Types") + ylab("Frequency (%)") + 
	theme(panel.background = element_rect(fill='#eaeaea'), panel.grid.minor=element_line(color='#4d5566'), panel.grid.major=element_line(color='#bdbdbd'), plot.title=element_text(size=50), axis.title=element_text(size=50, color='#555555'), axis.title.y=element_text(vjust=1, angle=90, face="bold"), axis.title.x = element_text(size=50, hjust = 0.5, face="bold"), axis.text.x = element_text(size=40), axis.text.y=element_text(size=40, angle=90), legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=40))
		
		#theme(axis.text = element_text(size=40, face="bold"), legend.text = element_text(size=45, face="bold"), axis.title=element_text(size=40, face="bold"), legend.position=c(0.7, 0.3))
	p
	ggsave(paste(base, 'vmDist.png', sep=''), height=10, width=20)
	ggsave(paste(base, 'vmDist.eps', sep=''), height=10, width=20)
}
