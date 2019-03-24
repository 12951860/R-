x = 2
x
y <- c(1,2,3,4)
y
y + x
y/x
y*y   #hadamard product (element-by-element)
y%*%y #vector multiplication
x1 <- seq(5)
x2 <- seq(1,5)
x3 <- seq(from=1, to=5, by=1)
x4 <- seq(1,5,1)
x5 <- seq(1,5,length=5)
x1;x2;x3;x4;x5

rep(1,5)
rep(c(1,2), 3)
AB <- c("A", "B")
rep(AB, 3)
rep(AB, times=c(4,2))
x= 1:4
x[1]
x[1:3]
x[-4]
x[c(T,T,F,F)]

x<- c("low","med","high","med","high")
xf <- factor(x)
xf
as.numeric(xf)
xf2 <- factor(x, levels = c("low","med","high"))
xf2
as.numeric(xf2)
xf[3] = "Extreme"  #levels에 없음
xf
xf[3] = "low"
xf
levels(xf)
levels(xf)[1] <- "Extreme"  #high를 Extreme으로 바꿈
xf
A1 <- matrix(1:9, nrow=3, ncol=3)
A1
A2 <- matrix(1:9, 3, 3, byrow=T)
A2
t(A1)
A1+A2

eng <- c(60,72,57,90,95,72)
math <- c(75,80,92,91,87,50)
score1 <- cbind(eng, math) #col(열)로 붙힘
score1
score2 <- rbind(eng,math);score2 #행(row)으로 붙힘
A <- matrix(1,3,3);A
I = diag(3)
B = 0.3*A + 0.7*I;B
solve(B)
solve(B) %*% B
C <- array(1:24, dim=c(3,4,2))
C
C[2,3,1]
C[,2,1]
data(iris)
head(iris)
dim(iris)  #차원
names(iris)
iris[1,]
mylist = list(Math=math, Eng=eng, Name="final")
mylist
mylist$Math; mylist[[1]]
mylist$Math[2]; mylist[[1]][2]
mylist2 = list(a=1:3,b=matrix(1:4,2,2),c="example")
mylist2
