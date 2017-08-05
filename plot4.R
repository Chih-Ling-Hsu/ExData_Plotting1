dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data <- subset(dataset, Date=="1/2/2007" | Date=="2/2/2007")
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.character(data$Global_active_power)
data$Global_reactive_power <- as.character(data$Global_reactive_power)
data$Sub_metering_1 <- as.character(data$Sub_metering_1)
data$Sub_metering_2 <- as.character(data$Sub_metering_2)
data$Sub_metering_3 <- as.character(data$Sub_metering_3)
data$Voltage <- as.character(data$Voltage)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)

par(mfcol=c(2,2))

with(data, plot(Datetime, Global_active_power, xlab="", ylab="Global Active Power", type="n"))
with(data, lines(Datetime, Global_active_power))

yrange <- with(data, c(min(Sub_metering_1, Sub_metering_2, Sub_metering_3), max(Sub_metering_1, Sub_metering_2, Sub_metering_3)))
with(data, plot(Datetime, Sub_metering_1, ylim=yrange, xlab="", ylab="Energy sub metering", type="n"))
with(data, lines(Datetime, Sub_metering_1))
with(data, lines(Datetime, Sub_metering_2, col="red"))
with(data, lines(Datetime, Sub_metering_3, col="blue"))
with(data, legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n"))

with(data, plot(Datetime, Voltage, xlab="datetime", ylab="Voltage", type="n"))
with(data, lines(Datetime, Voltage))

with(data, plot(Datetime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n"))
with(data, lines(Datetime, Global_reactive_power))

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
