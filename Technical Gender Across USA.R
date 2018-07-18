library(readr)
library(dplyr)
library(tidyr)

#Setting Up the right Working directory
setwd("diversity across geography folder directory here")

#Reading in Company Gender info: INPUT A CSV FILE WITH "GENDER" and "STATE" COLUMNS IN DIVERSITY ACROSS GEOGRAPHY FOLDER FILTERED SUCH THAT YOU ONLY HAVE TECHNICAL WORKERS (Gender must be male, female, or blank, State just the state name)
Company_demos <- read_csv("Your File 1.csv")

#Reading in Percentage of STEM workforce that is female by state
Gender_STEM <- read_csv("Gender STEM by State.csv")

# Creating by State Company Gender Percentages
filtered_gend <- filter(Company_demos, !is.na(Gender))
Company_gend_state <- count(filtered_gend, Gender, State)
Company_gend_state_spread <- spread(Company_gend_state, Gender, n, fill=0)
Company_gend_state_spread2 <- mutate(Company_gend_state_spread, Tech_Females_in_org_percent = Female / (Male+Female), Males_in_org_percent = Male / (Male+Female), total_emps = Male + Female )

#Joining Workforce Info to Company Info
Gender_joined <- left_join( Company_gend_state_spread2,Gender_STEM, by = "State" )
Gender_joined2 <- mutate(Gender_joined, Female_difference = Tech_Females_in_org_percent - Percent_STEM_Workers_Female)
Gender_summary <- select(Gender_joined2, State, total_emps,Tech_Females_in_org_percent,Percent_STEM_Workers_Female, Female_difference)

#Filtering and Ordering to Highlight Discrepancies (Filter min value on total employees is editable)
Gender_summary_filt <- filter(Gender_summary, total_emps >= 5)
Gender_summary_filt <- Gender_summary_filt[order(Gender_summary_filt$Female_difference),]

#Writing Summary Table to CSV
write_csv(Gender_summary_filt,"Gender Summary Table.csv")



# (OPTIONAL) Reading in Applications Data: INPUT A CSV FILE "GENDER" and "STATE" COLUMNS IN DIVERSITY ACROSS GEOGRAPHY FOLDER FILTERED SUCH THAT YOU ONLY HAVE APPLICATIONS FOR TECHINCAL ROLES (Gender must be male, female, or blank, State just the state name)
applications <- read_csv("Your file here 2.csv")

# (OPTIONAL) Creating by State Technical Application Gender Percentages
filtered_applications <- filter(applications, !is.na(Gender))
apps_state <- count(filtered_applications, Gender, State)
apps_spread <- spread(apps_state, Gender, n, fill=0)
apps_spread2 <- mutate(apps_spread, Female_Tech_app_percent = Female / (Male + Female))
apps_spread3 <- select(apps_spread2, State, Female_Tech_app_percent)

# (OPTIONAL) Join Apps with Summary Table
Gender_Summary_Apps <- left_join(Gender_summary, apps_spread3, by="State")

# (OPTIONAL) Filtering and Ordering to Highlight Discrepancies (Filter min value on total employees is editable)
Gender_summary_apps_filt <- filter(Gender_Summary_Apps, total_emps >= 5)
Gender_summary_apps_filt <- Gender_summary_apps_filt[order(Gender_summary_apps_filt$Female_difference),]

# (OPTIONAL) Writing Applications Summary Table to CSV
write_csv(Gender_summary_apps_filt,"Gender and Apps Summary Table.csv")


