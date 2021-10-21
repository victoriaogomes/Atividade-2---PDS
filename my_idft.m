function [resultado] = my_idft(Xk, N)
    aux = zeros(1, N);
    for n=0:N-1
        for k=0:N-1
            WN = exp(1i*2*pi*k*n/N);
            aux(n+1) = aux(n+1) + Xk(k+1)*WN;
        end
    end
    resultado = (1/N)*aux;
end

