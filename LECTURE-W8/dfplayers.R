dfplayers <- read.csv("C:/Users/User/Downloads/players.csv")
View(dfplayers)

is.na(dfplayers)
#if missing value is true for that row, replace w the median
median_age <- median(dfplayers$Age, na.rm = TRUE)

median_age <- dfplayers$Age[dfplayers$Age<18 |
                dfplayers$Age>38]
print(median_age)


#boxplot 
data<-c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(data, main = "Boxplot")
iqr <- IQR(data)
first_q<-quantile(data,0.25)#this is 26
print(first_q)
third_q<-quantile(data,0.75) #this is 31.75
print(third_q)
le<-first_q - 1.5 * iqr
print(le)
ue = third_q + 1.5 * iqr
print(ue)


#drop le and ue values and save into new_data
data_new<-data
data_new <- data_new[!data_new<le]
data_new <- data_new[!data_new>ue]
data_new


#replace value with mean
data_new2 <- data
avg <- round(mean(data_new2)) #for the purpose of example we round up value
data_new2[data_new2<le] <- avg
data_new2[data_new2>ue] <- avg
data_new2

#replace outliers with ue and le
data_new3 <- data
data_new3[data_new3<le] <- le
data_new3[data_new3>ue] <- ue
data_new3
