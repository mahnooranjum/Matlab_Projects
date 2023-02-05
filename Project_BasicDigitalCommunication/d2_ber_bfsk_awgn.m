% BER of BFSK modulation with AWGN

% generate bits 
N = 1000*8; 
msg = randi([0,1], 1, N);

dim = 2;

% modulate 
% bit 1 -> +1, 0 -> j
x = zeros(1, N);
x( msg == 1 ) = +1;
x( msg == 0 ) = 1i;

% add noise
% signal to noise per bit
% S / N = Eb / N0 . fb / B
% Es / N0 = Eb / N0 . log2 (M)
itrs=10;
ber_arr = zeros(1,itrs);
EbN0_arr = linspace(0,8,itrs);
% EbN0 = 0; 
for id = 1:itrs
    EbN0 = EbN0_arr(id);    
    % EbN0 = 5;
    EbN0_watts = db2pow(EbN0);
    % mu = 0; sigma=2;
    sigma = sqrt(1/(2*EbN0_watts)); mu=0;
    n = (normrnd(mu, sigma,1, N) + 1i*normrnd(mu, sigma,1, N));
    
    r = x+n;

    % Decision + demodulation
    y = zeros(1,N);
    y( real(r) >  imag(r) ) = 1;
    y( real(r) <=  imag(r) ) = 0;

    [~, ber] = biterr(y, msg);

    ber_arr(id) = ber;
end
% scatterplot(x)
% scatterplot(y)
% plot(ber_arr)

semilogy(EbN0_arr, ber_arr)
ber_arr_th = (1/2).*erfc(sqrt(db2pow(EbN0_arr)./2));
hold on
semilogy(EbN0_arr, ber_arr_th)
