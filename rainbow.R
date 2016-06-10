

setwd("~/R/analyseR/")

library(stringr)
library(dplyr)
source("dSuperData.R")


getLifeRainbow <- function (dadDOB, momDOB, persoDOB, nkid, partDOB)
{
#Receiving inputData
	
#Call the function for calculating the Old Year
    dadDOB      <- getOldYear(dadDOB)
	momDOB      <- getOldYear(momDOB)
    persoDOB    <- getOldYear(persoDOB)
	parternDOB  <- getOldYear(partDOB)
	
#Number of kids
	nbkid  <- nkid
	
	#curve(-x * log (x) - (1 - x) * log(1 - x),col=c("blue"), xlab = "x", ylab = "Entropy", lwd=20)
	#Use the PDF career-theory-model-super.pdf for some qualitative parameter
    #print(paste(dadDOB,momDOB,persoDOB,parternDOB,nbkid,sep = "-"))
   
}#End-function


getOldYear <- function (paramDate){

#System time which the date of today minus the date written
        age  <- round((as.Date(Sys.time()) - as.Date(paramDate))/365) 
        age  <- str_replace_all(age, "‘[:alpha:]’","")
		#Return
		return (age) 		
}#End-function
