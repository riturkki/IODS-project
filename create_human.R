library(data.table)
library(dplyr)
library(stringr)


hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

str(hd)
dim(hd)
summary(hd)
setnames(hd,c("hdi_rank","country","hdi","le","ey","my","gni","gni_rank"))
str(hd)

str(gii)
dim(gii)
summary(gii)
setnames(gii,c("gii_rank","country","gii","mmr","abr","prp","pse_f","pse_m","lfpr_f","lfpr_m"))
str(gii)

gii <- mutate(gii, pse_ratio = pse_f / pse_m)
gii <- mutate(gii, lfpr_ratio = lfpr_f / lfpr_m)

human <- inner_join(gii, hd, by = "country", suffix = c(".gii",".hd"))

save(human,file="human")

