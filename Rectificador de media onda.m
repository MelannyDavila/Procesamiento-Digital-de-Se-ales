clc
clear all
close all
duracion=52;
f=1000; %frecuencia de trabajo
T=1/f; %periodo
% tiempo entre muestras (100 muestras/período)
Ts=T/100; 
tn=0:Ts:duracion; %vector de tiempo inicio:salto:fin
y1 = sin(2*pi*f*tn); %funcion sinusoidal
 
% Un rectificador de media onda puede ser obtenido remplazando 
% la parte negativa de una señal sinusoidal con ceros:
y2 = y1;
j=1; %variable auxiliar
for i=tn 
  if y1(j)<0;
     y2(j)=0; %asignacion de ceros a los intervalos negativos
  end
  j=j+1;
end
 
%stem(tn,y2);
%xlabel('Tiempo(seg)') % Titulo del Eje X
%ylabel('Amplitud') % Titulo del Eje Y
%title('Onda Rectificada de Media Onda') % Titulo del Gráfico
 
% Verificación auditiva: 
Fs = 1/Ts;
sound (y2, Fs)
