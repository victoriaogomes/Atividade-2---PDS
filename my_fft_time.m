function [Xk] = my_fft_time(xn,N)
    if N < length(xn)
        error('N sempre deve ser maior ou igual ao tamanho de xn')
    end
    xn = [xn zeros(1, N - length(xn))];
    Xk = zeros(1, N);
    for k = 0 : N-1
        WN = exp(-1i*2*pi*k/N);
        for n = 0 :((N/2)-1)
            WNMEIOS = exp(-1i*2*pi*k*n/(N/2));
            Xkpar(n+1) = xn((2*n)+1);
            Xkimpar(n+1) = xn((2*n+1)+1);
            Xk(k+1) = Xk(k+1) + Xkpar(n+1)*WNMEIOS + WN*Xkimpar(n+1)*WNMEIOS;
        end
    end
end

