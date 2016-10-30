# SMU 2016 Sem 1 Data Science Mid Term: CaseStudy
# Nimish Sakalle
# This is complete .r file for case study
# Step 1 is to load libraries

####----------------------------------------------------------------------------------------------------------#####  
# Step 4: This is to merge both the file using "COuntryCode" COlumn
Merge.Data <- merge(Final.GDP, FEDSTATS, BY = "CountryCode")
# This is to check and verify file merge, count of rows in dataset (Matched data on country code).
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
############################EOF###############################################

