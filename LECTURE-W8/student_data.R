#import library
library(dplyr)
library(readr)

#_________________________________________________________________________________________________________

#import dataset student_data
student_data <- read.csv("C:/Users/User/Downloads/student_data.csv")
View(student_data) #table
summary(student_data) #descriptive analytics
head(student_data) #first 6 rows
head(student_data, 10) #first 10 rows
tail(student_data) #last 6 rows

#_____________________________________________________________________________________


#1. FILTER to get student who fails
Student_fail <- student_data %>% filter(final_exam_mark < 40)
print(Student_fail)

#_________________________________________________________________________________________

#2. ARRANGE
#accending
mydata <- student_data%>% filter(final_exam_mark > 40 ) %>% arrange(final_exam_mark)
View(mydata)
#decending
mydata1 <- student_data%>% filter(final_exam_mark > 40 ) %>% arrange(desc(final_exam_mark))
View(mydata1)

#_______________________________________________________________________________________

#3. SELECT
mydata <- student_data%>% select(student_id,coursework_mark, final_exam_mark)
View(mydata)
#without using select function
mydata2<- df_DS23[ , c("student_id", "coursework_mark", "final_exam_mark" )]
View(mydata2)
#glimpse() function is provided by dplyr library to see the columns of the dataset and display some portion of the data with respect to each attribute/variable. It is like a transposed output of the print() function
glimpse(mydata) #shows data type
print(mydata)

#________________________________________________________________________________

#4. MUTATE - create new variable / column
mydata <- student_data %>% mutate(Total_Mark=(coursework_mark + final_exam_mark/200*100))
View(mydata)

#Without using Select function
mydata <- cbind(student_data, Total_Mark = (student_data$coursework_mark + student_data$final_exam_mark/200*100))
View(mydata)

#__________________________________________________________________________________________________


