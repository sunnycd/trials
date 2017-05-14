??gsDesign
library(gsDesign)

#get fixed sample size
nfix<-nBinomial(p1=0.3,p2=0.45,beta=0.1)
nfix
(nperarm<-2*ceiling(nfix/2))


delta=0.2;alpha=0.05;beta=0.1;sigma=sqrt(2*0.5);
n1=(qnorm(1-alpha/2)+qnorm(1-beta))^2*sigma^2/(delta)^2
n1
IF=1.026;
(n2=IF*n1)




rr<-c(3,5)
n<-nBinomial(p1=0.1,p2=0.1*rr,beta=0.1)
(nperarm<-2*ceiling(n/2))

x <- gsDesign(n.fix=n1)
plot(x)
OF4<-gsDesign(k=10,n.fix=66,test.type=2,sfu="OF",beta=0.1)
OF4
plot(OF4)
PC4<-gsDesign(k=5,n.fix=66,test.type=2,sfu="Pocock",beta=0.1)
PC4
plot(PC4)

# making a gsDesign object first may be easiest...
x <- gsDesign()

# take a look at it
x

# default plot for gsDesign object shows boundaries
plot(x)

# plottype=2 shows boundary crossing probabilities
plot(x, plottype=2)

# now add boundary crossing probabilities and 
# expected sample size for more theta values
y <- gsProbability(d=x, theta=x$delta*seq(0, 2, .25))
class(y)

# note that "y" below is equivalent to print(y) and
# print.gsProbability(y)
y

# the plot does not change from before since this is a
# gsDesign object; note that theta/delta is on x axis
plot(y, plottype=2)

# now let's see what happens with a gsProbability object
z <- gsProbability(k=3, a=x$lower$bound, b=x$upper$bound, 
                   n.I=x$n.I, theta=x$delta*seq(0, 2, .25))

# with the above form,  the results is a gsProbability object
class(z)
z

# default plottype is now 2
# this is the same range for theta, but plot now has theta on x axis
plot(z)


#time to event
?nSurvival
nsrv<-nSurvival(lambda1=log(2)/6,lambda2=log(2)/10,eta=log(2)/18,Ts=24,Tr=12)
nsrv

nsrv<-nSurvival(lambda1=0.916,lambda2=1.713,eta=-0.626,Ts=24,Tr=17)
nsrv

data(x)
summary(x)
