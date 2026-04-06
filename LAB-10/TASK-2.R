library(caTools)
library(class)

data("ChickWeight")

split <- sample.split(ChickWeight$Diet, SplitRatio = 0.7)

train_data <- subset(ChickWeight, split == "TRUE")
test_data <- subset(ChickWeight, split == "FALSE")

train_scale <- scale(train_data[, 1:2])
test_scale <- scale(test_data[, 1:2])

for (k_val in c(1, 3, 5, 7, 15)) {
  knn_pred <- knn(train = train_scale, 
                  test = test_scale, 
                  cl = train_data$Diet, 
                  k = k_val)
  
  acc <- mean(knn_pred == test_data$Diet)
  print(paste("K =", k_val, ", Accuracy =", acc))
  
  if (k_val == 1) {
    print(table(test_data$Diet, knn_pred))
  }
}