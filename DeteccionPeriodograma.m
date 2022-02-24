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
 
%% Periodograma (módulo de la FFT):
FACTOR = 1;
nFFT=2^(ceil(log2(N)))*FACTOR;
 
Xn_FFT=fft(xn,nFFT);
Periodigrama=abs(Xn_FFT);
f1=linspace(0,Fs,nFFT);
figure
subplot (2,1,1) 
plot(f1,Periodigrama);
%axis([0 Fs 0 max(Periodigrama)+20])
xlabel('Frecuencia Hz')
title('Periodograma')
 
%% Espectro de amplitudes (módulo de la DFT):
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
title ('COMPARACIÓN: ESPECTRO DE AMPLITUDES VS PERIODOGRAMA')
legend('PERIDOGRAMA','ESPECTRO DE AMPLITUDES')
% CÁLCULO DE LA nFFT:
FACTOR = 2;
nFFT=2^(ceil(log2(N)))*FACTOR;


%% Determinación de la CAPACIDAD DE DETECCIÓN DEL PERIODOGRAMA:
clc, close all, clear all
duracion = 0.5;
f1 = 100;
f2 = 200;
Fmax = 200;
Fs = 20*Fmax;
Ts = 1/Fs;
%% DOMINIO DEL TIEMPO: 
tn = Ts:Ts:duracion;
k = 0.1; % amplitud de la segunda componente
y = sin(2*pi*f1*tn) + k*sin(2*pi*f2*tn);
figure
subplot(3,1,1);
plot(tn,y);
title('SEÑAL EN EL DOMINIO DEL TIEMPO');
xlabel('tiempo [s]');
ylabel('Amplitud');
grid minor;
 
%% DOMINIO DE LA FRECUENCIA:
N = length(y);
nFFT = 2^ceil(log2(N))*64; % Cálculo de nFFT (muestras en el tiempo)
Xn = fft(y, nFFT); % Cálculo de los complejos FFT
 
% Periodograma = | FFT |
Periodograma = abs(Xn);   
%p = 10*log10(abs(Xn));
 
f = linspace(0, Fs, nFFT);
subplot(3,1,2);
plot(f, Periodograma, 'color', 'm');
grid minor
title('PERIODOGRAMA');
xlabel('Frecuencia [Hz]');
ylabel('Amplitud');
axis([0 240 0 max(Periodograma)]);

% Periodograma = | FFT |
%p = abs(Xn);
p = 10*log10(abs(Xn));
subplot(3,1,3);
plot(f,p)
grid minor
title('PERIODOGRAMA escala vertical en dB');
xlabel('Frecuencia [Hz]');
ylabel('Amplitud [dB]');
axis([0 250 0 max(p)]);
toc