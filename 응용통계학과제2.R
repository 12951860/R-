#5-2-2
theta = seq(0,1,length=100)
theta1.prior = dbeta(theta,0.7,2.9)
theta2.posterior = dbeta(theta,2.7,10.9)
plot(theta,theta2.posterior,type="l")
lines(theta,theta1.prior,type="l",col="blue")

#5-2-3
N=30000
theta2 = rbeta(N, 2.7, 10.9)
alpha=0.05
level = 1-alpha
HPDsample = function(theta,level=0.95){
  N = length(theta)
  theta.sort = sort(theta)
  M = ceiling(N*level)
  nCI = N-M
  CI.width = rep(0,nCI)
  for (i in 1:nCI) CI.width[i]=theta.sort[i+M]-theta.sort[i]
  index = which.min(CI.width)
  HPD=c(theta.sort[index],theta.sort[index+8M])
  return(HPD)
}
HPDsample(theta2)

#5-2-4
theta1 = rbeta(N,0.7,2.9)
odds1 = log(theta1/(1-theta1))
odds2 = log(theta2/(1-theta2))
plot(density(odds2),xlab="eta",ylab="density")
lines(density(odds1),lty=2)
HPDsample(odds1)
HPDsample(odds2)
abline(v=HPDsample(odds1),lty=3)
abline(v=HPDsample(odds2),lty=4)
text(-4,0.2,"사전밀도함수")
text(-3.5,0.45,"사후밀도함수")

#5-6
theta.a = rbeta(10000,11,11)
theta.b = rbeta(10000,15,7)
logodds = log((theta.a/(1-theta.a))/(theta.b/(1-theta.b)))
mean(logodds)
sd(logodds)
plot(density(logodds),type="l",xlab="로그오즈비",
     ylab="posterior density",main="")
HPD2=HPDsample(logodds)
abline(v=HPD2,lty=2)

