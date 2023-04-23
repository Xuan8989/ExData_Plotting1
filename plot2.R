## read file into R

power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

## merge the time and date together 
combinedtime <- strptime(paste(power$Date, power$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
newpower <- cbind(power, combinedtime)

## change the class of the variables 

newpower$Date <- as.Date(newpower$Date, format="%d/%m/%Y")
newpower$Time <- format(newpower$Time, format="%H:%M:%S")
newpower$Global_active_power <- as.numeric(newpower$Global_active_power)
newpower$Global_reactive_power <- as.numeric(newpower$Global_reactive_power)
newpower$Voltage <- as.numeric(newpower$Voltage)
newpower$Global_intensity <- as.numeric(newpower$Global_intensity)
newpower$Sub_metering_1 <- as.numeric(newpower$Sub_metering_1)
newpower$Sub_metering_2 <- as.numeric(newpower$Sub_metering_2)
newpower$Sub_metering_3 <- as.numeric(newpower$Sub_metering_3)

## subset the data to include only the desiganted dates 
newdata <- subset(newpower, Date == "2007-02-01" | Date == "2007-02-02")
View(newdata)
##plot the Global active power against time 
png("plot2.png", width = 480, height = 480)
with(newdata, plot(combinedtime, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()



