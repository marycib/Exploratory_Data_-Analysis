

#Reads in data from file 

dat_pow<- read.table("household_power_consumption.txt", sep=";", header = T,
                  stringsAsFactors = FALSE, dec = ".", na.strings="?")


# subset

dat_pow<- subset(dat_pow, dat_pow$Date %in% c("1/2/2007","2/2/2007"))

dat_pow$Global_active_power<- as.numeric(dat_pow$Global_active_power)

png("Plot_1.png", width = 480, height = 480)

hist(dat_pow$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.off()