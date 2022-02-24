clc
close all
clear all 
f = 1e3;
duracion =f*2; %Duracion de 1 segundo 
Fmax = 1; %frecuencia de trabajo
Fs = 20*Fmax; %frecuencia de muestreo
Ts= 1/ Fs;
T=1/f;
duracion=2*T; %Duracion en periodos
Ts=T/50; % tiempo entre muestras 
tn=0:Ts:duracion; %vector de tiempo inicio:paso:fin 
y1=sin(2*pi*f*tn); %funcion sinusoidal
y_final = y1; %funcion final
y2_2f=0.5*sawtooth(2*pi*2*f*tn,0.5)+0.5; %funcion triangular 
for n=1:length(tn) %lazo for para recorrer a la funcion final
    if y1(n)<=0 %si la funcion sinusoidal es negativa
        y_final(n)=y2_2f(n); %se asiga a la funcion triangular en ese intervalo
    end 
end 
tntotal = linspace(0, duracion, length(y_final));
stem(tntotal,y_final)%grafico de la senal mixta
title('Señal  mixta:Sinusoidal-Triangular') %titulo
xlabel('Tiempo [segundos]')%eje x
ylabel('Amplitud [V]')%eje y
axis([0 max(tntotal) 0 max(y_final)+0.02])%limitaciones de ejes
grid on
N = length (y_final);%longitud de la funcion
Xk = dft_vectorial (y_final); %uso de la DFT
Esp= abs(Xk);%valor absoluto del espectro
Esp_n = Esp/max(Esp);%espectro normalizado
f=linspace(0,Fs, length(y_final)); %eje x, frecuencia
 
figure
stem(f,Esp_n)% grafico espectro normalizado
title('Espectro de amplitudes normalizado')%titulo
xlabel('f[Hz]')%eje x
ylabel('Amplitud [V]') %eje Y
axis([0 max(f) 0 max(Esp_n)+0.02])%limite de ejes
grid on
 
figure
stem(f,Esp_n)%grafico espectro normalizado hasta fs/2
axis([0 Fs/2 0 max(Esp_n)+0.02])%limite de los ejes
title('Espectro de amplitudes normalizado - desde cero hasta Fs/2')%titulo
xlabel('f[Hz]')%eje x
ylabel('Amplitud [V]') %eje Y
grid on
