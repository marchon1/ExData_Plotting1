library(dplyr)
library(lubridate)

#cleaning data
raw_data<-read.table("./R/ExploreData Week 1/household_power_consumption.txt", 
                     sep = ";",na.strings = "?", header = TRUE)
final_data<-filter(raw_data, Date=="1/2/2007"|Date=="2/2/2007")
final_data$Date<-as.Date(final_data$Date, format = "%d/%m/%Y")

#cleaning data required for plot2
final_data$datetime <- strptime(paste(final_data$Date, final_data$Time), 
                                format = "%Y-%m-%d %H:%M:%S")

#plotting required graph
with(final_data, plot(datetime, Global_active_power, type="l",
                      xlab = "", ylab="Global Active Power (kilowatts)"))

#copy to png
dev.copy(png, file="./R/ExploreData Week 1/plot2.png")
dev.off()