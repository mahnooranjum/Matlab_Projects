function [x] = modulate_bpsk(msg, N)
%   MODULATE_BPSK Summary of this function goes here
%   Detailed explanation goes here
    x = zeros(1, N);
    x( msg == 1 ) = +1;
    x( msg == 0 ) = -1;
end

