## Course: Exploratory Data Analysis
## Peer-graded Assignment: Course Project 1
## Script to generate file plot4.png

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

# Generate png plot4
png(filename="plot4.png")

  # Set 2x2 display for the four plots
  par(mfrow = c(2,2))

  # Generate first plot
  plot(powerdata$Time,
     powerdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

  # Generate second plot
  plot(powerdata$Time,
     powerdata$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

  # Generate third plot
  plot(powerdata$Time,
     powerdata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
  lines(powerdata$Time,
      powerdata$Sub_metering_2,
      col = "red")
  lines(powerdata$Time,
      powerdata$Sub_metering_3,
      col = "blue")
  legend("topright",
       legend = names(powerdata[7:9]),
       bty = "n",
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"))

  # Generate fourth plot
  plot(powerdata$Time,
     powerdata$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
