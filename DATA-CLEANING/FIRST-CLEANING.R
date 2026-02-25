
# Import pipe-separated dataset into R and store as df
df <- read.delim("C:/Users/User/OneDrive - Universiti Teknologi PETRONAS/Documents/DS_TEB2043/DATA-CLEANING/Unclean Dataset.csv",
                 sep = "|", 
                 header = FALSE,     # first row is header
                 stringsAsFactors = FALSE,
                 strip.white = TRUE,
                 skip =1)          # skip the first junk row

View(df)




#Assign propoer column names
colnames(df) <- c("Student_ID",
                  "First_Name",
                  "Last_Name",
                  "Age",
                  "Gender",
                  "Course",
                  "Enrollment_Date",
                  "Total_Payments")

#Replacing NA with 
df[df == ""] <- NA

# Check if some rows still have everything in the first column
table(apply(df, 1, function(x) sum(!is.na(x))))

library(stringr)

# Split only rows where Student_ID is NA or all other columns are NA
messy_rows <- which(apply(df, 1, function(x) sum(!is.na(x)) <= 1))

# Split the first column by comma
split_rows <- str_split(df$Student_ID[messy_rows], pattern = ",")

max_cols <- 8
split_rows <- lapply(split_rows, function(x) { length(x) <- max_cols; x })
split_df <- as.data.frame(do.call(rbind, split_rows), stringsAsFactors = FALSE)
colnames(split_df) <- colnames(df)

df[messy_rows, ] <- split_df

df <- data.frame(lapply(df, function(x) {
  if (is.character(x)) {
    # Convert to UTF-8 and replace invalid bytes
    iconv(x, from = "latin1", to = "UTF-8", sub = "")
  } else {
    x
  }
}), stringsAsFactors = FALSE)

# Remove leading/trailing spaces
df <- data.frame(lapply(df, str_trim), stringsAsFactors = FALSE)

# Convert payments to numeric (remove currency symbols and commas)
df$Total_Payments <- as.numeric(gsub("[^0-9]", "", df$Total_Payments))


# Save as a clean CSV
write.csv(df, "C:/Users/User/OneDrive - Universiti Teknologi PETRONAS/Documents/DS_TEB2043/DATA-CLEANING/Seperated Dataset.csv", row.names = FALSE)











