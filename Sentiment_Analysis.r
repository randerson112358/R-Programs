#This file needs a few things
#Prerequisites
# 1) Positive and Negative words text file (positive-words.txt, and negative-words.txt)
# 2) You will need to connect to twitter by filling in the '###' with the correct credentials

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

tweets = searchTwitter("#bitcoin", n=10, lang="en")
Tweets.text = laply(tweets,function(t)t$getText())

#Scan in the positive words NOTE: Be sure to change <Location_of_File> to the location where you saved the positive-words.txt file
pos = scan('<Location_of_File>/positive-words.txt', what='character', comment.char=';')
 
#Scan in the negative words NOTE: Be sure to change <Location_of_File> to the location where you saved the negative-words.txt file
neg = scan('<Location_of_File>/negative-words.txt', what='character', comment.char=';')
 

score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  
  # we got a vector of sentences. plyr will handle a list or a vector as an "l" for us
  # we want a simple array of scores back, so we use "l" + "a" + "ply" = laply:
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    # clean up sentences with R's regex-driven global substitute, gsub():
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    # and convert to lower case:
    sentence = tolower(sentence)
    
    # split into words. str_split is in the stringr package
    word.list = str_split(sentence, '\\s+')
    # sometimes a list() is one level of hierarchy too much
    words = unlist(word.list)
    
    # compare our words to the dictionaries of positive & negative terms
   
    neg.matches = match(words, neg.words)
    pos.matches = match(words, pos.words)
    
    # match() returns the position of the matched term or NA
    # we just want a TRUE/FALSE:
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
    # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}

#HERE IS THE ANALYSIS !!!
analysis = score.sentiment(Tweets.text, pos, neg)

#You can get a table
table(analysis$score)

#You can get the mean
mean(analysis$score)

# you can get a histogram
hist(analysis$score)
