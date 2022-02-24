clc; clear all; close all;
%% Configuraci�n de los par�metros de la onda:
%Amplitud m�xima
Amax=1;
%Frecuencia
Fo=2000;
%Per�odo
T=1/Fo;
%Fase incial 
Phy=180;
%Duraci�n de la onda
duracion=0.001;
%Per�odo de muestreo:
Ts=T/100;
%Vector de tiempos discretos:
tn=0:Ts:duracion;
% Construcci�n de la se�al -- vector de amplitudes:
yn=Amax*square(2*pi*Fo*tn,50);
% Gr�fica de la se�al 
plot(tn,yn,':ob','MarkerSize',4);
%Etiquetas y t�tulo
xlabel('Tiempo');
ylabel('Amplitud');
title('Onda cuadrada 2KHz');
Fs=1/Ts;
sound(yn,Fs)