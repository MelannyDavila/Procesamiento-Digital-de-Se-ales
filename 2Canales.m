%% Programa para manejar los 2 canales de salida del puerto de audio de manera independiente
clc,close all,clear all
Amax=1;%Amplitud de las señales
F1=1000; %Frecuencia 1
F2=2000; %Frecuencia 2
d=28; %Duracion en segundos
% Tiempo entre muetras conisderando la Frecuencia más exigente (F2):
T = 1/F2;
Ts= T/ 100; % Considerando 100 muestras por cada período.
tn1=[0:Ts:d]; %Vector de tiempo discreto
%Generación de señales sinusoides de diferente frecuencia
%Se multiplica 0.75, para que la señal no sobrepase la amplitud de +/-1 voltio.
yn1=Amax*sin(2*pi*F1*tn1);
yn2=(Amax)*sin(2*pi*F2*tn1);
%Ploteo de la señal a salir por el puerto de audio
%plot(tn1,yn1,tn1,yn2);
%legend('Canal izquierdo: sinusoide de 1000Hz ','Canal derecho: sinusoide de 2000Hz')
%xlabel('Tiempo (s)');
%ylabel('Amplitud');
%grid on 
%Crear la matriz: Columna 1 corresponde al canal 1 y Columna 2 corresponde al canal 2
yn=[yn1' yn2'];
% Verificación auditiva: 
Fs = 1/Ts;
sound(yn2,Fs)
