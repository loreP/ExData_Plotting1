data<-read.table("household_power_consumption.txt", sep=";",header=T, colClasses = c("character","character", "numeric", "numeric","numeric", "numeric","numeric", "numeric", "numeric"), na.strings = "?")
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data_red<-subset(data, as.Date(Date_Time) >= "2007-02-01" & as.Date(Date_Time) <=  "2007-02-02")
png(filename = "plot3.png", width = 480, height = 480)

plot(data_red$Date_Time, data_red$Sub_metering_1, type="n", ylab=("Energy sub metering"), xlab="")

lines(data_red$Date_Time, data_red$Sub_metering_1, col="black")
lines(data_red$Date_Time, data_red$Sub_metering_2, col="red")
lines(data_red$Date_Time, data_red$Sub_metering_3, col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"), col=c("black","blue","red"),  lty = c(1,1,1))
dev.off()