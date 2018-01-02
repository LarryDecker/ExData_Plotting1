#setwd("C:\\coursera\\exdata\\project1data")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")

dfnames<-read.delim("household_power_consumption.txt",sep=";",skip=0,nrows=1,header=TRUE)
hpc<-read.delim("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,col.names=names(dfnames))
png(file="plot1.png")
hist(hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
