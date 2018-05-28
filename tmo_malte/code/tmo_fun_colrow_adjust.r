


# Correct Columns ---------------------------------------------------------



# correct_columns: this function checks whether a column is corrupted the way
# that two original columns were accidentally merged into a single column.

correct_columns <- function(x){
  ccheck <- x %>% as.data.frame()
  y <- str_detect(ccheck[4,], "\\d\\s\\d" )
  
  if (sum(y, na.rm = TRUE) > 0) { # Condition: corrupted columns
    y2 <- which(y)
    
    # Split corrupted columns into two columns
    for (i in 1:length(y2)) {
      y3a <- paste0("X",y2[i])
      y3 <- paste0("X", y2[i],"a")
      ccheck <- ccheck %>% separate(!!y2[i+(i-1)], into = c(y3a,y3), "\\s")
    } 
    x <- ccheck
  } else {
    x <- ccheck
  }
}



# Correct Rows ------------------------------------------------------------

# The function should just identify the rows in need for a manual adjustment.
