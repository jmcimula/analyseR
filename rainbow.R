

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

  prInf <- as.integer(dadDOB) - as.integer(momDOB)
  cpInf <- as.integer(persoDOB) - as.integer(parternDOB)
  
  if (prInf <= 10 && cpInf <= 10){
  
       
	    d <- dst %>%
		     select (age,stage, characteristic) %>%
			 filter(as.integer(str_trim(dst$ageinf)) <= as.integer(persoDOB), str_detect(dst$range, persoDOB) == TRUE)
  
        print(paste("The difference of the age of your parents is",prInf,sep = ": "))
		print(paste("The difference of the age between you and your spouse is",cpInf,sep = ": "))
		print(paste("Your age range is", d$age,sep = ": " ))
		print(paste("Your actual life's stage is",d$stage, sep = ": "))
	    print(paste("", d$characteristic, sep = ""))
		
	    curve(-x * log (x) - (1 - x) * log(1 - x),col=c("blue"), xlab = "LCD", ylab = "", lwd=20)
		
		#getLifeRainbow("1968-11-20","1970-07-15","1990-10-09",2,"1987-02-02")
  }
   
}#End-function


getOldYear <- function (paramDate){

#System time which the date of today minus the date written
age  <- round((as.Date(Sys.time()) - as.Date(paramDate))/365) 
age  <- str_replace_all(age, "‘[:alpha:]’","")

#Return
return (age) 		

}#End-function

