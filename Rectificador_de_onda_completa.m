
clc, clear all, close all
duracion=52;
f=100;
T=1/f;
% tiempo entre muestras (consideramos 100 muestras/período)
Ts=T/100; 
tn=0:Ts:duracion;  %inicio:salto:fin
 
% Vector de amplitudes:
 y = sin(2*pi*f*tn);
% La onda rectificada completa es obtenida al invertir los semiciclos negativos por medio del comando abs:
y_abs=abs(y);


% Verificación visual:
%figure % Abre una nueva ventana de gráfico.
%stem(tn,y_abs) % Grafica el Eje del Tiempo vs. Eje de Amplitudes.
%grid on % Agrega las divisiones menores en el fondo del grafico.
%xlabel('Tiempo(seg)') % Titulo del Eje X
%ylabel('Amplitud') % Titulo del Eje Y
%title('Onda Rectificada Completa') % Titulo del Grafíco
 
% Verificación auditiva: 
Fs = 1/Ts;
sound (y_abs, Fs)
