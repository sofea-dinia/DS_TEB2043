  x <- c(1,2,3,4,5,6,7,8,9,10)
  y <- c(2500,2700,3000,3400,3900,4400,5000,5600,6200,6900)
  df <- data.frame(x,y)
  data_train<-df[1:7,]
  data_test<-df[8:10,]
  # Apply the lm() function
  relation <- lm(y~x, data_train)
  print(relation)
  #Make prediction
  x_text <- data.frame(x= data_test$x)
  result <- predict(relation,x_text)
  print(result)
  
  # Scatter plot
  plot(df$x, df$y,
       main = "Scatter Plot with Regression Line",
       xlab = "x",
       ylab = "y",
       pch = 19,
       col = "blue")
  
  # Add regression line from training data
  abline(relation, col = "red", lwd = 2)
  