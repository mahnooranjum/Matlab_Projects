function out = bi2oct(g1)
g1 = bi2de(g1);
g1 = dec2base(g1, 8);
out = str2num(g1);
end