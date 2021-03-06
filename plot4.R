
#1. Set working directory:
setwd(dir = "your_path/Exploratory-Data-Analysis-CP-1")

#2. Read dataset with filtering by Date:
power_data <- subset(read.csv( "./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                                check.names=F, stringsAsFactors=FALSE, quote='\"', dec="."),
                      subset=(Date == "1/2/2007" | Date == "2/2/2007") )

#3. Convert text values:
with(power_data,
{
  Sub_metering_1 <- as.numeric(Sub_metering_1)
  Sub_metering_2 <- as.numeric(Sub_metering_2)
  Sub_metering_3 <- as.numeric(Sub_metering_3)
  Voltage <- as.numeric(Voltage)
  Global_active_power <- as.numeric(Global_active_power)
  Global_reactive_power <- as.numeric(Global_reactive_power)
})
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
power_data$Date_Time <- as.POSIXct(paste(as.Date(power_data$Date), power_data$Time))

#4. Open PNG device and set 4 subplots:
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#5. Plot 4 charts with a data set on each:
with(power_data,
{
  #Chart 1:
  plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  #Chart 2:
  plot(Date_Time, Voltage, type="l", xlab="datetime", ylab="Voltage")
  #Chart 3:
  plot(Date_Time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(Date_Time, Sub_metering_2, type="l", col="red")
  lines(Date_Time, Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  #Chart 4:
  plot(Date_Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
 
#6. Close PNG device:
dev.off()
