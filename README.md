

```md
# 🏥 Heart Attack Risk Predictor  

Heart Attack Risk Predictor is a web-based application that uses **Machine Learning (Random Forest)** to predict the risk level of a heart attack based on user inputs.  

⚠️ **Disclaimer:** This project is **only for educational purposes**. It is **not** a medically approved diagnostic tool. Always consult a healthcare professional for medical advice.  

---

## 📥 Installation  

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/yourusername/heart-attack-risk-predictor.git
cd heart-attack-risk-predictor
```

### **2️⃣ Install R Dependencies**  
Inside **RStudio**, install the required packages:  
```r
install.packages("plumber")
install.packages("randomForest")
install.packages("caret")
```

---

## 🚀 Usage  

### **Run the Backend API (R Server)**  
1. Train the model:
   ```r
   source("model_training.r")
   ```
2. Start the API:
   ```r
   library(plumber)
   pr <- plumb("api.r")
   pr$run(port=8000, host="0.0.0.0")
   ```
3. API is now running at **`http://localhost:8000/predict`**.

---

### **Run the Frontend**
1. Open **`index.html`** in a web browser.
2. Fill in the input fields and click submit to get a prediction.

---





## 📷 ScreenShoots





https://github.com/user-attachments/assets/a7bde1b1-6a1e-4eb2-b3f8-9842c2ad2fcd













## 🤝 Contributing  

Pull requests are welcome. For major changes, please open an issue first  
to discuss what you would like to change.  

Please make sure to update tests as appropriate.  

---

## 🤖 Authors

- [@Gavish](https://github.com/gavish47)
- [@Akshit tripathi](https://github.com/AKSHIT-TRIPATHI)

