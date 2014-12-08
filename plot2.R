data<-read.table("household_power_consumption.txt", sep=";",header=T, colClasses = c("character","character", "numeric", "numeric","numeric", "numeric","numeric", "numeric", "numeric"), na.strings = "?")
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data_red<-subset(data, as.Date(Date_Time) >= "2007-02-01" & as.Date(Date_Time) <=  "2007-02-02")
png(filename = "plot2.png", width = 480, height = 480)

plot(data_red$Date_Time, data_red$Global_active_power, type="n", ylab=("Global Active Power (Kilowatts)"), xlab="")
lines(data_red$Date_Time, data_red$Global_active_power)
dev.off()