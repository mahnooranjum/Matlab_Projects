function mat = get_pathloss(distances, stations)
    temp = size(distances);
    mat  = zeros(temp); 
    for i = 1:temp(1)
        for j = 1:temp(2)
            mat(i,j) = get_pathloss_cell(distances(i, j), ...
                                         stations.Fo(j), ...
                                         stations.Alpha(j));
        end
    end

end

