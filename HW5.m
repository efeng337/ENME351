t = 0:0.01e-3:40e-3;
sumA = 0; %cos terms
sumB = 0; %sin terms
an = 0; 
for n=1:100
    A = an * cos(200*pi*n*t);
    sumA = sumA + A;
    bn = ((-0.6+0.6*((-1)^n))/(200*pi*n));
    B = bn*sin(200*pi*n*t);
    sumB = sumB + B;
end
d = 0.0035 + sumA + sumB; %Fourier Series
plot(t,d);
xlabel('time (s)');
ylabel('d(t)');