

# Überprüfung "infotable"
str_detect(SheetList_id[[i]][1:2,1], "Grundgesamtheit*") %>% any() &
str_detect(SheetList_id[[i]][1:3,2], "Bevölkerung in Deutschland*") %>% any() &
str_detect(SheetList_id[[i]][2:5,1], "Erhebungszeit*") %>% any()

# Überprüfung "pol"

(str_detect(names(SheetList_id[[i]]), "Parteipräferenz*") %>% any() | 
  str_detect(names(SheetList_id[[i]]), "SPD") %>% any())



# Überprüfung "dem"

str_detect(names(SheetList_id[[i]]), "Alter.in.Jahren*") %>% any()



# Überprüfung "aggr" a

str_detect(SheetList_id[[i]][1:5,1], "Basis*") %>% any() &
  str_detect(SheetList_id[[i]][2:6,1], "Zusammenfassung*") %>% any()


# Überprüfung "aggr" b
str_detect(SheetList_id[[i]][1:5,1], "ZUSAMMENF*") &
  str_detect(SheetList_id[[(i-1)]][2:6,1], "Zusammenfassung*")





# Überprüfung "first" a
str_detect(SheetList_id[[i]][1:5, 1], "1. Nennung*") %>% any()

# Überprüfung "first" b
str_detect(SheetList_id[[(i-1)]][1:5, 1], "1. Nennung*") %>% any()

# Überprüfung "scnd" a
str_detect(SheetList_id[[i]][1:5, 1], "2. Nennung*") %>% any()


# Überprüfung "scnd" b
str_detect(SheetList_id[[(i-1)]][1:5, 1], "2. Nennung*") %>% any() &
  str_detect(SheetList_id[[(i-1)]][2:6,1], "Zusammenfassung*") %>% !any()






name      name2 date            log       help
11    11 scnd_dem_a <NA>           <NA> scnd_dem_b
31    31 scnd_dem_b <NA> error_identify aggr_dem_b
33    33 scnd_pol_b <NA> error_identify aggr_pol_b
45    45 scnd_dem_b <NA> error_identify aggr_dem_b
47    47 scnd_pol_b <NA> error_identify aggr_pol_b
157  157 scnd_dem_b <NA> error_identify aggr_dem_b
159  159 scnd_pol_b <NA> error_identify aggr_pol_b




# Help column in index_df

index_df$help <- NA

index_df$help[seq(1, 182, 14)] <- "infotable"
index_df$help[seq(2, 182, 14)] <- "aggr_dem_a"
index_df$help[seq(3, 182, 14)] <- "aggr_dem_b"
index_df$help[seq(4, 182, 14)] <- "aggr_pol_a"
index_df$help[seq(5, 182, 14)] <- "aggr_pol_b"
index_df$help[seq(6, 182, 14)] <- "first_dem_a"
index_df$help[seq(7, 182, 14)] <- "first_dem_b"
index_df$help[seq(8, 182, 14)] <- "first_pol_a"
index_df$help[seq(9, 182, 14)] <- "first_pol_b"
index_df$help[seq(10, 182, 14)] <- "scnd_dem_a"
index_df$help[seq(11, 182, 14)] <- "scnd_dem_b"
index_df$help[seq(12, 182, 14)] <- "scnd_pol_a"
index_df$help[seq(13, 182, 14)] <- "scnd_pol_b"
index_df$help[seq(14, 182, 14)] <- "error_tbl"

index_df[index_df$name2 != index_df$help,]

