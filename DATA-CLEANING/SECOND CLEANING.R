# Read the CSV file
data <- read.csv("C:/Users/User/OneDrive - Universiti Teknologi PETRONAS/Documents/DS_TEB2043/DATA-CLEANING/Seperated Dataset.csv", stringsAsFactors = FALSE)

# Ensure correct data types
data$Student_ID <- as.character(data$Student_ID)  # keep IDs as string first
data$Age <- as.numeric(data$Age)                 # convert age to numeric
data$Total_Payments <- as.numeric(gsub("[^0-9]", "", data$Total_Payments)) # remove $ and commas
data$Gender <- toupper(substr(data$Gender, 1, 1)) # clean Gender to "M" or "F"


# Standardize course names
data$Course[data$Course %in% c("Machine Learnin", "Machine Learning")] <- "Machine Learning"
data$Course[data$Course %in% c("Web Developmen", "Web Development", "Web Develpment")] <- "Web Development"
data$Course[data$Course %in% c("Data Analytics","Data Analysis")] <- "Data Analysis"

# Convert dates to standard format
data$Enrollment_Date <- as.Date(data$Enrollment_Date, format="%d-%b-%y")
missing_dates <- is.na(data$Enrollment_Date)
data$Enrollment_Date[missing_dates] <- as.Date(data$Enrollment_Date[missing_dates], format="%d-%m-%y") # try alternative

# Remove exact duplicates
data <- data[!duplicated(data), ]

# Remove duplicates by Student_ID keeping first occurrence
data <- data[!duplicated(data$Student_ID), ]

# Remove rows with missing crucial info
data <- data[!is.na(data$Student_ID) & !is.na(data$Age) & !is.na(data$Course), ]

# Remove invalid ages (e.g., > 100 or < 10)
data <- data[data$Age >= 10 & data$Age <= 100, ]

View(data)

# --- Step 0: Keep a character copy to safely fix shifted rows ---
data_char <- data
data_char[] <- lapply(data_char, as.character)

# --- Step 1: Fix single row function ---
fix_shifted_row <- function(row) {
  row <- as.character(row)   # ensure character
  ncol <- length(row)
  
  # Pad or trim to 8 columns
  if(ncol < 8) row <- c(row, rep(NA, 8 - ncol))
  if(ncol > 8) row <- row[1:8]
  
  names(row) <- colnames(data_char)  # assign names for easy access
  
  # 1. Shift if Student_ID not numeric
  if(is.na(suppressWarnings(as.numeric(row["Student_ID"])))) {
    row <- c(NA, row[1:7])
  }
  
  # 2. Fix Age
  if(is.na(suppressWarnings(as.numeric(row["Age"])))) {
    nums <- grep("^[0-9]+$", row)
    if(length(nums) > 0) {
      row["Age"] <- row[nums[1]]
      row[nums[1]] <- NA
    }
  }
  
  # 3. Fix Total_Payments
  if(is.na(suppressWarnings(as.numeric(row["Total_Payments"])))) {
    nums <- grep("^[0-9]+$", row)
    if(length(nums) > 0) {
      row["Total_Payments"] <- row[nums[length(nums)]]
      row[nums[length(nums)]] <- NA
    }
  }
  
  return(row)
}

# --- Step 2: Detect shifted rows ---
shifted_rows <- apply(data_char, 1, function(row) {
  sid <- suppressWarnings(as.numeric(row["Student_ID"]))
  age <- suppressWarnings(as.numeric(row["Age"]))
  total <- suppressWarnings(as.numeric(row["Total_Payments"]))
  is.na(sid) | is.na(age) | is.na(total)
})

# --- Step 3: Apply fix only to shifted rows ---
data_char[shifted_rows, ] <- t(apply(data_char[shifted_rows, ], 1, fix_shifted_row))

# --- Step 4: Convert columns back to proper types ---
data_char$Student_ID <- as.numeric(data_char$Student_ID)
data_char$Age <- as.numeric(data_char$Age)
data_char$Total_Payments <- as.numeric(data_char$Total_Payments)

# Flexible date conversion
convert_date <- function(x) {
  if(is.na(x) || x == "") return(NA)
  for(fmt in c("%Y-%m-%d", "%d-%m-%Y", "%d-%m-%y", "%d-%b-%y", "%d-%b-%Y")) {
    d <- as.Date(x, format = fmt)
    if(!is.na(d)) return(d)
  }
  return(NA)
}
data_char$Enrollment_Date <- sapply(data_char$Enrollment_Date, convert_date)

# --- Step 5: Replace original data ---
data <- data_char

View(data)

# Remove exact duplicate rows
data <- data[!duplicated(data), ]

# Remove duplicates by Student_ID, keep first occurrence
data <- data[!duplicated(data$Student_ID), ]

data <- data[!is.na(data$Student_ID) & !is.na(data$Age) & !is.na(data$Course), ]
data <- data[data$Age >= 10 & data$Age <= 100, ]

data$Course[data$Course %in% c("Web Developmen","Web Developmet","Web Develpment")] <- "Web Development"
data$Course[data$Course %in% c("Machine Learnin")] <- "Machine Learning"
data$Course[data$Course %in% c("Data Analytics")] <- "Data Analysis"

# Save as a clean CSV
write.csv(data, "C:/Users/User/OneDrive - Universiti Teknologi PETRONAS/Documents/DS_TEB2043/DATA-CLEANING/Cleaned Dataset.csv", row.names = FALSE)
