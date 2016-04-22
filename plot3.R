household<- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

household_sub<- subset.data.frame(household,
                                  household$Date == "1/2/2007")
household_pow<- rbind(household_sub)

household_sub<- subset.data.frame(household,
                                  household$Date == "2/2/2007")
household_pow<- rbind(household_pow, household_sub)

household_datetime<-strptime(paste(household_pow$Date,household_pow$Time, sep = " "),
                             "%d/%m/%Y %H:%M:%S" )

png("plot3.png", width = 480, height = 480)
plot(household_datetime,household_pow$Sub_metering_1, type="l",
     xlab = "", ylab = "Energy sub metering")
points(household_datetime, sub_metering_2 ,col="red", type = "l")
points(household_datetime,household_pow$Sub_metering_3, col="blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty = c(1,1,1), lwd = c(2,2,2))
dev.off()