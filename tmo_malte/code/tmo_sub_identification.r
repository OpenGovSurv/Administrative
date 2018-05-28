###########################################################################
#
#   THEMEN MONITOR ONLINE
#   Sub script: Identification of element content
#
###########################################################################



# Create copy of SheetList_raw for this process to work with:
SheetList_id <- SheetList_raw

# Delete list elements wich equals "NULL"
SheetList_id[which(lapply(SheetList_id, class) == "NULL")] <- NULL

# Rename list elements, according to their current position
names(SheetList_id) <- seq(1:length(SheetList_id))

# Create auxilary names vector for list
index_df <- data.frame(name = seq(1:length(SheetList_id)),
                       name2 = NA,
                       date = NA)

# Identification loop -----------------------------------------------------

# For usage of str_detect, all NAs should be converted to "NA":
SheetList_id <- lapply(SheetList_id, function(d) {d[is.na(d)] <- "NA"; d})
  
# For later use, function that bounds value to the maximum "nrow"
nmax <- function(df,b){
  if (nrow(df) <= b) {
    nrow(df)
  } else {
    b
  }
}

# Specific auxilary function, used to avoid crossing bounds of subscript
a <- function(x) {if (i < 182){1} else {0}}


# write up loop to get information out of list elements
for (i in 1:length(SheetList_id)) {

    # Find infotables, extract survey date information
    if (str_detect(SheetList_id[[i]][1:2,1], "Grundgesamtheit*") %>% any() &
        str_detect(SheetList_id[[i]][1:3,2], "Bevölkerung in Deutschland*") %>% any() &
        str_detect(SheetList_id[[i]][2:5,1], "Erhebungszeit*") %>% any()
        ) {
      index_df[i,"name2"] <- "infotable"
      index_df[i,"date"] <- SheetList_id[[i]][5,2] %>% as.character()

    # Identify Zusammenfassung (1. & 2. Nennung), Aggr Demographics a
    } else if (str_detect(SheetList_id[[i]][1:nmax(SheetList_id[[i]], 5),1], "Basis*") %>% any() &
        str_detect(SheetList_id[[i]][2:nmax(SheetList_id[[i]], 6),1], "Zusammenfassung*") %>% any() &
        str_detect(names(SheetList_id[[i]]), "Alter.in.Jahren*") %>% any() &
        (dim(SheetList_id[[i]])[1] > dim(SheetList_id[[i+a(1)]])[1]) 
        ) {
      index_df[i, "name2"] <- "aggr_dem_a"
    
    # Identify Zusammenfassung (1. & 2. Nennung), Aggr Demographics b, doesn't occur always
    } else if (i > 1 &
               str_detect(SheetList_id[[(i-1)]][2:nmax(SheetList_id[[i-1]], 6),1], "Zusammenfassung*") %>% any() &
               str_detect(names(SheetList_id[[i]]), "Alter.in.Jahren*") %>% any() &
               dim(SheetList_id[[i]])[1] < dim(SheetList_id[[i-1]])[1]
               ){ 
      index_df[i, "name2"] <- "aggr_dem_b"
    
    # Identify Zusammenfassung (1. & 2. Nennung), Aggr Political preferences a  
    } else if (str_detect(SheetList_id[[i]][1:nmax(SheetList_id[[i]], 5),1], "Basis*") %>% any() &
              str_detect(SheetList_id[[i]][2:nmax(SheetList_id[[i]], 6),1], "Zusammenfassung*") %>% any() &
              (str_detect(names(SheetList_id[[i]]), "Parteipräferenz*") %>% any() | 
              str_detect(names(SheetList_id[[i]]), "SPD") %>% any()) &
              (dim(SheetList_id[[i]])[1] > dim(SheetList_id[[i+a(1)]])[1] )
               ) {
      index_df[i, "name2"] <- "aggr_pol_a"
   
    # Identify Zusammenfassung (1. & 2. Nennung), Aggr Political preferences b  , doesn't occur always
    } else if (i > 1 &
               str_detect(SheetList_id[[(i-1)]][2:nmax(SheetList_id[[i-1]], 6),1], "Zusammenfassung*") %>% any() &
               (str_detect(names(SheetList_id[[i]]), "Parteipräferenz*") %>% any() | 
                str_detect(names(SheetList_id[[i]]), "SPD") %>% any()) & 
               dim(SheetList_id[[i]])[1] < dim(SheetList_id[[i-1]])[1]
               ) {
      index_df[i, "name2"] <- "aggr_pol_b"
    
    # Identify 1. Nennung, First Democraphics a
    } else if (str_detect(SheetList_id[[i]][1:nmax(SheetList_id[[i]], 5), 1], "1. Nennung*") %>% any() &
               str_detect(names(SheetList_id[[i]]), "Alter.in.Jahren*") %>% any() &
               (dim(SheetList_id[[i]])[1] > dim(SheetList_id[[i+a(1)]])[1]
               )) {
      index_df[i, "name2"] <- "first_dem_a"
      
    # Identify 1. Nennung, First Demographics b
    } else if (i > 1 &
               str_detect(SheetList_id[[(i-1)]][1:nmax(SheetList_id[[i-1]], 5), 1], "1. Nennung*") %>% any() &
               str_detect(names(SheetList_id[[i]]), "Alter.in.Jahren*") %>% any() &
               dim(SheetList_id[[i]])[1] < dim(SheetList_id[[i-1]])[1]
               ) {
      index_df[i, "name2"] <- "first_dem_b"
      
    # Identify 1. Nennung, First Political preferences a
    } else if (str_detect(SheetList_id[[i]][1:nmax(SheetList_id[[i]], 5), 1], "1. Nennung*") %>% any() &
               (str_detect(names(SheetList_id[[i]]), "Parteipräferenz*") %>% any() | 
                str_detect(names(SheetList_id[[i]]), "SPD") %>% any()) &
               (dim(SheetList_id[[i]])[1] > dim(SheetList_id[[i+a(1)]])[1]
               )) {
      index_df[i, "name2"] <- "first_pol_a"
      
    # Identify 1. Nennung, First Political preferences b
    } else if (i > 1 & 
               str_detect(SheetList_id[[(i-1)]][1:nmax(SheetList_id[[i-1]], 5), 1], "1. Nennung*") %>% any() &
               (str_detect(names(SheetList_id[[i]]), "Parteipräferenz*") %>% any() | 
                str_detect(names(SheetList_id[[i]]), "SPD") %>% any()) &
               dim(SheetList_id[[i]])[1] < dim(SheetList_id[[i-1]])[1]
               ) {
      index_df[i, "name2"] <- "first_pol_b"
      
    # Identify 2. Nennung, Second Demographics a
    } else if (str_detect(SheetList_id[[i]][1:nmax(SheetList_id[[i]], 5), 1], "2. Nennung*") %>% any() &
               str_detect(names(SheetList_id[[i]]), "Alter.in.Jahren*") %>% any() &
               !str_detect(SheetList_id[[(i-1)]][2:nmax(SheetList_id[[i-1]], 6),1], "Zusammenfassung*") %>% any() &
               (dim(SheetList_id[[i]])[1] > dim(SheetList_id[[i+a(1)]])[1]
               )) {
      index_df[i, "name2"] <- "scnd_dem_a"
      
    # Identify 2. Nennung, Second Demographics b
    } else if (i > 1 & 
               str_detect(SheetList_id[[(i-1)]][1:nmax(SheetList_id[[i-1]], 5), 1], "2. Nennung*") %>% any() &
               str_detect(names(SheetList_id[[i]]), "Alter.in.Jahren*") %>% any() &
               !str_detect(SheetList_id[[i-1]][2:nmax(SheetList_id[[i-1]], 6), 1], "Zusammenfassung*") %>% any() &
               dim(SheetList_id[[i]])[1] < dim(SheetList_id[[i-1]])[1]
               ) {
      index_df[i, "name2"] <- "scnd_dem_b"
      
    # Identify 2. Nennung, Second Political preferences a
    } else if (str_detect(SheetList_id[[i]][1:nmax(SheetList_id[[i]], 5), 1], "2. Nennung*") %>% any() &
               (str_detect(names(SheetList_id[[i]]), "Parteipräferenz*") %>% any() | 
                str_detect(names(SheetList_id[[i]]), "SPD") %>% any()) &
               !str_detect(SheetList_id[[i]][1:nmax(SheetList_id[[i]], 5), 1], "Zusammenfassung*") %>% any() &
               (dim(SheetList_id[[i]])[1] > dim(SheetList_id[[i+a(1)]])[1]
               )) {
      index_df[i, "name2"] <- "scnd_pol_a"
      
    # Identify 2. Nennung, Second Political preferences b
    } else if (i > 1 & 
               str_detect(SheetList_id[[(i-1)]][1:nmax(SheetList_id[[i-1]], 5), 1], "2. Nennung*") %>% any() &
               (str_detect(names(SheetList_id[[i]]), "Parteipräferenz*") %>% any() | 
                str_detect(names(SheetList_id[[i]]), "SPD") %>% any()) &
               !str_detect(SheetList_id[[i-1]][1:nmax(SheetList_id[[i-1]], 5), 1], "Zusammenfassung*") %>% any() &
               dim(SheetList_id[[i]])[1] < dim(SheetList_id[[i-1]])[1]
               ) {
      index_df[i, "name2"] <- "scnd_pol_b"
      
      
    # Identify Fehlertoleranztabelle
    } else if (str_detect(names(SheetList_id[[i]]), "Größe.der.Stichprobe*") %>% any()
               ) {
      index_df[i, "name2"] <- "error_tbl"
      
    }
} # Brackets loop index (master)

## Clean up
rm(a)
rm(i)
rm(nmax)


