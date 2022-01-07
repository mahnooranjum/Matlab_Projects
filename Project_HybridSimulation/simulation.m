X = 1000;   Y = 1000;        n = 10; 
mmSBS = 1:0+n;  umSBS = 1:0+n;       BS = 1;       nUsers = 300; 
ptBS = 46;  ptmmSBS = 30;    ptumSBS = 30; 
pd = makedist('Nakagami', 'mu', 3, 'omega', 3);

rate = zeros(n,100);

for j=1:n
    for i=1:100
        [users,   ...
        stations, ...
        recvpower,...
        distances] = simulate(X,Y,i*i*i,mmSBS(j),umSBS(j),BS,nUsers,ptBS, ptmmSBS, ptumSBS, pd);
        rate(j, i) = sum(users.Rate);
    end
    init_graph(X,Y,j);
    update_graph(users, stations);
end

rate(isnan(rate))=0;
plot(sum(rate'));
% %% (mmSBS,rate,umSBS,rate)
% hold on, box on, grid on
% plot(umSBS,rate, 'b', 'linew', 1.5);
% legend("Number of SBS")
% title("Sum Rate versus # of SBS")
% 
% %% (mmSBS,rate,umSBS,rate)
% hold on, box on, grid on
% yyaxis left
% plot(mmSBS,rate, 'b', 'linew', 1.5);
% yyaxis right
% plot(umSBS,(rate), 'r', 'linew', 1.5);
% hold off
% legend("mmWave", "umWave")
% title("Y-Y Plot of the number of small base stations")
% 
% %%