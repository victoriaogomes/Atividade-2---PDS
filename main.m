Ts = 1/500;                       % Período de amostragem (em segundos)
t =  @(n) n.*Ts;                  % Definição do tempo do amostrado: x[n] é obtido quando t = n*Ts
xc = @(t) 1*sin(20*pi*60*t) + ... % Sinal inicial (já amostrado)
          3*sin(2*pi*240*t) + ...
          4*sin(2*pi*120*t) + ...
          sin(2*pi*180*t);
%% Definição dos vetores de n para cada uma das quantidades de amostras utilizadas      
n32 = 0:1:31;      
n64 = 0:1:63;
n128 = 0:1:127;
n256 = 0:1:255;
n512 = 0:1:511;
n1024= 0:1:1023;
%% Alternativa (a)
% Calcule a DFT e FFTs de x[n] usando 32 amostras do sinal
signal = xc(t(n32));
dft_a = my_dft(signal, 32);
fft_time_a = my_fft_time(signal, 32);
fft_freq_a = my_fft_freq(signal, 32);
% figure(1)
% stem(n32 - 16, fftshift(abs(dft_a/16)));

%% Alternativa (b)
% Aumente o comprimento para 64 amostras, acrescentando 32 zeros às amostras de x[n], 
% do item anterior, e calcule a DFT e FFTs do novo x[n]
signal = xc(t(n32));
dft_b = my_dft(signal, 64)/32;
fft_time_b = my_fft_time(signal, 64)/32;
fft_freq_b = my_fft_freq(signal, 64)/32;
%figure(2)
%stem(n64 - 32, dft_b);

%% Alternativa (c)
% Repita o processo dos itens (a) e (b), para o sinal x[n] com 64, 128, 256 e 512 amostras
%- Repetindo a alternativa (a)
signal = xc(t(0:1:63));
dft_c_a_64 = my_dft(signal, 64)/32;
fft_time_c_a_64 = my_fft_time(signal, 64)/32;
fft_freq_c_a_64 = my_fft_freq(signal, 64)/32;
%figure(3)
%stem(n64 - 32, dft_c_a_64);

signal = xc(t(0:1:127));
dft_c_a_128 = my_dft(signal, 128)/64;
fft_time_c_a_128 = my_fft_time(signal, 128)/64;
fft_freq_c_a_128 = my_fft_freq(signal, 128)/64;
%figure(4)
%stem(n128 - 64, dft_c_a_128);

signal = xc(t(0:1:255));
dft_c_a_256 = my_dft(signal, 256)/128;
fft_time_c_a_256 = my_fft_time(signal, 256)/128;
fft_freq_c_a_256 = my_fft_freq(signal, 256)/128;
%figure(5)
%stem(n256 - 128, dft_c_a_256);

signal = xc(t(0:1:511));
dft_c_a_512 = my_dft(signal, 512)/256;
fft_time_c_a_512 = my_fft_time(signal, 512)/256;
fft_freq_c_a_512 = my_fft_freq(signal, 512)/256;
%figure(6)
%stem(n512 - 256, dft_c_a_512);

%- Repetindo a alternativa (b)
signal = xc(t(0:1:63));
dft_c_b_128 = my_dft(signal, 128)/64;
fft_time_c_b_128 = my_fft_time(signal, 128)/64;
fft_freq_c_b_128 = my_fft_freq(signal, 128)/64;
%figure(7)
%stem(n128 - 64, dft_c_b_128);

signal = xc(t(0:1:127));
dft_c_b_256 = my_dft(signal, 256)/128;
fft_time_c_b_256 = my_fft_time(signal, 256)/128;
fft_freq_c_b_256 = my_fft_freq(signal, 256)/128;
%figure(8)
%stem(n256 - 128, dft_c_b_256);

signal = xc(t(0:1:255));
dft_c_b_512 = my_dft(signal, 512)/256;
fft_time_c_b_512 = my_fft_time(signal, 512)/256;
fft_freq_c_b_512 = my_fft_freq(signal, 512)/256;
%figure(9)
%stem(n512 - 256, dft_c_b_512);

signal = xc(t(0:1:511));
dft_c_b_1024 = my_dft(signal, 1024)/512;
fft_time_c_b_1024 = my_fft_time(signal, 1024)/512;
fft_freq_c_b_1024 = my_fft_freq(signal, 1024)/512;
fft_c_a_matlab_1024 = fft(signal, 1024)/512;
%figure(10)
%stem(n1024 - 512, dft_c_b_1024);

%% Alternativa (d)
% Comente os resultados, mostrando numa tabela comparativa a quantidade de operações 
% realizadas (somas e produtos)
N = [32;64;128;256;512;1024];
SomasDft = [sumOp(32, "DFT");sumOp(64, "DFT");sumOp(128, "DFT");sumOp(256, "DFT");sumOp(512, "DFT");sumOp(1024, "DFT")];
ProdutosDft = [multOp(32, "DFT");multOp(64, "DFT");multOp(128, "DFT");multOp(256, "DFT");multOp(512, "DFT");multOp(1024, "DFT")];
SomasFft = [sumOp(32, "FFT-diz");sumOp(64, "FFT-diz");sumOp(128, "FFT-diz");sumOp(256, "FFT-diz");sumOp(512, "FFT-diz");sumOp(1024, "FFT-diz")];
ProdutosFft = [multOp(32, "FFT-diz");multOp(64, "FFT-diz");multOp(128, "FFT-diz");multOp(256, "FFT-diz");multOp(512, "FFT-diz");multOp(1024, "FFT-diz")];
table(N, SomasDft, SomasFft, ProdutosDft, ProdutosFft)

%% Alternativa (e)
% Calcule a iDFTs para todos os DFTs realizados e apresente os sinais
% reconstruídos x(t) e compare com o sinal x(t)
figure(1);
signal = xc(0:0.002:0.002*31);
plot(0:0.002:0.002*31, signal);
idft_a = my_idft(dft_a, 32);
figure(2);
plot(n32, idft_a);

signal = xc(t(0:1:31));
idft_b = my_idft(dft_b, 64);

%plotIDFT(idft_b, signal, 64);

signal = xc(t(0:1:63));
idft_c_a_64 = my_idft(dft_c_a_64, 64);

signal = xc(t(0:1:127));
idft_c_a_128 = my_idft(dft_c_a_128, 128);

signal = xc(t(0:1:255));
idft_c_a_256 = my_idft(dft_c_a_256, 256);

signal = xc(t(0:1:511));
idft_c_a_512 = my_idft(dft_c_a_512, 512);

signal = xc(t(0:1:63));
idft_c_b_128 = my_idft(dft_c_b_128, 128);

signal = xc(t(0:1:127));
idft_c_b_256 = my_idft(dft_c_b_256, 256);

signal = xc(t(0:1:255));
idft_c_b_126 = my_idft(dft_c_b_512, 512);

signal = xc(t(0:1:511));
idft_c_b_1024 = my_idft(dft_c_b_1024, 1024);