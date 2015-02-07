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

#Create Plot
hist(data.subset$Global_active_power, main="Global Active Power"
     , xlab="Global Active Power (kw)", ylab="Frequency", col="red")

#Save a copy of the graph to a file
png.directory = paste(getwd(),"plot1.png")
dev.copy(png, png.directory)
dev.off