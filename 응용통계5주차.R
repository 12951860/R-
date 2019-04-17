#Prior vs Likelihood vs Posterior
#theta ~ Beta(a,b)
a=1; b=1
#x|theta ~ B(n,theta)
n=40; x=15
#a diacretization of the possible theta values
theta = seq(0,1,length=50)
prior.theta = dbeta(theta,a,b)
#prob of data\thea(likelihood)
likhd.theta = dbinom(x,n,theta)
#joint prob of data & theta
joint.xtheta = prior.theta * likhd.theta
#posterior of theta
post.theta = dbeta(theta, a+x, b+n-x)

par(mfrow=c(2,2))#set up a 2x2 plotting window plot
plot(theta,prior.theta, type="l", sub="(a) prior: pi(theta)")
plot(theta, likhd.theta,type="l",sub="(b) likelihood: f(x|theta)")
abline(v=x/n, lty=2)
plot(theta, joint.xtheta,type="l",sub="(c) prior x likelihood: pi (theta)x f(x|theta)")
abline(v=(a+x-1)/(a+b+n-2), lty=2)
plot(theta, post.theta, type="l", sub="(d) posterior: pi(theta|x)")
abline(v=(a+x-1)/(a+b+n-2),lty=2)


#우리의 사전적인 믿음이 자료를 관측한 뒤 어떻게 바뀌었는가?
par(mfrow=c(1,1))
plot(theta, post.theta, type="l", col="blue")
lines(theta, prior.theta, col="red", lty=2)
legend(.5,3,legend=c(paste("beta(",a,",",b,") prior"),
                     paste("post under beta(",a,",",b,") prior")),
       lty=c(2,1),col=c("red","blue"),bty="n")


#Monte Carlo 예제
n=c(10,100,1000,10000,100000) #N values
int = rep(0,5) #integral
for(i in 1:5){
  xval=runif(n[i],min=-1,max=1)
  int[i] = mean(2*xval^2)
}


theta_1000 = rbeta(1000, a+x, b+n-x)#generate posterior samples
quantile(theta_1000, c(.025,.975))#simulation-based quantiles
qbeta(c(.025,.975),a+x,b+n-x)#theoretical quantiles
mean(theta); var(theta)
#theoretical estimaties
(a+x)/(b+a+n); (a+x)*(b+n-x)/((a+b+n+1)*(a+b+n)^2)

hist(theta_1000, prob=T, main="Histogram of theta")
#Simulation-based density
theta_1000 = theta_1000[order(theta_1000)]
lines(theta_1000, dbeta(theta_1000, a+x, b+n-x))
#theoretical density
mean.theta = mean(theta_1000)
abline(v=mean.theta, lty=2)
abline(v=(a+x)/(a+b+n),lty=2,col="red")


#100개 샘플의 경우 
theta_100 = rbeta(100, a+x, b+n-x)#generate posterior samples
hist(theta_100,prob=T,main="Histogram of theta",ylim=c(0,5.5))
#Simulation-based density
theta_100 = theta_100[order(theta_100)]
lines(theta_100, dbeta(theta_100, a+x, b+n-x))
#theoretical density
mean.theta = mean(theta_100)
abline(v=mean.theta, lty=2)
abline(v=(a+x)/(a+b+n), lty=2, col="red")



#log odds ratio
a=b=1
X=15;n=40
theta = rbeta(10000, a+x, b+n-x)
eta = log(theta/(1-theta))
hist(eta, prob=T, main="Histogram of eta")
lines(density(eta), lty=2)
mean(eta); var(eta)



#beta binomial distribution
a=b=1
n=40;x=15
m=10;z=c(0:10)
pred.z = gamma(m+1)/gamma(z+1)/gamma(m-z+1)*beta(a+z+x,b+n-x+m-z)/
  beta(a+x,b+n-x)
plot(z, pred.z,xlab="z",ylab="probablity", type="h")
title("Predictive Distribution, a=1, b=1, n=40, x=15, m=19")


#Monte Carlo Method
a=b=1; x=15; n=40; m=10; N=10000
theta = rbeta(N, a+x, b+n-x)
pred.z = c(1:(m+1))*0
for(z in c(0:m)) pred.z[z+1] = mean(dbinom(z,m,theta))
zsample = rbinom(N,m,theta)
plot(table(zsample)/N,type="h",xlab="z",ylab="predictive density",main="")
mean(zsample)
var(zsample)

#Bayesian Credible Interval
a=1;b=1;x=2;n=10
theta = seq(0,1,length=1001)
ftheta = dbeta(theta, a+x, n-x+b)
prob=ftheta/sum(ftheta)
HPD = HPDgrid(prob,0.95)
HPD.grid=c(min(theta[HPD$index]),max(theta[HPD$index]))
HPD.grid

install.packages("binom")
library(binom)
n=10; x=2
CI.exact = binom.confint(x,n,conf.level=0.95,methods=c("exact"))
CI.exact = c(CI.exact$lower, CI.exact$upper)
CI.exact


HPD.approx = qbeta(c(0.025,0.975), a+x, n-x+b)
p = x/n
CI.asympt = c(p-1.96*sqrt(p*(1-p)/n),p+1.96*sqrt(p*(1-p)/n))
HPD.approx
CI.asympt


#Comparison of two proportions
a=b=1
n1=18; x1=12; n2=10; x2=8
theta1 = rbeta(10000, a+x1, b+n1-x1)
theta2 = rbeta(10000, a+x2, b+n2-x2)
xi  = log((theta1/(1-theta1))/(theta2/(1-theta2)))
HPD = HPDsample(xi)
plot(density(xi), type="l", xlab="log odds retio",
     ylab="posterior density", main="")
abline(v=HPD, lty=2)
text(mean(xi),0.06,"95% HPD interval")
