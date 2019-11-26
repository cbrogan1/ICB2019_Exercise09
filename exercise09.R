# exercise 9 - Cailey Brogan

library(ggplot2)
library(cowplot)

# number 1
# data from https://www.cdc.gov/growthcharts/html_charts/wtage.htm about age vs weight in males 2-20 yrs old

# read in data
dataFile <- read.table("age_weight.txt", header=T, sep="\t")

# create plot
a <- ggplot(data = dataFile, aes(x = age, y = weight)) + 
    geom_point(color = "blue", shape = 1) + 
    theme_bw() + 
    xlab("Age (in months)") + 
    ylab("50th percentile weight (in kg)") +
    stat_smooth(method="lm") + theme_classic()

# display plot
a

#--------------------------------------------------------------------------------------------------------------#

# number 2
data<-read.table("data.txt", header=T, sep=",")

# bar graph of the average observations per region
b <- ggplot(data, aes(x = region, y = observations)) +
    xlab("Region") + ylab("Observations") +
    stat_summary(geom="bar", fun.y="mean")

# scatter plot (using jitter) of all observations
c <- ggplot(data, aes(x= region, y = observations)) + geom_jitter(aes(color = as.factor(region))) +
  theme_bw() + xlab("Region") + ylab("Observations") +
  scale_color_manual(name = "region", values = c("red", "green", "blue", "orange"))

# plot both
plot_grid(b, c)

# Do the plots different stories? Why?
# Yes, the plots tell different stories.
# The difference in the bar and scatter plots show that the standard deviations of the regions are different.
# The north region has a small standard deviation.
# The east and west have large standard deviations.
# The south region has two subsets of data that each have small deviations with in the data subsets but the data set as a whole has a greater standard deviation than the north.
# The bar graph shows the averages while the jitter plot shows the ranges of the data





