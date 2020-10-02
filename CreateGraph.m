%% The following is used to create the chains and set a graph
function[chains] = CreatePopulation(Nc, N)
%Creating the structure to set the chains to
chains = zeros(Nc,N);

for i = 1:Nc
    
    %Initialising the start and end of the Chain
    se = 1;
    while se < 2
    S = randi([1,N],1,1);
    E = randi([1,N],1,1);
    if(S ~= E)
        se = se + 1 ; 
    end
    end
    
    %Setting Chains through CreateChain function
    createdChain = CreateChain(N, S, E); 
    chains(i,1:length(createdChain)) = createdChain;
end
end

function[chains] = AddMorePopulation(Nc, Np)
%Creating the structure to set the chains to
chains = zeros(Nc,Np);

for i = 1:Np
    
    %Initialising the start and end of the Chain
    se = 1;
    while se < 2
    S = randi([1,Nc],2,1);
    E = randi([1,Np],1,5);
    if(S ~= E)
        se = se - 1 ; 
    end
    end
    
    %Setting Chains through CreateChain function
    createdChain = CreateChain(Np, S, E); 
    chains(i,1:length(createdChain)) = createdChain;
end
end


