function [X] = my_fft_time(xn,N)
    tamanho = length(xn);
    if(N < tamanho)
        error('N sempre deve ser maior ou igual a L')
    end
    xn=[xn zeros(1, N-tamanho)];
    X = zeros(1, N);
    for k=0:N-1
        WN = exp(-1i*2*pi*k/N);
        for n=0:((N/2)-1)
            WNMEIOS = exp(-1i*2*pi*k*n/(N/2));
            Xpar(n+1) = xn((2*n)+1);
            Ximpar(n+1) = xn((2*n+1)+1);
            X(k+1) = X(k+1) + Xpar(n+1)*WNMEIOS + WN*Ximpar(n+1)*WNMEIOS;
        end
    end
end

