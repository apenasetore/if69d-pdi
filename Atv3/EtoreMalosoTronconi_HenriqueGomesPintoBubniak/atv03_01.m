% Atividade 3 PDI
% Etore Maloso Tronconi e Henrique Gomes Pinto Bubbiniak

close all; clear; clc;

% Leitura da imagem
img = imread("vpfig.png");

% Garante que está em uint8
if ~isa(img, 'uint8')
    img = im2uint8(img);
end

% Vetor de entrada da LUT
x = 0:255;

% Teste com diferentes slopes
slopes = [0.02, 0.05, 0.1];

figure;

for i = 1:length(slopes)
    
    slope = slopes(i);
    inflec = 127;

    % Sigmoide
    y1 = 1 ./ (1 + exp(-slope * (x - inflec)));

    % Normalização para [0,255]
    y1n = mat2gray(y1);
    y1n = uint8(y1n * 255);

    % Aplicação da LUT
    B = intlut(img, y1n);

    % Plot da LUT
    subplot(length(slopes),2,2*i-1)
    plot(x, y1n)
    xlim([0 255]); ylim([0 255]);
    grid on
    title(['Sigmoide - slope = ', num2str(slope)])

    % Imagem resultante
    subplot(length(slopes),2,2*i)
    imshow(B)
    title(['Imagem com slope = ', num2str(slope)])
end