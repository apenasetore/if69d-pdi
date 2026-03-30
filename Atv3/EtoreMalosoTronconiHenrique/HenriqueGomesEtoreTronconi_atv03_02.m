% Atividade 3 PDI
% Etore Maloso Tronconi e Henrique Gomes Pinto Bubbiniak

close all; clear; clc;

% Leitura da imagem
img = imread("gDSC04422m16.png");

% Garante que está em uint8
if ~isa(img, 'uint8')
    img = im2uint8(img);
end
img_hist = zeros(256,1);
M = size(img,1);
N = size(img,2);
max = max(img);
min = min(img);
% Calcula a frequência de cada nível de cinza
for i = 1:256
    mask = img == i -1; % Ajusta para o índice correto
    img_hist(i) = sum(mask(:));
end

% Normaliza o histograma
img_hist = img_hist / sum(M*N);
cdf = cumsum(img_hist);
cdf = uint8(cdf*256);
img_eq = intlut(img,cdf);

img_eq_mat = histeq(img,256);


figure;

subplot(2,2,1);
imshow(img_eq);
title('Equalized Image Nail');

subplot(2,2,2);
imhist(img_eq);
title('Histogram Image Nail');

subplot(2,2,3);
imshow(img_eq_mat);
title('Equalized Image Matlab');

subplot(2,2,4);
imhist(img_eq_mat);
title('Histogram Image Matlab');