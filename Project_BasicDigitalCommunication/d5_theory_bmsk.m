
M = 4;
k = log2(M);
N = 1000*8; 
msg = randi([0,1], 1, N);

msg_tomod = reshape(msg,k , length(msg)/k );

msg_tomod = bi2de(msg_tomod', 'left-msb');
x = pskmod(msg_tomod, M, pi/M);

itrs=10;
ber_arr = zeros(1,itrs);
EbN0_arr = linspace(0,8,itrs);

ber_arr_th = (1/k)*2*(1-sqrt(1/M)).*erfc(sqrt(3*k.*(db2pow(EbN0_arr))./(2*(M-1))));semilogy(EbN0_arr, ber_arr_th)
semilogy(EbN0_arr, ber_arr_th)