#Correspondence analysis (CA) is a multivariate statistical technique proposed by Hirschfeld and later developed by Jean-Paul Benzécri. It is conceptually similar to principal component analysis, but applies to categorical rather than continuous data. In a similar manner to principal component analysis, it provides a means of displaying or summarising a set of data in two-dimensional graphical form.[Wikipedia]

#Correspondence analysis is a graphical technique to show which rows or columns of a frequency table have similar patterns of counts. In the correspondence analysis plot, there is a point for each row and for each column. Use Correspondence Analysis when you have many levels, making it difficult to derive useful information from the mosaic plot.
#The row profile can be defined as the set of rowwise rates, or in other words, the counts in a row divided by the total count for that row. If two rows have very similar row profiles, their points in the correspondence analysis plot are close together. Squared distances between row points are approximately proportional to Chi-square distances that test the homogeneity between the pair of rows. Column and row profiles are alike because the problem is defined symmetrically. The distance between a row point and a column point has no meaning. However, the directions of columns and rows from the origin are meaningful, and the relationships help interpret the plot. [http://www.jmp.com/support/help/Correspondence_Analysis.shtml]


#Loading libraries
#library(ca) #Correspondence analysis
library(ggplot2)
library(FactoMineR) #for computing Correspondence Analysis
library(factoextra) #for visualizing Correspondence Analysis
library(corrplot) #use the function corrplot to highlight the most contributing variables for each dimension

#Loading data
setwd('~/R/DynamicRegressionModel/')
msleep <- read.table(file = "DataAuto.txt",sep="\t",header=TRUE,dec=".",row.names=1)

#Renaming the columns
colnames(msleep) <- c("Price","Cylinder","Power","Weight","Consumption")

#Create a 2 way table
#tab <- with(msleep, table(Weight,Cylinder)) 

#View(prop.table(tab, 1)) #View the row percentages
#View(prop.table(tab, 2)) #View the column percentages

caResult <- CA(msleep, graph = FALSE)

#Print attributes of the function CA
print(caResult)

#Extended results
summary(caResult)

#Correspondence Analysis Factor Map : Symetric Map
plot(caResult)

#Asymetric Map
plot(caResult, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows = c(FALSE, TRUE)) # asymmetric map

#Interpretation of Correspondence Analysis Outputs

#(1) Significance of the association between rows and columns

#To interpret correspondence analysis, the first step is to evaluate whether there is a significant dependency between the rows and columns.
#There are two methods to inspect the significance:

   #* Using the trace
   #* Using the Chi-square statistic
 #The trace is the the total inertia of the table (i.e, the sum of the eigenvalues). The square root of the trace is interpreted as the correlation coefficient between rows and columns.

eig <- get_eigenvalue(caResult)
trace <- sum(eig$eigenvalue) 
cor.coef <- sqrt(trace)
print(cor.coef)

# Chi-square statistics
chi2 <- trace*sum(as.matrix(msleep))
print(chi2)

# Degree of freedom
df <- (nrow(msleep) - 1) * (ncol(msleep) - 1)
# P-value
pval <- pchisq(chi2, df = df, lower.tail = FALSE)
print(pval)

#(2) Eigenvalues and scree plot

#The number of dimensions to retain in the solution can be determined by examining the table of eigenvalues.

#As mentioned above, trace is the total sum of eigenvalues. For a given axis, the ratio of the axis eigenvalue to the trace is called the percentage of variance (or total inertia or chi-square value) explained by that axis.

#The proportion of variances retained by the different dimensions (axes) can be extracted using the function get_eigenvalue()[in factoextra] as follow :

eigenvalues <- get_eigenvalue(caResult)
head(round(eigenvalues, 2))

#Eigenvalues correspond to the amount of information retained by each axis. Dimensions are ordered decreasingly and listed according to the amount of variance explained in the solution. Dimension 1 explains the most variance in the solution, followed by dimension 2 and so on.


#(3) CA scatter plot: Biplot of row and column variables

fviz_ca_biplot(caResult)

#Change the theme

fviz_ca_biplot(caResult) + theme_minimal()

#(4) Row variables

row <- get_ca_row(caResult)
print(row)

#Coordinates of rows
head(row$coord)

#Default plot
fviz_ca_row(caResult)

#Contribution of rows to the dimensions
head(row$contrib)

#use the function corrplot to highlight the most contributing variables for each dimension

corrplot(row$contrib, is.corr=FALSE)

#Contributions of rows on Dim.1
fviz_contrib(caResult, choice = "row", axes = 1)

# Contributions of rows on Dim.2
fviz_contrib(caResult, choice = "row", axes = 2)

# Total contribution on Dim.1 and Dim.2
fviz_contrib(caResult, choice = "row", axes = 1:2)

# Control row point colors using their contribution
# Possible values for the argument col.row are :
  # "cos2", "contrib", "coord", "x", "y"
fviz_ca_row(caResult, col.row = "contrib")

# Change the gradient color
fviz_ca_row(caResult, col.row="contrib") + scale_color_gradient2(low="white", mid="blue",high="red", midpoint=10) + theme_minimal()

# Control the transparency of rows using their contribution
# Possible values for the argument alpha.var are :
  # "cos2", "contrib", "coord", "x", "y"
fviz_ca_row(caResult, alpha.row="contrib") +  theme_minimal()

#Cos2 : The quality of representation of rows

head(row$cos2)

#Visualize the cos2 of rows using corrplot:

corrplot(row$cos2, is.corr=FALSE)

#Asymmetric biplot for correspondence analysis
fviz_ca_biplot(caResult, map ="rowprincipal", arrow = c(TRUE, TRUE))


