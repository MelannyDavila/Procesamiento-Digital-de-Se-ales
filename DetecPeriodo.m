% Determinación de la CAPACIDAD DE DETECCIÓN DEL PERIODOGRAMA:
clc, close all, clear all
duracion = 0.25;
f1 = 100;
f2 = 1000;
Fmax = 200;
Fs = 20*Fmax;
Ts = 1/Fs;
%% DOMINIO DEL TIEMPO: 
tn = Ts:Ts:duracion;
k = 0.5; % amplitud de la segunda componente
y = sin(2*pi*f1*tn) + k*sin(2*pi*f2*tn);
subplot(2,1,1);
plot(tn,y);
title('SEÑAL EN EL DOMINIO DEL TIEMPO');
xlabel('tiempo [s]');
ylabel('Amplitud');
grid minor;
a=max(y)
axis([0 max(tn) -max(y)-0.2 max(y)+0.2]);
%% DOMINIO DE LA FRECUENCIA:
N = length(y);
nFFT = 2^ceil(log2(N))*64; % Cálculo de nFFT (muestras en el tiempo)
Xn = fft(y, nFFT); % Cálculo de los complejos FFT
 
% Periodograma = | FFT |
Periodograma = abs(Xn);   
%p = 10*log10(abs(Xn));
 
f = linspace(0, Fs, nFFT);
subplot(2,1,2);
plot(f, Periodograma, 'color', 'm');
grid minor
title('PERIODOGRAMA');
xlabel('Frecuencia [Hz]');
ylabel('Amplitud');
axis([0 max(f)/3 0 max(Periodograma)]);
