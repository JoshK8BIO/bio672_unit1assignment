#JoshuaKoller_Windows_unit1_BIO672.r
#Packages ggplot2, 
#Files

#Set Seed for replication
set.seed(8)

#Create a dataset of 5000 random normal numbers called myValues
myValues <- rnorm(5000)

#Calculate mean
myMean <- mean(myValues)
#Calculate standard deviation
mySd <- sd(myValues)

#Turn data set into a dataframe
myData <- data.frame(myValues)



library(ggplot2)
#Open pfd file to save graph
pdf(file="histo.pdf")
#Creates blank graph for histogram
hplot <- ggplot(myData, aes(x=myValues)) +
#Adds labels to graph    
    labs(title="Histogram",x="Values",y="Frequencies")+
#Adds white bars to graph, separated by black dividers
    geom_histogram(aes(y=..density..), color="black", fill="white")+
#Adds a density line colored blue, filled in with a transparent blue    
    geom_density(color="blue", fill="blue", alpha=0.15)+
#Adds a normal bell curve over the data
    stat_function(fun=dnorm,
                  args=list(mean=mean(myData$myValues),sd=sd(myData$myValues))
                  ,color="red",lwd=0.5)
print(hplot)
#Close pdf
dev.off()
## STEP 3 ##
#Saves paste function to a file
sink("mean_sd.txt")
paste("Mean:",myMean,"SD:",mySd)
sink()
## STEP 4 ##

