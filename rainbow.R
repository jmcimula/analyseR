
library(stringr)
library(dplyr)


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
	
	#Creating dataframe with default values
	#Initializing age range and main activity accordingly
	pAge    <- c("0-14","15-24","25-44","45-64","65+")
	pStage  <- c(
	             "Growth",          #0-14
				 "Exploration",     #15-24
				 "Establishment",   #25-44
				 "Maintenance",     #45-64
				 "Decline"          #65+
				 )
	pChar   <- c(
	
	            "Development of self-concept, attitudes,needs and general world of work", #0-14
				"Trying out through classes, work experience, hobbies. Tentative choice and skill development", #15-24
				"Entry-level skill building and stabilisation through work experience", #24-44
				"Continual adjustment process to improve position", #45-64
				"Reduced output, prepare for retirement" #65+				
			  )
	#Donald Super Table
	dst  <- cbind(pAge, pStage, pChar)
	dst  <- as.data.frame(dst)
	colnames(dst) <- c("age", "stage", "characteristic")
	
	#stage + detail
	
	   d1 <-  c("Decline", "In adolescence", "Giving less time to hobbies")
	   d2 <-  c("Decline", "In early adulthood", "Reducing sports participation")
	   d3 <-  c("Decline", "In middle adulthood", "Focusing on essentials")
	   d4 <-  c("Decline", "In late adulthood", "Reducing working hours")
	   
	   d <- rbind(d1,d2,d3,d4)
	 
	 
	
	m1 <- c("Maintenance", "In adolescence", "Verifying current occupational choice")
	m2 <- c("Maintenance", "In early adulthood", "Making occupational position secure")
	m3 <- c("Maintenance", "In middle adulthood", "Holding one's own against competition")
	m4 <- c("Maintenance", "In late adulthood", "Keeping what one enjoys")
	
	m <- rbind(m1,m2,m3,m4)
	
	e1 <- c("Establishment", "In adolescence", "Getting started in a chosen field")
	e2 <- c("Establishment", "In early adulthood", "Settling down in a suitable position")
	e3 <- c("Establishment", "In middle adulthood", "Developing new skills")
	e4 <- c("Establishment", "In late adulthood", "Doing things one has wanted to do")
	
	e <- rbind(e1,e2,e3,e4)
	 
	es1 <- c("Exploration", "In adolescence", "Learning more about opportunities")
	es2 <- c("Exploration", "In early adulthood", "Finding desired opportunity")
	es3 <- c("Exploration", "In middle adulthood", "Identifying new tasks to work on")
	es4 <- c("Exploration", "In late adulthood", "Finding a good retirement place")
	
	es <- rbind(es1,es2,es3,es4)
	
	g1 <- c("Growth", "In adolescence", "Developing a realistic self-concept")
	g2 <- c("Growth", "In early adulthood", "Learning to relate to others")
	g3 <- c("Growth", "In middle adulthood", "Accepting one's own limitations")
	g4 <- c("Growth", "In late adulthood", "Developing and valuing non-occupational roles")
	
	g <- rbind(g1,g2,g3,g4)
	
	LCD <- rbind(d,m,e,es,g)
	
	LCD <- as.data.frame(LCD)
	
	#curve(-x * log (x) - (1 - x) * log(1 - x),col=c("blue"), xlab = "x", ylab = "Entropy", lwd=20)
	#Use the PDF career-theory-model-super.pdf for some qualitative parameter

    print(paste(dadDOB,momDOB,persoDOB,parternDOB,nbkid,sep = "-"))
   
}#End-function


getOldYear <- function (paramDate){

        #For example "1989-03-17"
		#System time which the date of today minus the date written
        age  <- round((as.Date(Sys.time()) - as.Date(paramDate))/365) 
        age  <- str_replace_all(age, "‘[:alpha:]’","")
		#Return
		return (age) 		
}#End-function
