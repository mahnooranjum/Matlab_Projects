function stations = init_stations(mmSBS,umSBS,BS,ptBS, ptmmSBS, ptumSBS,iter)

% X 
% Y
% Frequency of Operation 
% Tranmission Power 
% BW
% Association Probability 

% rng(iter);
n = mmSBS + umSBS + BS;
mm = 28e9;
um = 2.4e9;
mmBW = 2e9;
umBW = 20e6;
mmAlpha = 2;
%umAlphaSBS = 2;
umAlpha = 3;
Id = 1:n;
Id = Id';
Fo = zeros(n,1);
Pt = zeros(n,1);
BW = zeros(n,1);
Alpha = zeros(n,1);
Prob = zeros(n,1);
Type = zeros(n, 1);
theta = 360.*rand(n,1);
r = randi([100 800],n,1);
[X, Y] = pol2cart(theta, r);
% X = randi([1 1000],n,1);
% Y = randi([1 1000],n,1);
stations = table(Id, X, Y, Fo, Pt, BW, Prob, Alpha, Type);

stations.X(1) = 0; 
stations.Y(1) = 0;
stations.Type(1) = 0;

stations.Type(2:1+mmSBS) = 1; 
stations.Type(2+mmSBS:1+mmSBS+umSBS) = 2;

stations.Fo(stations.Type == 0) = um;
stations.BW(stations.Type == 0) = umBW;
stations.Pt(stations.Type == 0) = ptBS;
stations.Alpha(stations.Type == 0) = umAlpha;


stations.Fo(stations.Type == 1) = mm;
stations.BW(stations.Type == 1) = mmBW;
stations.Pt(stations.Type == 1) = ptmmSBS;
stations.Alpha(stations.Type == 1) = mmAlpha;

stations.Fo(stations.Type == 2) = um;
stations.BW(stations.Type == 2) = umBW;
stations.Pt(stations.Type == 2) = ptumSBS;
stations.Alpha(stations.Type == 2) = mmAlpha;


end

