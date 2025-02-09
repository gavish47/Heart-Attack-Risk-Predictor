library(caret)
library(randomForest)

setwd("C:/Users/gavis/Desktop/test")

data <- read.csv("heart_attack_data_updated.csv")
data$target <- as.factor(data$target)  
set.seed(123)
trainIndex <- createDataPartition(data$target, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]
model <- randomForest(target ~ ., data = trainData, ntree = 100, importance = TRUE)
saveRDS(model, "heart_attack_model.rds")
predictions <- predict(model, testData)
conf_matrix <- confusionMatrix(predictions, testData$target)
print(conf_matrix)
