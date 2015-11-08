##loading file into a data.table using fread for speed
el_cons_DT <- fread("./data/household_power_consumption.txt", na.strings = "?")

##subsetting with just the data points relevant for the assignment
ec_DT_exrt <- el_cons_DT[Date == "1/2/2007" | Date == "2/2/2007"]

##converting the Time column into POSIXlt format
ec_DT_exrt[[2]] <- strptime(paste(ec_DT_exrt[[1]],ec_DT_exrt[[2]]), "%d/%m/%Y %H:%M:%S")

##printing Plot 3 to a png file, by starting with type = "n" and adding lines
##for the three Sub meters
png("plot3.png")

par(mfcol = c(1,1), cex = 1)
plot(ec_DT_exrt$Time,ec_DT_exrt$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(ec_DT_exrt$Time,ec_DT_exrt$Sub_metering_1)
lines(ec_DT_exrt$Time,ec_DT_exrt$Sub_metering_2, col = "red")
lines(ec_DT_exrt$Time,ec_DT_exrt$Sub_metering_3, col = "blue")
legend("topright", legend = colnames(ec_DT_exrt)[7:9], lty = 1, col = c("black","red","blue"))

dev.off()