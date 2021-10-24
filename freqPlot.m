function freqPlot(Xk, numFig, fs)
    figure(numFig);                          % Declaração da figura que vai plotar o sinal
    mag = abs(fftshift(Xk));                 % Obtenção da magnitude do sinal
    freq = -fs/2 : fs/(length(Xk)-1) : fs/2; % Eixo da frequência para plotagem do sinal
    stem(freq, mag);                         % Plotagem da magnitude do sinal
end

