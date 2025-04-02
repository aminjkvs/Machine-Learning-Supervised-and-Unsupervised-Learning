# Ridge Regression Implementation  

## Problem Description  
Ridge regression addresses the problem of multicollinearity and overfitting in linear regression by:  
1. Adding L2 regularization to prevent excessively large weights  
2. Improving model generalization while maintaining all features (unlike Lasso)  

## Solution Approach  
This implementation demonstrates:  
- Gradient descent with L2 penalty  
- Mean Squared Error (MSE) with regularization  
- Dynamic visualization of:  
  - Regression line fitting  
  - Weight shrinkage process  
- Automated GIF generation of training  

## Key Algorithm Components  
```python  
# Gradient calculation with L2 penalty  
dw = (1/n_samples) * np.dot(X.T, error) + (l2_lambda * weights)  

# Composite loss function  
loss = MSE + l2_lambda * sum(weights²)

![Ridge_Regression](https://github.com/user-attachments/assets/f1de9d1b-efa6-4d24-a717-e05e7c2ddf42)
