%EqHistCDF.m

clc; clear; close all

g = im2double(imread('pout.tif'));

% Histograma
[h, x] = imhist(g, 256);
p = h / numel(g); % normaliza

% CDF
cdf = cumsum(p);

figure

subplot(1,2,1)
bar(x, p)
title('Normalised Histogram ou PDF')
xlabel('r'), ylabel('Probility Density Function')

subplot(1,2,2)
plot(x, cdf, 'LineWidth', 2)
title('Cummulative Density Function')
xlabel('r'), ylabel('T(r)')

% subplot(1,3,3)
% plot(x, cdf, 'LineWidth', 2)
% title('Função T(r)')
% xlabel('r'), ylabel('s')