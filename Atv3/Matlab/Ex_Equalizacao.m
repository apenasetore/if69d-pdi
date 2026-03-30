clc; clear; close all

g = im2double(imread('cameraman.tif'));

% g_low = 0.3 + 0.4*g; % comprime contraste

g_vezes = 0.4*g;
g_vezes_mais=0.3 + 0.4*g; % comprime contraste


figure
subplot(2,3,1), imshow(g), title('Original Image (img)');
subplot(2,3,2), imshow(g_vezes), title('Baixo contrast (0.4*img)');
subplot(2,3,3), imshow(g_vezes_mais), title('Baixo contrast (0.3+0.4*img)');
subplot(2,3,4), imhist(g);
subplot(2,3,5), imhist(g_vezes);
subplot(2,3,6), imhist(g_vezes_mais);


g_eq = histeq(g_vezes_mais);

figure

subplot(2,2,1), imshow(g_vezes_mais), title('Baixo contrast (0.3+0.4*img)')
subplot(2,2,2), imshow(g_eq), title('Equalizada')
subplot(2,2,3), imhist(g_vezes_mais)
subplot(2,2,4), imhist(g_eq)