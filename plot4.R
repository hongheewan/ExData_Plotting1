household<- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

household_sub<- subset.data.frame(household,
                                  household$Date == "1/2/2007")
household_pow<- rbind(household_sub)

household_sub<- subset.data.frame(household,
                                  household$Date == "2/2/2007")
household_pow<- rbind(household_pow, household_sub)

household_datetime<-strptime(paste(household_pow$Date,household_pow$Time, sep = " "),
                             "%d/%m/%Y %H:%M:%S" )
# First plot
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2),mar=c(4,4,2.5,2))
plot(household_datetime,household_pow$Global_active_power,type = "l",
     ylab="Global Active Power")

# Second plot
plot(household_datetime,household_pow$Voltage,type = "l",
     ylab="Voltage", xlab="datetime")

# Third plot
plot(household_datetime,household_pow$Sub_metering_1, type="l",
     xlab = "", ylab = "Energy sub metering")
points(household_datetime, household_pow$Sub_metering_2,col="red", type = "l")
points(household_datetime,household_pow$Sub_metering_3, col="blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty = c(1,1,1), lwd = c(1,1,1), bty = "n")

# Fourth plot
plot(household_datetime, household_pow$Global_reactive_power, type = "l",
     xlab = "datetime", ylab="Global Reactive Power")
dev.off()