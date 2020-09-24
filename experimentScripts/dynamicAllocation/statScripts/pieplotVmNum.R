library(ggplot2)
library(scales)
cat('Usage: pieplotVmNum(base) \n')
pieplotVmNum <- function(base){
	dataFile <- paste(base, '/vmNum.csv', sep='')
	rawdata <- round(read.csv(dataFile, header=F, sep=','), 2)
	justFitSub <- floor(rawdata[1, ])
	evoContainerLevel <- floor(rawdata[2, ])
	evoTwoLevels <- floor(rawdata[3, ])

	algorithm <- c('sub&Just-Fit/FF', 'evo/FF', 'evo/evo')
	value <- c(justFitSub, evoContainerLevel, evoTwoLevels)
	data <- data.frame(group=algorithm, value=value)

	print(data)

	blank_theme <- theme_minimal()+
	  theme(
	    axis.title.x = element_blank(),
	    axis.title.y = element_blank(),
	    panel.border = element_blank(),
	    panel.grid=element_blank(),
	    axis.ticks = element_blank(),
	    plot.title=element_text(size=14, face="bold")
	    )


	p <- ggplot(data, aes(x="", y=value, fill=group)) + blank_theme + theme(axis.text.x = element_blank()) + geom_bar(width=1, stat="identity") +coord_polar("y", start = 0) + scale_fill_manual(values=c("#812c2c", "#86b3dd", "#fa9d22")) + geom_text(aes(y=value/3 + c(0, cumsum(value)[-length(value)]), label = value), size=25) + theme(legend.position="none")
	p
	ggsave(paste(base, 'pie.eps', sep=''), height=10, width=10)
}
