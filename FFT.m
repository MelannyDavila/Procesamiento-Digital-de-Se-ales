clear all;close all;clc;
tic
fmax=200;
duracion=0.01;
Fs=10*fmax;
Ts=1/Fs;
%base tiempo discreto
n=0:Ts:duracion;
% vector de amplitudes
xn= sin(2*pi*100*n)+sin(2*pi*200*n);
plot(n,xn)
title('DFT')
N=length(xn);
 
%% Periodograma (m�dulo de la FFT):
FACTOR = 1;
nFFT=2^(ceil(log2(N)))*FACTOR;
 
Xn_FFT=fft(xn,nFFT);
Periodigrama=abs(Xn_FFT);
f1=linspace(0,Fs,nFFT);
 
subplot (2,1,1) 
plot(f1,Periodigrama);
%axis([0 Fs 0 max(Periodigrama)+20])
xlabel('Frecuencia Hz')
title('Periodograma')
 
%% Espectro de amplitudes (m�dulo de la DFT):
xn_nuevo = [xn zeros(1,nFFT-length(xn))];
Xn_DFT_nuevo=dft_vectorial(xn_nuevo);
 
Espectro_amplitudes_nuevo=abs(Xn_DFT_nuevo); 
f2=linspace(0,Fs,nFFT);
 
subplot (2,1,2) 
plot(f2,Espectro_amplitudes_nuevo);
%axis([0 Fs 0 max(Espectro_amplitudes)+20])
xlabel('Frecuencia Hz')
title('Espectro de amplitudes nuevo')
 
figure
hold on
plot(f1,Periodigrama);
plot(f2,Espectro_amplitudes_nuevo);
title ('COMPARACI�N: ESPECTRO DE AMPLITUDES VS PERIODOGRAMA')
legend('PERIDOGRAMA','ESPECTRO DE AMPLITUDES')
% C�LCULO DE LA nFFT:
FACTOR = 2;
nFFT=2^(ceil(log2(N)))*FACTOR;



toc



%% Obtencion del diagrama de barras de Xn_FFT
figure
bar(abs(Xn_FFT))
title('Modulo de los valores complejos de XnFFT')
