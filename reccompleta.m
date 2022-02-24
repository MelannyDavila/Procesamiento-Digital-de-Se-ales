clc, close all, clear all;
%% Rectificador de onda completa
f = 0.5;
T = 1/f;
duracion = T; %Duracion en periodos
Fmax = 1; %Dado que la frecuencia a la que se solicita es 1 Hz, se genera 
%la señal en base a una sinusoidal de 0.5 Hz cuya frecuencia se duplica en
%el preoceso.
Fs = 100*Fmax; %Se elige la frecuencia de muestreo con un factor de 10
Ts= 1/ Fs;
n = Ts:Ts:duracion;%Se generan los periodos en los que se va a tomar muestras
% Señal muestreada en los valores del tiempo discreto 
xn = abs(sin(2*pi*f*n));%Se genera la señal rectificada
%Grafico
stem(n, xn,'k', 'linewidth',2)%Se grafica la señal
title('Señal discretizada')
xlabel('t[segundos]'), ylabel('Amplitud [V]')
%Sonido
% sound(xn, 51000)