import numpy as np
import cv2
import matplotlib.pyplot as plt

image_path = "ch2_ohr_ncp_20210405T1606536730_d_img_d18/browse/calibrated/20210405/ch2_ohr_ncp_20210405T1606536730_b_brw_d18.png"
image = cv2.imread(image_path,0)

#added something else

kernal = np.ones((3,3),np.float32)/9

flit2d = cv2.filter2D(image,-1,kernal)

if flit2d is None:
    print("the image could not be loaded")
else:
    cv2.imshow("grbeyscale",flit2d)
    cv2.waitKey(0)
    cv2.destroyAllWindow()


