function mat = get_pr(pathloss, stations, users)
    temp = size(pathloss);
    mat  = zeros(temp); 
    for i = 1:temp(1)
        for j = 1:temp(2)
            mat(i,j) = get_pr_cell(stations.Pt(j),...
                                   pathloss(i, j),...
                                   users.Fading(i));
        end
    end
end

