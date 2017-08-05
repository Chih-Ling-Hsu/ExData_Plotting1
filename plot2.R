dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data <- subset(dataset, Date=="1/2/2007" | Date=="2/2/2007")

data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

with(data, plot(Datetime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
with(data, lines(Datetime, Global_active_power))

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
