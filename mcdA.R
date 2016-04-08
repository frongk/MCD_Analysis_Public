#determine the frequent itemsets in the mcd data 
#filters for cancer using grepl in first two conditions
library(tictoc)

tic()
setwd("C:/Users/FRONGKLIN/Documents/GitHub/evoTherapeutics/data") #change this one too
load("us2013.RData")
library(arules)

time1 <- toc()

#what do people use mcd data for
#links between data?
#major causes of death
#what are the hunches that people have about death data

#first look at subset of cancerpatients
cancLG <- US2013#subset(US2013, grepl("C",US2013$FirstCondition) | grepl("C",US2013$SecondCondition))
rm(US2013) #save some memory!


condSet <- c("FirstCondition", "SecondCondition", "ThirdCondition", "FourthCondition", "FifthCondition", "SixthCondition", "SeventhCondition", "EighthCondition", "NinthCondition", "TenthCondition")

filtFun1 <- function(x){
  check1 <- (x == "       ")
  x[check1] = NA
  x <- sub("\\d\\d([a-z]|[A-Z])","\\1",x, perl = TRUE)
  x <- sub("\\s","\\1",x, perl = TRUE)
  return(x)
}
cancLGF <- apply(cancLG[condSet],2,filtFun1)

cList <- split(c(as.matrix(cancLGF[,1:10])),
                 #as.vector(cancLG$RaceRecode5),
                 #as.vector(cancLG$AgeRecode52)),
                 #as.vector(cancLG$Sex)),
                 as.vector(row.names(cancLG))) #rownames of cancLG is transaction basket
                 #(parenthesis above might not make sense if you don't know split fun)

rm(cancLG)
rm(cancLGF)

#remove duplicates function for lapply
rmDuplNA <- function(inList){
  idx <- duplicated(inList)
  lOut <- inList[!idx]
  idx <- is.na(lOut)  
  lOut <- lOut[!idx]
  return(lOut)
}
cList <- lapply(cList, rmDuplNA)

cancTrans <- as(cList,"transactions")
tic()
rules <- apriori(
  cancTrans, 
  parameter=list(supp=0.00002, conf=0.8, target="rules", minlen=3, maxlen=5)
)

rules <- sort(rules, by ="lift")
inspect(rules)
time2<-toc()
time2
