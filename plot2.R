
#1. Set working directory:
setwd(dir = "your_path/Course Project 1/Exploratory-Data-Analysis-CP-1")

#2. Read dataset with filtering by Date:
power_data <- subset( read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                                check.names=F, stringsAsFactors=FALSE, quote='\"', dec="."),
                      subset=(Date == "1/2/2007" | Date == "2/2/2007") )

#3. Convert text values:
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
power_data$Date_Time <- as.POSIXct(paste(as.Date(power_data$Date), power_data$Time))
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

#4. Plot 2 - a line chart:
plot(power_data$Date_Time, power_data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#5. Save chart to file and close PNG device:
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
