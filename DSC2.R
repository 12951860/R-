plot(itemChargeFull[which(itemChargeFull$itemname=="동화약품"),]$date,itemChargeFull[which(itemChargeFull$itemname=="동화약품"),]$close_val)
plot(itemChargeFull[which(itemChargeFull$itemname=="S-Oil"),]$date,itemChargeFull[which(itemChargeFull$itemname=="S-Oil"),]$close_val)
plot(oilKorea$date,scale(oilKorea$close_val),col=2,xlab="date",ylab="유가")
cor(itemChargeFull[which(itemChargeFull$itemname=="S-Oil"),]$close_val,oilKorea$close_val)
par(mfrow=c(1,1))
points(goodsForeign[which(goodsForeign$itemname=="설탕"),]$date,scale(goodsForeign[which(goodsForeign$itemname=="설탕"),]$close_val),col=4)
plot(itemChargeFull[which(itemChargeFull$itemname=="S-Oil"),]$date,itemChargeFull[which(itemChargeFull$itemname=="S-Oil"),]$close_val)

mode(goodsForeign$date) <- "character"
goodsForeign$date <- as.Date(goodsForeign$date,format = "%Y%m%d")

points(goodsForeign[which(goodsForeign$itemname=="알루미늄합금"),]$date,scale(goodsForeign[which(goodsForeign$itemname=="알루미늄합금"),]$close_val),col=3)
points(goodsForeign[which(goodsForeign$itemname=="아연"),]$date,scale(goodsForeign[which(goodsForeign$itemname=="아연"),]$close_val),col=5)
points(goodsForeign[which(goodsForeign$itemname=="납"),]$date,scale(goodsForeign[which(goodsForeign$itemname=="납"),]$close_val),col=1)
points(goodsForeign[which(goodsForeign$itemname=="구리"),]$date,scale(goodsForeign[which(goodsForeign$itemname=="구리"),]$close_val),col=4)


filter(goodsForeign,scale(close_val)<=-2)
z<-goodsForeign
z<-goodsForeign %>%
  group_by(itemname) %>%
  filter(scale(change_val)<=-2)
library(dplyr)

plot(oilForeign[which(oilForeign$itemname=="브렌트유"),]$date,scale(oilForeign[which(oilForeign$itemname=="브렌트유"),]$close_val))

which.max(oilKorea)
points(goldKorea$date,scale(goldKorea$buy_val),col=1)


plot(oilKorea$date,scale(oilKorea$close_val),col=2)

point(goodsForeign[which(goodsForeign$itemname==해외원자재[1]),]$date,
scale(goodsForeign[which(goodsForeign$itemname==해외원자재[1]),]$close_val))

a15<-scale(goodsForeign[which(goodsForeign$itemname==해외원자재[15]),]$close_val)
aa<-c(a12,a7,a13,a1,a2,a4,a15,a3,a10,a5,a8,a14,a6,a9,a11)
AA<-data.frame(date=goodsForeign$date,aa,itemname=goodsForeign$itemname)
AA
ggplot(AA,aes(date,aa,colour=itemname))+
  geom_point()
plot(goodsForeign[which(goodsForeign$itemname=="천연가스"),]$date,
      goodsForeign[which(goodsForeign$itemname=="천연가스"),]$close_val,xlab="date",ylab="천연가스")

plot(oilForeign$date,scale(oilForeign$close_val),col=2,xlab="date",ylab="유가")
plot(goldKorea$date,scale(goldKorea$buy_val))
mode(goldKorea$date) <- "character"
goldKorea$date <- as.Date(goldKorea$date,"%Y%m%d")


Q<-inner_join(oilKorea,goodsForeign[which(goodsForeign$itemname=="구리"),],by='date')
View(goodsForeign[which(goodsForeign$itemname=="구리"),])
bb <- scale(oilKorea$close_val)
mode(a1)
a1[1]

intersect(oilKorea,goodsForeign[which(goodsForeign$itemname=="구리"),])
oilKorea[c(1,2)]
3+5
for(i in 1:30){
  
}


zin<-goodsForeign[4593:4918,]
zinc1 <- data.frame(date=zin$date,close_val1=zin$close_val)
oil1<-data.frame(date=oilKorea$date,close_val2=oilKorea$close_val)
INN<-inner_join(zinc1,oil1,by='date')

X<-matrix(0,326,3)
i=1
j=1
k=1
repeat{

  if(zinc1[[1]][j]==oil1[[1]][k]){
    X[i,1]<-zinc1[[1]][j]
    X[i,2]<-zinc1[[2]][j]
    X[i,3]<-oil1[[2]][k]
    i = i+1
    k=k+1
    j=j+1
    if(j>326 | k>487) {
      print("error")
      break
    }
  }else if(zinc1[[1]][j]>oil1[[1]][k]){
    k=k+1
    if(k>487){
      print("a")
      break
    }
  }else(zinc1[[1]][j]<oil1[[1]][k]){
    j = j+1
    if(j>326){
      print("b")
      break
    }
  }
  
}
full_join(zinc1,oil1,by=c('date'))
write.csv(zinc1,file="D:\\DSC2019\\zinc1.csv")
write.csv(oil1,file="D:\\DSC2019\\oil.csv")
read.csv()
INN<-read.csv("D:\\DSC2019\\INN.csv",header=T)
plot(INN$close1,INN$close2)