clear
close all
clc

fig = figure('Visible','on');

% 全体設定
set(fig,'defaultAxesXColor','k');
set(fig,'defaultAxesYColor','k');
set(fig,'defaultLegendTextColor','k');
fsize = 28;

% カラーマップの作成（青・白・赤）
map = [0 0 1
    1 1 1
    1 0 0];
mymap = interp1(1:3, map, linspace(1,3,1000),'linear');

x = -3:0.1:3;
y = -3:0.1:3;
[X, Y] = meshgrid(x,y);
Z = peaks(X,Y);
contourf(X,Y,Z,100, 'LineStyle', 'none')
% clim([0 6])
clim([-6 6])
% colormap(plasma)
colormap(mymap)

% 軸目盛の設定
set(gca,'TickLabelInterpreter', 'latex', 'FontSize', fsize);
xlim([-3 3]);
xticks(-3:1:3);
ylim([-3 3]);
yticks(-3:1:3);
tickValuesx=get(gca, 'XTick');
tickValuesy=get(gca, 'YTick');
tickLabelsx=cellstr(num2str(tickValuesx', '$%g$'));
tickLabelsy=cellstr(num2str(tickValuesy', '$%g$'));
set(gca, 'xticklabels', tickLabelsx);
set(gca, 'yticklabels', tickLabelsy);

% カラーバーの設定
clb=colorbar('FontSize', fsize);
set(clb, 'TickLabelInterpreter', 'latex');
% clb.Ticks=[0 2 4 6];
clb.Ticks=[-6 -3 0 3 6];
tickValues=get(clb, 'Ticks');
tickLabels=cellstr(num2str(tickValues', '$%g$'));
set(clb, 'TickLabels', tickLabels);
clb.Label.Interpreter='latex';
clb.Label.Rotation=0;
clb.Label.FontSize=fsize;
clb.Label.String='$z$';

% 軸ラベルの設定
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', fsize);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', fsize);

% グリッドの表示
grid on;
axis equal;

% 座標軸ツールバーの表示
tb = axtoolbar('Visible', 'off');

exportgraphics(fig, 'colormap2.eps', 'ContentType', 'vector');
exportgraphics(fig, 'colormap2.png');
