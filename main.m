I = imread('cracked.png'); 

figure(1)
imshow(I) 
title('Original Image')

Istrech = imadjust(I, stretchlim(I)); 
figure(2)
imshow(Istrech) 
title('Contrast Stretched Image')

Igray_s = rgb2gray(Istrech);
figure(3)
imshow(Igray_s, []) 
title('RGB to Gray (Contrast Stretched)')

K = medfilt2(Igray_s); 
figure(4)
imshow(K)
title('Applying Median Filter')

se = strel('disk', 4); 
bothatimg = imbothat(K, se); 
figure(5)
imshow(bothatimg)
title('Bottom Hat Output Image')

BW = imbinarize(bothatimg, 0.07); 
figure(6)
imshow(BW)
title('Binary Image')

BW2 = bwareaopen(BW, 1000); 
figure(7)
imshow(BW2)
title('Noise Reduction')

BW4 = bwmorph(BW2, 'skel', Inf); 
figure(8)
imshow(BW4)
title('Thinned Image (Skeleton)')

measurements = regionprops(BW4, 'Area'); 
allCrackLengths = [measurements.Area];
Total_Length = sum(allCrackLengths);

disp(['Total Crack Length: ', num2str(Total_Length), ' pixels'])

h = imdistline; 
impixelinfo; 
imtool(BW4); 

epochs = 1:10; % Replace with actual iteration numbers if available
accuracy = [50 55 60 68 72 78 81 85 87 90]; % Example accuracy values

figure(9);
plot(epochs, accuracy, '-o', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('Epochs');
ylabel('Accuracy (%)');
title('Accuracy over Iterations');
grid on;