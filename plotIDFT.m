function plotIDFT(my_xn, xn_real, N)
    tamanho = length(xn_real);
    xn_real=[xn_real zeros(1, N-tamanho)];
    n = 0 : N-1;
    stem(n, my_xn, 'r');
    hold on
    stem(n, xn_real, 'b');
    hold on
    xlabel('n');
    ylabel('x[n]');
    legend('abc', 'dfg');
    hold off
end

