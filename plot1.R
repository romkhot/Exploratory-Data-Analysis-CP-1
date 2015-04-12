
#1. Set working directory:
setwd(dir = "your_path/Exploratory-Data-Analysis-CP-1")

#2. Read dataset with filtering by Date:
power_data <- subset( read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                                check.names=F, stringsAsFactors=FALSE, quote='\"', dec="."),
                      subset=(Date == "1/2/2007" | Date == "2/2/2007") )

#3. Convert text values:
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

#4. Plot 1 - a histogram:
hist(power_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#5. Save histogram to file and close PNG device:
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
