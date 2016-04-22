household<- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

household_sub<- subset.data.frame(household,
                                  household$Date == "1/2/2007")
household_pow<- rbind(household_sub)

household_sub<- subset.data.frame(household,
                                  household$Date == "2/2/2007")
household_pow<- rbind(household_pow, household_sub)

household_datetime<-strptime(paste(household_pow$Date,household_pow$Time, sep = " "),
                             "%d/%m/%Y %H:%M:%S" )

png("plot2.png")
plot(household_datetime,household_pow$Global_active_power,
     type="l", xlab = "",ylab="Global Active Power(kilowatts)")
dev.off()
