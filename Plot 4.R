#Plot 4

table<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

library(dplyr)

date_time<-paste(dataset_truncated$Date, dataset_truncated$Time)
date_time<-strptime(date_time, "%Y-%m-%d %H:%M:%S")
dataset_truncated<-cbind(date_time, dataset_truncated)

png(file="plot4.png")
par(mfrow=c(2,2))
plot(x=dataset_truncated$date_time, y=dataset_truncated$Global_active_power,
     type="l", ylab="Global Active Power", xlab="")
plot(x=dataset_truncated$date_time, y=dataset_truncated$Voltage,
     type="l", ylab="Voltage", xlab="datetime")

plot(x=dataset_truncated$date_time, y=dataset_truncated$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
lines(x=dataset_truncated$date_time, y=dataset_truncated$Sub_metering_1, col="black")
lines(x=dataset_truncated$date_time, y=dataset_truncated$Sub_metering_2, col="red")
lines(x=dataset_truncated$date_time, y=dataset_truncated$Sub_metering_3, col="blue")
legend("topright",lwd=1, col=c("black", "red", "blue"), bty="n", cex=0.75,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x=dataset_truncated$date_time, y=dataset_truncated$Global_reactive_power,
     type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
