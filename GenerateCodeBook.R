# Generate a codebook (CodeBook.md) for Tidy dataset(Tidy.txt)
#
# First, set path and libraries
setwd("C:/Users/catherine/Documents/UCI_HAR_Dataset/scripts")
library(memisc)
library(data.table)
# Read dataset
Data <- fread("C:/Users/catherine/Documents/UCI_HAR_Dataset/scripts/Tidy.txt",header=TRUE, sep=" ")
# Generates CodeBook.md
Data <- within(Data,{
        sapply(Data,class)
})
Write(codebook(Data), file="CodeBook.md")


