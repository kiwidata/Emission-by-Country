### Tableau Link: https://public.tableau.com/views/EmissionsperCountry_16745347943690/GlobalCO2LinearPrediction?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link

# Group Project - Emission by Country
Carbon emissions and environmental protection issues become a widely used term and concept in the public debate on responsibility and abatement action against the threat of global climate change. Therefore, forecasting carbon emissions is of great significance to track countries' progress in meeting carbon emission targets set by the Paris Climate Agreement. This project analyzes estimates of global and national CO2 emissions using machine learning models. The aim is to predict if the goal of the Paris Climate Agreement Accord can be reached. One specific goal, in particular in this analysis, is to find if global CO2 emission level will be reduce by more than 40% compared to the 1990s level of emission. 

# Project structure

The project is divided into four stages:

* Stage 1: Data cleaning and exploration
  * Global data overview
  * Definition of the initial project goals
  * Data exploration and cleaning
  * Export clean data frame to a file
* Stage 2: Analysis
  * Top 3 Polluters and Linear Regression
  * Unsupervised Machine Learning
  * Deep Neural Network
* Stage 3: Data Visualization
  * Visualization and Insights of CO2 emissions
* Conclusion

# Built with

* **Programming language**
	- Python 3.7
* **Libraries**
	- **dataset handling**: pandas, numpy, tensorflow
	- **data visualization**: matplotlib
	- **machine learning**: scikit-learn
* **Presentation**: 
	- Jupyter Notebook
	- Tableau

# Stage 1: Data cleaning and exploration

## Global Data Overview

This dataset provided by CICERO Center for International Climate Research as part of the Global Carbon Project is an in-depth look into the global CO2 emissions at the country-level, facilitating a better comprehension of each nation's contribution to the global cumulative impact of human activity on climate. CO2 Emissions (MtCO2) from coal, oil, gas, cement, flaring, and other sources, as well as emissions per capita, are all included in this country-level survey of global fossil CO2 emissions.

The dataset is publicly available at https://doi.org/10.5281/zenodo.7215364 and licensed under the <a href="https://datacatalog.worldbank.org/public-licenses#cc-by">Creative Commons Attribution 4.0 International license</a>.

## Project Goals

Two Goals were set for this analysis:

1) The global CO2 emission trend - to see if the Paris Accord 2030 goal of CO2 emission could be reached. The Paris Accord states that the goal for emission should be at least a 40% reduction by 2030 compared to 1990 CO2 levels.
2) Statical Analysis to find the countries that contributed the most to global CO2 emissions and that improved the most over the years.

## Data exploration and cleaning

The dataset provided was cleaned and ready for use for analysis. Some cleaning was still done to properly used the data:
- All rows except global were removed to be able to analyze the global trend (jupyter notebook)
- Creating a table that showed the percentage of the type of emitters that pollutes by country and join it to our original table (Jupyter Notebook and SQL)
- All rows except 2021 year was shown to analyze the 2021 biggest polluters (jupyter notebook)

## Export clean data frame to a file
- Exported the percentage of emitters by country - https://github.com/kiwidata/Emission-by-Country/blob/main/emission%25bytype.csv
- Exported the 2021-2050 global CO2 prediction by country - https://github.com/kiwidata/Emission-by-Country/blob/main/CO2%20Emission%20Predictions%202021-2050.csv

## Software Used
* Kaggle
* Amazon Web Services (AWS) - RDS, S3, EC2
* PostgresSQL 13.7-R1
* pgAdmin 4
* Google Colab
* PySpark
* VS Code 1.75.0

## Outline of Workflow
* Obtained emissions_by_country dataset from Kaggle
* Created an AWS RDS, emissions-by-country
* Created a database in pgAdmin and connected to the RDS instance
* Created schemas and tables stored on PostgresSQL
* Created an AWS S3 bucket to store CSV files
* Used Google Colab and PySpark to extract, transform, and load the datasets into emission-by-country database
* Shut Down all the instances created with AWS
* Completed Notebook: ![emissions_by_country_jm.ipynb](link to the notebook when added to main)
* Schema: ![]()

# Stage 2: Analysis 

## Top 3 Polluters

Based on our dataset : China (30.9%), USA (13.5%), India (7.3%) are the world biggest polluters. These 3 countries emitted more than 51.7% (19189 MtCO2) of all global CO2 in 2021.

