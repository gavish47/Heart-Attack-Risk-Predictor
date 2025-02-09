# Load necessary libraries
library(plumber)
library(jsonlite)
library(randomForest)

# Load the trained model
model <- readRDS("heart_attack_model.rds")

#* @apiTitle Heart Attack Prediction API
# Enable CORS to allow cross-origin requests
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

# Define the API endpoint for predictions
#* @post /predict
function(req, res) {
  tryCatch({
    # Parse input data
    input_data <- fromJSON(req$postBody)
    input_data <- as.data.frame(input_data)
    
    # Ensure the input format matches model expectations
    input_data[] <- lapply(input_data, as.numeric)
    
    # Make a prediction
    prediction <- predict(model, input_data)
    
    # Convert factor to numeric if necessary
    if (is.factor(prediction)) {
      prediction <- as.numeric(as.character(prediction))
    }
    
    # Return the prediction result
    list(prediction = prediction)
  }, error = function(e) {
    res$status <- 400
    list(error = "Invalid input data or server error")
  })
}

