% Histog_Ex_1.m [script]

clc; clear; close all

g = im2double(imread('cameraman.tif'));

figure

subplot(1,2,1)
imshow(g)
title('Imagem original')

subplot(1,2,2)
imhist(g)
title('Histograma')
xlabel('Intensidade')
ylabel('Frequência')

g_dark = g * 0.5;
g_bright = g + 0.3;

figure
imshow(g); title('Original', 'FontSize', 16)
figure
imshow(g_dark); 
title('Reduz a intensidade média', 'FontSize', 14)
figure
imshow(g_bright); 
title('Aumenta a intensidade média', 'FontSize', 14)

figure
imhist(g)
title('Histograma (original)', 'FontSize', 16)
figure
imhist(g_dark)
title('Histograma (escurecida)', 'FontSize', 16)
figure
imhist(g_bright)
title('Histograma (clareada)', 'FontSize', 16)