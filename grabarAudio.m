clc, clear all, close all
recObj = audiorecorder;%Creaci�n del objeto audiorecorder
Fs = 44100 ;%frecuencia de muestreo elegido
nBits = 16 ;%seteo del numero de bits para realizar la captura de la se�al
N = 2^12; %Se establece el numero de puntos que tendran la se�ales
nChannels = 2 ;%numero de canales por los que se va a capturar la se�al
ID = -1; % dispositivo de entrada de audio por defecto
recObj = audiorecorder(Fs,nBits,nChannels,ID);%asignaci�n de un objeto audiorecorder
recordblocking(recObj,1);%Creaci�n de un bloque de grabado
tiempo = 0.5;%tiempo de grabaci�n para cada bloque de datos (1 segundo)
while 1
    recordblocking(recObj,tiempo);%Asignaci�n del tiempo de grabaci�n
    audioGrabado = getaudiodata(recObj);%Asignaci�n de los datos grabados a una variable para poder interpretarlos
    subplot(2,1,1), plot(audioGrabado), title('Dominio del tiempo'), ylabel('Amplitud [V]'),axis([0 1e3 -0.5 0.5]), grid on%Presentaci�n de la se�al capturada en tiempo
    %Analisis de datos
    Xn_FFT = fft(audioGrabado,N);%Realizaci�n de la transformada r�pida de Fourier para poder observar a la se�al en frecuencia
    P2 = abs(Xn_FFT/N);%Se toman los valores absolutos
    P1 = P2(1:N/2+1);%Se reorganiza la informaci�n
    P1(2:end-1) = 10*2*P1(2:end-1);
    f = Fs*(0:(N/2))/N;%Se crea el vector de frecuencias
    subplot(2,1,2), plot(f,(P1)), title('Dominio de la frecuencia'), ylabel('Amplitud'), xlabel('Frecuencia [Hz]'), axis([0 2e3 0 2]), grid on%Presentaci�n de la informaci�n en el
    %dominio de la frecuencia
    pause(0.5)%Se asigna un retardo de medio segundo
    %Etapa de reconocimiento de frecuencias
    c1 = find(P1 == max(P1));%Se captura el primer valor m�ximo del espectro de frecuencia (correspondiente a una de las frecuencias de la se�al)
    P1(c1) = [];%Se elimina el primer valor m�ximo para poder capturar el segundo 
    c2 = find(P1 == max(P1));%Se captura el segundo valor m�ximo
    %Etapa de etiquetaci�n de frecuencias, de acuerdo a la combinaci�n de
    %frecuencias asignadas se interpreta el bot�n, se da un intervalo de
    %error ya que la medici�n no es completamente precisa.
    if f(c1) < f(c2)%Ordeno las frecuencias para no cometer errores
        aux = f(c1);
        f(c1) = f(c2);
        f(c2) = aux;
    end
    if f(c1)<1280&&f(c2)<750
        disp('Se esta presionando el boton 1')
    elseif f(c1)<1380&&f(c1)>1300&&f(c2)<730
        disp('Se esta presionando el boton 2')
    elseif f(c1)<1490&&f(c2)<730
        disp('Se esta presionando el boton 3')
    elseif f(c1)<1700&&f(c1)>1500&&f(c2)<730
        disp('Se esta presionando el boton A')
    elseif f(c1)<1280&&f(c1)>760&&f(c2)<800
        disp('Se esta presionando el boton 4')
    elseif f(c1)<1380&&f(c1)>1300&&f(c2)<800&&f(c2)>730
        disp('Se esta presionando el boton 5')
    elseif f(c1)<1500&&f(c1)>1400&&f(c2)<800&&f(c2)>740
        disp('Se esta presionando el boton 6')
    elseif f(c1)<1700&&f(c1)>1500&&f(c2)<800&&f(c2)>730
        disp('Se esta presionando el boton B')
    elseif f(c1)<1280&&f(c2)<900&&f(c2)>800
        disp('Se esta presionando el boton 7')
    elseif f(c1)<1380&&f(c1)>1300&&f(c2)>800&&f(c2)<900
        disp('Se esta presionando el boton 8')
    elseif f(c1)<1500&&f(c1)>1400&&f(c2)>800&&f(c2)<900
        disp('Se esta presionando el boton 9')
    elseif f(c1)<1700&&f(c1)>1500&&f(c2)>800&&f(c2)<900
        disp('Se esta presionando el boton C')
    elseif f(c1)<1280&&f(c2)>900
        disp('Se esta presionando el boton *')
    elseif f(c1)<1380&&f(c1)>1300&&f(c2)>900
        disp('Se esta presionando el boton 0')
    elseif f(c1)<1500&&f(c1)>1400&&f(c2)>900
        disp('Se esta presionando el boton #')
    elseif f(c1)<1700&&f(c1)>1500&&f(c2)>900
        disp('Se esta presionando el boton D')
    end
end
