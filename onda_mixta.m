clc, close all, clear all
duracion=0.003;
f=1000;
T=1/f;
Ts=T/100; % tiempo entre muestras
tn=0:Ts:duracion;  %inicio:salto:fin
y1=sin(2*pi*f*tn);
y2=0.5*sawtooth(2*pi*f*tn,0.5)+0.5;
y2_2f=0.5*sawtooth(2*pi*2*f*tn,0.5)+0.5;
% Ahora, si la sinusoidal es negativa, hay que poner la triangular:
y_final = y1;
for n=1:length(tn)
    if y1(n)<=0
        y_final(n)=y2_2f(n);
    end
end
figure
subplot(3,1,1)
plot(tn,y1, 'b')
title('Sinusoidal')
xlabel('t(sec)')
grid minor
 
subplot(3,1,2)
plot(tn,y2_2f, 'r')
title('triangular con duplicada su frecuencia')
xlabel('t(sec)')
grid minor
 
subplot(3,1,3)
plot(tn,y_final, 'r')
title('Onda mixta solicitada')
xlabel('t(sec)')
grid minor

% Verificación auditiva: 
Fs = 1/Ts;
sound(y_final,Fs)
