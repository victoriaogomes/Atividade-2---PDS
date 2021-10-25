function [Xk] = my_fft_freq(xn,N)
    if(N < length(xn))
        error('N sempre deve ser maior ou igual ao tamanho de xn')
    end
    xn = [xn zeros(1, N - length(xn))];
    Xk = zeros(1, N);
    Xpar = zeros(1, N/2);
    Ximpar = zeros(1, N/2);
    for k = 0 : ((N/2)-1)
        for n = 0 : ((N/2)-1)
            W2NK = exp(-2*1i*2*pi*k*n/N);
            WN = exp(-1i*2*pi*n/N);
            Xpar(k+1) = Xpar(k+1) + (xn(n+1)+ xn(n+1+(N/2)))*W2NK;
            Ximpar(k+1) = Ximpar(k+1) + (xn(n+1) - xn(n+1+(N/2)))*W2NK*WN;
        end
    end
    for k = 0 : N-1
        if ~rem(k, 2)
            Xk(k+1) = Xpar(((k-rem(k, 2))/2)+1);
        else
            Xk(k+1) = Ximpar(((k-rem(k, 2))/2)+1);
        end
     end
end

