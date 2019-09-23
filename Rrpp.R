dat <- read.csv("D:\\R\\NHIS_OPEN_GJ_2015.CSV",header = T)
head(dat)
write.table(head(dat),"D:\\R\\GJ2015.txt",sep=" ")
?write.table
library("readr")
write_tsv(head(dat),"D:/R/GJ20152.txt")


#xml데이터
url <- 'http://openapi.seoul.go.kr:8088/(인증키)/xml/SebcPublicEnterpriseKor/1/5/'
install.packages('XML')
library(XML)
indata <- xmlToDataFrame(url)
View(indata)
indata <- indata[-1:-2,-1:-3]#1,2행과 1~3열은 필요없음

#JSON데이터
#github
install.packages("jsonlite")
library(jsonlite)
install.packages('curl')
library(curl)
data2 <- fromJSON("https://api.github.com/users/hadley/orgs")
data2 <- as.data.frame(data2)
colnames(data2)
View(data2)

#공공데이터포털
setwd("D:/R/")
data3 <- fromJSON("Nationalelementaryschool.json")#인코딩에러
guess_encoding("Nationalelementaryschool.json")#readr패키지
data3 <- fromJSON(txt="Nationalelementaryschool.json",encoding="euc-kr")#?


##데이터베이스
#MSSQL서버


##feather,fst
datab<-data.frame(number=rnorm(n=100000000))
dim(datab)
system.time({
  save(datab, file="data.RData")
})
library(readr)
system.time({
  write_csv(datab,"datab.csv")
})
install.packages("feather")
library(feather)
