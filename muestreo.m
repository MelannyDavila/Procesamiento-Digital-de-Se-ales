% DEMOSTRACIÓN DEL EFECTO DE ALIASSING:
% Teniendo 3 tonos (de 500, 1500 y 2000 Hz), suponemos intencionalmente
% que la Fmax es 2000 para ver qué ocurre en el momento del muestreo:
clc, clear all, close all
%% Representación de señales analógicas:
Fmax_a = 1000;
% Simulación de la onda analógica:
% Sobre muestreo (factor alto de muestras / período):
Fs_a = 100*Fmax_a; 
duracion= 0.05; % duración en segundos
% Eje de tiempo analógico
ta = 0:1/Fs_a:duracion; 
% Simulación de señales analógicas de 500, 1500 y 2000 Hz:
xa1 = sin(2*pi*500*ta);
xa2 = sin(2*pi*1500*ta);
xa3 = sin(2*pi*2000*ta);
%% MUESTREO DE ESTAS SEÑALES “ANALÓGICAS”:
% Vamos a muestrear de modo que solo la F1 CUMPLA con el Teorema del Muestreo;
% las otras dos INCUMPLIRÁN el teorema:
% Suponemos que la máxima componente es 1000 Hz.
% Con esta, solo quedará bien muestreada la f1 de 500 Hz:
Fmax_d = 1000; 
Fs_d = 2.1*Fmax_d; % Fs_d = 2100 Hz, 
% Para F1, sí respetamos el Teorema del Muestreo pues la Fs requerida es 
% > 2*1000 (mayor que 2000 Hz) y se tiene una Fs de 2100 Hz.
% Para F2, no respetamos el Teorema del Muestreo pues la Fs requerida es 
% > 2*3400 (mayor que 6800 Hz) y solo se tiene una Fs de 2100 Hz.
% Para F3, no respetamos el Teorema del Muestreo pues la Fs requerida es
% > 2*4600 (mayor que 9200 Hz) y solo se tiene una Fs de 2100 Hz.
 
% Eje de tiempo discreto (nTs):
tn = 0:1/Fs_d:duracion; % misma duración = 2 seg
% Simulación de señales discretas:
xn1 = sin(2*pi*500*tn);  
xn2 = sin(2*pi*1500*tn);  
xn3 = sin(2*pi*2000*tn);  
%% Gráficos superpuestos de analógicas y discretas:
plot (ta, xa1)
hold on
stem(tn,xn1,'r')
xlabel('t(segundos)')
title('Señal analógica 1 (f1 = 500 Hz) muestreada a 2100 Hz: SÍ CUMPLE')
figure
plot (ta, xa2)
hold on
stem(tn,xn2,'r')
xlabel('t(segundos)')
title('Señal analógica 2 (f2 = 1500 Hz) muestreada a 2100 Hz: NO CUMPLE') 
figure
plot (ta, xa3)
hold on
stem(tn,xn3,'r')
xlabel('t(segundos)')
title('Señal analógica 3 (f3 = 2000 Hz) muestreada a 2100 Hz: NO CUMPLE')
%% RECUPERACIÓN AUDITIVA PARA F1 = 500 Hz: 
pause
% Aumentar duración a 2 segundos 
sound(xa1,Fs_a) %señal analógica de F1 = 500 Hz
disp('generando la señal analógica de F1 = 500 Hz')
pause
 
sound(xn1,Fs_d) %señal analógica de F1 muestreada a 2100 Hz: SI CUMPLE EL TEOREMA
disp('generando la señal muestreada de F1 = 500 Hz')
pause
%% RECUPERACIÓN AUDITIVA PARA F2 = 1500 Hz: 
sound(xa2,Fs_a) %señal analógica de F2 = 1500 Hz
disp('generando la señal analógica de F2 = 1500 Hz')
pause
 
sound(xn2,Fs_d) %señal analógica de F2 muestreada a 2100 Hz: NO CUMPLE EL TEOREMA
disp('generando la señal muestreada de F2 = 1500 Hz')
pause
%% RECUPERACIÓN AUDITIVA PARA F3 = 2000 Hz: 
sound(xa3,Fs_a) %señal analógica de F3 = 2000 Hz
disp('generando la señal analógica de F3 = 2000 Hz')
pause
 
sound(xn3,Fs_d) %señal analógica de F3 muestreada a 2100 Hz: NO CUMPLE EL TEOREMA
disp('generando la señal muestreada de F3 = 2000 Hz')
