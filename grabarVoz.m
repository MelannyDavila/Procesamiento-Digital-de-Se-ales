clc
clear 
close all;
Fs=44100;
FACTOR = 128;
objtAudio=audiorecorder(Fs,16,1);

%% Letra A
a=1;
figure('Name','Letra A','NumberTitle','off')
while a<=10
    if a>=1 && a<=10
        da=['Menciona la letra A',num2str(a)];
        disp(da);
        recordblocking(objtAudio,2);
        letra_A=getaudiodata(objtAudio);
        Na=length(letra_A);
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
    end
    a=a+1;
end
hold off
%% Letra E
e=1;
figure('Name','Letra E','NumberTitle','off')
while e<=10
    if e>=1 && e<=10
        de=['Menciona la letra E',num2str(e)];
        disp(de)
        recordblocking(objtAudio,2);
        letra_E=getaudiodata(objtAudio);
        Ne=length(letra_E);
        nFFT=2^(ceil(log2(Ne)))*FACTOR;
        Xn_FFT_e = fft(letra_E,nFFT);
        periodograma_e=abs(Xn_FFT_e);
        fe=linspace(0,Fs,nFFT);
        hold on
        plot(fe,periodograma_e/max(periodograma_e));
        legend({'E1','E2','E3','E4','E5','E6','E7','E8','E9','E10'})
        axis([0 Fs/2 0 1])
        x=sprintf('letraE(%d).wav',e);
        audiowrite(x,letra_E,Fs);
        pause(1)
        disp('Letra E creada correctamente')
    end
    e=e+1;
end
hold off
%% Letra I
i=1;
figure('Name','Letra I','NumberTitle','off')
while i<=10
    if i>=1 && i<=10
        di=['Menciona la letra I',num2str(i)];
        disp(di)
        recordblocking(objtAudio,2);
        letra_I=getaudiodata(objtAudio);
        Ni=length(letra_I);
        nFFT=2^(ceil(log2(Ni)))*FACTOR;
        Xn_FFT_i = fft(letra_I,nFFT);
        periodograma_i=abs(Xn_FFT_i);
        fi=linspace(0,Fs,nFFT);
        hold on
        plot(fi,periodograma_i/max(periodograma_i));
        legend({'I1','I2','I3','I4','I5','I6','I7','I8','I9','I10'})
        axis([0 Fs/2 0 1])
        x=sprintf('letraI(%d).wav',i);
        audiowrite(x,letra_I,Fs);
        pause(1)
        disp('Letra I creada correctamente')
    end
    i=i+1;
end
hold off
%% Letra O
o=1;
figure('Name','Letra O','NumberTitle','off')
while o<=10
    if o>=1 && o<=10
        do=['Menciona la letra O',num2str(o)];
        disp(do)
        recordblocking(objtAudio,2);
        letra_O=getaudiodata(objtAudio);
        No=length(letra_O);
        nFFT=2^(ceil(log2(No)))*FACTOR;
        Xn_FFT_o = fft(letra_O,nFFT);
        periodograma_o=abs(Xn_FFT_o);
        fo=linspace(0,Fs,nFFT);
        hold on
        plot(fo,periodograma_o/max(periodograma_o));
        legend({'O1','O2','O3','O4','O5','O6','O7','O8','O9','O10'})
        axis([0 Fs/2 0 1])
        x=sprintf('letraO(%d).wav',o);
        audiowrite(x,letra_O,Fs);
        pause(1)
        disp('Letra O creada correctamente')
    end
    o=o+1;
end
hold off
%% Letra U
u=1;
figure('Name','Letra U','NumberTitle','off')
while u<=10
    if u>=1 && u<=10
        du=['Menciona la letra U',num2str(u)];
        disp(du)
        recordblocking(objtAudio,2);
        letra_U=getaudiodata(objtAudio);
        Nu=length(letra_U);
        nFFT=2^(ceil(log2(Nu)))*FACTOR;
        Xn_FFT_u = fft(letra_U,nFFT);
        periodograma_u=abs(Xn_FFT_u);
        fu=linspace(0,Fs,nFFT);
        hold on
        plot(fu,periodograma_u/max(periodograma_u));
        legend({'U1','U2','U3','U4','U5','U6','U7','U8','U9','U10'})
        axis([0 Fs/2 0 1])
        x=sprintf('letraU(%d).wav',u);
        audiowrite(x,letra_U,Fs);
        pause(1)
        disp('Letra U creada correctamente')
    end
    u=u+1;
end
hold off