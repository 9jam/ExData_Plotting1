##loading file into a data.table using fread for speed
el_cons_DT <- fread("./data/household_power_consumption.txt", na.strings = "?")

##subsetting with just the data points relevant for the assignment
ec_DT_exrt <- el_cons_DT[Date == "1/2/2007" | Date == "2/2/2007"]

##converting the Time column into POSIXlt format
ec_DT_exrt[[2]] <- strptime(paste(ec_DT_exrt[[1]],ec_DT_exrt[[2]]), "%d/%m/%Y %H:%M:%S")

##printing Plot 4 to a png file, by starting with type = "n" and adding lines
##for the three Sub meters
png("plot4.png")

##setting up the 2 by 2 grid to be filled along the columns
par(mfcol=c(2,2))

##graph 1
plot(ec_DT_exrt$Time,ec_DT_exrt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##graph 2
plot(ec_DT_exrt$Time,ec_DT_exrt$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(ec_DT_exrt$Time,ec_DT_exrt$Sub_metering_1)
lines(ec_DT_exrt$Time,ec_DT_exrt$Sub_metering_2, col = "red")
lines(ec_DT_exrt$Time,ec_DT_exrt$Sub_metering_3, col = "blue")
legend("topright", legend = colnames(ec_DT_exrt)[7:9], lty = 1, col = c("black","red","blue"), bty = "n", cex = 0.75)

##graph 3
plot(ec_DT_exrt$Time,ec_DT_exrt$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##graph 4
plot(ec_DT_exrt$Time,ec_DT_exrt$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()