# To convert long format NIH survial data to meted vertical
rm(list = ls())
library(reshape)
library(dplyr)
library(tidyr)

dat <- read.csv("~/Documents/phd/NIH/longevity/data/NIH_data_final_long.csv")
mdat <- melt(dat, id.vars = c("cross","usability","clutch","start_day"))
out <- strsplit(as.character(mdat$variable),'_') 
mdat2 <-cbind(mdat, do.call(rbind, out))
colnames(mdat2)[5:8] <- c("day_sex","num_alive","day","sex")

write.csv(mdat2,"~/Documents/phd/NIH/NIH_data_final_melt.csv", row.names = F)
