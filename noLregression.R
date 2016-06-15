#Non-Linear Regression in R using MARS, SVM, k-NN & Neural Network

setwd('~/R/DynamicRegressionModel/')
msleep <- read.table(file = "DataAuto.txt",sep="\t",header=TRUE,dec=".",row.names=1)

colnames(msleep) <- c("Price","Cylinder","Power","Weight","Consumption")

library(caret)
library(nnet)
library(kernlab)
library(earth)

#Proposition of the model

##### >>>>>>><< Consumption ~ Price + Cylinder + Power + Weight


#Multivariate Adaptive Regression Splines

#Multivariate Adaptive Regression Splines (MARS) is a non-parametric regression method that models multiple nonlinearities in data using hinge functions (functions with a kink in them).


fit <- earth(Consumption ~ Price + Cylinder + Power + Weight, msleep) #Fit the model

#summarize the fit

summary(fit)

#summarize the importance of input variables
evimp(fit)
# make predictions
predictions <- predict(fit, msleep)
# summarize accuracy
rmse <- mean((msleep$Consumption - predictions)^2)
print(rmse)


#Support Vector Machine
#Support Vector Machines (SVM) are a class of methods, developed originally for classification, that find support points that best separate classes. SVM for regression is called Support Vector Regression (SVM).

#fit model
fit <- ksvm(Consumption ~ Price + Cylinder + Power + Weight, msleep)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, msleep)
# summarize accuracy
rmse <- mean((msleep$Consumption - predictions)^2)
print(rmse)

#k-Nearest Neighbor
#The k-Nearest Neighbor (kNN) does not create a model, instead it creates predictions from close data on-demand when a prediction is required. A similarity measure (such as Euclidean distance) is used to locate close data in order to make predictions.

# fit model
fit <- knnreg(msleep[,1:4], msleep[,5], k=3)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, msleep[,1:4])
# summarize accuracy
rmse <- mean((msleep$Consumption - predictions)^2)
print(rmse)

#Neural Network
#A Neural Network (NN) is a graph of computational units that recieve inputs and transfer the result into an output that is passed on. The units are ordered into layers to connect the features of an input vector to the features of an output vector. With training, such as the Back-Propagation algorithm, neural networks can be designed and trained to model the underlying relationship in data.


x <- msleep[,1:4]
y <- msleep[,5]
# fit model
fit <- nnet(Consumption~., msleep, size=12, maxit=500, linout=T, decay=0.01)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, x, type="raw")
# summarize accuracy
rmse <- mean((y - predictions)^2)
print(rmse)