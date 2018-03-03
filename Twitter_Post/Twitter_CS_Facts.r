#Install the appropriate packages
#install.packages("twitteR")
library("twitteR")
library("ISOweek")


#Assign the appropriate keys
consumerKey='XXXXXXX'
consumerSecret='XXXXXXX'
accessToken='2257973394-XXXXXXX'
accessTokenSecret= 'XXXXXXX'


#Connect to twitter
setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)


#Open File and read lists 55 facts about computer science
FactsFile = read.table("test.txt", sep='\n')

#Get the Current Week for this year
week= strftime(Sys.Date(), format="%V")
#Convert the string to a number
weekNumber = as.numeric(week)

#Post Tweet Quote for that week
tweet(as.vector(FactsFile[weekNumber,1]))
