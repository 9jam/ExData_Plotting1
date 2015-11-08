##loading file into a data.table using fread for speed
el_cons_DT <- fread("./data/household_power_consumption.txt", na.strings = "?")

##subsetting with just the data points relevant for the assignment
ec_DT_exrt <- el_cons_DT[Date == "1/2/2007" | Date == "2/2/2007"]

##converting the Time column into POSIXlt format
ec_DT_exrt[[2]] <- strptime(paste(ec_DT_exrt[[1]],ec_DT_exrt[[2]]), "%d/%m/%Y %H:%M:%S")

##printing Plot 2 to png, with type = "l" to connect the points in a line
png("plot2.png")

par(mfcol = c(1,1), cex = 1)
plot(ec_DT_exrt$Time,ec_DT_exrt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()