clc, close all, clear all 
duracion=10; 
f=1000; 
T=1/f; 
Ts=T/100; % tiempo entre muestras 
tn=0:Ts:duracion;  %inicio:salto:fin 
y1=sin(2*pi*f*tn); 
y2=0.5*sawtooth(2*pi*f*tn,100/100)+0.5; 
y_final = y1; 
y2_2f=0.5*sawtooth(2*pi*2*f*tn,0.5)+0.5; 
for n=1:length(tn) 
    if y1(n)<=0 
        y_final(n)=y2_2f(n); 
    end 
end 

sound(y_final, 51000) 
