import sys
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import PIL
from PIL import Image



image = mpimg.imread(r'C:\Input_Image.JPG')


R, G, B = image[:,:,0], image[:,:,1], image[:,:,2]
imageGray = 0.2989 * R + 0.5870 * G + 0.1140 * B

H, S, V = image[:,:,0], image[:,:,1], image[:,:,2]
imageHSV = 0.2989 * H + 0.5870 * S + 0.1140 * V

rows = 1
columns = 2


plt.subplot(rows, columns, 1)  
plt.imshow(imageGray, cmap='gray')
plt.axis('off')
plt.title("Grayscale")
plt.subplot(rows, columns, 2)  
plt.imshow(imageHSV, cmap='hsv')
plt.axis('off')
plt.title("HSV")
plt.show()
