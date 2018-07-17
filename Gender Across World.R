library(readr)
library(dplyr)
library(tidyr)

#Setting Up the right Working directory
setwd("diversity across geography folder directory here")

#Reading in Company Gender info: INPUT A CSV FILE WITH "GENDER" and "COUNTRY" COLUMNS IN DIVERSITY ACROSS GEOGRAPHY FOLDER (Gender must be male, female, or blank, Country just the country name)
Company_demos <- read_csv("Your file here.csv")

#Reading in Percentage of Labor force that is Female
Gender_LFPR <- read_csv("International Gender.csv")

#Creating by Country Company Gender Percentages
filtered_gend <- filter(Company_demos, !is.na(Gender))
Company_gend_Country <- count(filtered_gend, Gender, Country)
Company_gend_Country_spread <- spread(Company_gend_Country, Gender, n, fill=0)
Company_gend_Country_spread2 <- mutate(Company_gend_Country_spread, Females_in_org_percent = Female / (Male+Female), Males_in_org_percent = Male / (Male+Female), total_emps = Male + Female )

#Joining Workforce Info to Company Info
Gender_joined <- left_join( Company_gend_Country_spread2,Gender_LFPR, by = "Country" )
Gender_joined2 <- mutate(Gender_joined, Female_difference = Females_in_org_percent - Female_percent_of_LF)
Gender_summary <- select(Gender_joined2, Country, total_emps,Females_in_org_percent,Female_percent_of_LF, Female_difference)

#Filtering and Ordering to Highlight Discrepancies (Filter min value on total employees is editable)
Gender_summary_filt <- filter(Gender_summary, total_emps >= 10)
Gender_summary_filt <- Gender_summary_filt[order(Gender_summary_filt$Female_difference),]

#Writing Summary Table to CSV
write_csv(Gender_summary_filt,"Gender Summary Table.csv")



# (OPTIONAL) Reading in Applications Data: INPUT A CSV FILE "GENDER" and "Country" COLUMNS IN DIVERSITY ACROSS GEOGRAPHY FOLDER (Gender must be male, female, or blank, Country just the Country name)
applications <- read_csv("Applicant International Gender.csv")

# (OPTIONAL) Creating by Country Application Gender Percentages
filtered_applications <- filter(applications, !is.na(Gender))
apps_Country <- count(filtered_applications, Gender, Country)
apps_spread <- spread(apps_Country, Gender, n, fill=0)
apps_spread2 <- mutate(apps_spread, Female_app_percent = Female / (Male + Female))
apps_spread3 <- select(apps_spread2, Country, Female_app_percent)

# (OPTIONAL) Join Apps with Summary Table
Gender_Summary_Apps <- left_join(Gender_summary, apps_spread3, by="Country")

# (OPTIONAL) Filtering and Ordering to Highlight Discrepancies (Filter min value on total employees is editable)
Gender_summary_apps_filt <- filter(Gender_Summary_Apps, total_emps >= 10)
Gender_summary_apps_filt <- Gender_summary_apps_filt[order(Gender_summary_apps_filt$Female_difference),]

# (OPTIONAL) Writing Applications Summary Table to CSV
write_csv(Gender_summary_apps_filt,"Gender and Apps Summary Table.csv")


