#Creating dataframe with default values
	#Initializing age range and main activity accordingly
	
	#Function to create the age range
	getTabElement <- function (x, y){
    
					expr <- NULL
					for (k in x : y ){ expr <- paste (expr, k , sep =",")}
    
					expr <- substr(expr,2,str_length(expr))
					return (expr)
   }#End-function
   
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
	 pAgeInf    <- c("0","15","25","45","65")
	 pAgeSup    <- c("14","24","44","64","150")
	 pAgeRange  <- c(getTabElement(0,14),getTabElement(15,24),getTabElement(25,44),getTabElement(45,64),getTabElement(65,150))
	#Donald Super Table
	
	dst  <- cbind(pAge, pStage, pChar, pAgeInf, pAgeSup,pAgeRange)
	
	dst  <- as.data.frame(dst)
	
	#Dataframe (1)
	colnames(dst) <- c("age", "stage", "characteristic", "ageinf", "agesup","range")
	
	#stage and some periodical details
	
	    decline <- rbind(
	                        c("Decline", "In adolescence", "Giving less time to hobbies"),
							c("Decline", "In early adulthood", "Reducing sports participation"),
							c("Decline", "In middle adulthood", "Focusing on essentials"),
							c("Decline", "In late adulthood", "Reducing working hours")
					    )	
	   
	    maintenance <- rbind(
		
		                    c("Maintenance", "In adolescence", "Verifying current occupational choice"),
							c("Maintenance", "In early adulthood", "Making occupational position secure"),
							c("Maintenance", "In middle adulthood", "Holding one's own against competition"),
							c("Maintenance", "In late adulthood", "Keeping what one enjoys")
		                )
	
		establishment <- rbind(

                      		c("Establishment", "In adolescence", "Getting started in a chosen field"),
							c("Establishment", "In early adulthood", "Settling down in a suitable position"),
							c("Establishment", "In middle adulthood", "Developing new skills"),
							c("Establishment", "In late adulthood", "Doing things one has wanted to do")
		                    )
	 
		exploration  <- rbind(
		
		                    c("Exploration", "In adolescence", "Learning more about opportunities"),
							c("Exploration", "In early adulthood", "Finding desired opportunity"),
							c("Exploration", "In middle adulthood", "Identifying new tasks to work on"),
							c("Exploration", "In late adulthood", "Finding a good retirement place")
						)
	
	    growth     <- rbind(
		 
		                    c("Growth", "In adolescence", "Developing a realistic self-concept"),
							c("Growth", "In early adulthood", "Learning to relate to others"),
							c("Growth", "In middle adulthood", "Accepting one's own limitations"),
							c("Growth", "In late adulthood", "Developing and valuing non-occupational roles")
		                )
	
	LCD <- rbind(decline, maintenance,establishment,exploration,growth)
	
	LCD <- as.data.frame(LCD)
	
	#Dataframe (2)
	colnames(LCD) <- c("stage", "lifeperiod", "characteristic")
	
	#LCD : Life Career Development
	
	

