%% Setting up Matrix for Edge Disjoint paths from all nodes
N = 10;

EdgeDisjoint = zeros(N,N);
for i = 1:N
    for j = 1:N
        if(i == j)
            EdgeDisjoint(i,j) = 0 ;
            continue;
        end
        if(i > j)
            continue;
        end
        paths = randi([1,4],1,1);
        EdgeDisjoint(i,j) = paths;
        EdgeDisjoint(j,i) = paths;
    end
end
