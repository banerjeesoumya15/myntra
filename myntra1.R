#https://www.r-bloggers.com/image-recognition-tutorial-in-r-using-deep-convolutional-neural-networks-mxnet-package/


getwd() 
setwd("C:/Users/soumya.banerjee01/Documents/R/myntra") 

library(data.table) 
train <- fread("myntra_train_dataset.csv")
test <- fread("myntra_test.csv")

# install.packages("jpeg") 
# library(jpeg) 
# myimg <- readJPEG(train$Link_to_the_image[1])

# myurl <- "http://upload.wikimedia.org/wikipedia/commons/9/95/Apollonian_spheres.jpg" 
# z <- tempfile() 
# download.file(myurl,z,mode="wb") 
# pic <- readJPEG(z) 
# file.remove(z)

library(mlr)
summary(train)
summarizeColumns(train)
summarizeColumns(test)
str(train)

train <- train[-which(is.na(train$Color)),]

for(i in colnames(train[,c(1:4,6)])) {
  train[,c(1:4,6)][[i]] <- as.factor(factor(train[,c(1:4,6)][[i]]))
}

for(i in colnames(test[,c(1:4)])) {
  test[,c(1:4)][[i]] <- as.factor(factor(test[,c(1:4)][[i]]))
}

table(train$Brand)
table(test$Brand)
table(train$Category)
table(test$Category)
table(train$Gender)
table(test$Gender)
table(train$Color)
table(test$Color)
###########################################
#to know all levels of Brand are common or not
train1 <- unique(train[,1])
test1 <- unique(test[,1])
res1 <- merge(train1, test1)

#to know all levels of Color are common or not
train4 <- unique(train[,4])
test4 <- unique(test[,4])
res4 <- merge(train4, test4)
###########################################

table(train$Sub_category)

train2 <- train[,c(4,5)]
test2 <- test[,5]

# for(i in 1:nrow(train2)){
#   myurl <- train2$Link_to_the_image[i]
#   z <- tempfile()
#   download.file(myurl,z,quiet = TRUE,   mode="wb")
#   me <- readJPEG(z)
#   
#   #train2 <- rbind(train2, data.frame(me))
#   
#   train2$pic[i] <- me
#   file.remove(z)
# }
#train2 <- train2[,-3]

# myurl <- train2[1,1]
# z <- tempfile()
# download.file(myurl,z,mode = "wb")
# pic <- readJPEG(z)
# train2$pic <- list(pic)
install.packages("magick")
library(magick)

#load image using magick package, from local, after downloading
#by using below code
temp_img <- array()
for(i in 1:nrow(train2)){
  myurl <- train2$Link_to_the_image[i]
  z <- tempfile()
  download.file(myurl, z, quiet = TRUE, mode = "wb")
  me <- image_read(z)
  #raster <- as.raster(me)
  # plot(raster)
  #magick_image <- image_read("C:\Users\soumya.banerjee01\Documents\R\myntra")
  temp_img[i] <- image_crop(magick_image,geometry_area(63,84,330,150))
}
#####################
myurl <- train2$Link_to_the_image[1]
z <- tempfile()
download.file(myurl, z, quiet = TRUE, mode = "wb")
me <- image_read(z)
#####################