###########################################################################
#
#   THEMEN MONITOR ONLINE
#   Sub script: Time stamp
#
##########################################################################



# Übernehme für alle Data frames:
j <- which(!is.na(index_df$date))


for (i in 1:length(j)) {
  if (i < length(j)) {
    index_df$date[j[i]:(j[i+1]-1)] <- index_df$date[j[i]]   
  } else if (i == length(j)) {
    index_df$date[j[i]:nrow(index_df)] <- index_df$date[j[i]]
  }
}

# Extract data on survey period from original time stamp
# Source: date (5. und 6. Januar 2016, e.g.)

index_df$day1 <- str_extract(index_df$date, "^(?<!\\d)\\d{1,2}") # extracts first (1 -2) digits of the string 
index_df$day2 <- str_extract(index_df$date,"(?<= bis\\s)\\d{1,2}") # use look arounds (positive look-behind assertion)
index_df$month <- str_extract(index_df$date, "[:upper:]{1}[:lower:]+" )
index_df$year <- str_extract(index_df$date, "\\d{4}$")  # extracts last four digits of the string

# Correct day variables into correct pattern

for (i in 1:length(index_df$day1)) {
  if (str_count(index_df$day1[i], "\\d") < 2)
    index_df$day1[i] <- paste0("0", index_df$day1[i])
}

for (i in 1:length(index_df$day2)) {
  if (str_count(index_df$day2[i], "\\d") < 2)
    index_df$day2[i] <- paste0("0", index_df$day2[i]) 
}

# Convert Month to numeric

index_df$month <- ifelse(index_df$month == "Januar", "01", index_df$month)
index_df$month <- ifelse(index_df$month == "Februar", "02", index_df$month)
index_df$month <- ifelse(index_df$month == "März", "03", index_df$month)
index_df$month <- ifelse(index_df$month == "April", "04", index_df$month)
index_df$month <- ifelse(index_df$month == "Mai", "05", index_df$month)
index_df$month <- ifelse(index_df$month == "Juni", "06", index_df$month)
index_df$month <- ifelse(index_df$month == "Juli", "07", index_df$month)
index_df$month <- ifelse(index_df$month == "August", "08", index_df$month)
index_df$month <- ifelse(index_df$month == "September", "09", index_df$month)
index_df$month <- ifelse(index_df$month == "Oktober", "10", index_df$month)
index_df$month <- ifelse(index_df$month == "November", "11", index_df$month)
index_df$month <- ifelse(index_df$month == "Dezember", "12", index_df$month)





#index_df2 <- index_df

index_df$sp_1 <- paste0(index_df$day1, "-", index_df$month, "-", index_df$year) %>% as.Date("%d-%m-%Y")
index_df$sp_2 <- paste0(index_df$day2, "-", index_df$month, "-", index_df$year) %>% as.Date("%d-%m-%Y")


# Reducing index_df to relevant variables:
index_df_safe <- index_df
index_df <- index_df %>% dplyr::select(name, name2, sp_1, sp_2)


# Convert to POSIXct using strptime()








