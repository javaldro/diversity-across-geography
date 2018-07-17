library(readr)
library(dplyr)
library(tidyr)

#Setting Up the right Working directory
setwd("diversity across geography folder directory here")

#Reading in Company Gender info: INPUT A CSV FILE WITH "GENDER" and "STATE" COLUMNS IN DIVERSITY ACROSS GEOGRAPHY FOLDER (Gender must be male, female, or blank, State just the state name)
Company_demos <- read_csv("Your file Here.csv")

#Reading in Labor Force Participation Rates and Census Numbers
Gender_LFPR <- read_csv("Labor force participation Gender.csv")
Gender_state <- read_csv("Gender demo numbers by state.csv")

# Creating by State Company Gender Percentages
filtered_gend <- filter(Company_demos, !is.na(Gender))
Company_gend_state <- count(filtered_gend, Gender, State)
Company_gend_state_spread <- spread(Company_gend_state, Gender, n, fill=0)
Company_gend_state_spread2 <- mutate(Company_gend_state_spread, Females_in_org_percent = Female / (Male+Female), Males_in_org_percent = Male / (Male+Female), total_emps = Male + Female )

# Creating By State Labour force Gender Percentages
Gender_LFPR_spread <- spread(Gender_LFPR, Gender, "Labor Force Participation", fill=0)
Gender_LFPR_spread2 <- select(Gender_LFPR_spread, Male, Female) 
Gender_LFPR_spread3 <- Gender_LFPR_spread2[rep(1, nrow(Gender_state)),]

Gender_labor_adjusted <- Gender_LFPR_spread3*Gender_state[,-1]
Gender_labor_adjusted2 <- mutate(Gender_labor_adjusted, Females_in_workforce_percent = Female / (Male+Female), Males_in_workforce_percent = Male / (Male+Female), total_workforce = Male + Female )
Gender_labor_adjusted2$State <- Gender_state$Geography

#Joining Workforce Info to Company Info
Gender_joined <- left_join( Company_gend_state_spread2,Gender_labor_adjusted2, by = "State" )
Gender_joined2 <- mutate(Gender_joined, Female_difference = Females_in_org_percent - Females_in_workforce_percent)
Gender_summary <- select(Gender_joined2, State, total_emps,Females_in_org_percent,Females_in_workforce_percent, Female_difference)

#Filtering and Ordering to Highlight Discrepancies (Filter min value on total employees is editable)
Gender_summary_filt <- filter(Gender_summary, total_emps >= 10)
Gender_summary_filt <- Gender_summary_filt[order(Gender_summary_filt$Female_difference),]

#Writing Summary Table to CSV
write_csv(Gender_summary_filt,"Gender Summary Table.csv")



# (OPTIONAL) Reading in Applications Data: INPUT A CSV FILE "GENDER" and "STATE" COLUMNS IN DIVERSITY ACROSS GEOGRAPHY FOLDER (Gender must be male, female, or blank, State just the state name)
applications <- read_csv("Your File Here 2.csv")

# (OPTIONAL) Creating by State Application Gender Percentages
filtered_applications <- filter(applications, !is.na(Gender))
apps_state <- count(filtered_applications, Gender, State)
apps_spread <- spread(apps_state, Gender, n, fill=0)
apps_spread2 <- mutate(apps_spread, Female_app_percent = Female / (Male + Female))
apps_spread3 <- select(apps_spread2, State, Female_app_percent)

# (OPTIONAL) Join Apps with Summary Table
Gender_Summary_Apps <- left_join(Gender_summary, apps_spread3, by="State")

# (OPTIONAL) Filtering and Ordering to Highlight Discrepancies (Filter min value on total employees is editable)
Gender_summary_apps_filt <- filter(Gender_Summary_Apps, total_emps >= 10)
Gender_summary_apps_filt <- Gender_summary_apps_filt[order(Gender_summary_apps_filt$Female_difference),]

# (OPTIONAL) Writing Applications Summary Table to CSV
write_csv(Gender_summary_apps_filt,"Gender and Apps Summary Table.csv")


