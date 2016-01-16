temp <- tempfile()
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, temp)
dataDownloaded <- date()
EPC <- read.table(unz(temp,"household_power_consumption.txt"),sep = ";", header = TRUE)
unlink(temp)
EPC$Date <- as.Date(EPC$Date,format = "%d/%m/%Y")
EPC$Global_active_power <- as.numeric(as.character(EPC$Global_active_power))
EPC1 = subset.data.frame(EPC, Date == "2007/02/01"| Date == "2007/02/02") #Subset dataframe on both days.
hist(EPC1$Global_active_power, col = "red",, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
