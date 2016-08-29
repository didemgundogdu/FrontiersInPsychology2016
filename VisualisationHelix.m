a = 0.5;
c = 5.0;
t = 0:0.01:10*pi;

x = (a*t/2*pi*c).*sin(t);
y = (a*t/2*pi*c).*cos(t);
z = t/(2*pi*c);

figure(3);
plot3(x, y, z);
xlabel('x'); ylabel('y'); title('Conical helix');
