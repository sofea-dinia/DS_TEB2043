student_data <- list(c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner"), c(59,71,83,67,65,57,62,92,92,59))
names(student_data) <- c("Student Name", "Exam Score")

print(student_data)

max_score <- max(student_data$`Exam Score`)
cat("Highest score:" ,max_score)

min_score <- min(student_data$`Exam Score`)
cat("Lowest score:", min_score)

avg_score <- mean(student_data$`Exam Score`)
cat("Average score:", avg_score)

max_student <- student_data$`Student Name`[which(student_data$`Exam Score`==max_score)]
cat("Student with highest score:", max_student)

min_student <- student_data$`Student Name`[which(student_data$`Exam Score`==min_score)]
cat("Student with lowest score:", min_student)