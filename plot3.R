#setwd("C:\\coursera\\exdata\\project1data")
library("lubridate")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")

dfnames<-read.delim("household_power_consumption.txt",sep=";",skip=0,nrows=1,header=TRUE)
hpc<-read.delim("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,col.names=names(dfnames))

hpc$DateTime<-dmy_hms(paste(hpc$Date,hpc$Time))

png(file="plot3.png")
with(hpc,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(hpc,lines(DateTime,Sub_metering_1))
with(hpc,lines(DateTime,Sub_metering_2,col="red"))
with(hpc,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()
