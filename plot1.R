## Course: Exploratory Data Analysis
## Peer-graded Assignment: Course Project 1
## Script to generate file plot1.png

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

# Generate png plot1
png(filename="plot1.png")
hist(powerdata$Global_active_power,
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col="red")
dev.off()
