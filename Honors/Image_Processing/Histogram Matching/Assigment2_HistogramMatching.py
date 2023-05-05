import sys
from skimage import data
from skimage import exposure
from skimage.exposure import match_histograms
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import PIL
from PIL import Image
import numpy as np
import argparse

image = mpimg.imread(r'C:\My_Image.jpg')
template = mpimg.imread(r'C:\Templete.jpg')

matching =  exposure.match_histograms(image, template, multichannel=np.multiply)

plt.figure(figsize=(10, 3))

rows = 1
columns = 3

plt.subplot(rows, columns, 1)  
plt.imshow(image)
plt.axis('off')
plt.title("My_Image")
plt.subplot(rows, columns, 2)  
plt.imshow(template)
plt.axis('off')
plt.title("Template_Image")
plt.subplot(rows, columns, 3)  
plt.imshow(matching)
plt.axis('off')
plt.title("Matched_Results_Image")
plt.tight_layout()
plt.show()







