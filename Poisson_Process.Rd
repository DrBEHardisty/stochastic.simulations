## Some Poisson stuff, since mutation processes are Poisson processes

## Simplest case: when lambda is below 1, is equal to 1 and is greater than 1
## The average human suffers approximately 1.23 mutations per year
## Based on a life-span of 80 years and accumulation of 65 de novo mutations in their lifetime

pk0 <- ppois(0:40,lambda=0.25)
pk1 <- ppois(0:40,lambda=1.23)
pk2 <- ppois(0:40,lambda=2)

## Plot
plot(pk0, xlab='Years of Life',ylab='Probablity of Suffering Lambda Mutations',main='Poisson Model of Mutations', type='lines')
lines(pk1, col=2)
lines(pk2, col = 3)

## Easier way to simulate a Poisson Process
## Three simulations
x <-cumsum(rexp(50))
y <- cumsum(c(0,rep(0.5,50)))

x1 <- cumsum(rexp(50))
y1 <- cumsum(c(0,rep(1.23,50)))

x2 <- cumsum(rexp(50))
y2 <- cumsum(c(0,rep(2,50)))

##Plot them to see how the process varies as time passes
p1 <- plot(stepfun(x,y),xlim = c(0,40),ylim=c(0,100),do.points = F, col='black', xlab="Years Alive", ylab="Number of Mutations", main='');
par(new=TRUE)
p2 <- plot(stepfun(x1,y1),xlim = c(0,40),ylim=c(0,100),do.points = F,col='red', xlab='Years Alive', ylab='Number of Mutations',main='')
par(new=TRUE)
p3 <- plot(stepfun(x2,y2),xlim = c(0,40),do.points = F,col='blue', xlab='Years Alive', ylab='Number of Mutations', main="How Many Mutations Could a 40 Year Old Organ Suffer?")
