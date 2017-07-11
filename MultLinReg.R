
##Multiple Linear regression in R
# This program attempts to predict the price of a house

## Read in the Housing Data
## I got the data from https://wiki.csc.calpoly.edu/datasets/wiki/Houses
##The dataset contains the following fields:

##MLS: Multiple listing service number for the house (unique ID).
##Location: city/town where the house is located. Most locations are in San Luis Obispo county and northern Santa Barbara county (Santa Maria-Orcutt, Lompoc, Guadelupe, Los Alamos), but there some out of area locations as well.
##Price: the most recent listing price of the house (in dollars).
##Bedrooms: number of bedrooms.
##Bathrooms: number of bathrooms.
##Size: size of the house in square feet.
##Price/SQ.ft: price of the house per square foot.
##Status: type of sale. Thee types are represented in the dataset: Short Sale, Foreclosure and Regular.

#Store the data in a dataframe
MyData = read.csv("C:/Users/rodne/Desktop/RealEstate.csv")

## Take only features that we want to measure.
MyData2 = MyData[c(1,3,4,5,6,7)]

#Normalize the Data (If you want to normalize uncomment the next tow lines)
#scaled.dat = scale(MyData2)
#scaled.dat = sas.data.frame(scaled.dat)

## Create a Linear Model
LinMod = lm(Price~MLS+Bedrooms+Bathrooms+Size+Price.SQ.Ft, data=MyData2)

# Print the coeficients to be used for our prediction of house price
LinMod

# Make the prediction of the house given an example from the data set
 price = -7.346e+05 + (  132842*1.832e+00) + (3 * 1.832e+00) + (3 * 1.384e+04) + (2371 * 2.543e+02) + (335.3 * 1.871e+03)

# Check how accurate our model is
summary(LinMod)

# Residuals are essentially the difference between the actual observed response values and the response values that the model predicted. 

# The summary statistics above tells us a number of things. One of them is the model p-Value (bottom last line) and the p-Value of individual predictor variables (extreme right column under ‘Coefficients’). The p-Values are very important because, We can consider a linear model to be statistically significant only when both these p-Values are less than the pre-determined statistical significance level, which is ideally 0.05. This is visually interpreted by the significance stars at the end of the row. The more the stars beside the variable’s p-Value, the more significant the variable. 
