function users = set_association(users,recvpower)
    temp = size(recvpower);
    for i = 1:temp(1)
        [t, idx] = max(recvpower(i,:));
        users.A(i)     = idx;
    end
    
%    stations.A(users.A) = 1;
end

