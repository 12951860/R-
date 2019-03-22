#요약통계
library(readr)
NHIS_OPEN_GJ_2015 <- read_csv("D:/R/NHIS_OPEN_GJ_2015.CSV",
                              locale=locale(encoding="euc-kr"))
summary(NHIS_OPEN_GJ_2015)
summary(as.factor(NHIS_OPEN_GJ_2015$성별코드))

library(XML)
library(dplyr)
#체중데이터 가져오기
data <- NHIS_OPEN_GJ_2015 %>%
   select('신장(5Cm단위)','체중(5Kg 단위)')
head(data)
#상관관계알아보기
cor(data, method = "pearson")
cor(data$`신장(5Cm단위)`,data$`체중(5Kg 단위)`,method="pearson")
# H0: 신장과 체중은 관계가 없다.
cor.test(data$`신장(5Cm단위)`,data$`체중(5Kg 단위)`)
#관계가 있어보인다.(양의 상관관계)

#회귀분석
data2 <- NHIS_OPEN_GJ_2015 %>%
  select('체중(5Kg 단위)',허리둘레,'신장(5Cm단위)')
set.seed(123)
idx <- sample(2,size=NROW(data2),replace=T,prob=c(0.7,0.3))
train_data <- data2[idx==1,]
test_data <- data2[idx==2,]
train_result <- lm(train_data$`체중(5Kg 단위)`~ train_data$허리둘레 + train_data$`신장(5Cm단위)`)
summary(train_result)

