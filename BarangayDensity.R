install.packages("dplyr")
install.packages("plyr")

pop = read.csv("population.csv", stringsAsFactors = TRUE)
reg = read.csv("regionarea.csv", stringsAsFactors = TRUE)

library(plyr)
library(dplyr)

#counts frequency of regions in population.csv
freq = count(pop,"Region")
#Calculate the Barangay Area
reg$average = reg$Area/freq$freq
#Outer Join population and regionarea datasets
pop = merge(x=pop,y=reg,by=c("Region"), all= TRUE)
#Calculate population density
pop$density = pop$Population/pop$average
top_n(pop,10,density)
