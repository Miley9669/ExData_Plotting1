#Plot 2
table<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

library(dplyr)


date_time<-paste(dataset_truncated$Date, dataset_truncated$Time)
date_time<-strptime(date_time, "%Y-%m-%d %H:%M:%S")
dataset_truncated<-cbind(date_time, dataset_truncated)

png(file="plot2.png")
plot(x=dataset_truncated$date_time, y=dataset_truncated$Global_active_power,
     type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
