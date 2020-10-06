library(dplyr)

#cleaning data
raw_data<-read.table("./R/ExploreData Week 1/household_power_consumption.txt", 
                     sep = ";",na.strings = "?", header = TRUE)
final_data<-filter(raw_data, Date=="1/2/2007"|Date=="2/2/2007")
final_data$Date<-as.Date(final_data$Date, format = "%d/%m/%Y")

#plotting required graphs
hist(final_data$Global_active_power, col = "red", 
     xlab="Global Active Power (kilowatts)", main = "Global Active Power")

#copy to png
dev.copy(png, file="./R/ExploreData Week 1/plot1.png")
dev.off()