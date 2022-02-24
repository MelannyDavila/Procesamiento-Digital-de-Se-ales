clc, clear all, close all
duracion=0.02;
f=1000;
T=1/f;
% tiempo entre muestras (consideramos 100 muestras/período)
Ts=T/100; 
tn=0:Ts:duracion;  %inicio:salto:fin
A=5;
% Vector de amplitudes:
y =sin(2*pi*f*tn);
 %plot(y)
% La onda rectificada completa es obtenida al invertir los semiciclos negativos por medio del comando abs:
y_abs=abs(y);
% Verificación visual:
figure % Abre una nueva ventana de gráfico.
stem(tn,y_abs) % Grafica el Eje del Tiempo vs. Eje de Amplitudes.
grid on % Agrega las divisiones menores en el fondo del grafico.
xlabel('Tiempo(seg)') % Titulo del Eje X
ylabel('Amplitud') % Titulo del Eje Y
title('Onda Rectificada Completa') % Titulo del Grafíco
 
% Verificación auditiva: 
Fs = 1/Ts;
sound (y_abs, Fs)
