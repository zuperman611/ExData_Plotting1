install.packages("data.table")
library(data.table)

#Load the file
file <- fread("household_power_consumption.txt", header=TRUE, sep=";")

#Sub set the required period
subsetPeriod <- file[file$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the variable to be plotted, and make it numerical
GAP<-as.numeric(subsetPeriod$Global_active_power)

#Plot the extracted variable as PNG
png("plot1.png", width=480, height=480, bg = "transparent")
hist(GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()