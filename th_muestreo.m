%RECUPERACION DE SE�AL A PARTIR DE UNA MUESTRA.      
clc, close all, clear all
% Datos de la se�al:
F=1; % solo hay una componente   
Fmax=1;  %Frecuencia de un 1Hz
%Fs = FACTOR * Fmax
Fs=4*Fmax; 
% Tiempo entre muestras:
Ts=1/Fs; 
%Duraci�n de la se�al: 20 muestras
duracion = 20*Ts;
% Vector de tiempo discreto:
tn=0:Ts:duracion; 
% Simulaci�n de la onda anal�gica:
% Tiempo entre muestras anal�gicas mucho menor que el tiempo entre muestras discretas:
Ta=Ts/10; 
%Vector de tiempo anal�gico:
ta=0:Ta:duracion; 
% Simulaci�n de la Se�al Anal�gica:
ya=sin(2*pi*F*ta);   
% Simulaci�n de la Se�al muestreada:
yn=sin(2*pi*F*tn);       
 
%Gr�fico de onda anal�gica y la muestreada:
subplot(4,1,1)
plot(ta,ya,'g',tn,yn,'o');
%axis([0 duracion -1 1]);
grid on
title('ONDA SINUSOIDAL ANAL�GICA Y MUESTREADA, Fs=FACTOR*Fmax')
 
% SINCS DESPLAZADAS HACIA LAS MUESTRAS:
for n=0:duracion/Ts % Hay 20 muestras
    SINCS_DESPLAZADAS(n+1,:)=sinc((ta-n*Ts)/Ts);
    subplot(4,1,2)
    plot(ta,SINCS_DESPLAZADAS(1:n+1,:));
    pause(0.1)
    title('SINCS DESPLAZADAS HACIA CADA UNA DE LAS MUESTRAS');
end
 
% (SINCS DESPLAZADAS) * (MUESTRAS RESPECTIVAS):
for n=0:duracion/Ts
    SINCS_DESPLAZADAS_POR_MUESTRAS(n+1,:)=yn(n+1)*sinc((ta-n*Ts)/Ts);
    subplot(4,1,3)
    plot(ta,SINCS_DESPLAZADAS_POR_MUESTRAS(1:n+1,:),tn(1:n+1),yn(1:n+1),'o');
    pause(0.1)
    title('CADA UNA DE LAS MUESTRAS MULTIPLICADAS POR SUS RESPECTIVAS SINCS')
end
 
% SE�AL RECONSTRUIDA: 
%Senial_reconstruida = sum(SINCS_DESPLAZADAS_POR_MUESTRAS);
for n=0:duracion/Ts
    subplot(4,1,4)
    Senial_reconstruida = sum(SINCS_DESPLAZADAS_POR_MUESTRAS(1:n+1,:));
    plot(ta,Senial_reconstruida,'k')
    title('ONDA RECUPERADA AL IR SUMANDO LOS APORTES')
    pause(0.1)
end
    
% COMPARACI�N ENTRE LA SE�AL ORIGINAL Y LA RECUPERADA:
subplot(4,1,4)
hold on
plot(ta,ya,'k');
plot(ta,Senial_reconstruida,'b');
legend('Onda Original','Onda Recuperada');
title('Recuperaci�n de la onda con Fs=FACTOR*Fmax');
 
% Solo para mejor visualizaci�n:
figure 
hold on
plot(ta,ya,'k');
plot(ta,Senial_reconstruida,'b');
legend('Onda Original','Onda Recuperada');
title('Recuperaci�n de la onda con Fs=FACTOR*Fmax');
