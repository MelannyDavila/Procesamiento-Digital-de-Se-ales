clc, clear all, close all
duracion=20;
f=1e3;
T=1/f;
% tiempo entre muestras (100 muestras/período)
Ts=T/100; 
tn=0:Ts:duracion;  %inicio:salto:fin
y1 = sin(2*pi*f*tn);
 
% Un rectificador de media onda puede ser obtenido remplazando 
% la parte negativa de una señal sinusoidal con ceros:
y2 = y1;
j=1;
for i=tn
  if y1(j)<0
     y2(j)=0;
  end
  j=j+1;
end
%  
plot(tn,y2);
xlabel('Tiempo(seg)') % Titulo del Eje X
ylabel('Amplitud') % Titulo del Eje Y
title('Onda Rectificada de Media Onda') % Titulo del Gráfico
 
% Verificación auditiva: 
Fs = 1/Ts;
sound (y2, Fs)
