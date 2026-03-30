%SigmoideContrasteRealce.m [script]
clc, clear, close all
g = im2double(imread('pout.tif'));
% g = im2double(imread('Chest_X_Ray_Female_Wiki.jpeg'));
% g = im2double(imread('Chest_R_Ray_2.jpeg'));
k = 10;       % ganho
x0 = 0.5;     % centro da sigmoide
v=0:0.01:1;
v_sig = 1 ./ (1 + exp(-k*(v - x0)));
figure, plot(v, v_sig); grid on;
axis square, xlabel('input'); ylabel('output');
g_sig = 1 ./ (1 + exp(-k*(g - x0)));
figure, imshow(g), title('Original');
figure, imshow(g_sig), title('Sigmoide');
test=sprintf('%s %d   %s %3.2f (centro sigmoide) \n%s', 'k=', k, ...
    'x_0=', x0, 'sig=1./(1+exp(-k*(g-x_0)))');
text(10,270, test, 'Color', 'w', 'FontSize', 20);
% text(50,550, test, 'Color', 'b', 'FontSize', 20); %X-ray Image