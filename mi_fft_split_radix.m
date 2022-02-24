function X = mi_fft_split_radix(X, N)
%% Número de etapas del algoritmo split-radix requeridas para computar la DFT de X tomada en base al numero de elementos que tiene el vector.
aux=log2(N); 

%% Creación del vector con el número de bloques de mariposas de cada etapa
vnumBSR(1)=1;%Se asugna el valor de uno 1 ya que se empieza con una mariposa
for j=2:1:aux
    vnumBSR(j)=2*vnumBSR(j-1)+(-1)^(j-1);%Posteriormente, se calcula el número de bloques de mariposas presente en cada etapa.
end


%% Para inicializar el while_1
etapa=0; 

%% Número de bloques de mariposas split-radix presentes en una etapa
numBSR=1; %valor inicial (etapa 0)

%% Logitud del bloque de mariposas split-radix 
num=N; %valor inicial (etapa 0)

%% Primer exponente del factor de giro
r=1; %valor inicial (etapa 0)

%% Ejecución de las etapas del algoritmo
while etapa<(aux-1) %while_1 
   %Se verifica que el numero sea par o impar.
    if mod(etapa,2)==0 %si la etapa actual es par
        a=1; b=num/4;
    else
        a=1+num/2;
        b=num/4+num/2;
    end
    
    %Ejecucion de los bloques de mariposas split-radix de la etapa actual
    for h=1:1:numBSR  %for_1
        
        %Segundo exponente del factor de giro
        p=0;  %valor inicial (en la primera mariposa del bloque)
        
        %Ejecución de las mariposas split-radix de cada bloque 
        for n=a:1:b %for_2
            temp3=X(n)+X(n+num/2);
            temp4=X(n+num/4)+X(n+3*num/4);
            temp1=X(n)-X(n+num/2);
            temp2=X(n+num/4)-X(n+3*num/4);
            X(n+num/4)=temp3;
            X(n+num/2)=temp4;
            
            %Si la longitud del bloque es superior a 4
            %sus mariposas tienen factores de giro
            if num>4  
                q=p*r; s=3*p*r;
            else
                q=0; s=0; 
            end
            
            X(n)=(temp1-1i*temp2)*exp(-1i*2*pi*q/N);
            X(n+3*num/4)=(temp1+1i*temp2)*exp(-1i*2*pi*s/N);
            p=p+1;
            
        end
        
        a=a+num+2*num/4;
        b=b+num+2*num/4;
    end
    
    etapa=etapa+1;
    numBSR=vnumBSR(etapa+1);
    num=num/2;
    r=2*r;
end
    
%% Etapa final de mariposa radix-2
if mod(etapa,2)==0 %si la etapa final es par
    k=1;
else
    k=2;
end

% Ejecución de las mariposas radix-2 de la etapa final 
for h=1:1:numBSR  %for_3
    temp1=X(k)+X(k+1);
    temp2=X(k)-X(k+1);
    X(k)=temp1;
    X(k+1)=temp2;
    
    k=k+3;
end

%% Ordenamiento a bit reverso
etapa=aux-2; %inicia desde la penultima etapa hacia la etapa 0
num=4;

% Ejecución de las etapas de ordenamiento
 while etapa>=0  %while_2
     salto=num/4;
     numBSR=vnumBSR(etapa+1);
     
    if mod(etapa,2)==0
        a=1; b=num/4;
    else
        a=1+num/2; b=num/4+num/2;
    end
    
    %Ejecución del ordenamiento en cada bloque de la presente etapa
    for h=1:1:numBSR  %for_4
        
        %Dos intercambios en las salidas de cada mariposa
        for k=1:1:2  %for_5
            
            %Ejecución del ordenamiento en cada mariposa del presente bloque
            for n=a:1:b  %for_6
                temp=X(n+salto);
                X(n+salto)=X(n);
                X(n)=temp;
            end
            a=a+salto; b=b+salto;
        end
        a=a+num; b=b+num;
    end
    etapa=etapa-1;
    num=2*num;
 end
 
 
%% Ordenamiento de bit reverso a orden natural
for k=1:1:N-2  %for_7
    y=dec2bin(k,aux); %de base decimal a binaria
    z=fliplr(y);  %reversion de los bits de "y"
    w=bin2dec(z); %de binario a decimal
    
    %Cambio de posiciones entre la muestra de la posicion "k" y la 
    %de su posición equivalente reversa "w" 
    if w>k
        temp=X(w+1);
        X(w+1)=X(k+1);
        X(k+1)=temp;
    end
end
end



