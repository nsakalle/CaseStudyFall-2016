# SMU 2016 Sem 1 Data Science Mid Term: CaseStudy
# Nimish Sakalle
# This is complete .r file for case study
# Step 1 is to load libraries

## Load R libraries 

library(plyr)
library(ggplot2)
####------------------------------------------------------------------------------------
### Step2: File read and check section.

# Setting working directory
setwd("C:\\RProject\\CaseStudy_fall2016\\Data")
# Reading file into GDP data frame
GDP <- read.csv("GDP.csv", skip=3,header=TRUE)
GDP_RAW<-GDP
##Below commands to  read second file.
FEDSTATS <- read.csv("EDSTATS.csv",header=TRUE)
FEDSTATS_Raw<-FEDSTATS



