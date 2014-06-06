### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### plot3.R: Create PNG plot of TimeStamp/Sub_metering[123]
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

### Convert date and time strings/columns to new TimeStamp (POSIXlt) column
df$TimeStamp <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

### Create PNG plot of TimeStamp/Sub_metering[123]
png("plot3.png", width=480, height=480)

### Adjust left margin
par(mar = c(5.1, 5, 4.1, 2))

with( df, 
  {
    plot(TimeStamp, Sub_metering_1, 
      type = "n",
      ylab = "Energy sub metering",
      xlab = ""
    )

    lines(TimeStamp, Sub_metering_1, col="black")
    lines(TimeStamp, Sub_metering_2, col="red")
    lines(TimeStamp, Sub_metering_3, col="blue")

    legend(
      "topright", 
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty = 1,
      col = c("black", "red", "blue")
    )
  }
)

dev.off()
