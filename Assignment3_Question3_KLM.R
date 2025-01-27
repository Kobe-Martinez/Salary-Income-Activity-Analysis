#21:219:220 Fundamentals of Data Visualization, Spring 2021
#Assignment 3 - Question 3
#Kobe Lee Martinez, RUID: 202006380

#Importing libraries
library(RColorBrewer)
library(Cairo)
library(GISTools)
#Importing color palette from set 2 with all colors in pal.
#gave the color pal. an alpha level of 0.5
colors <- brewer.pal(8, "Set2")
colorsT <- add.alpha(colors, .5)

#sets the working directory
setwd("/Users/kobea/OneDrive/Documents/Rutgers/FDMTLS of Data Vis/coding")
#lists all the files in the directory
list.files()
#imports the comma separated data file
df.act <- read.table("atusact_2019.dat", sep = ",", header = TRUE)
#assigns the unique values from col TRTIER2 to actCodes 
actCodes <- unique(df.act$TRTIER2)
#imports the cvs file
names <- read.csv("codes.csv", sep = ";")
#assigns the values from df.act with the code "1301" from TRTIER2 to df.tmp 
df.tmp <- df.act[df.act$TRTIER2 == 1301, ]

#creates empty vectors
startTime <- NULL
stopTime <- NULL
#for loop that converts the time from "hh:mm" to minutes in dtype int(data type integer)
for (i in 1:dim(df.tmp)[1]) {
 
  startTime[i] <- (as.numeric(substring(df.tmp$TUSTARTTIM[i],1,2))*60 +
                     as.numeric(substring(df.tmp$TUSTARTTIM[i],4,5)))
  
  stopTime[i] <- (as.numeric(substring(df.tmp$TUSTOPTIME[i],1,2))*60 +
                    as.numeric(substring(df.tmp$TUSTOPTIME[i],4,5)))
  
}

#saves the converted start/stop time into the data frame
df.tmp$startTime <- startTime
df.tmp$stopTime <- stopTime
####################################
#creates bins for the times
timeBin <- seq(0, 24*60, 80)
#Tried setting TRCODE to activity, but it print NA when assigned (did this for every col)
activity <- df.tmp[df.tmp$TUACTIVITY_N,]

#attempted to follow pseudo code for activity through time 
activity1 <- NULL
Samp_1 <- NULL
Samp_2 <- NULL
for (i in 1:dim(activity)[1]) {
  activity1[i] <- unique(activity$TRCODE)
  Samp_1[i] <-matrix(activity$startTime)
  Samp_2[i] <- matrix(activity$stopTime)
  S <- cbind(Samp_1, Samp_2)
  
}



#Attempted the activity through time my own way
Samp_1 <-matrix(activity$startTime)

Samp_2 <- matrix(activity$stopTime)

S <- cbind(Samp_1, Samp_2)

prop <- NULL

for(i in 1:length(activity)){
  
  start <- activity$startTime[i]
  
  stop <- activity$stopTime[i]
  
  for(j in 1:(length(timeBin)-1)) {
  
      prop[j] <- ((start < timeBin[j+1]) &
                 
                     (stop > timeBin[j]))
    if (start > stop){
      
      prop[j] <- !((start > timeBin[j+1]) &
                     (stop < timeBin[j]))
    }
  }
}

for(i in 1:(length(timeBin)-1)) {
  
  temp[j, i] <- sum(S[1,] <= timeBin[j] & S[2,] > timeBin[j + 1])

  }