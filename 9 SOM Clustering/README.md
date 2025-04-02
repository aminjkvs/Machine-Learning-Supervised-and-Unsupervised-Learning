# Self-Organizing Map (SOM) Implementation

## Problem Statement
The project addresses the challenge of visualizing and clustering high-dimensional data (like GPS coordinates) in a lower-dimensional space (typically 2D). Traditional clustering methods struggle with:
- Preserving topological relationships between data points
- Visualizing high-dimensional structures
- Identifying natural groupings in complex datasets

## Solution Approach
We implement a Self-Organizing Map (SOM) that:
1. Projects high-dimensional data onto a 2D grid
2. Preserves topological properties of the input space
3. Learns through unsupervised competitive learning
4. Provides intuitive visualization of data structure

## Algorithm Details: Self-Organizing Map
SOM is a type of artificial neural network that uses unsupervised learning to produce a low-dimensional representation of the input space.

### Key Features:
- **Competitive Learning**: Neurons compete to respond to input patterns
- **Topology Preservation**: Similar inputs activate nearby neurons on the map
- **Neighborhood Function**: Updates affect not just the winning neuron but its neighbors

### Mathematical Formulation:
1. **Initialization**: 
   - Random weight initialization: `W_ij ∈ [0,1]`
   
2. **Training Process**:
   - For each input vector `x`:
     - Find Best Matching Unit (BMU): `argmin_j ||x - w_j||`
     - Update weights: 
       `w_j(t+1) = w_j(t) + η(t) * h_j,i(t) * (x - w_j(t))`
     - Where:
       - `η(t)` = learning rate (decreases over time)
       - `h_j,i(t)` = neighborhood function (Gaussian kernel)

3. **Neighborhood Function**:
   `h_j,i(t) = exp(-||r_j - r_i||² / (2σ(t)²))`
   Where σ(t) decreases monotonically with time

### Implementation Highlights:
- Grid visualization with connecting lines showing topological relationships
- Dynamic learning rate and neighborhood radius decay
- Min-Max normalization for stable training
- GIF generation showing the learning process

  
![SOM_with_Grid_Overlay](https://github.com/user-attachments/assets/408cae67-053b-46b2-8e2e-80c55feaf14a)
