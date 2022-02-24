clc
clear all
close all
rec = audiorecorder;%Objeto audiorecorder
Fs = 8600 ;%frecuencia de muestreo
nBits = 16 ;%Numero de bits para la captura de la señal
N = 2^10; %Numero de puntos que tendran la señales
nChannels = 2 ;%Numero de canales 
ID = -1; %Dispositivo de entrada de audio
rec = audiorecorder(Fs,nBits,nChannels,ID);
recordblocking(rec,1);%Bloque de grabado
tiempo = 1; %Tiempo de grabación, 1 segundo
while 1
    recordblocking(rec,tiempo);%Tiempo de grabación
    audioGrabado = getaudiodata(rec);%Registro de los datos grabados
    figure
    plot(audioGrabado,'b')
    title('Dominio del tiempo')
    ylabel('Amplitud [V]')
    axis([0 1e3 -0.5 0.5])
    grid on
    %Analisis de datos
    Xn_FFT = fft(audioGrabado,N);%Transformada rápida de Fourier 
    P2 = abs(Xn_FFT/N);%Valores absolutos de la FFT
    P1 = P2(1:N/2+1);
    P1(2:end-1) = 10*2*P1(2:end-1);
    f = Fs*(0:(N/2))/N;%Vector de frecuencia
    figure
    plot(f,(P1),'b')
    title('Dominio de la frecuencia')
    ylabel('Amplitud')
    xlabel('Frecuencia [Hz]')
    axis([0 2e3 0 2]) 
    grid on
    pause(1)%Retardo, 1 segundo
    %Etapa de reconocimiento de frecuencias
    c1 = find(P1 == max(P1));%Se captura el primer valor máximo
    P1(c1) = [];
    c2 = find(P1 == max(P1));%Se captura el segundo valor máximo
    if f(c1) < f(c2)%Comparacion de las frecuencias para ordenar
        aux = f(c1);
        f(c1) = f(c2);
        f(c2) = aux;
    end
    if f(c1)<1280&&f(c2)<730
        disp('Caracter presionado: 1')
    elseif f(c1)<1380&&f(c1)>1300&&f(c2)<730
        disp('Caracter presionado: 2')
    elseif f(c2)<1500&&f(c1)<730
        disp('Caracter presionado: 3')
    elseif f(c1)<1700&&f(c1)>1500&&f(c2)<730
        disp('Caracter presionado: A')
    elseif f(c1)<1280&&f(c1)>730&&f(c2)<800
        disp('Caracter presionado: 4')
    elseif f(c1)<1380&&f(c1)>1300&&f(c2)<800&&f(c2)>730
        disp('Caracter presionado: 5')
    elseif f(c1)<1500&&f(c1)>1400&&f(c2)<800&&f(c2)>730
        disp('Caracter presionado: 6')
    elseif f(c1)<1700&&f(c1)>1500&&f(c2)<800&&f(c2)>730
        disp('Caracter presionado: B')
    elseif f(c1)<1280&&f(c2)<900&&f(c2)>800
        disp('Caracter presionado: 7')
    elseif f(c1)<1380&&f(c1)>1300&&f(c2)>800&&f(c2)<900
        disp('Caracter presionado: 8')
    elseif f(c1)<1500&&f(c1)>1400&&f(c2)>800&&f(c2)<900
        disp('Caracter presionado: 9')
    elseif f(c1)<1700&&f(c1)>1500&&f(c2)>800&&f(c2)<900
        disp('Caracter presionado: C')
    elseif f(c1)<1280&&f(c2)>900
        disp('Caracter presionado: *')
    elseif f(c1)<1380&&f(c1)>1300&&f(c2)>900
        disp('Caracter presionado: 0')
    elseif f(c1)<1500&&f(c1)>1400&&f(c2)>900
        disp('Caracter presionado: #')
    elseif f(c1)<1700&&f(c1)>1500&&f(c2)>900
        disp('Caracter presionado: D')
    end
end
