% TransfLinear.m [script]

clc; clear; close all;

g = im2double(imread('pout.tif'));

% s = c*r + b
c1 = 2.0;   b1 = 0.0;    % aumento de contraste
c2 = 1.0;   b2 = -0.25;  % redução de brilho
c3 = 0.3;   b3 = 0.0;    % redução de contraste

g1 = c1*g + b1;
g2 = c2*g + b2;
g3 = c3*g + b3;

% mantém no intervalo [0,1]
g1 = min(max(g1,0),1); 
g2 = min(max(g2,0),1);
g3 = min(max(g3,0),1);

% retas de transformação
r = linspace(0,1,256);
s1 = c1*r + b1;
s2 = c2*r + b2;
s3 = c3*r + b3;

% Clipping das curvas
s1 = min(max(s1,0),1);
s2 = min(max(s2,0),1);
s3 = min(max(s3,0),1);

% Curva 1
figure, imshow(g);
title('Original','FontSize',14);

figure, imhist(g);
title('Histograma Original','FontSize',14);

figure, plot(r,s1,'LineWidth',2);
grid on;
axis([0 1 0 1]);
axis square;
xlabel('Entrada r');
ylabel('Saída s');
title(sprintf('Curva 1: c = %.1f, b = %.2f', c1, b1),'FontSize',14);
figure, imshow(g1);
title('Curva 1: Aumento de contraste','FontSize',14);
figure, imhist(g1);
title('Curva 1 Histograma','FontSize',14);
close all

% Curva 2
figure, plot(r,s2,'LineWidth',2);
grid on;
axis([0 1 0 1]);
axis square;
xlabel('Entrada r');
ylabel('Saída s');
title(sprintf('c = %.1f, b = %.2f', c2, b2),'FontSize',14);
figure, imshow(g2);
title('Redução de brilho','FontSize',14);

figure, imhist(g2);
title('Histograma','FontSize',14);

close all

% Curva 3
figure, plot(r,s3,'LineWidth',2);
grid on;
axis([0 1 0 1]);
axis square;
xlabel('Entrada r');
ylabel('Saída s');
title(sprintf('c = %.1f, b = %.2f', c3, b3),'FontSize',14);

figure, imhist(g3);
title('Curva 1 Histograma','FontSize',14);

figure, imshow(g3);
title('Redução de contraste','FontSize',14);