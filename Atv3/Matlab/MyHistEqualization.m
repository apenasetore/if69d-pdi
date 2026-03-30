%MyHistEqualization.m

clc; clear; close all;

% Leitura da imagem
g = imread('pout.tif');

% Garantir imagem em tons de cinza
if size(g,3) == 3
    g = rgb2gray(g);
end

% Converter para uint8 se necessário
if ~isa(g,'uint8')
    g = im2uint8(g);
end

% Número de níveis de cinza
L = 256;

% Tamanho da imagem
[M, N] = size(g);

%% 1) Histograma
h = zeros(L,1);

for i = 1:M
    for j = 1:N
        nivel = double(g(i,j)) + 1;   % MATLAB começa em 1
        h(nivel) = h(nivel) + 1;
    end
end

%% 2) PDF
p = h / (M*N);

%% 3) CDF
cdf = zeros(L,1);
cdf(1) = p(1);

for k = 2:L
    cdf(k) = cdf(k-1) + p(k);
end

%% 4) Função de transformação
% mapeamento para [0, L-1]
T = uint8(round((L-1) * cdf));

%% 5) Aplicação da transformação
g_eq = zeros(M,N,'uint8');

for i = 1:M
    for j = 1:N
        nivel = double(g(i,j)) + 1;
        g_eq(i,j) = T(nivel);
    end
end

%% 6) Mostrar resultados
figure('Color','w','Position',[100 100 1200 700])

subplot(2,2,1)
imshow(g)
title('Imagem original')

subplot(2,2,2)
imhist(g)
title('Histograma original')

subplot(2,2,3)
imshow(g_eq)
title('Imagem equalizada (manual)')

subplot(2,2,4)
imhist(g_eq)
title('Histograma equalizado')

%% 7) Mostrar PDF, CDF e T(r)
figure('Color','w','Position',[150 150 1200 400])

subplot(1,3,1)
bar(0:L-1, p)
title('PDF')
xlabel('r_k')
ylabel('p(r_k)')
xlim([0 L-1])

subplot(1,3,2)
plot(0:L-1, cdf, 'LineWidth', 2)
title('CDF')
xlabel('r_k')
ylabel('CDF(r_k)')
xlim([0 L-1])
ylim([0 1])

subplot(1,3,3)
plot(0:L-1, double(T), 'LineWidth', 2)
title('Função T(r)')
xlabel('r_k')
ylabel('s_k')
xlim([0 L-1])
ylim([0 L-1])


figure 
plot(0:L-1, double(T), 'LineWidth', 2);
grid on, axis square;
title('Função T(r)', FontSize=18)
xlabel('nível de intensidade r (entrada)', FontSize=18)
ylabel('nível de intensidade s (saída)', FontSize=18)
xlim([0 L-1])
ylim([0 L-1])

hold on

% seta vertical
quiver(125, 0, 0, 170, 0, 'r', 'LineWidth', 2)

% seta horizontal
quiver(125, 170, -125, 0, 0, 'r', 'LineWidth', 2)
