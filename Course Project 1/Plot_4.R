#Reads in data from file

dat_pow<- read.table("household_power_consumption.txt", sep=";", header = T,
                     stringsAsFactors = FALSE, dec = ".", na.strings="?")



# Filter Dates for 1/2/2007 and 2/2/2007
dat_pow<- subset(dat_pow, dat_pow$Date %in% c("1/2/2007","2/2/2007"))


dat_time <- strptime(paste(dat_pow$Date, dat_pow$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


dat_pow$Global_active_power<- as.numeric(dat_pow$Global_active_power)
dat_pow$Sub_metering_1<- as.numeric(dat_pow$Sub_metering_1)
dat_pow$Sub_metering_2<- as.numeric(dat_pow$Sub_metering_2)
dat_pow$Sub_metering_3<- as.numeric(dat_pow$Sub_metering_3)
dat_pow$Voltage<- as.numeric(dat_pow$Voltage)
dat_pow$Global_reactive_power<- as.numeric(dat_pow$Global_reactive_power)




png("Plot_4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# plot 1

plot(dat_time, dat_pow$Global_active_power, type="l", xlab = "", ylab ="Global Active Power (kilowatts)")

# plot 2

plot(dat_time, dat_pow$Voltage, type="l", xlab = "datetime", ylab ="Voltage")


# plot 3

plot(dat_time, dat_pow$Sub_metering_1, type = "l", xlab=" ", ylab = "Energy sub metering")
lines(dat_time, dat_pow$Sub_metering_2, type = "l", col="red")     
lines(dat_time, dat_pow$Sub_metering_3, type = "l", col="blue")


legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))


# plot 4

plot(dat_time, dat_pow$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Energy sub metering")

dev.off()
