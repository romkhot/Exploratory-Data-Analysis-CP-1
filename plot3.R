
#1. Set working directory:
setwd(dir = "your_path/Exploratory-Data-Analysis-CP-1")

#2. Read dataset with filtering by Date:
power_data <- subset(read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                                check.names=F, stringsAsFactors=FALSE, quote='\"', dec="."),
                      subset=(Date == "1/2/2007" | Date == "2/2/2007") )

#3. Convert text values:
with(power_data,
{
  Sub_metering_1 <- as.numeric(Sub_metering_1)
  Sub_metering_2 <- as.numeric(Sub_metering_2)
  Sub_metering_3 <- as.numeric(Sub_metering_3)
})
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
power_data$Date_Time <- as.POSIXct(paste(as.Date(power_data$Date), power_data$Time))

#4. Plot 3 - chart with 3 data sets:
with(power_data,
{
   plot(Date_Time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(Date_Time, Sub_metering_2, col='red')
  lines(Date_Time, Sub_metering_3, col='blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#5. Save chart to file and close PNG device:
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
