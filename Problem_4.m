%Projectile Motion

h = input('What is the initial height(in m)? ');
v = input('What is the initial velocity(in m/s)? ');
theta = input('What is the angle(in degrees) with repect to x? ');
ax = input('How fast is the object moving in the x-direction(in m/s^2)? ');
ay = input('How fast is the object moving in the y-direction(in m/s^2)? ');

if ay == 0
    error('If the vertical acceleration is zero, then there is no free fall!');
    ay = input('How fast is the object moving in the y-direction? ');
end

%Computing the trajectory for Non-Ideal Motion
%Initial velocities
Vx = (v*cosd(theta));
Vy = (v*sind(theta));

%Computing for time to reach max distance from Y = Yo + Voy*t +
%(1/2)*ay*t^2
a = [-(1/2)*ay, Vy, h];
b = roots(a);
t = max(b);

%Plotting the motion with respect to time t
T = linspace(0,t);

%x and y components
x = (Vx.*T) + ((1/2).*ax.*T.^2);
y = h + (Vy.*T) - ((1/2).*ay.*T.^2);

%Computing the trajectory for Ideal Motion
axi = 0;
ayi = 9.8;

%Computing for time to reach max distance from Y = Yo + Voy*t +
%(1/2)*ay*t^2
c = [-(1/2)*ayi, Vy, h];
d = roots(c);
ti = max(d);

%Plotting the motion with respect to time t
Ti = linspace(0,ti);

%x and y components
xi = (Vx.*Ti) + ((1/2).*axi.*Ti.^2);
yi = h + (Vy.*Ti) - ((1/2).*ayi.*Ti.^2);

subplot(1,2,1)
plot(x,y), grid on, xlabel 'Movement in x', ylabel 'Movement in y'
title 'Ideal Motion'
axis equal
subplot(1,2,2)
plot(xi,yi), grid on, xlabel 'Movement in x', ylabel 'Movement in y'
title 'Non-Ideal Motion'
axis equal
