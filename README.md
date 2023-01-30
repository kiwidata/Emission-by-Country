# Group Project - Emission

## Discussion regarding topic for analysis

Emissions or electrical vehicles

Choice of Carbon emissions - found huge dataset of 65000 rows plus of carbon emission by country

Brainstorm:
 - countries emission comparison?
 - where is the peak of CO2 emission?
 - Paris Accord : Global Emission Goal - CO2 emission halved by 2030 possible?

Tool
- SQL - clean data
- Python - doing some analysis
- Tableau

Group:
- Visualization (PowerBI or Tableau): 
- Python analysis: Statistic and Linear Regression
- SQL database:

# Statistics and Linear Regression

## Overview

Two Goal were set for this analysis.
1) Statical Analysis to find the countries that contributed the most to global emissions. 
2) The Global Emission trends and predictions to see if the Paris Accord 2030 Goal of CO2 Emission can be reached.

## Results

### Top 3 Polluters

Based on our dataset : China (30.9%), USA (13.5%), India (7.3%) are the world biggest polluters. These 3 countries emitted more than 51.7% (19189 MtCO2) of all global CO2 in 2021.

![Top 3 Polluters ](https://user-images.githubusercontent.com/111706055/215375812-a95d7479-8eac-4b3d-80fb-9d0c6245e846.png)

### Emission Trends & Linear Regression

Looking at Emission Trends we looked at 4 different timeframes : 1750-2021, 1900-2021, 2000-2021, and 1980-2021.

#### 1750-2021
The graph below shows an exponential growth in MtCO2 emission from 1750-2021.

![1750_2021 timeframe](https://user-images.githubusercontent.com/111706055/215376639-8ccdb183-1bce-493a-93d3-9f3a32aadbe0.png)

Although this graph really does show the massive upscale of CO2 over the years. The timeframe had to be adjusted to more recent dates.The linear regression would not give an accurate prediction for this exponetial chart. The growth rate of CO2 emission did change over the years.

### 1900-2021

The graph below shows more a linear growth than an exponential growth. Linear regression was used for this data. 

![1900_2021 timeframe](https://user-images.githubusercontent.com/111706055/215377535-a33c8826-f855-43d5-91d7-e760ae31b9bb.png)

The R2 was accurate by 90.7% which mean the predictions were accurate by 90.7%. However it seems that the emission growth rate changed drastically over the last 120 years. Using this linear model we predicted by 2020 there would be 31907.7 MtCO2 emitted, but an actuality it was 35264.08 MtCO2 globally. The emission growth rate might be a factor. Hence we reduced the timeframe to look at more recent dates to find more accurate predictions that would assumed the actual current CO2 emission growth rate.

![1900_2021 linear](https://user-images.githubusercontent.com/111706055/215378373-cbfabc9c-4c64-403b-b9de-83fe67222fa9.png)


### 2000-2021

The graph still shows a linear growth and its R2 is 91.4% accurate. However it does appear less agressive than the previous plot from 1900-2021.
This might signal a plateau for the emission. Hence this might signal better predictions. Furthermore the 2021 emission (38555.41 MtCO2) of this linear regression is much closer to the 2021 total actuals of 371123.85 MtCO2 which reinforced the theory of a better prediction than the previous 1900-2021 model. 

![2000_2021 timeframe](https://user-images.githubusercontent.com/111706055/215378649-7c76645f-0d06-4c16-9bb2-6c9b07f083cd.png)

Comparing both linear model prediction '1900-2021' and '2000-2021' we have the following:

![both models](https://user-images.githubusercontent.com/111706055/215379183-37b05b74-484c-4b17-9121-197ac0b4b307.png)

The prediction from the '2000-2021' model is more than 50% than that of the 1900-2021 model in 2100. Both are accurate in term of their R2. However the predictions are not close. This shows the growth rate of emission is not constant and actually accelerated over time. One final linear regression with the timeframe of 1980-2021 was done to compare to the 2000-2021 timeframe.
