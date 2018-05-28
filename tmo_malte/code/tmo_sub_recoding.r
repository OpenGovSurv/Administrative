###########################################################################
#
#   THEMEN MONITOR ONLINE
#   Sub script: Variable recoding
#
###########################################################################


# x_x_1
names_x_x_1 <- c("item","all","west","east","age1","age2","age3","age4",
                 "male", "female", "edu1", "edu2", "edu3", "employ1",
                 "employ0", "income1", "income2", "income3")
z_1_1 <- lapply(z_1_1, setNames, nm = names_x_x_1)
z_2_1 <- lapply(z_2_1, setNames, nm = names_x_x_1)
a_1_1 <- lapply(a_1_1, setNames, nm = names_x_x_1)
a_2_1 <- lapply(a_2_1, setNames, nm = names_x_x_1)
b_1_1 <- lapply(b_1_1, setNames, nm = names_x_x_1)
b_2_1 <- lapply(b_2_1, setNames, nm = names_x_x_1)

# x_x_2

# In early quartals, the fdp was excluded from the table.

z_1_2 <- lapply(z_1_2, check_parties)
z_2_2 <- lapply(z_2_2, check_parties)
a_1_2 <- lapply(a_1_2, check_parties)
a_2_2 <- lapply(a_2_2, check_parties)
b_1_2 <- lapply(b_1_2, check_parties)
b_2_2 <- lapply(b_2_2, check_parties)


names_x_x_2 <- c("item", "all", "cdu", "spd", "leftists", 
                 "greens", "fdp", "afd", "elec_party_else", "elec_none", 
                 "elec_dont_know")

z_1_2 <- lapply(z_1_2, setNames, nm = names_x_x_2)
z_2_2 <- lapply(z_2_2, setNames, nm = names_x_x_2)
a_1_2 <- lapply(a_1_2, setNames, nm = names_x_x_2)
a_2_2 <- lapply(a_2_2, setNames, nm = names_x_x_2)
b_1_2 <- lapply(b_1_2, setNames, nm = names_x_x_2)
b_2_2 <- lapply(b_2_2, setNames, nm = names_x_x_2)


# Delete empty rows/ rows with obsolete data
z_1_1 <- lapply(z_1_1, rm_row, 1, 3)
z_2_1 <- lapply(z_2_1, rm_row, 1, 3)
z_1_2 <- lapply(z_1_2, rm_row, 1, 3)
z_2_2 <- lapply(z_2_2, rm_row, 1, 1)

a_1_1 <- lapply(a_1_1, rm_row, 1, 1)