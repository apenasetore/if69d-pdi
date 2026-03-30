% GammaGraficos.m [script]

clc; clear; close all;

r = linspace(0,1,500);

g04 = r.^0.4;
g05 = r.^0.1;
g1  = r.^1;
g25 = r.^2.5;
g10 = r.^10;

figure, hold on

% fundo amarelo (acima da diagonal)
fill([0 0 1], [0 1 1], 'c', 'FaceAlpha', 0.2,'EdgeColor', 'none');

% fundo amarelo (abaixo da diagonal)
fill([0 1 1], [0 1 0], 'y','FaceAlpha', 0.2,'EdgeColor', 'none');

plot(r,g04,'k','LineWidth',1.5, 'Color','r')
plot(r,g05,'k','LineWidth',1.5, 'Color','b')
plot(r,g1 ,'k','LineWidth',1.5, 'Color','black')
plot(r,g25,'k','LineWidth',1.5, 'Color','g')
plot(r,g10,'k','LineWidth',1.5, 'Color','c')

axis square, box on, grid on
set(gca,'XTick',[0 0.25 0.5 0.75 1],'YTick',[0 0.25 0.5 0.75 1],'FontSize',15)
xlabel('Input gray level (r)'), ylabel('Output gray level (s)')

% textos próximos às curvas
text(0.20, 0.82, '\gamma = 0.4', 'FontSize', 14, 'Color','r')
text(0.35, 0.62, '\gamma = 0.1', 'FontSize', 14, 'Color','b')
text(0.55, 0.52, '\gamma = 1',   'FontSize', 14, 'Color','black')
text(0.65, 0.28, '\gamma = 2.5', 'FontSize', 14, 'Color','g')
text(0.85, 0.10, '\gamma = 10',  'FontSize', 14, 'Color','c')
text(0.35, 0.4, '\gamma=1 identidade', 'Rotation', 43, 'FontSize', 20, 'Color','black')
text(0.15, 0.72, '\gamma<1 clareia', 'FontSize', 20, 'Color','black')
text(0.5, 0.15, '\gamma>1 escurece', 'FontSize', 20, 'Color','black')
