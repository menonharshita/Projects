import pandas as pd
import numpy as np
import os
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA as pca
from sklearn import preprocessing
from factor_analyzer import FactorAnalyzer

dap = pd.read_csv("C:\\Users\\abhis\\OneDrive\\Desktop\\Semester 2\\MSIS 5223\\Project\\youdata.csv")
dap_numeric = dap.drop(columns = ["VideoId", "Title", "Uploader", "PublishedDateTime", "Duration", "Category", "Viewcount"], axis = 1)

dap_numeric.columns

pca_result = pca(n_components=4).fit(dap_numeric)

#Obtain eigenvalues
pca_result.explained_variance_

#Components from the PCA
pca_result.components_.T * np.sqrt(pca_result.explained_variance_)

#screeplot
plt.figure(figsize=(7,5))
plt.plot([1,2,3,4], pca_result.explained_variance_ratio_, '-o')
plt.ylabel('Proportion of Variance Explained') 
plt.xlabel('Principal Component') 
plt.xlim(0.75,4.25) 
plt.ylim(0,1.05) 
plt.xticks([1,2,3,4])

pca = pca().fit(dap_numeric)
plt.plot(np.cumsum(pca.explained_variance_ratio_))
plt.xlabel('number of components')
plt.ylabel('cumulative explained variance');