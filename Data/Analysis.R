# SMU 2016 Sem 1 Data Science Mid Term: CaseStudy
# Nimish Sakalle
# This is complete .r file for case study
# Step 1 is to load libraries

## Load R libraries 

library(plyr)
library(ggplot2)
library(knitr)
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

####----------------------------------------------------------------------------------------------------------#####
### Step3: file and data quality checks and cleanup.
##  First and fifth column does not have any name. below command it to add the column header.

  colnames(GDP)[1] <- "CountryCode"
  colnames(GDP)[5] <- "GDP"

# As check above columms x.1,x.2,x.3,x.4,x.5,x.6 does not have any data, these columns can be dropped from the dataset.
  GDP.Final <- GDP[,c(1:2,4:5)]
# and than checking the structures to verify changes.
  names(GDP.Final)
  head(GDP.Final)
  NROW(GDP.Final)

# Cleaning up of GDP File. Ranking attributes does have null values and below command will eliminate null data frame.
  GDP.Final[GDP.Final == ""] <- NA
  GDP.Final.Clean <- GDP.Final[!(is.na(GDP.Final$Ranking)), ]
  head(GDP.Final.Clean)
  nrow(GDP.Final.Clean)
  str(GDP.Final.Clean)
  GDP.Final.Clean
   
# removing rows where the column values are null from attribute GDP.

  Final.GDP <- GDP.Final.Clean[!(is.na(GDP.Final.Clean$GDP)), ]
  nrow(Final.GDP)
  Final.GDP

####----------------------------------------------------------------------------------------------------------#####  
# Step 4: This is to merge both the file using "COuntryCode" COlumn

  Merge.Data <- merge(Final.GDP, FEDSTATS, BY = "CountryCode")
  names(Merge.Data)


# This is to check and verify file merge, count of rows in dataset (Matched data on country code).
  
  head(Merge.Data)
  nrow(Merge.Data)
  str(Merge.Data)

####---------------------------------------------------------------------------------------------------------#####  
## Step 4: This section is dedicated for data analysis and data review.

## Question1 
## below command is to copy only the required columns to the dataframe. this is useful to eliminate colums not required for analysis.

  Merge.GDP.STAT <- Merge.Data[,c(1,2,3,4,6)]
 

# Below command output shows the number of IDs matched.
  
  dim(Merge.GDP.STAT)
  GDP.STAT.MATCH <- nrow(Merge.GDP.STAT)
  GDP.STAT.MATCH
  print(paste0("IDs Matched:", GDP.STAT.MATCH))


# Question 2: Sorting data frame
# To sort the data by GDP, this column has to convert into numeric. This column is currently defined as caracter.
  
  
  Merge.GDP.STAT$GDP <-as.numeric(gsub("[^[:digit:]]","", Merge.GDP.STAT$GDP))
  Merge.GDP.STAT$Ranking <-as.numeric(gsub("[^[:digit:]]","", Merge.GDP.STAT$Ranking))
  str(Merge.GDP.STAT)
# Below command is to sort the data by GDP.   
  Sort.GDP.Stat <- Merge.GDP.STAT[order(Merge.GDP.STAT$GDP), ]
  head(Sort.GDP.Stat)
  str(Sort.GDP.Stat)
# This is to dispaly 13 row of the data setr after sorting the dataset.  
  
  Sort.GDP.Stat.13 <- Sort.GDP.Stat[13,]
  knitr::kable(Sort.GDP.Stat.13)

## Question 3: AVG GDP Ranking
#  The below command is to provide the mean ranking by income group. 
  
  Merge.GDP.STAT.AVG  <- ddply(Merge.GDP.STAT, .(Income.Group), summarize,  Ranking=mean(Ranking))
  Merge.GDP.STAT.AVG 
  knitr::kable(Merge.GDP.STAT.AVG)

## Question 4: ggplot with color by income group.
## This is to create QQ plot.
plot_gg <- ggplot(Merge.GDP.STAT)+ geom_point(aes(x=GDP,y=Income.Group,colour=Income.Group))+scale_x_log10()+labs(x = Merge.GDP.STAT$GDP, y= Merge.GDP.STAT$Income.Group)

plot_gg 
##Question 5
# Below command cut GDp into 5 quantile

Merge.GDP.STAT$Quantile<- cut(Merge.GDP.STAT$Ranking,breaks=5) 
#take the quantiles and income.group from the merge data file and create a table 
quant.table<-table(Merge.GDP.STAT$Income.Group, Merge.GDP.STAT$Quantile) 
quant.table 
knitr::kable(quant.table)
###############################EOF################################################
