#Read in data set, set NAs = ?
data <- read.table("../Data/household_power_consumption.txt", sep=";", dec="."
                   , header=TRUE, na.strings="?")

#Convert date strings to date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subset Data for dates interested in for analysis
data.subset <- subset(data
                      , subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Remove larger dataset to reclaim memory
rm(data)

#Convert Numbers
data.subset$Global_active_power <- as.numeric(data.subset$Global_active_power)
datetime <- paste(data.subset$Date, data.subset$Time)
data.subset$Datetime <- as.POSIXct(datetime)

#Create Plot
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#Top Left
plot(data.subset$Datetime, data.subset$Global_active_power, type="l"
     ,xlab="", ylab="Global Active Power (kw)")

#Top Right
plot(data.subset$Datetime, data.subset$Voltage, xlab="datetime"
     ,ylab="Voltage(volt)", type="l")

#Bottom Left
plot(data.subset$Datetime, data.subset$Sub_metering_1
     , type="l", xlab="", ylab="Energy sub metering")
lines(data.subset$Datetime, data.subset$Sub_metering_2, col='Red')
lines(data.subset$Datetime, data.subset$Sub_metering_3, col='Blue')
legend("topright", col=c("black","red","Blue"), lty=1, lwd=2
       ,legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

#Botom Right
plot(data.subset$Datetime, data.subset$Global_reactive_power, type="l"
     , xlab="datetime", ylab="Global_reactive_power")

dev.off()