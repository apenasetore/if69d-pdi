%ExGamma_1.m [scrit]

clc; clear; close all;

% g = im2double(imread('pout.tif'));
g = im2double(imread('cameraman.tif'));

gamma_menor   = 0.4;   
gamma_identidade = 1.0;   
gamma_maior     = 2.5;


g_menor = g .^ gamma_menor;
g_id    = g .^ gamma_identidade;
g_maior = g .^ gamma_maior;

% Curvas de transformação
r = linspace(0,1,500);
s_menor = r .^ gamma_menor;
s_id    = r .^ gamma_identidade;
s_maior = r .^ gamma_maior;

figure, subplot(2,3,4)
plot(r,s_menor,'LineWidth',2, 'Color', 'b' ); hold on
plot(r,s_id,'k','LineWidth',1.5, 'Color', 'black')
plot(r,s_maior,'LineWidth',2, 'Color', [0.9290 0.6940 0.1250])
grid on
axis([0 1 0 1]); axis square
xlabel('Input (r)')
ylabel('Output (s)')

text(0.20, 0.82, '\gamma = 0.4', 'FontSize', 14, 'Color','b')
text(0.55, 0.52, '\gamma = 1',   'FontSize', 14, 'Color','black')
text(0.65, 0.28, '\gamma = 2.5', 'FontSize', 14, 'Color', [0.9290 0.6940 0.1250])

subplot(2,3,2)
imshow(g,[])
title('Original')

subplot(2,3,3)
imshow(g_menor,[])
title('\gamma=0.4 (clareia)')

subplot(2,3,5)
imshow(g_id,[])
title('\gamma=1 (identidade)')

subplot(2,3,6)
imshow(g_maior,[])
title('\gamma=2.5 (escurece)')

figure
imhist(g_menor);
title('Histograma - \gamma = 0.4', 'FontSize', 18);

figure
imhist(g_maior);
title('Histograma - \gamma = 2.5', 'FontSize', 18)

figure
imhist(g);
title('Original', 'FontSize', 18)