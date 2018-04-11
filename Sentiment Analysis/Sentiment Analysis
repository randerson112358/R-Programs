#install.packages("RSentiment")
library(RSentiment)

calculate_total_presence_sentiment(c("This is a good text", "This is a bad text", "This is a really bad text", "This is horrible"))
#[,1]      [,2]      [,3]       [,4]       [,5]            [,6]           
#[1,] "Sarcasm" "Neutral" "Negative" "Positive" "Very Negative" "Very Positive"
#[2,] "0"       "0"       "3"        "1"        "0"             "0"        

calculate_sentiment(c("This is a good text", "This is a bad text", "This is a really bad text", "This is horrible"))
#        text                 sentiment
#1       This is a good text  Positive
#2        This is a bad text  Negative
#3 This is a really bad text  Negative
#4          This is horrible  Negative

calculate_score(c("This is a good text", "This is a bad text", "This is a really bad text", "This is horrible"))
#[1]  1 -1 -1 -1
