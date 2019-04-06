#theta ~ Beta(a,b)
a=1;b=1
#x|theta ~ B(n, theta)
n=40; x=15
#a discretization of the possible theta value
theta = seq(0,1,length=50)
prior.theta = dbeta(theta,a,b)
#prob of data/theta(likelihood)
likhd.theta = dbinom(x,n,theta)
#joint prob of data & theta
joint.xtheta = prior.theta * likhd.theta
#posterior of theta
post.theta = dbeta(theta, a+x, b+n-x)
par(mfrow=c(2,2))#set up a 2x2 plotting window plot
plot(theta,prior.theta, type="l",
sub="(a) prior: pi(theta)")
plot(theta, likhd.theta, type="l",
     sub="(b) likelihood: f(x|theta)")
plot(theta, joint.xtheta, type="l"
     ,sub="(c) prior x likelihood: pi (theta)x
      f(x|theta)")
plot(theta,post.theta, type="l",
     sub="(d) posterior: pi(theta|x)")
abline(v=(a+x-1)/(a+b+n-2),lty=2)

par(mfrow=c(1,1))
plot(theta, post.theta, type="l", col="blue")
lines(theta, prior.theta, col="red", lty=2)

legend(.5, 3, legend=c(paste("beta(",a,",",b,",) prior"),
                       paste("post under beta(",a, ",",b,") prior")),
       lty=c(2,1),col=c("red", "blue"), bty="n")

#Monte Carlo
n=c(10,100,1000,10000,100000)#N value
int = rep(0,5) #integral
for(i in 1:5){
  xval = runif(n[i],min=-1, max=1)
  int[i] = mean(2*xval^2)
}

n=30
theta_1000 = rbeta(1000, a+x, b+n-x)
#generate posterior samples
quantile(theta_1000, c(.025,.975))
#simulation-based quantiles
qbeta(c(.025,.975),a+x,b+n-x)#theoretical quantiles
mean(theta_1000);var(theta_1000)#simulation-based estimates
#theoretical estimates
(a+x)/(b+a+n); (a+x)*(b+n-x)/((a+b+n+1)*(a+b+n)^2)

hist(theta_1000,prob=T,main="Histogram of theta")
#simulation-based density
theta_1000=theta_1000[order(theta_1000)]
lines(theta_1000, dbeta(theta_1000, a+x, b+n-x))
#theoretical density
mean.theta= mean(theta_1000)
abline(v=mean.theta, lty=2)
abline(v=(a+x)/(a+b+n),lty=2,col="red")

theta_100 = rbeta(100, a+x, b+n-x) # generate posterior samples
 hist(theta_100, prob=T, main="Histogram of theta", ylim=c(0,5.5))
# simulation-based density
 theta_100 = theta_100[order(theta_100)]
 lines(theta_100, dbeta(theta_100, a+x, b+n-x))
# theoretical density
 mean.theta = mean(theta_100)
 abline(v=mean.theta, lty=2)
 abline(v=(a+x)/(a+b+n), lty=2, col = "red")
 #1000개일때보다 100개일때 실제분포와 차이
 
 #Monte Carlo Method
 ##log odds ratio
 a=b=1
X=15;n=40 
theta = rbeta(10000,a+X,b+n-X)
eta = log(theta/(1-theta))
hist(eta, prob=T, main="Histogram of eta")
lines(density(eta),lty=2)
mean(eta);var(eta)

#Eg)Beta-Binomial distribution
##beta binomial distribution##
a=b=1
n=40;x=15
m=10;z=c(0:10)
pred.z = gamma(m+1)/gamma(z+1)/gamma(m-z+1)*
  beta(a+z+x,b+n-x+m-z)/beta(a+x,b+n-x)
plot(z, pred.z, xlab="z",ylab="probability",type="h")
title("Predictive Distribution,a=1,b=1,n=40,x=15,m=19")

###Monte Carlo Method####
N=10000
theta = rbeta(N, a+x, b+n-x)
pred.z = c(1:(m+1))*0
for(z in c(0:m)) pred.z[z+1]=mean(dbinom(z,m,theta))
zsample = rbinom(N,m,theta)
plot(table(zsample)/N,type="h",xlab="z",ylab="predictive density",main="")
mean(zsample)
var(zsample)
a=1;b=1;x=2;n=10
theta = seq(0,1,length=1001)
ftheta = dbeta(theta, a+x, n-x+b)
prob = ftheta/sum(ftheta)
HPDgrid <- function(prob,level=0.95){
  prob.sort=sort(prob,decreasing=T)
  M=min(which(cumsum(prob.sort)>=level))
  height = prob.sort[m]
  HPD.index = which(prob >= height)
  HPD.level = sum(prob[HPD.index])
  res=list(index=HPD.index, level=HPD.level)
  return(res)
}
HPD = HPDgrid(prob, 0.95)
HPD.grid = c(min(theta[HPD$index]),max(theta[HPD$index]))
HPD.grid

install.packages("binom")
library(binom)
n=10;x=2
CI.exact = binom.confint(x,n,conf.level=0.95,methods=c("exact"))
CI.exact = c(CI.exact$lower, CI.exact$upper)
CI.exact
#Bayesian CI vs Frequentist CI
HPD.approx = qbeta(c(0.025,0.975),a+x,n-x+b)
p=x/n
CI.asympt = c(p-1.96*sqrt(p*(1-p)/n),p+1.96*sqrt(p*(1-p)/n))
HPD.approx
CI.asympt

a=b=1; n1=18; x1=12; n2=10; x2=8
thetal = rbeta(10000, a+x1, b+n1-x1)
theta2 = rbeta(10000, a+x2, b+n2-x2)
xi = log((thetal/(1-thetal))/(theta2/(1-theta2)))

HPDsample <- function(theta,level=0.95){
  N=length(theta)
  theta.sort = sort(theta)
  M = ceiling(N*level)
  nCI = N-M #number of possible CIs
  CI.width = rep(0,nCI)
  for(i in 1:nCI) CI.width[i] = theta.sort[i+M]-theta.sort[i]
  index = which.min(CI.width)
  HPD = c(theta.sort[index],theta.sort[index+M])
  return(HPD)
}
HPD=HPDsample(xi)
plot(density(xi),type="l",xlab="log odds ratio",
     ylab="posterior density", main="")
abline(v=HPD,lty=2)     
text(mean(xi),0.06,"95% HPD interval")
