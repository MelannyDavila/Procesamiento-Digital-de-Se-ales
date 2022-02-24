clc
close all
clear all
%% Rectificador de onda completa
f =0.15; %factor de muestreo
duracion =f*45; %duracion f*35 segundos
Fmax = 1; %frecuencia solicitada
Fs = 10*Fmax; %frecuencia de muestreo
Ts= 1/ Fs;%periodo
n = Ts:Ts:duracion;%dominio de las muestras
xn = abs(sin(2*pi*f*n));%señal rectificada
figure
stem(n, xn)%grafica de la senal
title('Rectificador de onda completa muestreado') %titulo
xlabel('t[segundos]')%eje x
ylabel('Amplitud [V]') %eje y
axis([0 max(duracion)+0.05 0.05 1.05]) %ejes
grid on
N = length (xn); %longitud del vector de la senal rectificada
Xk = dft_vectorial (xn);%uso de la dft vectorial
Esp= abs(Xk);%espectro de amplitud
Esp_nor = Esp/max(Esp); %espectro normalizado
f=linspace(0,Fs, length(xn));% eje x, frecuencia 
figure
stem(f,Esp_nor) %grafica espectro normalizado
title('Espectro de amplitud normalizado') %titulo
xlabel('f[Hz]') %eje x
ylabel('Amplitud [V]') %eje y
grid on
figure
stem(f,Esp_nor) %grafica espectro normalizado hasta fs/2
axis([0 Fs/2 0 max(Esp_nor)]) %limite de los ejes
title('Espectro de amplitud normalizado - desde cero hasta Fs/2') %titulo
xlabel('f[Hz]') %eje x
ylabel('Amplitud [V]') %eje y
grid on
