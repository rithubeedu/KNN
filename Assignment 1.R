# Set working directory
getwd()
# Load necessary libraries
library(gmodels)
library(caret)
library(class)
library(dplyr)

# Load the dataset
ub.df <- read.csv("C:/Users/Hello/Downloads/UniversalBank.csv")

# Display summary statistics of the dataset
summary(ub.df)

# Set seed for reproducibility
set.seed(1947)

# Create training and testing indices using 70% of the data for training
idx <- sample(nrow(ub.df), 0.7 * nrow(ub.df))
idx <- createDataPartition(y = ub.df$Personal.Loan, p = 0.7, list = FALSE)

# Print the length of the indices to confirm
length(idx)

# Convert categorical variables to factors
ub.df$ID <- factor(ub.df$ID)
ub.df$ZIP.Code <- factor(ub.df$ZIP.Code)

# Create training and testing datasets
train.df <- ub.df[idx, c("Age", "Experience", "Income", "Family", "CCAvg", "Education",
                         "Mortgage", "Securities.Account", "CD.Account", "Online", "CreditCard")]
test.df <- ub.df[-idx, c("Age", "Experience", "Income", "Family", "CCAvg", "Education",
                         "Mortgage", "Securities.Account", "CD.Account", "Online", "CreditCard")]

# Define training and testing labels
train_labels <- ub.df$Personal.Loan[idx]
test_labels <- ub.df$Personal.Loan[-idx]

# Define factors for categorical variables
Family <- factor(c("1", "2", "3", "4"))
Education <- factor(c("1", "2", "3"))
Personal.Loan <- factor(c("0", "1"))
Securities.Account <- factor(c("0", "1"))
CD.Account <- factor(c("0", "1"))
Online <- factor(c("0", "1"))
CreditCard <- factor(c("0", "1"))

# Perform k-NN classification with k = 1
ub_test_pred <- knn(train = train.df, test = test.df, cl = train_labels, k = 1)

# Display confusion matrix
CrossTable(x = test_labels, y = ub_test_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r =
             FALSE, dnn = c('actual', 'predicted'))

# Perform k-NN classification with k = 3
ub_test_pred <- knn(train = train.df, test = test.df, cl = train_labels, k = 3)

# Display confusion matrix
CrossTable(x = test_labels, y = ub_test_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r =
             FALSE, dnn = c('actual', 'predicted'))

# Perform k-NN classification with k = 5
ub_test_pred <- knn(train = train.df, test = test.df, cl = train_labels, k = 5)

# Display confusion matrix
CrossTable(x = test_labels, y = ub_test_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r =
             FALSE, dnn = c('actual', 'predicted'))

# Perform k-NN classification with k = 7
ub_test_pred <- knn(train = train.df, test = test.df, cl = train_labels, k = 7)

# Display confusion matrix
CrossTable(x = test_labels, y = ub_test_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r =
             FALSE, dnn = c('actual', 'predicted'))

# Perform k-NN classification with k = 9
ub_test_pred <- knn(train = train.df, test = test.df, cl = train_labels, k = 9)

# Display confusion matrix
CrossTable(x = test_labels, y = ub_test_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r =
             FALSE, dnn = c('actual', 'predicted'))

# Create a new customer profile for classification
new.df <- data.frame(
  Age = 40, Experience = 10, Income = 84, Family = 2, CCAvg = 2, Education = 2, Mortgage =
    0, Securities.Account = 0,
  CD.Account = 0, Online = 1, CreditCard = 1
)

# Classify the new customer profile using k-NN with k = 1
ub_test_pred <- knn(train = train.df, test = new.df, cl = train_labels, k = 1)

# Classify the new customer profile using k-NN with k = 3
ub_test_pred <- knn(train = train.df, test = new.df, cl = train_labels, k = 3)

# Classify the new customer profile using k-NN with k = 5
ub_test_pred <- knn(train = train.df, test = new.df, cl = train_labels, k = 5)

# Classify the new customer profile using k-NN with k = 7
ub_test_pred <- knn(train = train.df, test = new.df, cl = train_labels, k = 7)

# Classify the new customer profile using k-NN with k = 9
ub_test_pred <- knn(train = train.df, test = new.df, cl = train_labels, k = 9)