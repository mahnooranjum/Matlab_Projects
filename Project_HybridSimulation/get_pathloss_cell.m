function Pl = get_pathloss_cell(dist, freq, alpha)
    Pl = 20*log10(4*pi*freq/3e8)+10*alpha*log10(dist);
    % use ro formula
    % use nlos los for mmwave
    % uhf nakagami 
    % rayleigh LOS sbs mm 
    % rician NLOS sbs mm
end