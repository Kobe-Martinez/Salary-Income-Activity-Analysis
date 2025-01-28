#Does the wage gap between men and women employees at hire improve in 1977?

#1.1
#Importing libraries
library(Sleuth3)
library(RColorBrewer)
library(Cairo)
library(GISTools)
#Importing case1202 from the Sleuth3 library and assigning it to myData
myData <- case1202
#Importing color palette from set 2 with all colors in pal.
#gave the color pal. an alpha level of 0.5
colors <- brewer.pal(8, "Set2")
colorsT <- add.alpha(colors, .5)

#1.2
#opening the help file of case1202
?case1202

#1.3
#Checking the unique values within the "Sex" col. of myData
SexData <- sort(unique(myData$Sex))
#Separating the entire dataset by the unique values in the 
#"Sex" col. 
Female <- myData[myData$Sex == "Female", ]
Male <- myData[myData$Sex == "Male", ]

#sets the x range for Bsal to (3000-9000)
xrange <- c(3000,9000)
#Takes both values of the x range (3000-9000) and creates bins for the range in increments of 500
bins <- seq(xrange[1], xrange[2],500)
#Provides information for the female Bsal and its breaks using the hist function, but does not plot it
h1 <- hist(Female$Bsal, breaks = bins, plot = FALSE)
#Provides information for the male Bsal and its breaks using the hist function, but does not plot it
h2 <- hist(Male$Bsal, breaks = bins, plot = FALSE)
#sets the y range from (0-25)
yrange <- c(0,25)

#sets the x range for Bsal to (7000-17000)
xrange1 <- c(7000,17000)
#Takes both values of the x range (7000-17000) and creates bins for the range in increments of 1000
bins1 <- seq(xrange1[1], xrange1[2], 1000)
#Provides information for the female Sal77 and its breaks using the hist function, but does not plot it
h3 <- hist(Female$Sal77, breaks = bins1, plot = FALSE)
#Provides information for the male Sal77 and its breaks using the hist function, but does not plot it
h4 <- hist(Male$Sal77, breaks = bins1, plot = FALSE)
#sets the y range from (0-25)
yrange1 <- c(0,25)

#1.4
#I created a pdf file named "Assignment3_Question1_KLM.pdf"
pdf_file<-"Assignment3_Question1_KLM.pdf"
pdf_file
#using the cairo_pdf & par functions, I edited the dimensions of the 
#pdf file
cairo_pdf(pdf_file,width=20,height=9.35)
par(omi = c(.25,.25,.25,.25))
#creates a matrix of 4 numbers, puts them in 2 cols, and sets them by row 
mat <- matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE)
#sets the heights of the cols/rows in the matrix above
layout(mat, heights = c(1,0.3))
#sets the line width and the margin size specified in inches
par(lwd = 2, mai = c(0,0.5,0.5,0.5))

#plots the Female$Bsal in a histogram by the assigned bins
#sets the y axis limits based on yrange and the x axis limits based on xrange
#names the title of the figure "Salaries at Hire"
#plots the figure without any axises
hist(Female$Bsal, breaks = bins, xlab = "Salary ($)",col = colorsT[2],border = colors[2],
     ylim = yrange, xlim = xrange,
     main = "Salaries at Hire", xaxt = "n",
     yaxt = "n", cex.main = 2)

#plots the male$Bsal in the same histogram by the assigned bins
hist(Male$Bsal, breaks = bins, col = colorsT[1], border = colors[1], add = TRUE)
#creates the y-axis for the histogram with tick marks from (0-25) in increments of 5 and size of 0.025,  
#and the axis line 2 times the line width. 
axis(2, at = seq(0,25,5), tck = -(-0.025), lab = F, lwd = 2)
#Produces the numbers for the y-axis (0,25) in increments of 5
mtext(seq(0,25,5), 2, at = seq(0,25,5), las = 2, line = 0.5)
#Labels the y-axis "Frequency"
mtext("Frequency", 2,  line = 2.5, cex = 1.4)



#plots the Female$Sal77 in a histogram by the assigned bins
#sets the y axis limits based on yrange1 and the x axis limits based on xrange1
#names the title of the figure "Salaries in 1977"
#plots the figure without any axises
hist(Female$Sal77, breaks = bins1, xlab = "Salary ($)",col = colorsT[2],border = colors[2],
     ylim = yrange1, xlim = xrange1,
     main = "Salaries in 1977", 
     yaxt = "n",xaxt = "n",  cex.main = 2)

#plots the male$Sal77 in the same histogram by the assigned bins
hist(Male$Sal77, breaks = bins1, col = colorsT[1], border = colors[1], add = TRUE)
#creates the y-axis for the histogram with tick marks from (0-25) in increments of 5 and size of 0.025,  
#and the axis line 2 times the line width.
axis(2, at = seq(0,25,5), tck = -(-0.025), lab = F, lwd = 2, las = 1)
#Produces the numbers for the y-axis (0,25) in increments of 5
mtext(seq(0,25,5), 2, at = seq(0,25,5), las = 2, line = 0.5)
#Labels the y-axis "Frequency"
mtext("Frequency", 2,  line = 2.5, cex = 1.4)
#legend (which is color-blind friendly) so viewers can understand which sex is being represented
legend("topright", col = colorsT[1:2], bty = "n",
       text.font=4, bg='#f7f9fb', cex=1.5, pch = c(15), pt.cex = 2.5,
        legend = c("Male Employees","Female Employees"))
