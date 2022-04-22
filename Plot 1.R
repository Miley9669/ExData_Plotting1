

table<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

library(dplyr)
table<-mutate(table, Date=as.Date(Date, format = "%d/%m/%Y"))
table<-mutate(table, Global_active_power = as.numeric(Global_active_power))

dataset_truncated<-filter(table, Date == "2007-02-01" | Date == "2007-02-02")

png(file="plot1.png")
hist(dataset_truncated$Global_active_power, ylab="Frequency", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red") 
#Color in the example is a dark orange. I'm not sure how to get that specific color.
dev.off()
