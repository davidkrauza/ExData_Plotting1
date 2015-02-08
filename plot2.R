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
png(filename="plot2.png", width=480, height=480, units="px")
plot(data.subset$Datetime, data.subset$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kw)")
dev.off()