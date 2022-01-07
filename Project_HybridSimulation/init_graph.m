function graph = init_graph(x, y, iter)
    figure();
    title({"Simulation ", num2str(iter)});
    
    axis([-x x -y y]);
    grid on;
    box on;
    hold on; 
    graph = gcf;

end

