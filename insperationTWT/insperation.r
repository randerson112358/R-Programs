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


week= strftime(Sys.Date(), format="%V")
weekNumber = as.numeric(week)

#Post Tweets
#tweet("A tweet")
tweet(as.vector(FactsFile[weekNumber,1]))
