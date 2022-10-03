# MechaCar Statistical Analysis

## Overview of the Analysis
A new prototype from AutosRU, the MechaCar, is experiencing production issues. To determine the source of the production issues regression analyses and t-tests will be conducted using R Studio. A statistical study comparing vehicle performance of the new MechaCare will be created to measure its performance against similar vehicles from other manufacturers.
<br><br>


## Resources
<b>Data Sources: </b><br>
- MechaCar_mpg.csv, a dataset containing mpg test results for 50 prototype MechaCars. <br>
- Suspension_Coil.csv, a dataset containing suspension coil weight capacities from three MechaCar production lots. <br>

<b>Components:</b><br>
- R Studio 2022.07.1 <br>
- R version 4.2.1 <br><br>
<b>R Packages:</b><br>
- ggplot2 3.3.6<br>
- tidyverse 1.3.2<br>
- dplyr 2.2.1<br>

## Summary

### Deliverable 1: Linear Regression to Predict MPG

Using linear regression the following coefficients are shown for the MechaCare_mpg.csv dataset:<br>

![linear_regression_mechaCarData](https://user-images.githubusercontent.com/105830645/193483704-d5d8a708-b966-4f97-8924-459b99b5a73c.png)<br>

The summary of the linear regression model shows the p-value and the r-squared value.<br>

![linear_regression_summary_mechaCarData](https://user-images.githubusercontent.com/105830645/193483722-0912308d-80c1-4fd5-aa56-0cb6e7dc3ca8.png)<br>

1. The pr(>|t|) value is less than 0.05 for vehicle length and ground clearance, indicating these variables impact MPG. <br>

2. The slope of the linear model is 5.35x10^11, which is not zero. However, it is lower than the 0.05 assumed statistical significance. The null hypothesis ("the slope is 0") is rejected.<br>

3. The model's r-squared value is 0.7149 and the adjusted r-squared value is 0.6825. This means that MPG can be predicted with approximately 68%-72% accuracy. There is room for improvement in the model with additional measurements.<br><br>


### Deliverable 2: Suspension Coil Analysis

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch.
The suspension coil summary for all MechaCar production lots is shown here. <br>

![summary_suspension_coil_data](https://user-images.githubusercontent.com/105830645/193484026-9e7793e5-9ea4-4be5-8599-3110ff174d6a.png)<br>

![summary_suspension_coil_data_table](https://user-images.githubusercontent.com/105830645/193483926-bd84e257-a954-4abe-9456-55c81caa876a.png)<br>



The variance of the suspension coils is 62.69 pounds per square inch. Therefore, it does not exceed the design specification of 100 pounds per square inch.<br>


The breakdown of the suspension coil measurements by production lots is shown here.<br>
![lot_summary_suspension_coil_data](https://user-images.githubusercontent.com/105830645/193483736-935ce126-cf48-434d-8367-a0eb68e6fa66.png)<br>
![lot_summary_suspension_coil_data_table](https://user-images.githubusercontent.com/105830645/193483751-e968453c-d2fb-4f89-84b9-9cdf49c42639.png)<br>


We see that Lot 1 has a 0.98 variance and Lot 2 has a 7.47 variance, both of which are well below the manufacturing standards. Lot 2 however is much higher, with a variance of 170.29, which is above the design specification. Lot 3 is contributing to a much higher variance for the total dataset and should be investigated further.<br>


The following boxplot shows the wider inner quartile range and outliers for Lot 3 more clearly.<br><br>
![PSI_by_Lot](https://user-images.githubusercontent.com/105830645/193483788-93e1c25e-035f-4744-bf6b-0f8daa2c886b.png)<br><br>


### Deliverable 3: T-Test Analysis<br>

A t-test was conducted on the total suspension coil dataset showing the PSI across all lots and determining if it is statistically different from the population mean of 1,500 pounds per square inch.<br>

The results show that there is a sample mean of 1,498.78 and a p-value of 0.06. The p-value is above 0.05 (the assumed lower limit for statistical significance). This indicates the PSI of 1,498.78 is statistically similar to the 1,500 of the mean population and we fail to reject the null hypothesis.<br>
![t_test_all_samples](https://user-images.githubusercontent.com/105830645/193484076-35eb4082-3ef1-49a0-8a4c-7ebc7fa13d1d.png)


Three more t-tests were conducted on each manufacturing lot.<br>

Lot 1 shows the sample mean as 1,500 and the p value is 1, which means there is no statistical difference from the total population mean and we fail to reject the null hypothesis for Lot 1. This means Lot 1 is statistically similar to the mean population.<br>
![t_test_lot1](https://user-images.githubusercontent.com/105830645/193484084-a3fa8d68-9cee-436f-ac33-57c049185bcd.png)<br>


Lot 2 shows the sample mean as 1,500.2 and the p value as 0.61. Because the p-value is above the assumed limit of 0.05 we fail to reject the null hypothesis for Lot 2. This means Lot 2 is statistically similar to the mean population.<br>
![t_test_lot2](https://user-images.githubusercontent.com/105830645/193484091-5187cc3c-e700-4779-87b3-171516286501.png)<br>

Lot 3 shows the sample mean is 1,496.14 and the p-value is 0.04. Because the p-value is below the assumed limit of 0.05 we reject the null hypothesis, which means that this population is statistically different from the mean population.<br><br>
![t_test_lot3](https://user-images.githubusercontent.com/105830645/193484097-3987cbf4-a5d1-472f-a917-6c97cf343682.png)<br>

### Deliverable 4: MechaCar vs Competitor Study

With rising gas prices many consumers are focused on fuel efficiency when considering their next vehicle purchase. MechaCar's fuel efficiency rating can be compared to leading competitors to determine how the model performs against similar models. 

H0 (Null Hypothesis): MechaCar's fuel efficiency is greater than 80% of similar models from competitors.

Ha (Alternative Hypothesis): MechaCar's fuel efficiency is not greater than 80% of similar models from competitors.

To test these, we'd need to determine how we define similar models from competitors. It should be similar in the engine type, axel ratio, emissions, vehicle width, vehicle length, and vehicle weight to the MechaCar model. Mean miles per gallon (MPG) and mean highway MPG should be compared to determine how competitors match up against the MechaCar model. Once the mean MPG and highway MPG are determined across the models, t-tests can be conducted to see if there is statistical difference between the MechaCar model and others. If 80% of the t-tests show a statistical difference and the diffeference is that MechaCar has a greater MPG and Highway MPG mean, then MechaCar performs better than 80% of similar competitor models.  
