x <- (1:10)*10; x
length(x)
mean(x); sum(x)
var(x); sd(x)
min(x); max(x)
quantile(x, probs = c(0.25,0.75))
summary(x)
set.seed(10)
x = rnorm(n=500,mean=0,sd=1)
plot(x)
hist(x); abline(v=0, col="red")
a=factor(c("a","b","c","b","c","a","c","c","a"))
plot(a)
hist(iris$Sepal.Length,xlab="cm")
hist(iris$Sepal.Length,breaks = 20,xlab="cm")
plot(iris$Sepal.L, iris$Petal.Width,
     xlab=c("Sepal Length (cm)"),ylab=c("Petal Width (cm)"))
plot(iris[,1:4], main="Scatter Plots for Iris Variable",pch=16)

myfun <- function(n, mu, Sigma=diag(length(mu))){
  p = length(mu)  #차원
  R = chol(Sigma)  #Cholesky decomposition of Sigma
  #Sigma = t(R) %*% R
  z = matrix(rnorm(n*p),n ,p)
  res = z %*% R + matrix(mu, n, p, byrow=T)
  return(res)
}
myfun(3, mu=1:2)

for (i in 1:5){
  print(i)
}
x=0
for(j in 1:10){
  x = x + j
}
x
vec = rep(NaN, 10); vec
s=0
for(i in 1:10){
  s = s+i
  vec[i] = s;
}
c(1+2, vec[2])
c(1+2+3+4+5+6, vec[6])

set.seed(1)
rm(list=ls())  #변수지우기
n=10
mu=4
sigma=10
y <- rnorm(n, mean=mu, sd=sigma)
y
set.seed(1)
y <- rnorm(n, mean=mu, sd = sigma)
y
ybar <- mean(y)
s2 <- var(y)
c(ybar, s2)
c(mu,sigma)

nrep = 10000
s2 <- rep(NaN, nrep)
for (i in 1:nrep){
  y=rnorm(n, mean = mu, sd=sigma)
  ybar[i] = mean(y)
  s2[i] = var(y)
}
cbind(c(mean(ybar),mean(s2)),c(mu,sigma^2))
#표본수를 늘리니 평균과 분산이 모평균,모분산과 비슷
cbind(c(mean(ybar)-mu, mean(s2)-sigma^2))
n=1000
for(i in 1:nrep){
  y = rnorm(n, mean=mu, sd=sigma)
  ybar[i] = mean(y)
  s2[i] = var(y)
}
cbind(c(mean(ybar)-mu, mean(s2)-sigma^2))

data(cars)
head(cars)
X = cars$speed
Y = cars$dist
plot(X,Y)
n = length(Y)
mean_x = mean(X);
mean_Y = mean(Y)
var_x = var(X);
var_Y = var(Y)
cov_xy = cov(X,Y)
SS_xx <- (n-1)*var_x
SS_xy <- (n-1)*cov_xy
SS_yy <- (n-1)*var_Y
b1 <- SS_xy/SS_xx
b0 <- mean_Y - b1*mean_x

yhat <- b0 + b1*X
e <- Y-yhat
SSE <- sum(e^2)
MSE <- SSE/(n-2)
s <- sqrt(MSE)
print(cbind(mean_x,mean_Y))
print(cbind(SS_xx, SS_xy, SS_yy))
print(cbind(b0,b1))
print(cbind(Y,yhat,e))
plot(X,Y,xlim = c(0,125))
abline(a=b0, b=b1, col='red')
plot(e)
mod <- lm(Y~X)
plot(X,Y,xlim = c(0,125))
abline(mod)
cbind(c(b0,b1),mod$coefficients)#lm과 직접구한 것 비교
cbind(s, summary(mod)$sigma)
cbind(yhat, mod$fitted)

Nsim=100
N=101
beta0=1
beta1=3
X = seq(0,1,1/(N-1))
sigma=2
Y = matrix(rep(N*Nsim),nrow=N, ncol=Nsim)

coeff_matrix = matrix(rep(2*Nsim),nrow=2,ncol=Nsim)
sigma_matrix = matrix(rep(Nsim),nrow=1,ncol=Nsim)
for(i in 1:Nsim){
  epsilon = rnorm(N, mean=0, sd=sigma)
  Y[,i]=beta0 + beta1*X + epsilon
  mod = lm(Y[,i]~X)
  coeff_matrix[,i] = mod$coefficients
  sigma_matrix[i]=summary(mod)$sigma
}
apply(coeff_matrix, 1, mean)
bias_b = apply(coeff_matrix, 1, mean)-c(beta0,beta1)
bias_s = mean(sigma_matrix)-sigma
c(bias_b, bias_s)

hist(coeff_matrix[1,],main=c("Histogram of b0"),
     breaks=20, xlab="b0")
hist(sigma_matrix, main=c("Histogram of sigmahat"),
     breaks=20, xlab="b1")
Nsim=10000
Y=matrix(rep(N*Nsim),nrow=N,ncol=Nsim)
coeff_matrix = matrix(rep(2*Nsim),nrow=2,ncol=Nsim)
sigma_matrix = matrix(rep(Nsim),nrow=1,ncol=Nsim)
#표본 개수를 늘리면 오차가 줄어듦
for(i in 1:Nsim){
  epsilon = rnorm(N, mean=0, sd=sigma)
  Y[,i]=beta0 + beta1*X + epsilon
  mod = lm(Y[,i]~X)
  coeff_matrix[,i] = mod$coefficients
  sigma_matrix[i] = summary(mod)$sigma
}

bias_b_large = apply(coeff_matrix, 1, mean)-c(beta0,beta1)
bias_s_large = mean(sigma_matrix)-sigma
c(bias_b_large, bias_s_large)
cbind(bias_b,bias_b_large)
cbind(bias_s,bias_s_large)
