clear
close all
clc

fig = figure('Visible','on');

set(fig,'defaultAxesXColor','k');
set(fig,'defaultAxesYColor','k');
fsize = 24;

% データ
x = linspace(-3,3,1000);
nCurve = 8;

a = linspace(-3,3,nCurve);

% カラーマップ
colors = plasma(nCurve);

hold on

h = gobjects(nCurve,1);
labels = cell(nCurve,1);

for i = 1:nCurve
    y = x.^3 - a(i)*x;

    h(i) = plot(x,y,...
        'Color',colors(i,:),...
        'LineWidth',2);

    labels{i} = sprintf('$a = %.1f$',a(i));
end

hold off

% 凡例
legend(h,labels,...
    'Interpreter','latex',...
    'Location','northwest',...
    'FontSize',fsize)

% 軸
xlabel('$x$','Interpreter','latex','FontSize',fsize)
ylabel('$y$','Interpreter','latex','FontSize',fsize)

set(gca,...
    'TickLabelInterpreter','latex',...
    'FontSize',fsize)

tickValuesx=get(gca, 'XTick');
tickValuesy=get(gca, 'YTick');
tickLabelsx=cellstr(num2str(tickValuesx', '$%g$'));
tickLabelsy=cellstr(num2str(tickValuesy', '$%g$'));
set(gca, 'xticklabels', tickLabelsx);
set(gca, 'yticklabels', tickLabelsy);

grid on
box on

exportgraphics(fig, 'graph.pdf', 'ContentType', 'vector');