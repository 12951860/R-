mtcars %>%
  group_by(cyl) %>%
  summarise(average=mean(mpg))
filter(iris,Sepal.Length > 7)

sample_n(iris,1,replace=T)
top_n(iris,5,Sepal.Width)
head(sort(iris$Sepal.Width,decreasing = T))

set.seed(123)
idx <- sample(2,size=NROW(iris),replace=T,prob=c(0.7,0.3))
train_data <- iris[idx==1,]
test_data <- iris[idx==2,]
install.packages("party")
library(party)
iris_tree <- ctree(Species~.,data=train_data); iris_tree
plot(iris_tree)
plot(iris_tree,type="simple")
#정확도확인
table(train_data$Species)
table(predict(iris_tree),train_data$Species)
#데이터예측
test_result <- predict(iris_tree,newdata=test_data)
table(test_data$Species)
table(test_result,test_data$Species)
#분류정확도평가
install.packages('caret')
install.packages('e1071')
library(caret)
confusionMatrix(test_result,test_data$Species)


install.packages("randomForest")
library(randomForest)
iris_forest <- randomForest(Species~., data=train_data, importance=T)
iris_forest

table(train_data$Species)
table(iris_forest$predicted, train_data$Species)
#변수중요도확인
iris_forest$importance
varImpPlot(iris_forest)
#예측
test_result <- predict(iris_forest, newdata=test_data)
table(test_data$Species)
table(test_result, test_data$Species)

#정확도평가
library(caret)
confusionMatrix(test_result,test_data$Species)

#ggplot2
install.packages("ggplot2")
library(ggplot2)
vignette("ggplot2-specs")
vignette("extending-ggplot2")
x<-ggplot(data=cars,aes(x=speed,y=dist))
summary(x)

#레이어상속
ggplot(data=cars, aes(x=speed,y=dist))+
  geom_point(colour="red")

ggplot(data=mpg, aes(x=displ,y=hwy,colour=class))+
  geom_point()+
  geom_smooth(se=F,method=lm)

ggplot(mpg,aes(displ,hwy,colour=class))+
  geom_point(colour='red')+
  geom_smooth(se=F,method=lm)

p<- ggplot(data=diamonds, aes(x=carat,y=price))
p+geom_smooth()

p <- ggplot(data=diamonds, aes(x=carat,y=price))
p + geom_smooth(aes(group=cut))

p<-ggplot(data=diamonds,aes(x=carat,y=price))
p + geom_smooth(aes(colour=cut))

ggplot(data=diamonds, aes(x=price))+geom_histogram()
ggplot(data=diamonds, aes(x=price))+geom_histogram(aes(y=..count..))

ggplot(data=diamonds,aes(x=price))+geom_histogram(aes(y=..ncount..))

x<-ggplot(diamonds, aes(price))
x+stat_bin(geom="bar") #-- (1)
x+stat_bin(geom="Line") #--(2)
x+stat_bin(aes(size=..ncount..),geom="point")#--(3)

#변수하나geom_dotplot()
result <- ggplot(iris,aes(Sepal.Length))+geom_dotplot()
result

summary(iris$Sepal.Length)
range(iris$Sepal.Length)
result<-ggplot(iris, aes(Sepal.Length))+geom_dotplot(binwidth=3.6/30)
result#오류없음

#geom_area()
result <- ggplot(iris,aes(Sepal.Length))+geom_area(stat='count')
result
table(iris$Sepal.Length)

#geom_bar()
result <- ggplot(iris,aes(Sepal.Length))+geom_bar()
result

result <- ggplot(iris,aes(Sepal.Length))+geom_bar()+coord_flip()
result

result <- ggplot(iris,aes(Sepal.Length))+geom_bar()+coord_flip()+scale_x_reverse()
result

result<-ggplot(iris,aes(Sepal.Length))+geom_bar(fill="deepskyblue4",alpha=0.3)
result
#geom_histogram()

#변수가 두개일때
#geom_line()
View(pressure)
result<- ggplot(pressure,aes(temperature,pressure))+geom_line()
result
#geom_area,geom_step() = 면적,계단식표현

#geom_point()
result<-ggplot(iris,aes(Sepal.Length,Sepal.Width))+geom_point()
result


#ggThemeAssist
install.packages('ggThemeAssist')
library(ggplot2)
library(ggThemeAssist)
gg<-ggplot(mtcars,aes(x=hp,y=mpg,colour=as.factor(cyl)))+geom_point()+theme()
gg

ggThemeAssistGadget(gg)

gg + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1), 
    panel.grid.minor = element_line(colour = "green4", 
        size = 2, linetype = "longdash"))
gg + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1), 
    panel.grid.major = element_line(colour = "coral", 
        size = 1))
gg + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1), 
    panel.background = element_rect(fill = "cadetblue2", 
        colour = "black", size = 2, linetype = "dotted"))
gg + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1), 
    plot.background = element_rect(fill = "azure4", 
        colour = "cornflowerblue", size = 2, 
        linetype = "dotdash"))
gg + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1))
