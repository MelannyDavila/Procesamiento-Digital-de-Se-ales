%% Grafica-Triangular Bipolar
clc
close all
clear all
duracion=0.002;
f=1000;
T=1/f;
Ts=T/100; % tiempo entre muestras
tn=0:Ts:duracion;  %inicio:salto:fin
 
y1=0.5*sawtooth(2*pi*f*tn,1)+0.5; 
y2=sin(2*pi*f*tn+pi); %senoidal desplazada 180 grados
 y1_f=0.5*sawtooth(2*pi*2*f*tn,1)+0.5; 
% Cuando la onda sinusoidal es negativa, se presenta la onda triangular:
y_final = y2;
for n=1:length(tn)
    if y2(n)<=0
        y_final(n)=y1_f(n);
    end
end
% Verificación visual:
figure
plot(tn,y_final, 'b','Linewidth',1.5) %Grafica
title('Onda Sinusoidal Diente de Sierra de 1 kHz') %Titulo
grid on % Cuadricula
xlabel('Tiempo') % Titulo del Eje X
ylabel('Amplitud') % Titulo del Eje Y
% Verificación auditiva: 
Fs = 1/Ts;
sound(y_final, Fs)