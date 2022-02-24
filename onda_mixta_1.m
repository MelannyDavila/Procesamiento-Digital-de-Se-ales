clc, close all, clear all
duracion=0.001;
f=2000;
T=1/f;
Ts=T/100; % tiempo entre muestras
tn=0:Ts:duracion;  %inicio:salto:fin
 
y1=0.5*sawtooth(2*pi*f*tn,0.5)+0.5; 
y2=sin(2*pi*f*tn+pi); %senoidal desplazada 180 grados
 
%subplot(3,1,1)
%plot(tn,y1, 'b')
%title('title triangular 0.8 pendiende de subida f=100Hz')
%xlabel('t(sec)')
%grid minor
 
%subplot(3,1,2)
%plot(tn,y2, 'r')
%title('Sinusoidal f=100Hz')
%xlabel('t(sec)')
%grid minor
 
%subplot(3,1,3)
%plot(tn,y1, 'b')
%hold on
%plot(tn,y2, 'r')
%title('Superposición de señales')
%xlabel('t(sec)')
%grid minor
 
% Para encuadrar la triangular de modo que se ubique según lo deseado: hay que
% aumentar al doble de frecuencia:
y1_f=0.5*sawtooth(2*pi*2*f*tn,0.5)+0.5; 
 
%figure
%subplot(3,1,1)
%plot(tn,y1_f, 'b')
%title(' triangular 0.8 pendiende de subida duplicada su frecuencia')
%xlabel('t(sec)')
%grid minor
 
%subplot(3,1,2)
%plot(tn,y2, 'r')
%title('Sinusoidal f=100Hz')
%xlabel('t(sec)')
%grid minor
 
%subplot(3,1,3)
%plot(tn,y1_f, 'b')
%hold on
%plot(tn,y2,'r')
%title('Superposición de señales')
%xlabel('t(sec)')
%grid minor
% Ahora, si la sinusoidal es negativa, hay que poner la triangular:
y_final = y2;
for n=1:length(tn)
    if y2(n)<=0
        y_final(n)=y1_f(n);
    end
end
 
figure
subplot(3,1,1)
 
plot(tn,y1_f, 'b')
title('triangular 0.8 pendiende de subida duplicada su frecuencia')
xlabel('t(sec)')
grid minor
 
subplot(3,1,2)
plot(tn,y2, 'r')
title('Sinusoidal')
xlabel('t(sec)')
grid minor
 
subplot(3,1,3)
plot(tn,y_final, 'r')
title('Onda mixta solicitada')
xlabel('t(sec)')
grid minor 
% Verificación auditiva: 
Fs = 1/Ts;
sound(y_final, Fs)