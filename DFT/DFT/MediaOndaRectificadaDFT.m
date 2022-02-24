clc
clear all
close all
duracion=2e-2;%duracion en segundos
f=100; 
T=1/f; %periodo
Fmax = 1; %frecuencia de trabajo
Fs = 100*Fmax; %frecuencia de muestreo
Ts=T/100; %periodo de  muestreo
tn=0:Ts:duracion;  % vector de tiempo, inicio:paso:fin
y1 = sin(2*pi*f*tn); %funcion sinusoidal
% Un rectificador de media onda puede ser obtenido remplazando 
% la parte negativa de una señal sinusoidal con ceros:
y2 = y1; %segunda parte de la funcion
j=1; %variable auxiliar
for i=tn %lazo for que recore la funcion y1
  if y1(j)<0 %si el valor de y1 es negativo
     y2(j)=0; %y2 tendra el valor de 0
  end
  j=j+1; %incremento de la varible auxiliar
end

stem(tn,y2);%grafico senal media onda rectificada
xlabel('Tiempo[seg]') %eje X
ylabel('Amplitud [V]') %eje Y
title('Onda Rectificada de Media Onda') % titulo
grid on
N = length (y2); %longitud de la funcion y2
Xk = dft_vectorial (y2); %uso de dft vectorial
Esp= abs(Xk); %valor absoluto del espectro
Esp_n = Esp/max(Esp);%normalizacion del espectro
f=linspace(0,Fs, length(y2));%eje x, frecuencia
 
figure
stem(f,Esp_n) %grafico espectro normalizado
title('Espectro de amplitud normalizado') %titulo
xlabel('f[Hz]') %eje x
ylabel('Amplitud [V]') %eje Y
grid on

figure
stem(f,Esp_n)% grafico del espectro normalizado hasta fs/2
axis([0 Fs/2 0 max(Esp_n)]) %limite de los ejes
title('Espectro de amplitud normalizado - desde cero hasta Fs/2') %titulo
xlabel('f[Hz]') %eje x
ylabel('Amplitud [V]') %eje Y
grid on