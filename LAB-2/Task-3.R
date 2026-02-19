name <- readline(prompt ="Enter your name: ")
phone <- readline(prompt ="Enter your phone number: ")

name_upper <- toupper(name)

first_part <- substr(phone, 1, 3)

last_part <- substr(phone, nchar(phone)-3, nchar(phone))

cat("Hi,", name_upper , ". A verification code has been sent to", first_part, "-xxxxx", last_part )