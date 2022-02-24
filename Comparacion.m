clc
clear all
close all
Fs=1e3;
FACTOR = 128;

a=1;
s=['sano01.txt';'sano02.txt';'sano03.txt';'sano04.txt';'sano05.txt';'sano06.txt';...
    'sano07.txt';'sano08.txt';'sano09.txt';'sano10.txt';'sano11.txt' ];
while a<=11
    T = importdata(s(a,:));
    L = T.data;
    Na=max(size(L));
    nFFT=2^(ceil(log2(Na)))*FACTOR;
    Xn_FFT_a = fft(letra_A,nFFT);
    periodograma_a=abs(Xn_FFT_a);
    fa=linspace(0,Fs,nFFT);
    hold on
    plot(fa,periodograma_a/max(periodograma_a));
    legend({'A1','A2','A3','A4','A5','A6','A7','A8','A9','A10'})
    axis([0 Fs/2 0 1])
    x=sprintf('letraA(%d).wav',a);
    audiowrite(x,letra_A,Fs);
    pause(1)
    disp('Letra A creada correctamente')
    a=a+1;
end
hold off
