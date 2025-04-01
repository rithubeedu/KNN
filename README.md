# 🧠 Predicting Personal Loan Acceptance using k-NN
A predictive analytics project for Universal Bank to classify potential personal loan customers using the k-Nearest Neighbors (k-NN) algorithm.

## 📘 Project Overview

Universal Bank wants to increase the number of personal loan customers. The bank has demographic and financial data on existing customers. This project uses the **k-NN algorithm** to:
- Predict which customers are likely to accept a personal loan.
- Determine the optimal value of **k** for classification.
- Classify a new potential customer using the best k.

---

## 🔍 Dataset

**File:** `UniversalBank.csv`

Each row represents a customer with attributes such as:
- Demographics (Age, Experience, Family Size, Education)
- Financial indicators (Income, Mortgage, CCAvg)
- Banking relationships (Credit Card, Online usage, CD Account, Securities Account)
- Target variable: `Personal.Loan` (1 = accepted loan, 0 = did not accept)

---

## ⚙️ Methodology

### 1. **Data Preparation**
- ID and ZIP code are excluded.
- Categorical features are converted into factors.
- Data is split 70% for training, 30% for testing.

### 2. **Modeling**
- k-NN classification is performed for `k = 1, 3, 5, 7, 9`.
- Confusion matrices are generated to evaluate model performance.
- The best `k` is selected based on accuracy.

### 3. **Customer Classification**
A new customer with the following profile is evaluated:
- Age: 40
- Experience: 10 years
- Income: \$84K
- Family: 2
- CCAvg: 2
- Education: 2
- No mortgage, uses Online Banking and has a Credit Card

Prediction is made using each k value to observe consistency.

---

## 📊 Results

| k | Accuracy |
|---|----------|
| 1 | 85.1%    |
| 3 | 85.9%    |
| 5 | 86.4%    |
| 7 | 86.6%    |
| 9 | ✅ **86.9%** |

**Best K = 9** (highest accuracy)

The customer profile was **predicted NOT to accept** the loan across all k values.

---

## 📁 File Structure

- `loan_knn_classification.R` — Main R script for analysis and modeling
- `UniversalBank.csv` — Dataset (not provided here due to privacy)
- `README.md` — Documentation

---

## 📌 Requirements

Install the following R packages:
```r
install.packages(c("gmodels", "caret", "class", "dplyr"))
