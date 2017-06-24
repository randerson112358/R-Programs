library(jsonlite)
jsonData = fromJSON("https://api.github.com/users/randerson112358/repos")
names(jsonData)
jsonData$name

## Change data set to JSON
myJSON = toJSON(iris, pretty=TRUE)
cat(myJSON)

##Change back to data frame
fromJSON(myJSON)
head(myJSON)
