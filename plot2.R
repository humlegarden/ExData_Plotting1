## Course: Exploratory Data Analysis
## Peer-graded Assignment: Course Project 1
## Script to generate file plot2.png

# Read data for target dates 2007-02-01 to 2007-02-02
firstrow <- 66636
numrows <- 2880
powerdata <- read.csv("./household_power_consumption.txt", 
                      sep=";", 
                      header = TRUE, 
                      stringsAsFactors = FALSE, 
                      skip = firstrow, 
                      nrows = numrows)

# Read column names from first line of file
# and assign them to the data frame
powerheaders <- read.csv("./household_power_consumption.txt", 
                         sep=";", 
                         header = FALSE, 
                         stringsAsFactors = FALSE, 
                         nrows = 1)
colnames(powerdata) <- powerheaders

# Convert Time column to POSIXlt
powerdata$Time <- paste(powerdata$Date, powerdata$Time)
powerdata$Time <- strptime(powerdata$Time, format="%d/%m/%Y %H:%M:%S")

# Generate png plot2
png(filename="plot2.png")
plot(powerdata$Time,
     powerdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
