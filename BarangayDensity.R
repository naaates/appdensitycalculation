install.packages("dplyr")
install.packages("plyr")

pop = read.csv("population.csv", stringsAsFactors = TRUE)
reg = read.csv("regionarea.csv", stringsAsFactors = TRUE)

library(plyr)
library(dplyr)

#counts frequency of regions in population.csv
freq = count(pop,"Region")
reg$average = reg$Area/freq$freq
pop = merge(x=pop,y=reg,by=c("Region"), all= TRUE)
pop$density = pop$Population/pop$average
top_n(pop,10,density)
