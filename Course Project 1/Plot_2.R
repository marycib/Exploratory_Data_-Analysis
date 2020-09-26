
#Reads in data from file

dat_pow<- read.table("household_power_consumption.txt", sep=";", header = T,
                     stringsAsFactors = FALSE, dec = ".", na.strings="?")



# Filter Dates for 1/2/2007 and 2/2/2007


dat_pow<- subset(dat_pow, dat_pow$Date %in% c("1/2/2007","2/2/2007"))


dat_time <- strptime(paste(dat_pow$Date, dat_pow$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


dat_pow$Global_active_power<- as.numeric(dat_pow$Global_active_power)



# plot

png("Plot_2.png", width = 480, height = 480)


plot(dat_time,dat_pow$Global_active_power,type = "l", ylab = "Global Active Power(kilowatts)")
dev.off()