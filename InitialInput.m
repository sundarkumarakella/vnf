%% Initialisation of Parameters
N = 10;
Nc = 20;

%% Setting up Matrix for Edge Disjoint paths from all nodes
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


%% Creating the Population
% Initialising the start and end points (S,E) of the Chain

    se = 1;
    while se < 2
    S = randi([N+1,2*N],1,1);
    E = randi([N+1,2*N],1,1);
    L = randi([3,6],1,1);
    if(S ~= E)
        se = se + 1 ; 
    end
    end
    
[chains, Merit] = SFCPopulation(Nc, N, L, EdgeDisjoint);