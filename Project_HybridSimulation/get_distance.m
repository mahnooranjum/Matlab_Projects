function mat = get_distance(users,stations)
    temp = size(users);
    rows = temp(1);
    temp = size(stations);
    cols = temp(1);
    
    mat = zeros(rows, cols);
    
    for i = 1:rows 
        mat(i,:) = sqrt( (users.X(i) - stations.X').^2 + ...
                         (users.Y(i) - stations.Y').^2 );
    end
        
end

