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

## By using below commands to check file header, summary about file, row count. Ths is important to get the information about the file.
## This steps helps to understand file structure, layout and data format.

# Checking for file header names.
names(GDP)
# Files header and first few attributes.
head(GDP)
# This commands give information about attributes data type.
str(GDP)
# This is to get the number of rows in file.
NROW(GDP)
#Its important to save original file layout and data into vector, this may come handy to have original format. 
GDP_RAW<-GDP

##Below commands to  read second file.
FEDSTATS <- read.csv("EDSTATS.csv",header=TRUE)

## Like the first file, below steps to check the of second file.
# Checking for file header names
names(FEDSTATS)

# This commands give information about attributes data type.
head(FEDSTATS)

# This commands give information about attributes data type.
str(FEDSTATS) 

#Its important to save original file layout and data into vector, this may come handy to have original format.
NROW(FEDSTATS)

############################EOF#####################
