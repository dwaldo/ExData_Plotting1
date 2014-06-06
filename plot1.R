### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### plot1.R: create a histogram plot of Global Active Power
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### Read data from text-delimited file.
### We know the column classes.
### NA values are represented by a "?".
all_data <- read.delim(
  "household_power_consumption.txt", 
  sep = ";", 
  stringsAsFactors = FALSE,
  colClasses=c(rep("character",2),rep("numeric",7)),
  na.string = "?"

)

### Subset data for dates of interest
df <- subset(all_data, Date == "1/2/2007" | Date == "2/2/2007")

### Create PNG of histogram
png("plot1.png", width=480, height=480)
hist(
  df$Global_active_power, 
  breaks = 12, 
  col = "red", 
  main = "Global Active Power", 
  xlab = "Global Active Power (kilowatts)"
)
dev.off()
