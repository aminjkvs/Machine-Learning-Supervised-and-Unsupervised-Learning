# Logistic Regression Implementation  

## Problem Description  
Logistic regression solves binary classification problems by:  
1. Modeling the probability of class membership  
2. Finding an optimal decision boundary  
3. Handling non-linear relationships through the sigmoid function  

## Solution Approach  
This implementation demonstrates:  
- Gradient descent optimization  
- Binary cross-entropy (log loss) minimization  
- Dynamic visualization of:  
  - Decision boundary evolution  
  - Training loss reduction  
- Automated GIF generation of the training process  

## Key Algorithm Components  
```python  
# Sigmoid activation function  
def sigmoid(self, z):  
    return 1 / (1 + np.exp(-z))  

# Gradient calculation  
dw = (1/n_samples) * np.dot(X.T, (y_pred - y))  
db = (1/n_samples) * np.sum(y_pred - y)  

# Log loss calculation  
loss = -np.mean(y * np.log(y_pred) + (1-y) * np.log(1-y_pred))  

![LogisticRegression-withoutLibrary+GIF](https://github.com/user-attachments/assets/b12866ac-6fac-415a-a9a4-babe3abfb2d0)
