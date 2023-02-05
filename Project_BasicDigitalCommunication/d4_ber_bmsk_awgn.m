% BER of BFSK modulation with AWGN

% generate bits 

M = 4;
k = log2(M);
N = 1000*8; 
msg = randi([0,1], 1, N);

msg_tomod = reshape(msg,k , length(msg)/k );

% modulate 
% bit 1 -> +1, 0 -> j
msg_tomod = bi2de(msg_tomod', 'left-msb');
x = pskmod(msg_tomod, M, pi/M);
% x = qammod(msg_tomod, M);
% scatterplot(x)
% EbN0 = 10;
% r = awgn(x, EbN0);
% scatterplot(r)


% add noise
% signal to noise per bit
% S / N = Eb / N0 . fb / B
% Es / N0 = Eb / N0 . log2 (M)
itrs=10;
ber_arr = zeros(1,itrs);
EbN0_arr = linspace(0,8,itrs);
% EbN0 = 0; 
% for id = 1:itrs
%     EbN0 = EbN0_arr(id);    
    % EbN0 = 5;
%     EbN0_watts = db2pow(EbN0);
    % mu = 0; sigma=2;
%     sigma = sqrt(1/(2*EbN0_watts)); mu=0;
%     n = (normrnd(mu, sigma,1, N) + 1i*normrnd(mu, sigma,1, N));
%     
%     r = x+n;
%     r = awgn(x, EbN0);
    % Decision + demodulation
%     y = zeros(1,N);
%     y( real(r) >  imag(r) ) = 1;
%     y( real(r) <=  imag(r) ) = 0;
% 
%     [~, ber] = biterr(y, msg);
% 
%     ber_arr(id) = ber;
% end
% scatterplot(x)
% scatterplot(y)
% plot(ber_arr)

% semilogy(EbN0_arr, ber_arr)
ber_arr_th = (1/k)*2*(1-sqrt(1/M)).*erfc(sqrt(3*k.*(db2pow(EbN0_arr))./(2*(M-1))));semilogy(EbN0_arr, ber_arr_th)
semilogy(EbN0_arr, ber_arr_th)