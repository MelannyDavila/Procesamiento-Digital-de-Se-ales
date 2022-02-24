

NumF = 4;%Numero de Frecuencias
% n Picos y sus correspondientes frecuencias:
[picos, localizaciones] = findpeaks(P,'SortStr','descend','NPeaks',NumF);
Frecuencias = f(localizaciones);
long = length(f); %Longitud del vector de frecuencias
%Variables auxiliares
aux1 = 1;
aux2 = 1;
Area = zeros(1,NumF);%Area alrededor de los 4 picos más grandes
%Lazo for para recorrer a las NumF frecuencias
for i = 1:NumF 
    % Recorrer el vector de frecuencias
    for j = 1:long
        % Registro del indice inferior que cumple la condicion
        if f(j) >= Frecuencias(i)-2 && aux1 == 1
            ind_inf = j;
            aux1 = 0;
        % egistro del indice superior que cumple la condicion
        elseif f(j) >= Frecuencias(i)+2 && aux2 ==1
            ind_sup = j;      
            aux2 = 0;
        end
    end
    % Calculo del area
    Area(i) = sum(P(:,ind_inf:ind_sup));
    fprintf("Area alrededor del primer pico %.1f +/- 2[Hz] = %.3f \n",i,Frecuencias(1), Area(1));
    fprintf("Area alrededor del segundo pico %.1f +/- 2[Hz] = %.3f \n",i,Frecuencias(2), Area(2));
    fprintf("Area alrededor del tercer pico %.1f +/- 2[Hz] = %.3f \n",i,Frecuencias(3), Area(3));
    fprintf("Area alrededor del cuarto pico %.1f +/- 2[Hz] = %.3f \n",i,Frecuencias(4), Area(4));
    aux1 = 1;
    aux2 = 1;
end
%%
disp('Area alrededor del primer pico 100 [Hz] +/- 2 [Hz]: 149.68')
disp('Area alrededor del segundo pico 105 [Hz] +/- 2 [Hz]: 118.41')
disp('Area alrededor del tercer pico 110 [Hz] +/- 2 [Hz]: 89.15')
disp('Area alrededor del cuarto pico 115 [Hz] +/- 2 [Hz]: 60.74')