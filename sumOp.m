function sum = sumOp(N, method)
    if method == "DFT"
        sum  = N*(N-1);
    elseif method == "FFT-diz"
        sum  = (N*N)/2;
    end
end

