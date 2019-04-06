x1 <- rep(c(0,1,2,3,4,5,6),c(7,14,13,8,4,2,2))
x2 <- rep(c(0,1,2,3,4,5,6,7),c(4,13,15,6,2,2,3,1))
a = 2; b = 1
n1 <- length(x1); s1 <- sum(x1)
n2 <- length(x2); s2 <- sum(x2)
postmean.theta1 = (a+s1)/(b+n1)
postmean.theta2 = (a+s2)/(b+n2)
###plot the posterior
par(mfrow = c(1,1))
theta <- seq(0, 6, length=100)
plot(theta, dgamma(theta, a+s1, b+n1), type="l",
     xlab="theta",ylab="p(theta|x")
lines(theta,dgamma(theta, a+s2,b+n2),lty=2,col="red")
lines(theta, dgamma(theta,a,b),lty=3,col="blue")
legend(2.5,1.5,legend=c(paste("City 1"),paste("City2"),
                        paste("Gamma(2,1) prior")),
       cex=1.3,lty=c(1,2,3),col=c(1,2,4),bty="n")

##Ch6
#predictive distribution of x_{n+1}
x1 <- c(rep(0,7),rep(1,14),rep(2,13),rep(3,8),rep(4,4),
        rep(5,2),rep(6,2))
x2 <- c(rep(0,4),rep(1,13),rep(2,15),rep(3,6),
        rep(4,2),rep(5,2),rep(6,3),rep(7,1))
a=2;b=1
n1 = length(x1);s1 = sum(x1)
n2 = length(x2);s2 = sum(x2)
x = seq(0,10)
par(mfrow=c(1,2))
plot(x,dnbinom(x,size=a+s1,prob=(b+n1)/(b+n1+1)),
     xlab = "x_{n+1}",ylab = "Predictive Prob",
     type="h",main="City1")
plot(x,dnbinom(x,size=a+s2,prob=(b+n2)/(b+n2+1)),
     xlab="x_{n+1}",ylab="Predictive Prob",type="h",
     main="City2")

#Monte Carlo Method for Traffic Example
