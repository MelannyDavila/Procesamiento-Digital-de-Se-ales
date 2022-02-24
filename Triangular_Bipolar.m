%% Grafica-Triangular Bipolar
clc
clear all
close all
%Amplitud maxima
Amax=1;
%Frecuencia
Fo=100;
%Perdiodo
T=1/Fo;
%Fase
Phy=180;
%Duracion de la onda
duracion=0.1;
%Periodo de muestreo
Ts=T/100;
%Vector de tiempos discretos
tn=0:Ts:duracion;
%%Construccion de la senial-vector de amplitudes
%Senial triangular
yt=Amax*sawtooth(2*pi*Fo*tn,50/100);
%%Grafica de la senial
plot(tn,yt,'b','Linewidth',1.5)
%Etiquetas y titulo
xlabel('Tiempo');
ylabel('Amplitud');
title('Onda triangular de 1 KHz');
axis([0 duracion -1.15 1.15])
%Velocidad de la transmision
Fs=1/Ts;
sound(yt,Fs)