## Stochastic simulation of the medium complicated model of aging
## Includes cells that are born, that age, and that die

## The model that will be simulated:
## dS0 <- -u0 * S0 - lamb0 * S0 + (r0 * S0 / r0 * S0 + r1 * S1 + r2 * S2) * (lamb0 * S0 + lamb1 * S1 + lamb2 * S2)
## dS1 <- u0 * S0 - lamb1 * S1 + (r1 * S1 / r0 * S0 + r1 * S1) + r2 * S2 * (lamb0 * S0 + lamb1 * S1 + lamb2 * S2) - u1 * S1 
## dS2 <- - lamb2 * S2 + (r2 * S2 / r0 * S0 + r1 * S1 + r2 * S2) * (lamb0 * S0 + lamb1 * S1 + lamb2 * S2) + u1 * S1

library(GillespieSSA)

## Model parameters
parms <- c(u0 = 0.1, lamb0 = 0.1, r0 = 0.2, r1 = 0.2, r2 = 0.2, lamb1 = 0.1, lamb2 = 0.1, u1 = 0.01)

## Initial values of each state variable
x0 <- c(S0 = 100, S1 = 0, S2 = 0)

## The reactions
a <- c("u0 * S0","lamb0 * S0", "(r0 * S0 * lamb0 * S0 + r0 * S0 * lamb1 * S1 + r0 * S0 * lamb2 * S2) / r0 * S0 + r1 * S1 + r2 * S2", "lamb1 * S1", "(r1 * S1 * lamb0 * S0 + r1 * S1 * lamb1 * S1 + r1 * S1 * lamb2 * S2) / r0 * S0 + r1 * S1 + r2 * S2", "u1 * S1", "lamb2 * S2", "(r2 * S2 * lamb0 * S0 + r2 * S2 * lamb1 * S1 + r2 * S2 * lamb2 * S2) / r0 * S0 + r1 * S1 + r2 * S2")

## the stochastic matrix given by the reactions
nu <- matrix(c(-1,-1,+1,0,0,0,0,0,+1,0,0,-1,+1,-1,0,0,0,0,0,0,0,+1,-1,+1),nrow=3,byrow=TRUE)

## A run of the model
out <-ssa(x0, a, nu, parms, tf=2, simName="A Model of Aging with Cell Replication & Death", verbose=TRUE)

## Native plotting method
ssa.plot(out)


## Distribute this shit to simplify it
## (r0 * S0 * lamb0 * S0 + r0 * S0 * lamb1 * S1 + ro * S0 + lamb2 * S1) / r0 * S0 + r1 * S1 + r2 * S2