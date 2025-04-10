# Railway Track Fault Detection using Image Processing

## 🔍 Objective

To develop an automated system that detects minor cracks on railway tracks using image processing techniques in MATLAB, thereby reducing the dependency on manual inspection and preventing derailments and accidents.

## 💡 Motivation

Railways are a major mode of transport in India, but track faults remain a leading cause of accidents. Manual inspection methods are labor-intensive and often unreliable. This project proposes an efficient, automated solution to address this issue.

## 📚 Background

This project leverages **MATLAB** and various image processing techniques such as filtering, morphological operations, and binarization to detect cracks and estimate their length from images of railway tracks.

## 🛠️ Technical Stack

- **Software**: MATLAB  
- **Techniques**: Image Processing (Contrast stretching, Filtering, Skeletonization)  
- **Hardware (optional)**: High-res camera or drone for image capture

## 📌 Features

- Automatic detection of cracks in railway track images  
- Measurement of crack length  
- Use of filters and morphological operations for accurate image processing  
- Cost-effective simulation using publicly available track images

## 🧪 Design Workflow

1. Read and display the image  
2. Contrast stretching  
3. RGB to Grayscale conversion  
4. Apply Median Filter  
5. Apply Bottom Hat Filter  
6. Convert to Binary Image  
7. Remove Noise  
8. Skeletonization  
9. Crack Detection and Measurement

## 👥 Authors

- [Urvashi Dube](https://github.com/UrvashiDube02)
- [D. Aakash](https://github.com/Aakashdharmalingam)

> Images processed through MATLAB are saved and displayed at each stage.


## 🧬 Code Sample

```matlab
I = imread('Railway_track_photo.jpg');
Istrech = imadjust(I, stretchlim(I));
Igray_s = rgb2gray(Istrech);
K = medfilt2(Igray_s);
se = strel('disk',4);
bothatimg = imbothat(K,se);
BW = imbinarize(bothatimg,0.07);
BW2 = bwareaopen(BW,1000);
BW4 = bwmorph(BW2,'skel',Inf);
measurements = regionprops(BW4,'Area');
Total_Length = sum([measurements.Area]);



