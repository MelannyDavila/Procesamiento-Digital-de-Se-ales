clc
close all
clear all 
%Señales mixtas
f=1000; %frecuencia de trabajo
T=1/f; %periodo
duracion=80; %Duracion de la senal
Ts=T/100; % tiempo entre muestras 
tn=0:Ts:duracion;  %vector de  tiempo inicio:salto:fin 
y1=sin(2*pi*f*tn); %funcion seno
y_final = y1; %funcion final
y2_2f=0.5*sawtooth(2*pi*2*f*tn,0.5)+0.5; %funcion triangular
for n=1:length(tn) %lazo for para modificar a la senal
    if y1(n)<=0 
        y_final(n)=y2_2f(n); %agregacion de la senal triangular
    end 
end 
sound(y_final,tn)%Sonido
