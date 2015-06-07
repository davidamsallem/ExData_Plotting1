library("sqldf")
data <- read.csv.sql("household_power_consumption.txt",sep=";",sql = "select * from file where  Date in ('1/2/2007','2/2/2007')")
dateTime   <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
png(file="plot4.png")
par(mfrow=c(2,2))
# plot 1
plot(dateTime, data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
# plot 2
plot(dateTime, data$Voltage,type="l",xlab="datetime",ylab="Voltage")
# plot3
plot(dateTime, data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(dateTime, data$Sub_metering_2,type="l",col="red",xlab="",ylab="Energy sub metering")
lines(dateTime, data$Sub_metering_3,type="l",col="blue",xlab="",ylab="Energy sub metering")
legend('topright', names(data)[7:9] , lty=1, col=c('black','red', 'blue'), cex=.75,bty='n')
#plot 4
plot(dateTime, data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

