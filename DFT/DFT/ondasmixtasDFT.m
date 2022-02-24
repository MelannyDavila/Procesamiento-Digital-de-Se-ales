clc
close all
clear all 
f = 1e3;
duracion =f*2; %Se coloca una duracion de 1 segundo 
Fmax = 1; %frecuencia de trabajo
Fs = 10*Fmax; % frecuencia de muestreo
Ts= 1/ Fs;
T=1/f;
duracion=2*T; %Duracion en periodos
Ts=T/25; % tiempo entre muestras 
tn=0:Ts:duracion;  %vector de tiempo inicio:paso:fin 
y1=sin(2*pi*f*tn); %funcion sinusoidal
y_final = y1; 
y2_2f=0.5*sawtooth(2*pi*2*f*tn,0.5)+0.5; %funcion triangular
for n=1:length(tn) 
    if y1(n)<=0 
        y_final(n)=y2_2f(n); 
    end 
end 
%Grafico
tntotal = linspace(0, duracion, length(y_final));
stem(tntotal,y_final), title('Señal  mixta: sinusoidal - diente de sierra') 
xlabel('Tiempo [segundos]'), ylabel('Amplitud [V]')

% Se aplica la DFT
N = length (y_final);
Xk = dft_vectorial (y_final);
%Se toman los valores reales dados por la funcion
Espectro_amplitudes= abs(Xk);
%Se normaliza dividiendo para el maximo
Espectro_amplitudes_normalizado = Espectro_amplitudes/max(Espectro_amplitudes);
 
% Grafica de la DFT normalizada:
% Eje de frecuencias:
f=linspace(0,Fs, length(y_final));
 
figure
stem(f,Espectro_amplitudes_normalizado)
title('Espectro de amplitudes normalizado')
xlabel('f[Hz]')
 
%Visualización de la DFT normalizada solo hasta Fs/2:
figure
stem(f,Espectro_amplitudes_normalizado)
axis([0 15 0 max(Espectro_amplitudes_normalizado)])
title('Espectro de amplitudes normalizado - desde cero hasta Fs/2')
xlabel('f[Hz]')
grid minor

