#VIEW DATA
data <- iris
head(data)
tail(data)
str(data)

#DESCRIPTIVE ANALYSIS
min(data$Sepal.Length) #this produces 4.3
max(data$Sepal.Length) #this produces 7.9
range(data$Sepal.Length)
range(data$Sepal.Length)[1] #this produces 4.3
range(data$Sepal.Length) [2] #this produces 7.9
range_val <- range(data$Sepal.Length)
range_val[1]
range_val[2]
sd(data$Sepal.Length) #this produces 0.8280661
var(data$Sepal.Length) #this produces 0.6856935
mean(data$Sepal.Length) #this produces 5.843333
median(data$Sepal.Length) #this produces 5.8
summary(data)
summary(data$Sepal.Length)


#QUARTILE
A<-c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)
quantile(A)
sort(A)
quantile(A,0.25)
quantile(A,0.75)
IQR(A)

#Histrogram : distirbution of sepal length
hist(iris$Sepal.Length, 
     main = "Histogram of Sepal Length",
     xlab = "Sepal Length (CM)",
     ylab = "Frequency",
     col = "purple",
     border = "black")

#Boxplot 
boxplot(iris$Sepal.Length ~ Species,
        data = iris,
        main = "Sepal Length by Species",
        xlab = "species",
        ylab= "Sepal length (cm)",
        col = c("lightgreen", "lightpink", "lightyellow"))

#scatterplot 
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Sepal Length vs Petal Length",
     xlab = "Sepal Length",
     ylab = "Petal Length",
     col = as.numeric(iris$Species),
     pch = 19)
legend("topleft", legend = levels(iris$Species), col= 1:3, pch =19)



