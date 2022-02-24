clc, close all, clear all 
%%CONSTRUCCI�N DE LA SE�AL 
%Duraci�n de la se�al  
duracion=1; 
%Primera componente de frecuencia 
f1=10; 
%Segunda componente de frecuencia 
f2=20; 
%Frecuencia de muestreo 
Fs=10*f2; 
%Per�odo de muestreo 
Ts=1/Fs; 
%Vector de tiempos 
t=0:Ts:duracion;   
%Construcci�n de la se�al 
%Se�al original sin(10)+sin(20) 
xn=sin(2*pi*f1*t)+sin(2*pi*f2*t);   
%%DOMINIO DE LA FRECUENCIA 
%N�mero de muestras de la se�al
N=length(xn); 
%C�lculo del valor que sea m�ltiplo de 2 m�s cercano y se multiplica por un 
%factor para aumentar el n�mero de muestras y tener un mejor resultado 
nFFT=2^(ceil(log2(N)))*128; 
%Aplico la funci�n  FFT de matlab 
Xn1=fft(xn,nFFT); 
% Se calcula el m�dulo de los complejos llamado PERIODOGRAMA 
Periodograma=abs(Xn1); 
%C�lculo del EJE de frecuencias: misma cantidad de puntos que PERIODOGRAMA y que est�n entre 0 y Fs: 
f=linspace(0,Fs,nFFT); 
% Con los dos ejes listos, ya solo graficamos: 
plot(f,Periodograma); 
% Por simetr�a de medio per�odo, solo nos interesa visualizar la mitad del PERIDODOGRAMA: 
axis([0 Fs/2 0 max(Periodograma)])  
xlabel('F(Hz)') 
title('PERIODOGRAMA en base a la FFT de Matlab') 