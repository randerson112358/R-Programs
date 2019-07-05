#Install the appropriate packages
#install.packages("twitteR")
library("twitteR")
library("ISOweek")


#Assign the appropriate keys
consumerKey='XXXXXXX'
consumerSecret='XXXXXXX'
accessToken='XXXXXXX'
accessTokenSecret= 'XXXXXXX'


#Connect to twitter
setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)


#Open File and read lists 55 facts about computer science
FactsFile = read.table("test.txt", sep='\n')

#Check that each sentence in the test.txt file is 140 character or less to post to twitter
#for(i in 1:nrow(FactsFile)){
#if( as.numeric(nchar(as.vector(FactsFile[i,1]))) > 140){
#print(i)
#print(as.vector(FactsFile[i,1]))
#count = count + 1
#}
#}

#Get the Current Week for this year
week= strftime(Sys.Date(), format="%V")
#Convert the string to a number
weekNumber = as.numeric(week)

#Post Tweet Quote for that week
tweet(as.vector(FactsFile[weekNumber,1]))
