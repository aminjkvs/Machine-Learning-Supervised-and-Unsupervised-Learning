# Radial Basis Function (RBF) Clustering Implementation

## Problem Statement
The project addresses the challenge of:
- Grouping similar data points into meaningful clusters
- Handling non-linear separable data distributions
- Providing intuitive visualization of cluster boundaries
- Automatically determining cluster centers and their influence regions

## Solution Approach
We implement an RBF-based clustering algorithm that:
1. Automatically discovers cluster centers
2. Uses Gaussian similarity measures to assign points to clusters
3. Visualizes cluster boundaries with radius indicators
4. Iteratively refines cluster positions through mean-shift updates

## Algorithm Details: RBF Clustering
RBF Clustering is a kernel-based method that uses radial basis functions to measure similarity between points and cluster centers.

### Key Features:
- **Kernel Similarity**: Uses Gaussian (RBF) kernel to measure point-to-center similarity
- **Competitive Learning**: Points compete to belong to the most similar center
- **Adaptive Centers**: Cluster positions update based on member points
- **Visual Radius**: Shows the effective influence region of each cluster

### Mathematical Formulation:
1. **Initialization**: 
   - Random center selection: `C = X[random_indices]`
   
2. **Training Process**:
   - For each epoch:
     - Compute RBF kernel: `K_ij = exp(-γ||x_i - c_j||²)`
     - Assign clusters: `label_i = argmax_j K_ij`
     - Update centers: `c_j = mean(x_i where label_i == j)`
   - Where:
     - `γ` = kernel bandwidth parameter (gamma)
     - `K_ij` = similarity between point i and center j

3. **Visualization Parameters**:
   - Radius shown: `radius_factor * (1/γ)`
   - Color mapping by cluster assignment

### Implementation Highlights:
- Dynamic center adjustment visualization
- Cluster boundary indication with dashed circles
- Color-coded point assignments
- GIF generation showing the convergence process

![RBF_Clustering_with_Radii](https://github.com/user-attachments/assets/8efdc841-b437-430e-a461-316eceea4cd3)
