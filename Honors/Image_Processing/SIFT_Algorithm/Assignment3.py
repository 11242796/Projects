import cv2
import numpy as np
import SIFT_Algorithm
from matplotlib import pyplot as plt


def drawlines(img1,img2,lines,pts1,pts2):
    ''' img1 - image on which we draw the epilines for the points in img1
        lines - corresponding epilines ''' 
    r,c = img1.shape
    img1 = cv2.cvtColor(img1,cv2.COLOR_GRAY2BGR)
    img2 = cv2.cvtColor(img2,cv2.COLOR_GRAY2BGR)
    for r,pt1,pt2 in zip(lines,pts1,pts2):
        color = tuple(np.random.randint(0,255,3).tolist())
        x0,y0 = map(int, [0, -r[2]/r[1] ])
        x1,y1 = map(int, [c, -(r[2]+r[0]*c)/r[1] ])
        img1 = cv2.line(img1, (x0,y0), (x1,y1), color,1)
        img1 = cv2.circle(img1,tuple(pt1),5,color,-1)
        img2 = cv2.circle(img2,tuple(pt2),5,color,-1)
    return img1,img2


img1 = cv2.imread('My_Image.PNG', 0)           # queryImage
img2 = cv2.imread('Assigment1.PNG', 0)  # trainImage

# find the keypoints and descriptors with SIFT
kp1, des1 = SIFT_Algorithm.computeKeypointsAndDescriptors(img1)
kp2, des2 = SIFT_Algorithm.computeKeypointsAndDescriptors(img2)

# FLANN parameters
FLANN_INDEX_KDTREE = 0
index_params = dict(algorithm = FLANN_INDEX_KDTREE, trees = 5)
search_params = dict(checks=50)   # or pass empty dictionary

flann = cv2.FlannBasedMatcher(index_params,search_params)

matches = flann.knnMatch(des1,des2,k=2)

good = []
pts1 = []
pts2 = []

# ratio test as per Lowe's paper
for i,(m,n) in enumerate(matches):
    if m.distance < 0.7*n.distance:
        good.append(m)
        pts2.append(kp2[m.trainIdx].pt)
        pts1.append(kp1[m.queryIdx].pt)
        
pts2 = np.int32(pts2)
pts1 = np.int32(pts1)       
F, mask = cv2.findFundamentalMat(pts1,pts2,cv2.FM_RANSAC)

# We select only first 15 points
pts1 = pts1[mask.ravel()==1][:30]
pts2 = pts2[mask.ravel()==1][:30]
lines = cv2.computeCorrespondEpilines(pts2.reshape(-1,1,2), 2,F)
lines = lines.reshape(-1,3)
img3,img4 = drawlines(img1,img2,lines,pts1,pts2)
    
#plt.subplot(121),plt.imshow(img3)
#plt.subplot(122),plt.imshow(img4)
#plt.show() 

plt.figure(figsize=(10, 3))
rows = 1
columns = 2


plt.subplot(rows, columns, 1)  
plt.imshow(img3)
plt.axis('off')
plt.title("Input_Image")
plt.subplot(rows, columns, 2)  
plt.imshow(img4)
plt.axis('off')
plt.title("Assigment1_Image")
plt.title("SIFT")
plt.tight_layout()
plt.show()