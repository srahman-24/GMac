# GMac

Maintained by: Shahina Rahman

Authors of the main manuscript: Shahina Rahman, Valen E. Johnson and Suhasini Subba Rao. 

## Description 

This software provides a hyperparameter-free, fast and efficient clustering framework for High dimensional data for limited samples (N << P). 

## Table of Contents 

- **Microarray-data**

     This folder contains all the post-processed 32 microarray datasets used to compare the clustering algorithms. 
     We downloaded the raw data from https://schlieplab.org/Static/Supplements/CompCancer/datasets.htm.  
     Some datasets, including Alizadeh-v1,v2,v3, Bittner, Garber, Lapointe-v1, Liang, Risinger, Singh-v1, Tomlins-v1, and West, were already present preprocessed and centered and were therefore not log-transformed further. For others, we took the logarithmic transformation, then standardized them by centering on the median and scaling by the standard deviation. 
     
     The information of clusters for each data is stored as the last column. 
    
    
 
- **Codes**  

   This folder contains all the executable code required to run our proposed algorithm, **Gmac**.
   
    1. **main_GMac.R** : contains the main script that executes GMac over all the datasets belonging to the folder "Microarray-data". It needs to source to other R scripts  a) GMac_bic.R and b) AMI.R 
    2. **GMac_bic.R**  : It is the function that takes the input of the feature matrix, X optimize the algorithm, and returns the number of clusters, K and cluster configurations, $\delta$. 
    3. **AMI.R**       : It is the function that calculates both Normalized Mutual Index (NMI) and Adjusted Mutual Index (AMI) between two vectors. 
    4. **Mvec.R**      : It is the function that takes the input of the feature matrix, X, and returns the M matrix, where the rows of M-matrix are the m-vectors of each object. 
    5. **T-sne-umap-plot.R** : The code that generates the t-sne and Umap plot using the original features vectors, i.e, the rows of X and the transformed M-vectors, i.e the rows of M. 
    6. **Arm1.csv**    : The original feature matrix from the ``Armstrong-v1" dataset. 
   
    
 - **RJcluster-Python-implementation**

    `GMac` is implement as `RJclust()` in the R Package in [[https://cran.r-project.org/web/packages/RJcluster/index.html]]
    This python notebook shows how to use `rpy2` package to read the `RJcluster` R package in Python. 
    This will enable Python users to implement GMac on their high-dimensional dataset, aka RJclust() function via the R package.
    There is a resource https://willfondrie.com/2022/01/how-to-use-r-packages-in-python/ for a guid to use R packages in Python. 
