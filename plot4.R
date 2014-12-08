data<-read.table("household_power_consumption.txt", sep=";",header=T, colClasses = c("character","character", "numeric", "numeric","numeric", "numeric","numeric", "numeric", "numeric"), na.strings = "?")
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data_red<-subset(data, as.Date(Date_Time) >= "2007-02-01" & as.Date(Date_Time) <=  "2007-02-02")
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar =c(4,4,2,1))

plot(data_red$Date_Time, data_red$Global_active_power, type="n", ylab=("Global Active Power (Kilowatts)"), xlab="")
lines(data_red$Date_Time, data_red$Global_active_power)

plot(data_red$Date_Time, data_red$Voltage, type="n", ylab=("Voltage"), xlab="datetime")
lines(data_red$Date_Time, data_red$Voltage)

plot(data_red$Date_Time, data_red$Sub_metering_1, type="n", ylab=("Energy sub metering"), xlab="")
lines(data_red$Date_Time, data_red$Sub_metering_1, col="black")
lines(data_red$Date_Time, data_red$Sub_metering_2, col="red")
lines(data_red$Date_Time, data_red$Sub_metering_3, col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"), col=c("black","blue","red"),  lty = c(1,1,1), box.lwd="")

plot(data_red$Date_Time, data_red$Global_reactive_power, type="n", ylab=("Global_reactive_power"), xlab="datetime")
lines(data_red$Date_Time, data_red$Global_reactive_power)

dev.off()