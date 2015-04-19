library('twitteR')

key <- "K6zvFfu5aLf9BZsVwMU1rYzW3"
secret <- "2mEEgWyi0JoHA9mVidDEj7y13GNCRW7KjeOZqA9X5gYJ6SKO7b"
secrettk <- "xlB3GI1TcM5xKQlO3tVaOFpnPjg8cLr98veLbePE9t6No"
mytoken <- "31033030-sJ6w29mm0yWfUJ8vAH7QnD46MUkoXtviXYZzcNIWy"

setup_twitter_oauth(key, secret, mytoken, secrettk)

tweets = userTimeline('google',n=1000)
tweets = searchTwitter('#bigpharma',n=1000)
head(tweets)

library('tm')

mylist <-sapply(tweets,function(x)x$getText())

mycorpus <-Corpus(VectorSource(mylist))
mycorpus <-tm_map(mycorpus,content_transformer(tolower))

mycorpus <-tm_map(mycorpus,tolower)
mycorpus <-tm_map(mycorpus,removeNumbers)
mycorpus <-tm_map(mycorpus,removePunctuation)
mycorpus <- tm_map(mycorpus,function(x)removeWords(x,stopwords()))
mycorpus <-tm_map(mycorpus,PlainTextDocument)

library('wordcloud')
library('RColorBrewer')

col <- brewer.pal(5,'Dark2')
wordcloud(mycorpus,min.freq=1,rot.per=0.45,scale=c(4,1),random.color=T,max.word=45,random.order=F,colors=col)

mytdm = TermDocumentMatrix(mycorpus)
findFreqTerms(mytdm,lowfreq=55)
tdm <-removeSparseTerms(mytdm,sparse=0.93)
tdmscale = scale(tdm)
dist <-dist(tdmscale,method='canberra')
fit <- hclust(dist)
plot(fit)
cutree(fit,k=7)
rect.hclust(fit,k=7,border="salmon")
