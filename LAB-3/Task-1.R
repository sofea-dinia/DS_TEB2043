marks <- c(33,24,54,94,16,89,60,6,77,61,13,44,26,24,73,73,90,39,90,54)

A <- sum(marks >= 90 & marks <= 100)
B <- sum(marks >= 80 & marks <= 89)
C <- sum(marks >= 70 & marks <= 79)
D <- sum(marks >= 60 & marks <= 69)
E <- sum(marks >= 50 & marks <=59)
F <- sum(marks <= 49)

cat("Number of student according to grades (A,B,C,D,E,F) :")
cat('')
cat(" A:" , A)
cat(" B:" , B)
cat(" C:" , C)
cat(" D:" , D)
cat(" E:" , E)
cat(" F:" , F)

result <- marks > 49
cat("The students with marks :", marks, "pass the exam :", result)

