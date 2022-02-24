clc; clear all; close all;
%%Configuraci�n de los par�metros de la onda:
%Amplitud m�xima
A = 1;
%Frecuencia
Fo = 1e3;
%Per�odo
T = 1/Fo;
%Per�odo de muestreo:
Ts = T/100;
%Duraci�n de la onda
duracion = 5e-3;
% Vector Tiempo
tn = 0:Ts:duracion;  %inicio:salto:fin
% Se�al Diente de Sierra
yds = sawtooth(2*pi*Fo*tn,1); 
 
% Verificaci�n visual:
 
figure % Abre una nueva ventana de gr�fico.
plot(tn*1e3,yds,'b','Linewidth',1.5) % Grafica el Eje del Tiempo vs. Eje de Amplitudes.
grid on % Agrega las divisiones menores en el fondo del grafico.
xlabel('Tiempo(ms)') % Titulo del Eje X
ylabel('Amplitud') % Titulo del Eje Y
title('Onda Diente de Sierra') % Titulo del Graf�co
 
% Verificaci�n auditiva: 
%Duraci�n de la onda
duracions = 10;
% Vector Tiempo
tns = 0:Ts:duracions;  %inicio:salto:fin
% Se�al Diente de Sierra
yds2 = sawtooth(2*pi*Fo*tns,1);
Fs = 1/Ts;
sound (yds2, Fs)
