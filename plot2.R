#setwd("C:\\coursera\\exdata\\project1data")
library("lubridate")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")

dfnames<-read.delim("household_power_consumption.txt",sep=";",skip=0,nrows=1,header=TRUE)
hpc<-read.delim("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,col.names=names(dfnames))

hpc$DateTime<-dmy_hms(paste(hpc$Date,hpc$Time))

png(file="plot2.png",height=480,width=480)
with(hpc,plot(DateTime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=""))
with(hpc,lines(DateTime,Global_active_power))
dev.off()
