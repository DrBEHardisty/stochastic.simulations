##Cow_Pop_Sim.R simulates the future population numbers of a population of cows with 3 age classes

M<-matrix(c(0,.10,1.2),ncol=3) #M,G,Q are the rows that will be in our Leslie matrix
G<-matrix(c(.90,0,0),ncol=3) #We make them into matrices then use rbind to make
Q<-matrix(c(0,.90,0),ncol=3) #them into our full L matrix
L<-rbind(M,G,Q)

##To compare our estimate of the population's future we should compute
##Note that the leading eigenvalue of L = 1.0208544
##This means the population will continue to grow in the future
eigen(L)

 

#This is our population matrix; starting with 100 calves
n<-c(100,0,0)
n<-matrix(n,ncol=1) #Turn it into a matrix
L%*%n

##define a function so we can simulate our 
## population's growth into the future for 25 generations
fun<-function(x) L%*%x

#Structure will be filled up so it must be a multiple
##of all the rows and the number of generations into the future we're 
## projecting
structure=numeric(75)

##The actual loop:

dim(structure)<-c(25,3)
for (i in 1:25){
n<-fun(n)
structure[i,]<-n
}

##Make the a plot of how the population behaves
##that approximates the pop. growth rate (lambda)
##Red line = calves (given as 100), green = yearlings (starting at 0)
##and black = two year olds (starting at 0)
CPlot<-matplot(1:25,structure,type="l", ylab="Population",xlab="Generations", main="A Simple Cow Population Model")

sum(structure[25,])/sum(structure[24,]) ##Pop. growth rate
structure[25,]/sum(structure[25,]) ##Approx. stable age distribution
eigen(L)$vectors[,1]/sum(eigen(L)$vectors[,1]) #this is the stable age distribution
