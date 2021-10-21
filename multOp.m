function mult = multOp(N, method)
    if method == "DFT"
        mult = N*N;
    elseif method == "FFT-diz"
        mult = N + (N*N)/2;
    end
end