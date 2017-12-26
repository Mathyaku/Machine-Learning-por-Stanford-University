
clear; close all;

x = [1, 2, 3, 4];
y = [1, 2, 3, 4];

theta0 = 0;
theta1 = 0;

delta = 0.05;
yrange = theta0+theta1.*x;

fitness = (1/2*size(x,2))*sum(sqrt((theta0 + times(theta1,x) -y).^2));

figure(1);
plot(x,y,'ob');
hold on;

h =  plot(x,yrange,'r--', 'lineWidth', 1.5);
h.YDataSource = 'yrange';

xlim([0 5])
ylim([-1 5])

while(fitness > 1)
    
    newTheta0 = theta0 - delta*(1/size(x,2))*sum(theta0 + theta1.*x -y);
    newTheta1 = theta1 - delta*(1/size(x,2))*sum((theta0 + theta1.*x -y).*x);
    
    theta0 = newTheta0;
    theta1 = newTheta1;
    
    pause(1);
    figure(1);
    yrange = theta0+theta1.*x;
    refreshdata;
    

    fitness = (1/2*size(x,2))*sum(sqrt((theta0 + times(theta1,x) -y).^2));
end

disp('Erro:');
disp(fitness);
