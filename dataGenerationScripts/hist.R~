library(ggplot2)
library(scales)

drawHist <- function(dataset){
	data <- read.csv(dataset, header=F, sep=',')


	data1cpu <- data.frame('cpu', data[,1])
	colnames(data1cpu) <- c('resource', 'weight')
	data1mem <- data.frame('mem', data[,2])
	colnames(data1mem) <- c('resource', 'weight')
	data1 <- rbind(data1cpu, data1mem)


	p1 <- ggplot(data1, aes(x=weight, color=resource)) + geom_histogram(aes(fill=resource), position="dodge", bins=30) + xlim(0, 750) + theme(panel.background=element_rect(fill='#eaeaea'), panel.grid.minor=element_line(color='#bdbdbd'), panel.grid.major=element_line("#bdbdbd"), axis.title=element_text(size=50, color='#555555'), axis.title.y=element_text(vjust=1, angle=90, face="bold"), axis.title.x=element_text(size=50, face="bold"), axis.text.x=element_text(size=40), axis.text.y=element_text(size=20, angle=45), legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=40)) + scale_y_continuous(labels=scientific)
	p1
	ggsave("hist.eps", height=10, width=15)
}
