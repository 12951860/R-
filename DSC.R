library(ggplot2)
head(exchange)
summary(exchange)
해외원자재 <- names(table(goodsForeign$itemname))
환전고시환율 <- names(table(exchange$itemname2))
해외금시세 <- names(table(goldForeign$itemname))
해외유가 <- names(table(oilForeign$itemname))
국내유가 <- names(table(oilKorea$itemname))
해외지수지수명 <- names(table(foreignCharge$itemname))
해외지수국가명 <- names(table(foreignCharge$country_name))
국내지수지수명 <- names(table(koreaIndex$itemcode))
종목시세및정보종목명 <- names(table(itemChargeFull$itemname))
SS<-list(해외원자재, 해외금시세, 해외유가, 국내유가, 해외지수지수명, 해외지수국가명,
                          국내지수지수명, 환전고시환율)
names(SS) <- c("해외원자재", "해외금시세", "해외유가", "국내유가", "해외지수지수명",
               "해외지수국가명", "국내지수지수명", "환전고시환율")
SS
min(koreaIndex$date); max(koreaIndex$date)
min(foreignCharge$date); max(foreignCharge$date)
plot(koreaIndex$change_val[koreaIndex$date>=20180101],type="l")   
plot(koreaIndex$acc_amount,type="l")  

a <- 해외지수국가명
#buildDictionary("NIADic","",data.frame("문대통령","ncn"))#을 명사로추가
a1 <- extractNoun(a)#명사추출
a2 <- unlist(a1)#리스트를 벡터로 
#noun2에서 2번이상 나온 단어만 추출 
a3 <- a2[nchar(a2) >= 2]

#단어 빈도수 계산 
aCount1 <- table(a3)
aCount <- head(sort(aCount1,decreasing = T),15)
print(aCount)

#wordcloud로 보기 
wordcloud(names(aCount),aCount,scale=c(4,1),rot.per = 0.35,min.freq=2,random.order=F,random.color=T)

sort(goodsForeign$change_val)
result <- goodsForeign %>%
  select(itemname,change_val,date) %>%
  filter(itemname=="대두") %>%
  arrange(change_val) %>%
  print()
plot(result$change_val)
install.packages("dplyr")
library(dplyr)

result2 <- goodsForeign %>%
  select(itemname,change_val,date) %>%
  filter(itemname=="대두박") %>%
  arrange(change_val) %>%
  print()
plot(result2$change_val)

head(result2$change_val,10)

which(result2$change_val,head(result2$change_val,10))
plot(koreaIndex$acc_quant)
plot(koreaIndex$acc_amount)
ggplot(koreaIndex,aes(date,acc_amount))+
  geom_point()
koreaIndex$date<-as.Date(koreaIndex$date,format='%Y%m%d')
mode(koreaIndex$date)<-"character"

ggThemeAssistGadget(a)
View(mpg)
abline(v=500)


plot(koreaIndex$close_val)
ggplot(koreaIndex,aes(date,close_val,colour=itemcode))+
  geom_point()

plot(itemChargeFull$close_val)
mode(itemChargeFull$date)<-"character"
itemChargeFull$date<-as.Date(itemChargeFull$date,format='%Y%m%d')
ggplot(itemChargeFull,aes(date,close_val,colour=itemcode))+
  geom_point()


head(종목시세및정보종목명)
plot(filter(itemChargeFull,itemChargeFull$itemname=="동화약품")$close_val)
plot(filter(itemChargeFull,itemChargeFull$itemname=="")$close_val)

plot(foreignCharge$close_val)
mode(foreignCharge$date)<-"character"
foreignCharge$date<-as.Date(foreignCharge$date,format='%Y%m%d')
ggplot(foreignCharge,aes(date,close_val,colour=itemcode))+
  geom_point()
q<-foreignCharge %>%
  arrange(desc(close_val)) %>%
  distinct(itemcode)
library(dplyr)
####write.table(filter(foreignCharge,itemcode),"D:\\DSC2019\\lklk.txt")

plot(exchange$sale_base_rate)
plot(exchange$change_val)
plot(exchange$cash_buying_val)

plot(oilKorea$close_val)

plot(goldKorea$international_val)
plot(goldKorea$deal_val)
plot(goldKorea$usd_rate)

plot(oilForeign$close_val)

plot(goldForeign$close_val)

plot(goodsForeign$close_val)

write.table(종목시세및정보종목명,"D:\\DSC2019\\종목시세및정보종목명.txt")
plot(filter(itemChargeFull,itemChargeFull$itemname=="넷마블")$close_val)
head(filter(itemChargeFull,itemChargeFull$itemname=="넷마블"))
write.table(환전고시환율 ,"D:\\DSC2019\\환전고시환율.txt")


plott(exchange,itemname2,"일본JPY (100엔)",cash_buying_val)
plot(filter(exchange,exchange$itemname2=="일본JPY (100엔)")$cash_buying_val)

w<-goodsForeign[which(goodsForeign$itemname=="설탕"),]
goodsForeign
plot(oilKorea$date[1:100],oilKorea$change_val[1:100])
  lines(x=w$date[1:100],y=w$change_val[1:100])
  mode(w$date)<-"character"
  w$date<-as.Date(w$date,format = "%Y%m%d")
mode(oilKorea$date)<-"character"
oilKorea$date <- as.Date(oilKorea$date,format="%Y%m%d")

e<-goodsForeign[which(goodsForeign$itemname!="구리"&goodsForeign$itemname!="니켈"&goodsForeign$itemname!="주석"),]
ggplot(goodsForeign,aes(date,close_val,colour=itemname))+
  geom_point()
mode(goodsForeign$date) <- "character"
goodsForeign$date <- as.Date(goodsForeign$date)

ggplot(itemChargeFull[which(itemChargeFull$itemname=="다나와"),],aes(date,close_val))+
  geom_line()

ggplot(oilForeign,aes(date,close_val,colour=itemname))+
  geom_line()
mode(oilForeign$date) <- "character"
oilForeign$date <- as.Date(oilForeign$date,format="%Y%m%d")

plot(oilKorea$date,oilKorea$close_val)
oil<-oilForeign[which(oilForeign$itemname=="두바이유"),]
plot(oil$date,oil$close_val)
par(mfrow=c(2,1))

