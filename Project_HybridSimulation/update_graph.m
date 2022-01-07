function handle = update_graph(users, stations)
scatter(users.X, users.Y, 'c', 'fill');
scatter(stations.X(stations.Type == 0), stations.Y(stations.Type == 0), 'r', 'fill');
scatter(stations.X(stations.Type == 1), stations.Y(stations.Type == 1), 'g', 'fill');
scatter(stations.X(stations.Type == 2), stations.Y(stations.Type == 2), 'b', 'fill');
handle = gcf;
end

