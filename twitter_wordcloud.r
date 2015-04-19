library('twitteR')

library('tm')
udemytweets = userTimeline('udemy',n=1000)
head(udemytweets)
udemylist <-sapply(udemytweets,function(x) x$getText())
udemylist
udemycorpus <- Corpus(VectorSource(udemylist))
udemycorpus
udemycorpus = tm_map(udemycorpus,content_transformer(tolower))
udemycorpus = tm_map(udemycorpus,removePunctuation)
udemycorpus <- tm_map(udemycorpus,function(x)removeWords(x,stopwords()))

?getTransformations

udemcorpus <- tm_map(udemycorpus,PlainTextDocument)
udemycorpus

library('wordcloud')

?wordcloud
wordcloud(udemycorpus,min.freq=4,scale=c(5,1),random.color=F,max.word=45,random.order=F)

udemytdm = TermDocumentMatrix(udemycorpus)

udemytdm

findFreqTerms(udemytdm,lowfreq=11)

?findFreqTerms

findAssocs(udemytdm,'udemy',0.60)
findAssocs(udemytdm,'build',0.35)

udemy2tdm <-removeSparseTerms(udemytdm,sparse = 0.9)

udemy2tdmscale <-scale(udemy2tdm)
udemydist <-dist(udemy2tdmscale,method='euclidean')
udemyfit <- hclust(udemydist)

plot(udemyfit)

cutree(udemyfit,k=5)

rect.hclust(udemyfit,k=4,border='red')
