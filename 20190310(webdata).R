#CSV데이터
#공공데이터포털(data.go.kr)의 건강검진정보(2015년) 데이터(NHIS_OPEN_GJ_2015)
# File > Import Dataset > From Text (readr) > 파일선택(폴더는 영어, 패키지설치)
install.packages('readr')
#한글이 깨져서 보일경우 하단에 있는 Locale항목의 Configure를 클릭하고 Encoding은 제일 하단의 Other를 선택
#encoding방식으로는 euc-kr을 입력후 OK누르고 Import로 데이터를 가져옴
#데이터를 가져올 때엔 데이터가 변형되거나 누락된 부분이 있는지 확인할 것

#data.seoul.go.kr에서 공기업리스트 > 한국어 > 인증키신청
install.packages('XML')
library(XML)
url <- 'http://openapi.seoul.go.kr:8088/6764526474776f6734377355794252/xml/SebcPublicEnterpriseKor/1/5/'
indata <- xmlToDataFrame(url)  
View(indata)
indata <- indata[-1:-2,-1:-3]


#JSON데이터
install.packages('jsonlite')
library(jsonlite)
install.packages('curl')
library(curl)
data2 <- fromJSON("https://api.github.com/users/hadley/orgs")
data2 <- as.data.frame(data2)
colnames(data2)
View(data2)
