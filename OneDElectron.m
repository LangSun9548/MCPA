set(0,'DefaultFigureWindowStyle','docked');
set(0,'Defaultaxesfontsize',12);
set(0,'Defaultlinelinewidth',2);

clear all;
close all;

x = 0;
v = 0;
F = 1;
m = 1;

dt = 1;
nt = 1000;
n = 1;
v = zeros(n,1);
x = zeros(n,1);
t = 0;
ve = -0.25;

for i = 2:nt

    t(i) = t(i-1) + dt;
    v(:,i) = v(:,i-1) + F/m*dt;
    x(:,i) = x(:,i-1) + v(:,i-1)*dt + F/m*dt^2/2;
    r = rand(n,1) < 0.05;
    v(r,i) = ve*v(r,i);
    AvgV(i,:) = mean(v,2);

    subplot(3,1,1)
    plot(t,v)
    hold on
    subplot(3,1,1)
    plot(t,AvgV,'*')
    hold off

    xlabel('time')
    ylabel('v')
    title(['Average V:' num2str(AvgV(i))])
    subplot(3,1,2)
    plot(x(1,:),v(1,:))
    hold on

    xlabel('x')
    ylabel('y')
    subplot(3,1,2)
    plot(x(1,:),AvgV,'*')
    hold off

    xlabel('time')
    ylabel('x')
    subplot(3,1,3)
    plot(t,x)

    pause(0.01)
end

disp('Average V')
mean(v)

