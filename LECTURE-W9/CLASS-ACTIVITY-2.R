Ozone <- c(11,11,11,12,12,13,13,13,13,14)
Solar.R <- c(290,44,320,149,120,137,112,27,238,274)
Wind <- c(9.2,9.7,16.6,12.6,11.5,10.3,11.5,10.3,12.6,10.9)
Temp <- c(66,62,73,74,74,76,71,76,64,68)

df <- data.frame(Ozone, Solar.R, Wind, Temp)
#split data into train and test sets
data.train<- df[1:7,]
data.test<- df[8:10,]
#modelling
relation <-lm(Ozone ~ Solar.R + Wind + Temp, data = data.train)
summary(relation)
# Prediction
a <- data.frame(Solar.R = data.test$Solar.R, Wind = data.test$Wind, Temp = data.test$Temp)
result <- predict(relation, a)
print(round(result, digits = 2))