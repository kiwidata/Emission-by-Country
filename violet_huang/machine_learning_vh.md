# Final Project Machine Learning Component

# Overview

The fossil CO2 emissions dataset we use from the Global Carbon Project consists of global and national fossil CO2 emissions from 1750 to 2021.  The dataset contains 64k entries with information on country name, country code, year, total emissions, emissions from major sources of coal, oil, gas, cement, flaring, all other sources combined, and per capita amount.  
![Dataset columns](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/Dataset%20columns.PNG)

This dataset gives us an insight into how each country individually and the world as a whole contributed to CO2 emissions.  The Paris Accord, which was signed in 2016 by 194 countries aims to reduce global CO2 emissions to slow global warming and reduce its impacts.  We performed analysis using various techniques learned throughout the course to:
* Have a deep understanding of what the data presents.
* Use linear regression to predict future CO2 emission levels and see if the Paris Accord can be met.
* Use unsupervised learning, specifically K-means clustering to group countries by their emission levels to identify high emission groups.
* Explore deep neural network to see if it is applicable in our use case.


# Linear Regression
Regression is machine learning technique used to predict continuous variables. The regression model can learn patterns that best fits the existing data and make future predictions beyond the range of current data.  This is an ideal use case for us since the CO2 emissions dataset contains large historical data and is continous.  
To perform the analysis, we performed the following steps:
* Load the dataset into Pandas dataframe 
* Clean the dataset by removing missing value since historical data is not complete
* Drop non-numeric/unnecessary features such as country code, per-capita
* Split the data into input and output
* Instantiate a linear regression model for the sklearn library to perform linear regression
* Make emission predictions on future years

## Results
![After 2000 linear regression](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/2020%20linear%20regression.PNG)



## Discussion
From the results, we can see that linear regression can capture the increasing trend of global CO2 emissions.
I experimented using differnt lookback time periods (20, 50, 70 years) to examine model accuracy, although longer time period present more data, however the plots of data shows the emission have expanation growth for past 70 years. The accuracy of longer period time point doesn't show the same trend. 
After group discussion, we continue to preprocess the data to try to include the model accuracy. 
![Original data plot_expanation growth](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/2020%20linear%20regression.PNG)


# Unsupervised Learning 
The dataset provides detailed emissions level by country for over 200 years.  This can give us an insight into how each country's emission level changes over the course of history.  By grouping countrie together, we can identify large emitting countries quickly and target them to reduce emissions the most.  For this task, we utlize unsupervised learning techniques, specifically K-means clustering. This is also a great use case because K-means can learn from un-labeled data to group the counties by their emissions levels.  We performed the following steps:
* Load the dataset into Pandas dataframe 
* Clean the dataset by removing missing value since historical data is not complete
* Drop non-numeric/unnecessary features such as country code, per-capita
* Standardize the data with StandardScaler
* Create an elbow curve to find the best value for K.
* Initialize and fit the model
* Visualize the results using hvplot


## Results
![2021](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_2021.PNG)
![2010](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_2010.PNG)
![2000](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_2000.PNG)
![1990](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_1990.PNG)
![1990](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_1990.PNG)
![1980](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_1980.PNG)
![1980](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/clustering_1970.PNG)


## Discussion
To understand what the data can tell us, we performed K-means clustering at five year intervals going back 20 years.  We can see the trend of how large emitting countries change in history.  As history tells us, the large emitters started in Europe, and shifted to the US, and eventually China as well as China developed in the late 20th and early 21st century.  Althogh intuitive, it is very satisfying to see our model able to make the clustering correctly.


# Deep Neural Network
Deep neural networks has the ability to learn from large sets of input data, regardless of data complexity.  We wanted to explore deep neural networks to see if it's a good use case for our dataset as well.  To accomplish this task, we performed the following:
* Load the dataset into Pandas dataframe 
* Clean the dataset by removing missing value since historical data is not complete
* Drop non-numeric/unnecessary features such as country code, per-capita
* Standardize the data with StandardScaler
* Split the preprocessed data into our features and target arrays
* Split the preprocessed data into a training and testing dataset
* Define the deep neural network using Keras library
* Tuned number of neurons and number of hidden layers
* Performed model traing on varying number of epochs
* Observe model loss and accuracy

## Results
![Deep_learning](https://github.com/kiwidata/Emission-by-Country/blob/violet-huang/violet_huang/deep%20learning.PNG)
ls
c

## Discussion
For deep neural network, the applicaion we used in class was for classfication, where the target variable is labled and belongs to a class. In our use case, the target variable is continuous, and the model loss fuction "binary_crossentropy" is not a good fit because it does not work on continous data.  This is shown in the results where the model accuracy is 0 after traing.  To overcome this, we switched the loss function to "mean squared error" to try to evaluate the model.  We are able to show that the model is able to reduce the loss and improve accuracy after training.  However, as we learned in class, deep neural network is not meant to be a replacement for learning regression or logistical regression, and in many cases it does not perform better.  For our use case, it definitely seems to be the case where it is not a good fit.  We believe using linear regression can give us the best result for our dataset and goal.