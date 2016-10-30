# SMU 2016 Sem 1 Data Science Mid Term: CaseStudy
# Nimish Sakalle
# This is complete .r file for case study
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

GDP.Final.Clean <- GDP.Final[!(is.na(GDP.Final$Ranking)), ]
head(GDP.Final.Clean)
nrow(GDP.Final.Clean)
str(GDP.Final.Clean)

# removing rows where the column values are null from attribute GDP.

Final.GDP <- GDP.Final.Clean[!(is.na(GDP.Final.Clean$GDP)), ]
nrow(Final.GDP)
Final.GDP

########################EOF####################################################