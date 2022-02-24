% Comparaci�n ESPECTRO DE AMPLITUDES (m�dulo de la DFT) VS PERIODOGRAMA (m�dulo de la FFT):
clear all;close all;clc;
 
fmax=200;
duracion=0.1;
Fs=10*fmax;
Ts=1/Fs;
%base tiempo discreto
n=0:Ts:duracion;
% vector de amplitudes
xn= sin(2*pi*100*n)+ sin(2*pi*200*n);
plot(n,xn)
title('DFT')

%% DOMINIO DE LA FRECUENCIA CON LA DFT:
% Espectro de amplitudes (m�dulo de la DFT):

N=length(xn); % numero de muestras de la senial discretizada
tic
Xn_DFT= dft_vectorial(xn);
toc
% Si tenemos N muestras en el tiempo, tendremos N complejos en frecuencia.
 
%C�LCULO DEL ESPECTRO DE AMPLITUDES = m�dulo (DFT)
Espectro_amplitudes=abs(Xn_DFT); 

% EJE DE FRECUENCIAS:
f1=linspace(0,Fs,N);
 
figure
subplot (2,1,1) 
plot(f1,Espectro_amplitudes);
% axis([0 Fs/2 0 max(Espectro_amplitudes)+20]) % para visualizar solo la mitad del espectro
xlabel('Frecuencia Hz')
title('Espectro de amplitudes')
 
%% DOMINIO DE LA FRECUENCIA CON LA FFT

% C�LCULO DE LA nFFT:
% Ejemplo: si N = 998 ---> (2^n)    nFFT = 1024 (2^10)
% El resto se completa con ceros (zero padding)
% Para tener mayor EXACTITUD en la ubicaci�n de los picos, se debe AUMENTAR
% la densidad de muestras, entonces a�adimos m�s ceros mediante un FACTOR: 16, 64, 128�. 1024, �
% Aqu� no importa pues la FFT es un algoritmo r�pido y el usuario casi no notar� el incremento de tiempo. 
FACTOR = 1;
nFFT=2^(ceil(log2(N)))*FACTOR;

% C�LCULO DE LA FFT:
% Por cada muestra de la se�al (y ceros a�adidos), tenemos un coeficiente complejo
% (N,000...0)---> nFFT complejos
tic
Xn_FFT = fft(xn,nFFT);
toc
% C�LCULO DEL PERIODOGRAMA =  m�dulo (fft):
Periodigrama=abs(Xn_FFT);

% EJE DE FRECUENCIAS:
f2=linspace(0,Fs,nFFT);
 
subplot (2,1,2) 
plot(f2,Periodigrama);
% axis([0 Fs/2 0 max(Periodigrama)+20]) % para visualizar solo la mitad del espectro
xlabel('Frecuencia Hz')
title('Periodograma')

