library(GillespieSSA)

## Model parameters
parms <- c(u0 = 0.01, u1 = 0.01)

## Initial values of each state variable
x0 <- c(S0 = 100, S1 = 0, S2 = 0)

## The reactions
a <- c("u0 * S0", "u1 * S1")

## the stochastic matrix given by the reactions
nu <- matrix(c(-1,0,+1,-1,0,+1),nrow=3,byrow=TRUE)

## A run of the model
out <-ssa(x0,a,nu,parms,tf=500, simName="A Simple Model of Aging")

## Native plotting method
ssa.plot(out)

out$stats
out$data

