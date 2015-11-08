##loading file into a data.table using fread for speed
el_cons_DT <- fread("./data/household_power_consumption.txt", na.strings = "?")

##subsetting with just the data points relevant for the assignment
ec_DT_exrt <- el_cons_DT[Date == "1/2/2007" | Date == "2/2/2007"]

##converting the Time column into POSIXlt format
ec_DT_exrt[[2]] <- strptime(paste(ec_DT_exrt[[1]],ec_DT_exrt[[2]]), "%d/%m/%Y %H:%M:%S")

##plotting the histogram to png
png("plot1.png")

par(mfcol = c(1,1), cex = 1)
hist(ec_DT_exrt$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
