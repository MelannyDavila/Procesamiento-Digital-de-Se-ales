clc, clear all, close all
f1 = 10;
f2 = 1e3;
f3 = 50;
Fs = 10000;  
N = 2^15;
T = 1/Fs;
t = (0:N-1)*T;  
tono1 = sin(2*pi*t*f1);
tono2 = sin(2*pi*t*f2);
tono3 = sin(2*pi*t*f3);
mezcla = tono1+tono2+tono3;
tono1frec = mi_fft_split_radix(mezcla, N);
% tono2frec = mi_fft_split_radix(tono2, 32);
% tono3frec = mi_fft_split_radix(tono3, 32);
fftfunction = fft(mezcla, N);

P2 = abs(tono1frec/N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(N/2))/N;

figure 
plot(f,P1)

figure
P3 = abs(fftfunction/N);
P4 = P2(1:N/2+1);
P4(2:end-1) = 2*P4(2:end-1);

subplot(2,1,1), plot(f,P1), title('Con la funcion')
subplot(2,1,2), plot(f, P4), title('Con la fft')

