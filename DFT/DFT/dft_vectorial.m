function [Xk] = dft_vectorial(xn)
N=length(xn);
n= [0:N-1];       % vector fila para n
k= [0:N-1];       % vector fila para k
WN= exp(-1j*2*pi/N); % notaci�n de la exponencial compleja.
nk= n'*k;     %Creaci�n de la variable nk que contiene los distintos
%valores de n y k
WNnk= WN .^nk;      % notaci�n de la exponencial compleja.
Xk = xn*WNnk ;    % Vector fila con los Coeficientes DFS
end

