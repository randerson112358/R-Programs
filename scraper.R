library(‘rvest’)


#Specifying the url for desired website to be scrapped
url <- 'https://socialblade.com/youtube/top/500'

#Reading the HTML code from the website
webpage <- read_html(url)
webpage

# write html to a file
write_html(webpage, file=”output.html”)
