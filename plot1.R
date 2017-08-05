dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data <- subset(dataset, Date=="1/2/2007" | Date=="2/2/2007")

data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()