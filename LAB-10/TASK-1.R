data("Theoph")

model_theoph <- lm(Dose ~ Wt, data = Theoph)
print(summary(model_theoph))

plot(Theoph$Wt, Theoph$Dose, 
     col = "blue", 
     main = "Theoph: Weight to Dose",
     xlab = "Weight (kg)", 
     ylab = "Dose (mg/kg)", 
     pch = 16)
abline(model_theoph, col = "red")

new_weights <- data.frame(Wt = c(90, 95, 100))
predicted_doses <- predict(model_theoph, new_weights)
print(predicted_doses)