
# Deliverable 1
# Use the library() function to load the necessary packages
library (tidyverse) #load tidyverse package
library(dplyr) #load dplyr package
library(ggplot2) #Load ggplot2

# Read in the MechaCar_mpg.csv file as a dataframe.
mechaCarData <- read.csv(file='Resources/MechaCar_mpg.csv', stringsAsFactors = FALSE, check.names = FALSE)
head(mechaCarData) # Display the first 6 rows of the dataframe

# Perform linear regression using the lm() function.
# In the lm() function, pass in all six variables (i.e., columns), and add the dataframe as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance,data=mechaCarData)

# Use the summary() function to determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance,data=mechaCarData))

# Deliverable 2

# Read in the Suspension_Coil.csv file as a dataframe.
suspension_coil_data <- read.csv(file = 'Resources/Suspension_Coil.csv',stringsAsFactors = FALSE, check.names = FALSE)
head(suspension_coil_data) # Display the first 6 rows of the dataframe

# Create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- suspension_coil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
total_summary # Display the summary dataframe

# Creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot
# by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create lot summary table
lot_summary # Display the summary dataframe

# Deliverable 3

# Use the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch
# t.test for all the lots
t.test(suspension_coil_data$PSI, mu=1500)

# t.test for lot 1
t.test(subset(suspension_coil_data,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)

# t.test for lot 2
t.test(subset(suspension_coil_data,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)

# t.test for lot 2
t.test(subset(suspension_coil_data,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)

# Create Boxplot Showing the Manufacturing Lots
ggplot(suspension_coil_data,aes(x = Manufacturing_Lot,y = PSI, fill= Manufacturing_Lot)) +geom_boxplot()+
  labs(title="PSI by Manufacturing Lot",
       x ="Manufacturing Lot", y = "PSI", fill = "Manufacturing Lot")+
  theme(plot.title = element_text(size=14, face="bold",hjust = 0.5),
  axis.title.x = element_text(color="blue", size=12, face="bold"),
  axis.title.y = element_text(color="blue",size=12, face="bold"))
