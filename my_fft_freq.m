function [X] = my_fft_freq(xn,N)
    tamanho = length(xn);
    if(N < tamanho)
        error('N sempre deve ser maior ou igual a L')
    end
    xn=[xn zeros(1, N-tamanho)];
    X = zeros(1, N);
    Xpar = zeros(1, N/2);
    Ximpar = zeros(1, N/2);
    for k=0:((N/2)-1)
        for n=0:((N/2)-1)
            W2NK = exp(-2*1i*2*pi*k*n/N);
            WN = exp(-1i*2*pi*n/N);
            Xpar(k+1) = Xpar(k+1) + (xn(n+1)+ xn(n+1+(N/2)))*W2NK;
            Ximpar(k+1) = Ximpar(k+1) + (xn(n+1) - xn(n+1+(N/2)))*W2NK*WN;
        end
    end
    for k=0:N-1
        if ~rem(k, 2)
            X(k+1) = Xpar(((k-rem(k, 2))/2)+1);
        else
            X(k+1) = Ximpar(((k-rem(k, 2))/2)+1);
        end
     end
end

