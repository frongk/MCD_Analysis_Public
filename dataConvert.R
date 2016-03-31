#### from https://sites.google.com/site/timriffepersonal/DemogBlog/newformetrickforworkingwithbigishdatainr ####
#started out as "longasscode.R" by felix 
#running this code will take a while - it loads the entire file to memory


library(sqldf)
setwd("C:/Users/FRONGKLIN/Documents/GitHub/evoTherapeutics/data") #you probably should tweak this! 
#change to load correct directory

fixed   <- file("VS13MORT.DUSMCPUB")
attr(fixed, "file.format") <- list(sep = ",", header = FALSE) 


#http://www.cdc.gov/nchs/data/dvs/Record_Layout_2013.pdf <- this is where all this info is!
US2013 <- sqldf("SELECT 
                substr(V1,20,1) ResidentStatus,
                substr(V1,21,2) StateOccurenceFIPS,
                substr(V1,23,3) CountyOccurenceFIPS,
                substr(V1,29,2) StateResidenceFIPS,
                substr(V1,35,3) CountyResidenceFIPS,
                substr(V1,83,1) PlaceofDeathandStatus,
                substr(V1,85,1) DayofWeek,
                substr(V1,102,4) CurrentDataYear,   
                substr(V1,65,2) MonthofDeath,
                substr(V1,69,1) Sex,
                substr(V1,445,2) USRace,
                substr(V1,447,1) BridgedRace,
                substr(V1,448,1) RaceImputation,
                substr(V1,449,1) RaceRecode3,
                substr(V1,450,1) RaceRecode5,
                substr(V1,70,4) DetailAge, 
                substr(V1,75,2) AgeRecode52, 
                substr(V1,77,2) AgeRecode27, 
                substr(V1,79,2) AgeRecode12, 
                substr(V1,81,2) InfantAgeRecode22, 
                substr(V1,84,1) MaritalStatus,
                substr(V1,484,3) Hispanic,
                substr(V1,61,2) Education1989,
                substr(V1,63,1) Education2003,
                substr(V1,64,4) Educationflag,
                substr(V1,146,4) ICD,
                substr(V1,150,3) ThreeFiftyEight,
                substr(V1,154,3) OneHundredThirteen,
                substr(V1,157,3) OneHundredThirtyInfant,
                substr(V1,160,2) ThirtyNine,
                substr(V1,163,2) NumberofEntityAxisConditions,
                substr(V1,165,7) Cond01,
                substr(V1,172,7) Cond02,
                substr(V1,179,7) Cond03,
                substr(V1,186,7) Cond04,
                substr(V1,193,7) Cond05,
                substr(V1,200,7) Cond06,
                substr(V1,207,7) Cond07,
                substr(V1,214,7) Cond08,
                substr(V1,221,7) Cond09,
                substr(V1,228,7) Cond10,
                substr(V1,235,7) Cond11,
                substr(V1,242,7) Cond12,
                substr(V1,249,7) Cond13,
                substr(V1,256,7) Cond14,
                substr(V1,263,7) Cond15,
                substr(V1,270,7) Cond16,
                substr(V1,277,7) Cond17,
                substr(V1,284,7) Cond18,
                substr(V1,291,7) Cond19,
                substr(V1,298,7) Cond20,
                substr(V1,341,2) NumberofRecordAxisConditions,
                substr(V1,344,5) Cond01,
                substr(V1,349,5) Cond02,
                substr(V1,354,5) Cond03,
                substr(V1,359,5) Cond04,
                substr(V1,364,5) Cond05,
                substr(V1,369,5) Cond06,
                substr(V1,374,5) Cond07,
                substr(V1,379,5) Cond08,
                substr(V1,384,5) Cond09,
                substr(V1,389,5) Cond10,
                substr(V1,394,5) Cond11,
                substr(V1,399,5) Cond12,
                substr(V1,404,5) Cond13,
                substr(V1,409,5) Cond14,
                substr(V1,414,5) Cond15,
                substr(V1,419,5) Cond16,
                substr(V1,424,5) Cond17,
                substr(V1,429,5) Cond18,
                substr(V1,434,5) Cond19,
                substr(V1,439,5) Cond20,
                substr(V1,145,1) PlaceofInjury,
                substr(V1,106,1) InjuryAtWork,
                substr(V1,107,1) MannerofDeath,
                substr(V1,108,1) Disposition,
                substr(V1,109,1) Autopsy,
                substr(V1,144,1) ActivityCode,
                count(*) Deaths 
                FROM fixed 
                GROUP BY
                ResidentStatus,
                StateOccurenceFIPS,
                CountyOccurenceFIPS,
                StateResidenceFIPS,
                CountyResidenceFIPS,
                PlaceofDeathandStatus,
                DayofWeek,
                CurrentDataYear,   
                MonthofDeath,
                Sex,
                USRace,
                BridgedRace,
                RaceImputation,
                RaceRecode3,
                RaceRecode5,
                DetailAge, 
                AgeRecode52, 
                AgeRecode27, 
                AgeRecode12, 
                InfantAgeRecode22, 
                MaritalStatus,
                Hispanic,
                Education1989,
                Education2003,
                Educationflag,
                ICD,
                ThreeFiftyEight,
                OneHundredThirteen,
                OneHundredThirtyInfant,
                ThirtyNine,
                NumberofEntityAxisConditions,
                Cond01,
                Cond02,
                Cond03,
                Cond04,
                Cond05,
                Cond06,
                Cond06,
                Cond07,
                Cond09,
                Cond10,
                Cond11,
                Cond12,
                Cond13,
                Cond14,
                Cond15,
                Cond16,
                Cond17,
                Cond18,
                Cond19,
                Cond20,
                NumberofRecordAxisConditions,
                Cond01,
                Cond02,
                Cond03,
                Cond04,
                Cond05,
                Cond06,
                Cond06,
                Cond07,
                Cond09,
                Cond10,
                Cond11,
                Cond12,
                Cond13,
                Cond14,
                Cond15,
                Cond16,
                Cond17,
                Cond18,
                Cond19,
                Cond20,
                PlaceofInjury,
                InjuryAtWork,
                MannerofDeath,
                Disposition,
                Autopsy,
                ActivityCode")


condNames = c("Cond01","Cond02","Cond03","Cond04","Cond05","Cond06","Cond07","Cond08","Cond09","Cond10","Cond11","Cond12","Cond13","Cond14","Cond15","Cond16","Cond17","Cond18","Cond19","Cond20")

#clean ICD codes for conditions using apply function below (R is weird and this is the most efficient way to do it)
filtFun1 <- function(x){
  check1 <- (x == "       ")
  x[check1] = NA
  x <- sub("\\d\\d([a-z]|[A-Z])","\\1",x, perl = TRUE)
  x <- sub("\\s","\\1",x, perl = TRUE)
  return(x)
}

filtCond <- apply(US2013[condNames],2,filtFun1)
US2013[condNames] <- filtCond

#specify columns to save in csv file
#all names to save:
#c("ResidentStatus","StateOccurenceFIPS","CountyOccurenceFIPS","StateResidenceFIPS","CountyResidenceFIPS","PlaceofDeathandStatus","DayofWeek","CurrentDataYear","MonthofDeath","Sex","USRace","BridgedRace","RaceImputation","RaceRecode3","RaceRecode5","DetailAge","AgeRecode52","AgeRecode27","AgeRecode12","InfantAgeRecode22","MaritalStatus","Hispanic","Education1989","Education2003","Educationflag","ICD","ThreeFiftyEight","OneHundredThirteen","OneHundredThirtyInfant","ThirtyNine","NumberofEntityAxisConditions","Cond01","Cond02","Cond03","Cond04","Cond05","Cond06","Cond07","Cond08","Cond09","Cond10","Cond11","Cond12","Cond13","Cond14","Cond15","Cond16","Cond17","Cond18","Cond19","Cond20","NumberofRecordAxisConditions","Cond01","Cond02","Cond03","Cond04","Cond05","Cond06","Cond07","Cond08","Cond09","Cond10","Cond11","Cond12","Cond13","Cond14","Cond15","Cond16","Cond17","Cond18","Cond19","Cond20","PlaceofInjury","InjuryAtWork","MannerofDeath","Disposition","Autopsy","ActivityCode","Deaths")
setSave <- c("ResidentStatus","PlaceofDeathandStatus","DayofWeek","CurrentDataYear",
             "MonthofDeath","Sex","USRace","AgeRecode27","MaritalStatus","Hispanic",
             "Education2003","NumberofEntityAxisConditions","Cond01","Cond02","Cond03",
             "Cond04","Cond05","Cond06","Cond07","Cond08","Cond09","Cond10","Cond11",
             "Cond12","Cond13","Cond14","Cond15","Cond16","Cond17","Cond18","Cond19",
             "Cond20","PlaceofInjury","InjuryAtWork","MannerofDeath","Disposition",
             "Autopsy","ActivityCode","Deaths")

US2013_reduced <-US2013[setSave]
rm(US2013)

write.csv(US2013_reduced, file="mcd_db_2013.csv",row.names=TRUE,quote=FALSE)
#note that all quotation marks have been removed
#note also that removal of quotation marks reduces file size by 25% :O