![Top 3 Polluters ](https://user-images.githubusercontent.com/111706055/215375812-a95d7479-8eac-4b3d-80fb-9d0c6245e846.png)

## Emission Trends & Linear Regression

Regression is machine learning technique used to predict continuous variables. The regression model can learn patterns that best fits the existing data and make future predictions beyond the range of current data.  This is an ideal use case for us since the CO2 emissions dataset contains large historical data and is continuous.  
To perform the analysis, we performed the following steps:
* Load the dataset into Pandas dataframe 
* Split the data into input and output
* Instantiate a linear regression model for the sklearn library to perform linear regression
* Make emission predictions on future years

Looking at Emission Trends, we looked at 4 different timeframes : 1750-2021, 1900-2021, 2000-2021, and 1980-2021.

#### 1750-2021
The graph below shows an exponential growth in MtCO2 emission from 1750-2021.

![1750_2021 timeframe](https://user-images.githubusercontent.com/111706055/215376639-8ccdb183-1bce-493a-93d3-9f3a32aadbe0.png)

A linear regression was made by changing the emission variable into a log function.

![1750_2021 timeframe log scales](https://user-images.githubusercontent.com/111706055/215959763-988bd2c3-def3-4725-98e4-5b3e3b5c46f3.png)

These graphs really does show the massive upscale of CO2 over the years. The R2 for the linear regression is 98.7% accurate which should in theory give us a very good prediction. However the predictions seems quite high. Even looking at 2021 it shows 63487.6 MtCO2 which is almost double the actual number that we currently have (37123 MtCO2). In 2100 its shows more than 20x the amount of CO2 emission than 2021. The growth rate of CO2 emission did change over the years, hence this model cannot be use because it assumes a constant growth rate and the predictions seems off the charts. The timeframe had to be adjusted to more recent dates.

### 1900-2021

The graph below shows more a linear growth than an exponential growth. Linear regression was used for this data. 

![1900_2021 timeframe](https://user-images.githubusercontent.com/111706055/215377535-a33c8826-f855-43d5-91d7-e760ae31b9bb.png)

The R2 was accurate by 90.7% which mean the predictions were accurate by 90.7%. However it seems that the emission growth rate changed drastically over the last 120 years. Using this linear model we predicted by 2020 there would be 31907.7 MtCO2 emitted, but in actuality it was 35264.08 MtCO2 globally. The emission growth rate is still a factor. Hence we reduced the timeframe to look at more recent dates to find more accurate predictions that would assumed the actual current CO2 emission growth rate.

![1900_2021 linear](https://user-images.githubusercontent.com/111706055/215378373-cbfabc9c-4c64-403b-b9de-83fe67222fa9.png)


### 2000-2021

The graph still shows a linear growth and its R2 is 91.4% accurate. However it does appear less aggressive than the previous plot from 1900-2021.
This might signal a plateau for the emission. Hence this might signal better predictions. Furthermore the 2021 emission (38555.41 MtCO2) of this linear regression is much closer to the 2021 total actuals of 371123.85 MtCO2 which reinforced the theory of a better prediction than the previous 1900-2021 model. 

![2000_2021 timeframe](https://user-images.githubusercontent.com/111706055/215378649-7c76645f-0d06-4c16-9bb2-6c9b07f083cd.png)

Comparing both linear model predictions '1900-2021' and '2000-2021' we have the following:

![both models](https://user-images.githubusercontent.com/111706055/215379183-37b05b74-484c-4b17-9121-197ac0b4b307.png)

The prediction from the '2000-2021' model is more than 50% than that of the 1900-2021 model in 2100. Both are accurate in term of their R2. However the predictions are not close. This shows the growth rate of emission is not constant and actually accelerated over time. One final linear regression with the timeframe of 1980-2021 was done to compare to the 2000-2021 timeframe.

### 1980-2021
The graph still shows a linear growth and its R2 is 96.37% accurate. This is more than 5% more accurate than our previous models (not including the 1750-2021 model). The 2021 emission (37661 MtCO2) of this linear regression is much closer to the 2021 total actuals of 371123.85 MtCO2 than our previous models. This model seems to have the best accuracy and also take in consideration the actual growth rate.

![1980_2021 timeframe](https://user-images.githubusercontent.com/111706055/215379606-f626836d-9774-4efc-b259-c8b46f8a7ecb.png)

Comparing the linear model predictions '1900-2021', '2000-2021', '1980-2021' we have the following:

![model comparison ](https://user-images.githubusercontent.com/111706055/215380250-68e775a5-9e09-4389-a781-db384c399e18.png)

The prediction models 2000-2021 and 1980-2021 seems very close. Especially looking at the next 5 years. This shows evidence that the actual growth rate did not change much during the last 40 years and that this prediction model can be used.The prediction does start to diverge the longer time passes. 

The model comparison shows 3 important components:

- Since 1900 the emission growth rate has drastically increased and our predicted emission shifted upward over the years. This is apparent looking at the 2020 year where the actual CO2 emission quantity is much larger than the predicted forecast of the '1900-2021' trend.

- The graphs shows that the emission level does seems to want to plateau in term of growth rate. This is evident since the 1980-2021 and 2000-2021 models are very close in term of predictions. 

- All graphs shows that the CO2 level will keep increasing with the current global emission rate. This is true for all 3 predictions. 

The table below shows the prediction rate of all the models in the next 30 years. 

![all model forecast including exp](https://user-images.githubusercontent.com/111706055/215960400-e1bcffe8-7b98-47c3-92fc-08231024ae2d.png)

All models indeed shows an increase in CO2 emission globally over the years.

### Discussion

The top 3 polluting countries (China, USA, and India) contributes to more than 51% of all global CO2 currently (2021).

In 1990 global emissions were 22757.48 MtCO2. Based on the Paris accord the goal was to reduce emissions by at least 40% by 2030 (~16000 MtCO2) compared to 1990 levels. However based on our models this will not be the case. The most accurate model '1980-2021' shows a prediction of 42129 MtCO2 in 2030. An 85% increased from 1990. The most optimistic model '1900-2022' shows a prediction of 34367 MtCO2 by 2030 which would show a slight decline from today's level, however this is assuming emission growth rate decrease, and even then it will not meet the desired goal. We can conclude that, based on these models, The Paris climate accord goal of CO2 emission will not be reached based on the current levels of global emissions. This is assuming the emission trend remains the same. 

## Unsupervised Learning 

The dataset provides detailed emissions level by country for over 200 years.  This can give us an insight into how each country's emission level changes over the course of history.  By grouping countries together, we can identify large emitting countries quickly and target them to reduce emissions the most.  For this task, we utlized unsupervised learning techniques, specifically K-means clustering. This is also a great use case because K-means can learn from un-labeled data to group the counties by their emissions levels.  We performed the following steps:

* Load the dataset into Pandas dataframe 
* Clean the dataset by removing missing value since historical data is not complete
* Drop non-numeric/unnecessary features such as country code, per-capita
* Standardize the data with StandardScaler
* Create an elbow curve to find the best value for K.
* Initialize and fit the model
* Visualize the results using hvplot


### Results
![2021](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_2021.PNG)
![2010](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_2010.PNG)
![2000](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_2000.PNG)
![1990](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_1990.PNG)
![1990](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_1990.PNG)
![1980](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_1980.PNG)
![1980](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_1970.PNG)


### Discussion
To understand what the data can tell us, we performed K-means clustering at five year intervals going back 20 years.  We can see the trend of how large emitting countries change in history.  As history tells us, the large emitters started in Europe, and shifted to the US, and eventually China as well as China developed in the late 20th and early 21st century.  Although intuitive, it is very satisfying to see our model able to make the clustering correctly.

## Deep Neural Network
Deep neural networks has the ability to learn from large sets of input data, regardless of data complexity.  We wanted to explore deep neural networks to see if it's a good use case for our dataset as well.  To accomplish this task, we performed the following:

* Load the dataset into Pandas dataframe 
* Clean the dataset by removing missing value since historical data is not complete
* Drop non-numeric/unnecessary features such as country code, per-capita
* Standardize the data with StandardScaler
* Split the preprocessed data into our features and target arrays
* Split the preprocessed data into a training and testing dataset
* Define the deep neural network using Keras library
* Tuned number of neurons and number of hidden layers
* Performed model training on varying number of epochs
* Observe model loss and accuracy

## Results
![Deep_learning](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/deep%20learning.PNG)

## Discussion
For deep neural network, the application we used was for classification, where the target variable is labeled and belongs to a class. In our use case, the target variable is continuous, and the model loss function "binary_crossentropy" is not a good fit because it does not work on continuous data.  This is shown in the results where the model accuracy is 0 after training.  To overcome this, we switched the loss function to "mean squared error" to try to evaluate the model.  We are able to show that the model is able to reduce the loss and improve accuracy after training.  However deep neural network is not meant to be a replacement for learning regression or logistical regression, and in many cases it does not perform better.  For our use case, it definitely seems to be the case where it is not a good fit.  We believed using linear regression gave us the best result for our dataset and goal.

# Stage 3: Data Visualization

## Visualization and Insights of CO2 emissions

![Screen Shot 2023-02-07 at 8 32 17 PM](https://user-images.githubusercontent.com/106771574/217666113-cf27a712-c967-4759-9a57-6f40d02adfef.png)
This depiction specifically describes how our linear prediction models were able to "analyze" the next 30 years of how much CO2 emission (Mt) we emitted globally following the years of 2021. Each linear prediction model can truly tell their own story. For example, the first model (located on the top right of your screen) focused on the prediction that was allotted from Start Year of 1750 leading into End Year of 2021. Our group was able to conclude that by the year of 2050, we would expect about 170,000 Metric tons (Mt) of CO2 to be emitted globally, which is mindboggling if you truly sit there and imagine what actually pollutes thousands of Metric tons of CO2 gloabally. But thankfully this is just a prediction, and a group conclusion that we came to was that we shoudln't be using this graph for a proper linear regression model until we analyze predict the outcomes of years that actually had relative data for our analysis. For example, the three graphs under our 1750-2021 analysis gives us a more clarified picture/reponse on how our data will perform within the next 30 years. The three following graphs (middle/bottom right side of your screen) consisted of 3 linear regression models from the years of 1900-2021, 1980-2021, & 2000-2021. These three predictions allowed us as analysists' to scale that it would describe almost an accurate representation of how the next 30 years of glabal CO2 emissions will impact our world (scaled by Metric Tons). We concluded that the best models to use were from 2 time allotments of 1900-2021 & 2000-2021; these two models gave us the best depictions of how to predict the future.

These 5 graphs (Left side) shows us a proper representation of how each pollutant of CO2 impacted our economy Globally from 1900-2021. This visualization is shown to represent how badly our World is being impacted by each pollutant of CO2 individually. The main focus of our analysis/visualation was scaled to represent the start year of 1900 all of the way through the year of 2021, hence a graph that one our main linear prediction models is based off of. 

![Screen Shot 2023-02-08 at 3 15 21 PM](https://user-images.githubusercontent.com/106771574/217673217-f3913753-71f5-4a13-b022-a3a6358f55c3.png)
The top 5 graphs scale all of our pollutants of CO2 emission per Metric Ton; Cement, Gas, Coal, Flaring, & Oil (Left to Right). These graphs will move from left to right, starting from the year of 1900, hence ending in the year of 2021. Then if you click on each graph, it will display the points of origin for how many units of CO2(Mt) was polluted for each pollutant. 

The World map under our Top 5 graphs respresents to us, in detail, our findings for the biggest pollutant of C02 emission by country. Our group was able to assess that our top three biggest polluters were: China(1), USA(2), & India(3). Our World map represents a cohesive understanding of how each pollutant impacted each country, scaled by Metric Tons of CO2.

![Screen Shot 2023-02-08 at 3 25 26 PM](https://user-images.githubusercontent.com/106771574/217674661-0222aab4-c9c6-4f18-8c1e-b633bd11e70a.png)
These 5 World maps represent our results for the emission of CO2 per Country using a colored heat-map to explain our findings (Using a specifc year). For an example now is posted the year of 2021. Although if you were looking for the year of 1869 for some reason, select the dropdown "Year (Page filter)" to locate the respective time allotment for your analysis, then the Tableau visuaization should refresh and there you have it! A new and improved colored heat map for the year of 1869 for how each pollutant impacted our economy globally, for their emission of C02 per Metric Ton. 

FUN Fact: I actually had to make a Calculated Field and a Parameter (Using an IF/THEN statement) which was the only way to Colour coordinate our findings with how each country positively or negatively reacts to the change of time given. For an example the graph will look very different accross the board if you were to use the year of 2021, in comparison to the year of 2000 or any other given year. Note: if you change the time only by 1 Year, the graphs should stay relative to the same colors within that visualization. 

### Tableau Embedded Code: <div class='tableauPlaceholder' id='viz1675900877884' style='position: relative'><noscript><a href='#'><img alt='Global CO2 &#47; Linear Prediction ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Em&#47;EmissionsperCountry_16745347943690&#47;GlobalCO2LinearPrediction&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='EmissionsperCountry_16745347943690&#47;GlobalCO2LinearPrediction' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Em&#47;EmissionsperCountry_16745347943690&#47;GlobalCO2LinearPrediction&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1675900877884');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else { vizElement.style.width='100%';vizElement.style.height='777px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>

# Conclusion

The Paris climate accord goal of CO2 emission will not be reached based on the current levels of global emissions. Hence by 2030 we will not reach a 40% CO2 emission reduction rate compared to the 1990's level. Assuming the emission trend remains the same, the linear regression analysis shows the CO2 emission will keep increasing to about 42129 MtCO2 in 2030. Almost triple the target rate set for 2030 of ~16000 MtCO2.

In 2021, based on our dataset, China (30.9%), USA (13.5%), India (7.3%) are the world biggest polluters. These 3 countries emitted more than 51.7% (19189 MtCO2) of all global CO2. By performing K-means clustering at five year intervals.  We saw the trend of how large emitting countries change throughout history.  As history tells us, the largest emitters started in Europe in the early 20th century, shifted to the US, and eventually to China in the 21st century.

One other model was performed 'deep neural network'. However it was not a good fit for our analysis since it was focusing in classification and not prediction. Our data is continuous.
