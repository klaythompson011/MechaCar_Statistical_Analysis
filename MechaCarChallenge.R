# import dplyr package
library(tidyverse)

# import file MechaCar_mpg.csv
MechaCar <- read.csv(file = "MechaCar_mpg.csv", check.names = F)

# generate multiple linear regression model
reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar)
reg

# generate summary statistics for reg data
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar))

# import file Suspension_Coil.csv 
Susp_Coil <- read.csv(file = "Suspension_Coil.csv", check.names = F)

# generate summary statistics for Susp_Coil data
total_summary <- Susp_Coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# generate summary statistics based on grouping of each manufacturing lot
lot_summary <- Susp_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# create subsets for each manufacturing lot
lot1 <- subset(Susp_Coil,Manufacturing_Lot=="Lot1")
lot2 <- subset(Susp_Coil,Manufacturing_Lot=="Lot2")
lot3 <- subset(Susp_Coil,Manufacturing_Lot=="Lot3")

# compare subsets versus population mean
t.test(Susp_Coil$PSI, mu=1500)
t.test((lot1$PSI), mu=1500)
t.test((lot2$PSI), mu=1500)
t.test((lot3$PSI), mu=1500)
