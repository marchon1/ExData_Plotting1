library(dplyr)
library(lubridate)

#cleaning data
raw_data<-read.table("./R/ExploreData Week 1/household_power_consumption.txt", 
                     sep = ";",na.strings = "?", header = TRUE)
final_data<-filter(raw_data, Date=="1/2/2007"|Date=="2/2/2007")
final_data$Date<-as.Date(final_data$Date, format = "%d/%m/%Y")

#cleaning data required for plot4
final_data$datetime <- strptime(paste(final_data$Date, final_data$Time), 
                                format = "%Y-%m-%d %H:%M:%S")

#plotting required graphs
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(final_data, {
#plot top left
  with(final_data, plot(datetime, Global_active_power, type="l",
                        xlab = "", ylab="Global Active Power (kilowatts)"))

#plot bottom left
  with(final_data, plot(datetime, Sub_metering_1, ylim = c(0,40),
                        xlab = "", ylab="Energy sub metering", type="l"))
  with(final_data, points(datetime, Sub_metering_2,col = "red", type = "l"))
  with(final_data, points(datetime, Sub_metering_3,col = "blue", type = "l"))
  #legend
  legend("topright", cex = 1.2, lty=1, col = c("black", "blue", "red"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
#plot top right and bottom right
  plot(datetime, Voltage, type = "l")
  plot(datetime, Global_reactive_power, type="l")
})

#copy to png
dev.copy(png, file="./R/ExploreData Week 1/plot4.png")
dev.off()