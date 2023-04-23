## read file into R

power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## change the class of the variables 

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- format(power$Time, format="%H:%M:%S")
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

##subset the data set to include only the designated dates
newpower <- subset(power, Date == "2007-02-01" | Date =="2007-02-02")

## plot the histogram 
png("plot1.png", width=480, height=480)
hist(newpower$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
