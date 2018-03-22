#This program takes insperational quotes from the text file 'insperation.txt' and posts it to twitter, depending on what week it is.
#Example: if the text file contained the following sentences in this order and the current week of the year was week 2, then the 
#program will post "have a good day!" to twitter:

#Psuedo List:
#"Be the best you can be !" - quote1
#"have a good day!" - quote2
#"You miss all the shots you never take" - quote3

#Install the appropriate packages
#install.packages("twitteR")
library("twitteR")
library("ISOweek")


#Assign the appropriate keys
consumerKey='XXXXXX'
consumerSecret='XXXXXX'
accessToken='XXXXXX'
accessTokenSecret= 'XXXXXX'


#Connect to twitter
setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)



#Extract Tweets !
#searchTwitter("nba", n=3, lang="en")


#Open File and read lists 55 facts about computer science (NOTE: Store the insperation.txt file in the following location:
#C:/Tweets/insperationTWT/
FactsFile = read.table("C:/Tweets/insperationTWT/insperation.txt", sep='\n')


#Gets the week number for the current year
week= strftime(Sys.Date(), format="%V")
weekNumber = as.numeric(week)

#Post Tweets
tweet(as.vector(FactsFile[weekNumber,1]))
