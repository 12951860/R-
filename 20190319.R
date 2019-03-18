#요약통계
library(readr)
NHIS_OPEN_GJ_2015 <- read_csv("D:/R/NHIS_OPEN_GJ_2015.CSV",
                              locale=locale(encoding="euc-kr"))
summary(NHIS_OPEN_GJ_2015)
summary(as.factor(NHIS_OPEN_GJ_2015$성별코드))

library(XML)
library(dplyr)
