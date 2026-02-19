student_data <- list(c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner"), c(59,71,83,67,65,57,62,92,92,59), c(89,86,65,52,60,67,40,77,90,61))

names(student_data) <- c("Student Name", "Chemistry", "Physics")

print(student_data)

fail_chemistry <- sum(student_data$Chemistry <= 49)
fail_physics <- sum(student_data$Physics <= 49)



sum_fail <- fail_chemistry + fail_physics


min_score_phy <- min(student_data$Physics)
student_min_score_phy <- student_data$`Student Name`[which(student_data$Physics == min_score_phy) ]


min_score_chem <- min(student_data$Chemistry)
student_min_score_chem <- student_data$`Student Name`[which(student_data$Chemistry == min_score_chem) ]


cat("Number of student who fails Chemistry:", fail_chemistry )
cat("Number of student who fails Physics:", fail_physics )
cat("Number of student who fails Physics and Chemistry :", sum_fail)
cat("Lowest score (Physics) : ", student_min_score_phy , ",",min_score_phy )
cat("Lowest score (Chemistry) : ", student_min_score_chem , ",", min_score_chem)