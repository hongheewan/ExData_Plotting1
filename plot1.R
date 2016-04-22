household<- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
household$Date<- as.Date(household$Date,"%d/%m/%Y")

household_sub<- subset.data.frame(household,
                      household$Date == "2007-02-01")
household_pow<- rbind(household_sub)
                                  
household_sub<- subset.data.frame(household,
                                  household$Date == "2007-02-02")
household_pow<- rbind(household_pow, household_sub)    

png("plot1.png")
hist(as.numeric(as.character(household_pow$Global_active_power)),
     col = "red", main="Global Active Power",xlab="Global Active Power(kilowatts)",
     ylab="Frequency")

dev.off()
