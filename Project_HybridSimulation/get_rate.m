function [users, stations] = get_rate(users, stations)    
    associations = groupsummary(users,{'A'});
    associations.Type = stations.Type(associations.A);
    tempo = size(stations);
    for i=1:tempo(1)
        if ismember( stations.Id(i), associations.A)
        stations.BW(i) = stations.BW(i)/ associations.GroupCount(associations.A == stations.Id(i));
        end
    end
    tempo = size(users);
    for i = 1:tempo(1)
        users.Rate(i) = stations.BW( users.A(i) == stations.Id ).*log2(1+users.SINR(i)); 
    end

end

