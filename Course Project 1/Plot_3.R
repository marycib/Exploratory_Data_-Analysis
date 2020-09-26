
#Reads in data from file

dat_pow<- read.table("household_power_consumption.txt", sep=";", header = T,
                     stringsAsFactors = FALSE, dec = ".", na.strings="?")



# Filter Dates for 1/2/2007 and 12/2/2007

dat_pow<- subset(dat_pow, dat_pow$Date %in% c("1/2/2007","2/2/2007"))


dat_time <- strptime(paste(dat_pow$Date, dat_pow$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


dat_pow$Global_active_power<- as.numeric(dat_pow$Global_active_power)

dat_pow$Sub_metering_1<- as.numeric(dat_pow$Sub_metering_1)
dat_pow$Sub_metering_2<- as.numeric(dat_pow$Sub_metering_2)
dat_pow$Sub_metering_3<- as.numeric(dat_pow$Sub_metering_3)



# plot

png("Plot_3.png", width = 480, height = 480)

plot(dat_time, dat_pow$Sub_metering_1, type = "l", xlab=" ", ylab = "Energy sub metering")
lines(dat_time, dat_pow$Sub_metering_2, type = "l", col="red")     
lines(dat_time, dat_pow$Sub_metering_3, type = "l", col="blue")

     
     legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
