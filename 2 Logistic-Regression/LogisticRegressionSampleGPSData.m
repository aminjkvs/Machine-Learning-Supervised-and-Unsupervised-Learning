clc;
clear all;
close all;

% Step 1: Load Data  
filename = 'F:\Github\4-Machine-Learning-Supervised-and-Unsupervised-Learning\2 Logistic-Regression\DataSetNew-GPS.xlsx';  % Replace with your Excel file name  
data2 = xlsread(filename);  % Read the data into a table   

% Step 2: Select every 4th row from the data  
data = data2(4:4:end, :);  % Selecting rows 4, 8, 12, etc.  


% Step 2: Separate features and labels  
X = data(:, 1:2);  % Features (first two columns)  
y = data(:, 3);    % Labels (third column)  

% Step 3: Prepare the data  
num_samples = size(X, 1);  
num_features = size(X, 2);  
num_classes = 4;  % Since you have 4 classes  

% Add intercept term to X  
X = [ones(num_samples, 1), X];  % Add a column of ones for the intercept term  

% Step 4: Initialize parameters  
theta = zeros(num_classes, num_features + 1);  % Parameters for each class  
learning_rate = 0.01;  % Learning rate  
num_iterations = 1000;  % Number of iterations  

% Step 5: One-vs-Rest Logistic Regression  
for iter = 1:num_iterations  
    for c = 1:num_classes  
        % Create binary labels for class c  
        binary_y = (y == c);  % True if class is c  
        
        % Calculate predictions using the sigmoid function  
        z = X * theta(c, :)';  % Compute the linear combination  
        predictions = sigmoid(z);  % Sigmoid function to get probabilities  
        
        % Compute error and gradient  
        error = predictions - binary_y;  % Compute error  
        gradient = (X' * error) / num_samples;  % Compute gradient  
        
        % Update weights  
        theta(c, :) = theta(c, :) - learning_rate * gradient';  % Update parameters  
    end  
end  

% Step 6: Make Predictions  
pred_probs = sigmoid(X * theta');  % Calculate predicted probabilities for each class  
[~, y_pred] = max(pred_probs, [], 2);  % Assign class with the highest probability  

% Step 7: Evaluate the Model  
% Create a confusion matrix  
confMat = confusionmat(y, y_pred);  % Note: use `confusionmat` function  
disp('Confusion Matrix:');  
disp(confMat);  

% Calculate accuracy  
accuracy = sum(y_pred == y) / length(y);  
fprintf('Accuracy: %.2f%%\n', accuracy * 100);  

% Step 8: Visualize Classification  
figure;  
gscatter(X(:, 2), X(:, 3), y, 'rbgy', 'osd^', 8); % Original data points, colored by true class  
hold on;  

% Create a grid for the decision boundary  
x1 = linspace(min(X(:, 2)), max(X(:, 2)), 100); % Feature 1 range  
x2 = linspace(min(X(:, 3)), max(X(:, 3)), 100); % Feature 2 range  
[x1Grid, x2Grid] = meshgrid(x1, x2);  % Create grid for visualization  
XGrid = [ones(numel(x1Grid), 1), x1Grid(:), x2Grid(:)];  % Add intercept term to grid  

% Get predictions for the grid  
predGrid = sigmoid(XGrid * theta');  % Compute predicted probabilities for grid  
[~, preds] = max(predGrid, [], 2);  % Get class with the highest probability for each grid point  

% Reshape predictions to match grid shape  
Z = reshape(preds, size(x1Grid));  

% Plot the decision boundaries  
contour(x1Grid, x2Grid, Z, 'k', 'LineWidth', 1.5); % Draw contour lines for predicted classes  

% Sigmoid function  
function g = sigmoid(z)  
    g = 1 ./ (1 + exp(-z));  % Sigmoid function  
end  
   