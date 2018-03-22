#Install the appropriate packages
#install.packages("twitteR")
library("twitteR")
library("ISOweek")


#Assign the appropriate keys
consumerKey='St43EdCUSdUHiOVdAWk9fbO4e'
consumerSecret='ePSduAcJfr9f3e9jalkHvE468ZRZT6GfCvRSJz0aYMZCeh8HuM'
accessToken='2257973394-t8TwIXFfQhb6bRJKgGbNvWSrUNH56dN6ybV9CUM'
accessTokenSecret= 'ZHbQG780v88dZ1gzyoyErHZs8doUYvqiAGVsFOkxFufvr'


#Connect to twitter
setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)



#Extract Tweets !
#searchTwitter("nba", n=3, lang="en")


#Open File and read lists 55 facts about computer science
FactsFile = read.table("C:/Tweets/insperationTWT/insperation.txt", sep='\n')


week= strftime(Sys.Date(), format="%V")
weekNumber = as.numeric(week)

#Post Tweets
#tweet("A tweet")
tweet(as.vector(FactsFile[weekNumber,1]))