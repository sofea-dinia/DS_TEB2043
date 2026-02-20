#CREATING DATA FRAME (DF)
names =c("Carrol","Mike","John")
gender = c("Female", "Male", "Male")
height = c(160, 175, 173)
weight = c(49, 89, 77)
age = c(35, 36, 41)
df = data.frame(names,gender,height,weight,age)
View(df)

#ACCESSING ROWS AND COLUMNS
df[1,3]
#row 1 until 2, column 1 until 3
df[1:2, 1:3]

#VIEW GENDER IN MATRIC OR VECTOR
#matrix
df["gender"]
#vector
df$gender

#WANT TO SEE ALL FROM COLUMN 1 - 2
df[1:2]
df[c(1,2)]

#SEARCHING FOR VALUES
df[df$names == "Mike",]
df[df$names == "Fufu",]
df[df$age>=35]


#ADDING NEW ROW IN DF
print("Before Adding:\n")
print(df)
newDf = rbind(df, data.frame(names = c("Suuria","Malik"),
                             gender = c("Female","Male"),
                             height = c(156,169),
                             weight = c(56,81),
                             age = c(23, 28)))
print("After Added rows:\n")
print(newDf)



#MERGE DATA FRAME (DF1+DF2)
gender = c("Female", "Male", "Male","Female","Male")
height = c(160, 175, 173,156,169)
weight = c(49, 89, 77,56,81)
age = c(35, 36, 41,23, 28)
names =c("Carrol","Mike","John","Suuria","Malik")
df1 = data.frame(names,gender,height,weight,age)

states = c("Selangor","Perak","Melaka")
names = c("Carrol","John","Malik")
df2 = data.frame(names, states)

dfMerge= merge(df1, df2, by = "names", all= TRUE)
View(dfMerge)
print(dfMerge)


#TO REMOVE ROWS IN DF
changabledf <- dfMerge
newDf2 = changabledf[-2,]
print(newDf2)

#MODIFY VALUES IN DF
newDf3 = changabledf
newDf3[1,"age"] <-30
newDf3[4, "height"] <-152
print(newDf3)

#CREATE NEW DF (DF4) TO REMOVE COLUMN 4 (WEIGHT)
newDf4 = changabledf[,-4]
print(newDf4)







#IMPORT COVID DATASET
getwd()
library(readr)
data_cv <- read.csv("C:/Users/User/Downloads/my_covid.csv")
head(data_cv,5)
summary(data_cv)

#EXPORT DATASET
#-seq not inclusing row numbwe 10-13
newdfCovid <- data_cv[-seq(10,13), ]
View(newdfCovid)
write.csv(newdfCovid,"C:/Users/User/Downloads/my_covid.csv" )\


#EFFECT OF MISSING VALUE
a <-c(1:5, rep(NA,3),6:10)
print(a)
sum(a)
b <- a[!is.na(a)]
print(b)
#https://www.youtube.com/watch?v=1iCib5KhbaU&t=321s
#creating a vector of integers having NAs.
a<-c(seq(1,10,3), rep(NA,4), seq(10,2,-2))
a
#assign missing value w 0
a[is.na(a)]<-0
print(a)
#assign with mean
m <- mean(a, na.rm =TRUE)
a[is.na(a)]<-m
a
#view if covid df has NA value
is.na(newdfCovid)




#IMPORT DATASET WITH NA
dfNA <- read.csv("C:/Users/User/Downloads/NAexample.csv")
View(dfNA)
is.na(dfNA) #whole dataframe
is.na(dfNA["VarA"]) #column
mean(dfNA$VarA) #mean with NA values
mean(na.omit(dfNA$VarA)) #mean without NA  values
 


#EXERCISE REMOVING BAD VALUES
library(readr)
df_raw <- read.csv("C:/Users/User/Downloads/file1.csv")
View(df_raw)

df_cleaned <- df_raw
df_logrm <- data.frame(TagsValue = character(), Definition = character() , 'Value to be assigned' = character())
rows_to_remove <- c()
for (i in 1:nrow(df_raw))
{
  if (df_raw[i, 2] == "Bad value" && df_raw[i, 3] == "Garbage")
  {
    rows_to_remove <- c(rows_to_remove, i)
    # Log the removed bad values
    df_logrm <- rbind(df_logrm, c(df_raw[i, 1], df_raw[i, 2],df_raw[i, 3]))
    # Save the index for the rows to be removed
  }
}
df_cleaned <- df_cleaned[-rows_to_remove, ]
View(df_cleaned)
View (df_logrm)
write.csv (df_logrm , file= "df_logrm9.csv")
write.csv (df_cleaned , file= "df_cleaned9.csv")





