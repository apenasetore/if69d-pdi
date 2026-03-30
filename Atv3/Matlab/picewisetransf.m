%picewisetransf.m [script]

clc; clear; close all;

% Imagem
g = im2double(imread('pout.tif'));

% Pontos de controle
r1 = 0.3;
r2 = 0.7;

s1 = 0.1;
s2 = 0.9;

% Inicializa saída
g_out = zeros(size(g));

% Região 1: r < r1
idx1 = g < r1;
g_out(idx1) = (s1/r1) * g(idx1);

% Região 2: r1 <= r < r2
idx2 = (g >= r1) & (g < r2);
g_out(idx2) = ((s2 - s1)/(r2 - r1)) * (g(idx2) - r1) + s1;

% Região 3: r >= r2
idx3 = g >= r2;
g_out(idx3) = ((1 - s2)/(1 - r2)) * (g(idx3) - r2) + s2;

% Plot da transformação
r = linspace(0,1,256);
s = zeros(size(r));

for i = 1:length(r)
    if r(i) < r1
        s(i) = (s1/r1)*r(i);
    elseif r(i) < r2
        s(i) = ((s2-s1)/(r2-r1))*(r(i)-r1)+s1;
    else
        s(i) = ((1-s2)/(1-r2))*(r(i)-r2)+s2;
    end
end

% Resultados
figure
imshow(g)
title('Original')

figure
plot(r,s,'LineWidth',2)
grid on, hold on
plot(r1, s1, 'ro', 'MarkerSize',8, 'LineWidth',2)
plot(r2, s2, 'ro', 'MarkerSize',8, 'LineWidth',2)
plot([r1 r1], [0 s1], '--r')
plot([0 r1], [s1 s1], '--r')

plot([r2 r2], [0 s2], '--r')
plot([0 r2], [s2 s2], '--r')

% text('%s %s', 'r1', 's1', 'VerticalAlignment';'bottom';'FontSize';12);

text(r1+0.02, s1-0.02, '$(r_1, s_1)$', ...
    'VerticalAlignment', 'bottom', ...
    'FontSize', 16, ...
    'Interpreter', 'latex');

text(r2, s2-0.05, '$(r_2, s_2)$', ...
    'VerticalAlignment', 'bottom', ...
    'FontSize', 16, ...
    'Interpreter', 'latex');

% text(r2, s2, sprintf(' (%.2f, %.2f)', r2, s2), ...
    % 'VerticalAlignment','bottom','FontSize',12)


% text(r1, s1, sprintf(' (%.2f, %.2f)', r1, s1), ...
%     'VerticalAlignment','bottom','FontSize',12)
% 
% text(r2, s2, sprintf(' (%.2f, %.2f)', r2, s2), ...
%     'VerticalAlignment','bottom','FontSize',12)

axis([0 1 0 1]), axis square
title('Transformação Piecewise')
xlabel('Entrada r')
ylabel('Saída s')

figure
imshow(g_out)
title('Resultado')