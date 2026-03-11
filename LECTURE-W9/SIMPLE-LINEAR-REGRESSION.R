#SIMPLE LINEAR REGRESSION

#1. simple data frame
#data of height
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
#data of weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
#Apply lm() function and print output
relation <- lm(y~x)
print(relation)
#find weight of a person with height 170
X_test <- data.frame(x=170)
result <- predict(relation, X_test)
print(round(result, digit=2))
#find weight of a person with height 170
X_test <- data.frame(x=189)
result1 <- predict(relation, X_test)
print(round(result1, digit=2))
#plot chart
#The abline() function called to add the regression line to the plot.
plot(x,y,col = "blue",main = "Height & Weight Regression",abline(lm(y~x)),pch = 16,xlab = "Height in cm", ylab = "Weight in Kg")




#2. TRAINING & TESTING IF DATA NOT TOO BIG
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152,131)
#data of weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
#Creating data frame
data1= data.frame(x,y)
#splitting data into training and testing
data1_train<-data1[1:7,]
data1_test<-data1[8:10,]
# Apply the lm() function
relation <- lm(y~x, data1_train)
print(relation)
#Make prediction
x_text <- data.frame(x= data1_test$x)
result <- predict(relation,x_text)
print(result)


#3. MAPE : MEAN ABSOLUTE PERCENTAGE ERROR
#PEFORMANCE MEASURE #1
mape <- mean(abs((data1_test$y -result)/data1_test$y)*100)
paste("The error - MAPE is: ", round(mape,digit=2),"%")
#paste(): This is a function in R used to concatenate strings together. It takes multipl arguments and combines them into a single string.


#PERFORMANCE MEASURE #2
#create data frame to bind actual and predicted value
actuals_preds <- data.frame(cbind(actuals=data1_test$y, predicteds=result))
mape <- mean(abs(actuals_preds$actuals - actuals_preds$predicteds )/
               actuals_preds$actuals)*100
paste("The error - MAPE is: ", round(mape,digit=2),"%")





#4. PREDICTION FROM BIG DATASET
income_happiness <- read.csv("DS_TEB2043/LECTURE-W9/income_happiness.csv")
View(income_happiness)
#Split data into training (80%) and testing (20%) sets
#Randomly select row indices for training
train_indices <- sample(1:nrow(income_happiness), size = 0.8 * nrow(income_happiness))
train_data <- income_happiness[train_indices, ]
test_data <- income_happiness[-train_indices, ]
# Apply the lm() function
relation <- lm(happiness~income, data=train_data)
print(relation)
# Prediction
a <- data.frame(x=test_data$income)
colnames(a) <- "income"
result <- predict(relation,a)
#Plot
plot(test_data$income,test_data$happiness,col="red",abline(lm(happiness~income,data=train_data)),pch = 16,xlab ="income",ylab = "happiness")

