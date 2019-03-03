install.packages('dplyr')
library(dplyr)
install.packages('tidyr')
library(tidyr)

#데이터프레임테이브
#iris datafmf tbl_iris qustndp sjgwk
tbl_iris <- tbl_df(iris)
tbl_iris
#데이터가 10개씩만 표기됨
iris$Sepal.Len #가장 비슷한 Sepal.Length가 나옴
tbl_iris$Sepal.Len #없는 명칭이라고 오류가 나옴
class(iris)
class(tbl_iris)
#데이터 프레임 테이블이 분석하기 쉬운형태

#gplimpse() : 데이터 구조를 확인하는 함수로 str()과 비슷
str(mtcars)
glimpse(mtcars) #좀더 정렬되어 있고 콘솔 크기에 맞춰 나옴

# %>%는 연산을 연속으로 할 때 좋은 함수다
# 파이프(%>%)를 안 쓴 경우 
result1 <- tbl_iris[tbl_iris$Species == "setosa", ]
result2 <- summary(result1)

#쓸 경우
result1 <- blt_iris %>%
  filter(Species == 'setosa') %>%
  summary() %>%
  print()

print(result2)

#gather() 데이터의 행/열 전환
# gather(데이터, 변수명을 포함한 열의 신규 명칭, 값을 포함한
#   열의 신규 명칭, 긴 형태로 전환할 변수 리스트)
tbl_iris

gather(tbl_iris,Type, value, Sepal.Length:Petal.width)

# spread()  여러 인덱스가 있는 데이터를 피벗테이블로 전환
# spread(데이터, 피벗으로 변환할 열의 이름, 값으로 처리할
#     열의 이름)
mtcars_10 <- head(mtcars,10) %>% print()

spread(mtcars_10, gear, mpg)

#separate(데이터, 분리할 칼럼명, 분리되는 신규 칼럼명) /칼럼안데이터분리
mtcars_name <- data.frame(Names = rownames(mtcars)); mtcars_name
result <- separate(mtcars_name, Names, c("A", "B"), sep=" ",fill = 'right'
                   , extra = 'merge');result


#Unite(데이터, 합쳐져 새로 생성될 칼럼명, 합칠 칼럼명1, 합칠칼럼명2)
mtcars_name<- unite(result, Names,A,B,sep=" ");mtcars_name

#개체추출
#filter(데이터, 조건)
filter(tbl_iris, Species=='versicolor')

#특정행의 개체 추출 slice(데이터, 조건)
slice(tbl_iris,6:15)

#필요한 열만 선택하기
#select()  sql쿼리문 처럼 필요한 칼럼만 선택
select(tbl_iris, Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
#select도우미함수 p.136
select(tbl_iris, starts_with("S"))

vars <- c("Sepal.Length", "Petal.Length")
select(tbl_iris, one_of(vars))

tbl_iris2 <- tbl_iris
colnames(tbl_iris2) <- sprintf("x%d",1:5)
tbl_iris2