#######################################
#sets the line width and the margin size specified in inches 
par(lwd = 2, mai = c(0.5,0.5,0,0.5))
#creates a boxplot based on the sexes and bsal cols. from myData
#makes sure the boxplot is horizontal
#plots it with no axises, with outliers, no frame, scale factor of 0.5, 
#and ylim by the xrange of the first histogram
boxplot(Bsal ~ Sex, data = myData, horizontal = TRUE, 
        boxwex = 0.5, col = colors[2:1], yaxt = "n", xaxt = "n", 
        ann = FALSE, ylim = xrange, outline = TRUE, frame = F)
#creates the x-axis for the boxplot with tick marks from (3000,9000) in increments of 1000 and size of 0.05,  
#and the axis line 2 times the line width.
axis(1, at = seq(3000,9000,1000), tck = -(-0.05), lab = F, lwd = 2)
#Produces the numbers for the x-axis (3000,9000) in increments of 1000
mtext(seq(3000,9000,1000), 1, at = seq(3000,9000,1000), line = 0.2)
#Labels the x-axis "Salary ($)"
mtext("Salary ($)", 1,  line = 2.5, cex = 1.4)


#creates a boxplot based on the sexes and sal77 cols. from myData
#makes sure the boxplot is horizontal
#plots it with no axises, with outliers, no frame, scale factor of 0.5, 
#and ylim by the xrange1 of the second histogram
boxplot(Sal77 ~ Sex, data = myData, horizontal = TRUE, 
        boxwex = 0.5, col = colors[2:1], yaxt = "n", xaxt = "n", 
        ann = FALSE, ylim = xrange1, outline = TRUE, frame = F)
#creates the x-axis for the boxplot with tick marks from (7000,17000) in increments of 1000 and size of 0.05,  
#and the axis line 2 times the line width.
axis(1, at = seq(7000,17000,1000), tck = -(-0.05), lab = F, lwd = 2, las = 1)
#Produces the numbers for the x-axis (7000,17000) in increments of 1000
mtext(seq(7000,17000,1000), 1, at = seq(7000,17000,1000), line = 0.2)
#Labels the x-axis "Salary ($)"
mtext("Salary ($)", 1, line = 2.5, cex = 1.4)
#closes file and provides URL for plot(concates. to single image)
dev.off()
#######################################
#Calculates the mean of female bsal
mFemale <- mean(Female$Bsal)
#Calculates the mean of male bsal
mMale <- mean(Male$Bsal)
#Calculates the sd of female bsal
sFemale <- sd(Female$Bsal)
#Calculates the sd of male bsal
sMale <- sd(Male$Bsal)

#Returns the length of female bsal 
nFemale <- length(Female$Bsal)
#Returns the length of male bsal
nMale <- length(Male$Bsal)

#Calculates a Hedge's g statistic and a confidence interval for salaries 
#at hire between men and women
sp2 <- (((nFemale-1)*sFemale^2)+((nMale-1)*sMale^2))/(nFemale+nMale-2)
sp <- sqrt(sp2)
g <- (mMale - mFemale)/sp
sg <- sqrt((g^2/(2*(nFemale+nMale-2))) + (1/nFemale) + (1/nMale))
zA <- qnorm(1-(0.05/2))
MOE <- sg*zA
###################################
#Calculates the mean of female Sal77
mFemale_1 <- mean(Female$Sal77)
#Calculates the mean of male Sal77
mMale_2 <- mean(Male$Sal77)
#Calculates the sd of female Sal77
sFemale_1 <- sd(Female$Sal77)
#Calculates the sd of male Sal77
sMale_2 <- sd(Male$Sal77)

#Returns the length of female Sal77 
nFemale_1 <- length(Female$Sal77)
#Returns the length of male Sal77 
nMale_2 <- length(Male$Sal77)

#Calculates a Hedge's g statistic and a confidence interval for salaries 
#in 1977 between men and women
sp2_sal77 <- (((nFemale_1-1)*sFemale_1^2)+((nMale_2-1)*sMale_2^2))/(nFemale_1+nMale_2-2)
sp_sal77 <- sqrt(sp2_sal77)
g_sal77 <- (mMale_2 - mFemale_1)/sp_sal77
sg_sal77 <- sqrt((g_sal77^2/(2*(nFemale_1+nMale_2-2))) + (1/nFemale_1) + (1/nMale_2))
zA_sal77 <- qnorm(1-(0.05/2))
MOE_sal77 <- sg_sal77*zA_sal77


#bsal lower lim
Lbsal <- (g-MOE)
#bsal upper lim
Ubsal <- (g+MOE)
#sal77 lower lim
Lsal77 <- (g_sal77-MOE_sal77)
#sal77 upper lim
Usal77 <- (g_sal77+MOE_sal77)

#The wage gap does not improve
