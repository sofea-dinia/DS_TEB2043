#1. built in data MTCARS about motor trend in US magazine talking abt car characteristic
data(mtcars)
head(mtcars)
str(mtcars)

#2. model the multiple linear regression
model <- lm(mpg ~ hp + wt + cyl, data = mtcars)

#3.investigate properties of the model
summary(model)

#3. Prediction on dataset
data(mtcars)
#split data into train and test sets
data.train<- mtcars[1:22,]
data.test<- mtcars[23:32,]
#modelling
relation <-lm(mpg ~ hp +wt+cyl, data = data.train)
summary(relation)
# Prediction
a <- data.frame(hp = data.test$hp, wt = data.test$wt, cyl = data.test$cyl)
result <- predict(relation, a)
print(round(result, digits = 2))

#4. Performance measurement 
mape <- mean(abs((data.test$mpg - result)/ data.test$mpg )*100)
paste("The error - MAPE is: ", round(mape,digit=2),"%")


#5. Side by side
actuals_preds <- data.frame(cbind(actuals=data.test$mpg, predicted=result))
View(actuals_preds)
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)
mape <- mean(abs(actuals_preds$actuals-actuals_preds$predicted)/actuals_preds$actuals)*100
paste("The error - MAPE is: ", round(mape,digit=2),"%")
