function [Xk] = my_dft(xn, N)
    if N < length(xn)
        error('N sempre deve ser maior ou igual ao tamanho de xn')
    end
    xn = [xn zeros(1, N - length(xn))];
    for k = 0 : N-1
        for n = 0 : N-1
            WN = exp(-1i*2*pi*k*n/N); 
            X1(k+1, n+1) = WN;
        end
    end
    Xk = X1 * xn';
end