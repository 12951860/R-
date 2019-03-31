#Likelihood Principle
#동전 10번중 앞면 3번.B(10,theta)
theta <- seq(0,1,length=1000)
ltheta <- choose(10,3)*theta^3*(1-theta)^7
plot(theta, ltheta, type = "l",main="Likelihood Function",
     ylab = "Likelihood L(theta|X)")
abline(v=0.3,lty=2,col=2)

#Quantile-based Interval
theta = seq(-3,3,length=500)
plot(theta,dnorm(theta, 0.3, 0.5),type="l",ylab="density")
abline(v=qnorm(c(0.049,0.999),0.3,0.5),lty=2, col=2)
abline(v=qnorm(c(0.025,0.975),0.3,0.5),lty=1,col=4)

#HPD Method1 : Quantile-based Method
n=100
x1 <- rnorm(n,0,1)
quantile(x1, c(.025,.975))

n2 <- 1000
x2 <- rnorm(n2,0,1)
quantile(x2, c(.025,.975))

par(mfrow=c(1,2))
hist(x1);hist(x2)
#표본을 더 많이 뽑은 쪽이 정규분포에 더 가까움

#HPD Method2 : Grid Search Method(격자점방법)
HPDgrid <- function(prob, level=.95){
  prob.sort = sort(prob, decreasing = T)
  #prob을 내림차순 정렬
  M = min(which(cumsum(prob.sort)>=level))
  #prob이 높은 순으로 더했을 때 level이상인 가장작은 수의 위치 
  height = prob.sort[M]
  #마지막으로 더한 prob이 높이가 됨 
  HPD.index = which(prob >= height)
  #height보다 높은 prob들 찾음 
  HPD.level = sum(prob[HPD.index])
  #level구함 
  res = list(index = HPD.index, level = HPD.level)
  return(res)
}
N = 1001
theta = seq(-3,3,length = N)
prob = exp(-0.5/0.25*(theta-0.3)^2)
prob = prob/sum(prob)#prob합이 1이됨.
alpha = 0.05;level = 1-alpha
HPD = HPDgrid(prob, level)
HPDgrid.hat = c(min(theta[HPD$index]),max(theta[HPD$index]))
HPDgrid.hat
