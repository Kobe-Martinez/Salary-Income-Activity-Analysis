#21:219:220 Fundamentals of Data Visualization, Spring 2021
#Assignment 3 - Question 2
#Kobe Lee Martinez, RUID: 202006380

#1
#Importing libraries
library(RColorBrewer)
library(Cairo)
library(GISTools)
#Importing color palette from set 2 with all colors in pal.
#gave the color pal. an alpha level of 0.5
colors <- brewer.pal(8, "Set2")
colorsT <- add.alpha(colors, .5)

#creating a data frame with the information provided on canvas
#This data frame has three cols "Householders,Median_Household_Income, & Margin_Of_Error"
#each col has to have the same number of rows (in this case 4) and the values are stored in a 
#vector which is assigned to the desired col.
df <- data.frame (
  Householders = c("Householders under 25", "Householders 25 to 44", "Householders 45 to 64", "Householders 65+"),
  Median_Household_Income = c(21835, 38317, 40424, 23763),
  Margin_Of_Error = c(3695, 1609, 2327, 1592)
)

# Prints the data frame
df

#2
#I created a pdf file named "Assignment3_Question2_KLM.pdf"
pdf_file<-"Assignment3_Question2_KLM.pdf"
pdf_file
#using the cairo_pdf & par functions, I edited the dimensions of the 
#pdf file
cairo_pdf(pdf_file,width=20,height=6)
par(xpd = TRUE, mar = c(5,15,0.05,4))
#empty plot with specified ranges
plot(x = NULL, y = NULL, ann = FALSE, axes = FALSE,
     xlim = c(15000,45000), ylim = c(1,4))

#plots the points of the median household income from ranges (1.5-2.1) in the shapes of circles
points(df$Median_Household_Income,c(1.5,1.7,1.9,2.1), col = colors[1:4], cex = 4,
       pch = 19)
#creates the x-axis for the figure with tick marks in increments of 5000 and size of 0.01,  
#and the axis line 3 times the line width. 
axis(1, at = seq(15000,45000,5000), tck = -(-0.01), lab = F, lwd = 3, las = 1)
#plots the actual numbers for the x-axis from (15000-45000) in increments of 5000
mtext(seq(15000,45000,5000), 1, at = seq(15000,45000,5000), line = 0.6, cex = 1.5)
#plots the label "Income ($)" under the x-axis 
mtext("Income ($)", 1,  line = 2.4, cex = 2)
#Plots the labels of the householders on the y-axis horizontally from (1.5-2.1) in increments of 0.2 
mtext(c("Householders under 25", "Householders 25 to 44", "Householders 45 to 64", "Householders 65+"), 
      2, line = -1.5, cex = 1.8, las = 1, at = seq(1.5,2.1,.2))
#Plots the title for the figure above the graph
mtext("Median Household Income in Newark, NJ", 3, line = -8.5, cex = 3.4)
#Creates the lines (lower and upper limits) which passes through the points
# does this by subtracting the mean by the MOE and adding the MOE by the mean then placing them on the
#respective y-axis
arrows(df$Median_Household_Income-df$Margin_Of_Error, c(1.5,1.7,1.9,2.1), 
       df$Median_Household_Income+df$Margin_Of_Error,
       c(1.5,1.7,1.9,2.1), col = colors[1:4], length = 0, lwd = 5)

#closes file and provides URL for plot(concates. to single image)
dev.off()

