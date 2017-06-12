
library(dplyr)

#change the file location
data <- read.csv("../input/nflplaybyplay2015.csv", header  = TRUE, stringsAsFactors = FALSE)

names(data) <- c("X","Date","GameID","Drive", "Quarter","Down","Time","TimeUnder","TimeSecs",
                 "PlayTimeDiff","SideOfField","YrddLine","YrddLine100","YrdToGo","YdNet"
                 ,"GoalToGo","FirstDown","OffTeam","DefTeam","Description","PlayAttempted",
                 "YardGained","SP","Touchdown","ExPointResult","TwoPointConversion","DefTwoPoint",
                 "Safety","PlayType","Passer","PassAttempt","PassOutcome","PassLength",
                 "PassLocation","InterceptionThrown","Interceptor","Rusher","RushAttempt",
                 "RunLocation","RunGap","Receiver","Reception","ReturnResult","Returner",
                 "Tackler1","Tackler2","FieldGoalResult","FieldGoalDistance","Fumble",
                 "RecFumbTeam","RecFumbPlayer","Sack","ReplayChallenge","ReplayChallengeResult",
                 "Accepted Penalty","Penalized Team","PenaltyType","PenalizedPlayer",
                 "PenaltyYards","OffTeamScore","DefTeamScore","ScoreDiff","AbsScoreDiff","Season")






twoPoint <- data[which(!is.na(data$TwoPointConversion)),]
probOfSuccess <- length(which(twoPoint$TwoPointConversion == "Success"))/length(twoPoint$TwoPointConversion)


length(twoPoint$X)
#only 89 2 point conversions

 arrange(data,!is.na(TwoPointConversion))%>% 
  group_by(OffTeam) %>% 
    summarise(NumberofAttempts = length(which(TwoPointConversion=="Sucess"))+length(which(TwoPointConversion == "Failure"))
    ,ProbOfSuccess = length(which(TwoPointConversion == "Success"))/(length(which(TwoPointConversion == "Success"))+length(which(TwoPointConversion == "Failure"))))


nflSuccessRate <-  length(which(data$TwoPointConversion == "Success"))/(length(which(data$TwoPointConversion == "Success"))+length(which(data$TwoPointConversion == "Failure")))
print(paste("The NFL sucess rate is: " , nflSuccessRate))

#I need to investigate why DAL has a 100% rate with 0 attempted. 
