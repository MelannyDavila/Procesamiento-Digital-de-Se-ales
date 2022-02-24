clc, close all, clear all 
%%CONSTRUCCIÓN DE LA SEÑAL 
%Duración de la señal  
duracion=1; 
%Primera componente de frecuencia 
f1=10; 
%Segunda componente de frecuencia 
f2=20; 
%Frecuencia de muestreo 
Fs=10*f2; 
%Período de muestreo 
Ts=1/Fs; 
%Vector de tiempos 
t=0:Ts:duracion;   
%Construcción de la señal 
%Señal original sin(10)+sin(20) 
xn=sin(2*pi*f1*t)+sin(2*pi*f2*t);   
%%DOMINIO DE LA FRECUENCIA 
%Número de muestras de la señal
N=length(xn); 
%Cálculo del valor que sea múltiplo de 2 más cercano y se multiplica por un 
%factor para aumentar el número de muestras y tener un mejor resultado 
nFFT=2^(ceil(log2(N)))*128; 
%Aplico la función  FFT de matlab 
Xn1=fft(xn,nFFT); 
% Se calcula el módulo de los complejos llamado PERIODOGRAMA 
Periodograma=abs(Xn1); 
%Cálculo del EJE de frecuencias: misma cantidad de puntos que PERIODOGRAMA y que están entre 0 y Fs: 
f=linspace(0,Fs,nFFT); 
% Con los dos ejes listos, ya solo graficamos: 
plot(f,Periodograma); 
% Por simetría de medio período, solo nos interesa visualizar la mitad del PERIDODOGRAMA: 
axis([0 Fs/2 0 max(Periodograma)])  
xlabel('F(Hz)') 
title('PERIODOGRAMA en base a la FFT de Matlab') 