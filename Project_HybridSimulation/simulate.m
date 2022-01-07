function [users, ...
          stations,...
          recvpower,...
          distances] = simulate(X,Y,n,mmSBS,umSBS,BS,nUsers,ptBS, ptmmSBS, ptumSBS, pd)
    
    %handle    = init_graph(X,Y,n);
    users     = init_hybrids(nUsers, n, pd); 
    stations  = init_stations(mmSBS,umSBS,BS,ptBS, ptmmSBS, ptumSBS, n); 
    %handle    = update_graph(users, stations);
    distances = get_distance(users,stations);
    pathloss  = get_pathloss(distances, stations);
    recvpower = get_pr(pathloss, stations, users);
    users     = set_association(users,recvpower);
    users     = get_SINR(users, stations, recvpower);
    [users,...
    stations] = get_rate(users, stations);
    stations  = get_prob(users, stations);
end

