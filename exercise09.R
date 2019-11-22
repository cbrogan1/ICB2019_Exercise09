# exercise 9 - Cailey Brogan

library(ggplot2)
library(cowplot)

# number 1
# data from https://www.cdc.gov/growthcharts/html_charts/wtage.htm about age vs weight in males 2-20 yrs old

# read in file name from user
filename <- readline("Enter file name (with .txt extension): ")

# function that reads in file name and then 
create_scatter <- function(filename) {
  dataFile <- read.table(filename, header=T, sep="\t")
  a = ggplot(data = dataFile, aes(x = age, y = weight)) + 
      geom_point(color = "blue", shape = 1) + 
      theme_bw() + 
      xlab("Age (in months)") + 
      ylab("50th percentile weight (in kg)") +
      stat_smooth(method="lm") + theme_classic()
  a
}


#--------------------------------------------------------------------------------------------------------------#
# number 2
data<-read.table("data.txt", header=T, sep=",")

# bar graph of the average observations per region
b <- ggplot(data, aes(x = region, y = observations)) +
    stat_summary(geom="bar", fun.y="mean")

# scatter plot (using jitter) of all observations
c <- ggplot(data, aes(x= region, y = observations)) + geom_jitter(aes(color = as.factor(region))) +
  theme_bw() + xlab("Region") + ylab("Observations") +
  scale_color_manual(name = "region", values = c("red", "green", "blue", "orange"))

# plot both
plot_grid(b, c)

