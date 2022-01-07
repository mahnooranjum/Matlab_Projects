function users = get_SINR(users,stations, recvpower)
    associations = groupsummary(users,'A');
    interference = (sum(recvpower,2) - max(recvpower, [], 2));
    tempo = size(recvpower);
    for i = 1:tempo(1)
        noise        = 10 - 204 + ...
                       10*log10(stations.BW(...
                       users.A(i))./associations.GroupCount(associations.A == users.A(i)));
        noise = db2pow(noise);
        users.SINR(i)   = max(recvpower(i,:))/ (interference(i) + noise); 
    end
end

