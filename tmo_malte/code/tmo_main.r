###########################################################################
#
#   THEMEN MONITOR ONLINE
#   Main script
#
###########################################################################



# 0 Prerequisites ---------------------------------------------------------

## Loading packages

library(xlsx)
library(readxl)
library(openxlsx)

library(tidyverse)
library(purrr)
library(stringr)


## Functions

# Functions to adjust/identify corrupted rows or columns, due to the
# OCR process.
# Identification of corrupted rows is pending (Malte)

  source(file = "code/tmo_fun_colrow_adjust.r")

# check_parties: function to be written (Lukas)
  source(file = "code/tmo_fun_check_parties.r")


# 1. Import ---------------------------------------------------------------

# File path to excel file
  filepath <- "data/ssoar-2017-ThemenMonitor_1_Quartal_2016_Eine.xlsx"

# Import of Excel file as list object
  #sheets <- readxl::excel_sheets(filepath)
  sheets <- openxlsx::getSheetNames(filepath)
  SheetList_raw <- lapply(sheets, openxlsx::read.xlsx, xlsxFile = filepath)
  
  # There are 26 warnings, regarding empty worksheets (NULL).
  
# 2 Identify list elements ------------------------------------------------

# Creation of auxilary data frame (index_df), identifying the content of the sheets.
  
# Identification of empty list elements (Malte, finished)
# Still, running the script via "source" results in an error - running it "by hand"
# gives the expected results.
  
# source(file = "code/tmo_sub_identification.r")

# Enrich index_df
  
  source("code/tmo_sub_date1.r")
  
  
  
  
# Correction --------------------------------------------------------------
  
  
# Correction of potential corrupted columns
  SheetList <- SheetList_raw %>% lapply(correct_columns)


# Recode variable names ---------------------------------------------------

# (Malte, in progress)
  source(file = "code/tmo_sub_recoding.r")
  

# Merge data from one week ------------------------------------------------
  
  # Merging together all sheets from one week


# Add time stamp ----------------------------------------------------------

  # Adding the Erhebungsdatum to the aforehand merged data
  
  


# Overall merge -----------------------------------------------------------

  # Merge single data frames to all 







