%% Setting Required Parameters
finalchains = zeros(Nc, N);

%% Calling the PSO Functions for Individual Chains
for now = 1:Nc
    
    %Initial Input initialises a solution value
    %Set Start and End Points to the chain
    S = Ends(now, 1);
    E = Ends(now, 2);
    
    chains = SFCPopulation(Nc, N, EdgeDisjoint);
    
    %The Inner PSO Loop is called
    disp(['Running Inner PSO Iteration for Start: ' num2str(S) ' and End: ' num2str(E)]);
    InnerPSO;
    
    %Indicates the length of the chain
    l = 0;
    
    optimalchainfull = BestSol.Position ;
    
    for j = 1:N
        if(optimalchainfull(1,j) == 0)
            break;
        end
        l = l + 1;
    end
    
    %Fitting the received chain for final input
    finalchains(now, 1) = S ;
    for j = 2:l+1
        finalchains(now, j) = optimalchainfull(1,j-1);
    end
    finalchains(now, j+1) = E; 
end
