### Alternative Authentication


# for this method you need the following objects from the 
# "keys and access token" tab in your developers account


# key <- "your API key from twitter"
# secret <- "your Secret key from twitter"
# secrettk <- "Access Token Secret from Twitter"
# mytoken <- "Access Token from Twitter"

key <- "K6zvFfu5aLf9BZsVwMU1rYzW3"
secret <- "2mEEgWyi0JoHA9mVidDEj7y13GNCRW7KjeOZqA9X5gYJ6SKO7b"
secrettk <- "xlB3GI1TcM5xKQlO3tVaOFpnPjg8cLr98veLbePE9t6No"
mytoken <- "31033030-sJ6w29mm0yWfUJ8vAH7QnD46MUkoXtviXYZzcNIWy"

# make sure that R recognizes it as character (it turns green when put under quotation)


# we need these 2 packages
library("twitteR")
library("httr")


# we are using the setup_twitter_oauth function
?setup_twitter_oauth


# keep this order of arguments
setup_twitter_oauth(key, secret, mytoken, secrettk)
# (1) choose direct authentication


# now you should be connected

# in this case you can run the search without the cainfo argument
udemytweets = searchTwitter("#Udemy", n=1000)