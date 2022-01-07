function users = init_hybrids(n, iter, distro)
    
% X, Y coordinates 
% Interference   
% Rate 
% Received Power 
% SINR 

% rng(iter);
Id = 1:n;
Id = Id';
%I = zeros(n,1);
A = zeros(n,1) - 1;
%Pr = zeros(n,1);
Rate = zeros(n,1);
SINR = zeros(n,1);
Fading = random(distro, n, 1);
theta = 360.*rand(n,1);
r = randi([1 800],n,1);
[X, Y] = pol2cart(theta, r);
users = table(Id, X, Y, A, Rate, SINR, Fading);

end

