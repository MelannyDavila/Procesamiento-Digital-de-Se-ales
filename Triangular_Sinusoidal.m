%% Generación onda Triangular Sinusoidal
clc
clear all
close all
 
% Variables de periodo y frecuencia
f = 1e3;
fs = 100*f;
duracion = 10;
 
% Eje del tiempo (eje x)
t=0:1/fs:duracion;
 
% Generación de la señal
y1=sawtooth(2*pi*f*t,0.5);
for i=1:length(y1)
    if y1(i)<0
        y1(i)=0;
    end
end    
y2=cos(2*pi*f*t);
for i=1:length(y2)
    if y2(i)<0
        y2(i)=0;
    end
end
y_mixta=y1+y2;
 
% Verificación visual:
plot(t*1e3,y_mixta,'b','Linewidth',1.5) % Grafica Tiempo vs. Amplitud
grid on % Cuadricula
xlabel('Tiempo') % Titulo del Eje X
ylabel('Amplitud') % Titulo del Eje Y
title('Onda Triangular Sinusoidal de 1 kHz') % Titulo del Grafico
axis([0 2 -0.1 1.1]); %Ejes
sound(y_mixta,fs);
