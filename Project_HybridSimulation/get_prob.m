function stations = get_prob(users, stations)
    associations = groupsummary(users,'A');
    associations.prob = associations.GroupCount ./ sum(associations.GroupCount);
    tempo = size(stations);
    for i=1:tempo(1)
        if ismember( stations.Id(i), associations.A)
        stations.Prob(i) = associations.prob(associations.A == stations.Id(i));
        end
    end
end

