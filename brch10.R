#ch10
library(wordcloud)
install.packages("wordcloud")
library(KoNLP)
library(Sejong)
library(NIADic)
useNIADic()
useSejongDic()
#mypaths <- .libPaths()
#mypaths<- c(mypaths[2],mypaths[1])
#.libPaths(mypaths)
news <- readLines("D:\\R언어교재자료(학생용) (1)\\ch_10\\ch10_1_news.txt")
buildDictionary("NIADic","",data.frame("문대통령","ncn"))#을 명사로추가
noun1 <- extractNoun(news)#명사추출
noun2 <- unlist(noun1)#리스트를 벡터로 
#noun2에서 2번이상 나온 단어만 추출 
noun3 <- noun2[nchar(noun2) >= 2]

#단어 빈도수 계산 
nounCount1 <- table(noun3)
nounCount <- head(sort(nounCount1,decreasing = T),15)
print(nounCount)

#wordcloud로 보기 
wordcloud(names(nounCount),nounCount,scale=c(4,1),rot.per = 0.35,min.freq=2,random.order=F,random.color=T)
