library('twitteR')


library('tm')
udemytweets = userTimeline('udemy',n=1000)
head(udemytweets)
udemylist <-sapply(udemytweets,function(x) x$getText())
udemylist
udemycorpus <- Corpus(VectorSource(udemylist))
udemycorpus
udemycorpus = tm_map(udemycorpus,tolower)
udemycorpus = tm_map(udemycorpus,removePunctuation)
udemycorpus <- tm_map(udemycorpus,function(x)removeWords(x,stopwords()))

?getTransformations

udemcorpus <- tm_map(udemycorpus,PlainTextDocument)
udemycorpus
