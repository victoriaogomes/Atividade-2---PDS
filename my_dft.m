function [resultadoF] = my_dft(xn,N)
    tamanho=length(xn);
    if(N<tamanho)
        error('N sempre deve ser maior ou igual a L')
    end
    xn=[xn zeros(1, N-tamanho)];
    for k=0:N-1
        for n=0:N-1
            WN=exp(-1i*2*pi*k*n/N); %Sem utilizar identidade de Euler, pois o MatLab consegue trabalhar com variáveis complexas
            X1(k+1, n+1) = WN;
        end
    end
    resultadoF = X1*xn';
end