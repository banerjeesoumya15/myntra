# myntra
#myntra challenge hacker earth

# myntra hackathon
getwd()
setwd("G:/hackathon/myntra/myntra/Share")
library(data.table)
train <- fread("myntra_train_dataset.csv")

install.packages("jpeg")
library(jpeg)
myimg <- readJPEG(train$Link_to_the_image[1])

myurl <- "http://upload.wikimedia.org/wikipedia/commons/9/95/Apollonian_spheres.jpg"
z <- tempfile()
download.file(myurl,z,mode="wb")
pic <- readJPEG(z)
file.remove(z)

