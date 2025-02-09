# Load necessary libraries
library(plumber)
library(jsonlite)
library(randomForest)

# Load the trained model
model <- readRDS("heart_attack_model.rds")

#* @apiTitle Heart Attack Prediction API
#* @filter cors
function(req, res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  res$setHeader("Access-Control-Allow-Methods", "POST, OPTIONS")
  res$setHeader("Access-Control-Allow-Headers", "Content-Type")
  if (req$REQUEST_METHOD == "OPTIONS") {
    res$status <- 200
    return(list(message = "CORS preflight"))
  }
  forward()
}

#* @post /predict
function(req, res) {
  tryCatch({
    input_data <- fromJSON(req$postBody)
    input_data <- as.data.frame(input_data)
    
    input_data[] <- lapply(input_data, as.numeric)
    
    prediction <- predict(model, input_data)
    
    if (is.factor(prediction)) {
      prediction <- as.numeric(as.character(prediction))
    }
    
    list(prediction = prediction)
  }, error = function(e) {
    res$status <- 400
    list(error = "Invalid input data or server error")
  })
}

