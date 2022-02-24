clc; clear all; close all;
%% Configuración de los parámetros de la onda:
%Amplitud máxima
Amax=1;
%Frecuencia
Fo=2000;
%Período
T=1/Fo;
%Fase incial 
Phy=180;
%Duración de la onda
duracion=0.001;
%Período de muestreo:
Ts=T/100;
%Vector de tiempos discretos:
tn=0:Ts:duracion;
% Construcción de la señal -- vector de amplitudes:
yn=Amax*square(2*pi*Fo*tn,50);
% Gráfica de la señal 
plot(tn,yn,':ob','MarkerSize',4);
%Etiquetas y título
xlabel('Tiempo');
ylabel('Amplitud');
title('Onda cuadrada 2KHz');
Fs=1/Ts;
sound(yn,Fs)