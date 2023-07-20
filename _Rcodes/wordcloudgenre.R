library(wordcloud2)

data=read.csv("melonchart0800.csv",stringsAsFactors =FALSE)

korean_words=unlist(str_extract_all(data, "[가-힣]+"))

nouns=sapply(korean_words,extractNoun,USE.NAMES=F)
class(nouns)
nouns=unlist(nouns)
class(nouns)
word =Filter(function(x){nchar(x)>=2},nouns)
word=table(word)

top_words <- head(sort(word,decreasing=T), 100)
top_freq <- head(sort(word,decreasing=T), 100)

wordcloud2(data=top_words,
           shape='pentagon',
           size=0.6)

