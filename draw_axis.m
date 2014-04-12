function draw_axis

global xMin;
global xMax;
global yMin;
global yMax;

%clear plot;

set(gca,'XTick',xMin:2:xMax);
set(gca,'YTick',yMin:2:yMax);
plot([xMin xMax],[0 0],'k-','LineWidth',3);%draw x axis
grid on;
hold on;
plot([0 0],[yMin yMax],'k-','LineWidth',3);
hold on;

xlim([xMin xMax]);
ylim([yMin yMax]);

axis normal;
axis equal;
axis image;



end