#Install the appropriate packages
install.packages("twitteR")
library("twitteR")

#REPLACE '####' with the appropriate values from your twitter app
consumerKey='####'
consumerSecret='####'
accessToken='####'
accessTokenSecret= '####'

#Connect to twitter
setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)

#Extract Tweets !
searchTwitter("nba", n=3, lang="en")
