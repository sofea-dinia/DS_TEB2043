weight <- as.numeric(readline(prompt= "Enter Weight :"))
18

bmi <- weight/(height/100)^2

cat("BMI Value :", bmi, "\n")

cat("Underweight :", bmi <= 18.4, "\n")
cat("Normal :", bmi >= 18.5 & bmi <= 24.9, "\n")
cat("Overweight :", bmi >= 25.0 & bmi <= 39.9, "\n")
cat("Obese :", bmi >= 40.0, "\n")