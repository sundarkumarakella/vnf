function [chains, Merit] = SFCPopulation(Nc, N, EdgeDisjoint)
%% Length of the chain
L = randi([3,6],1,1);

%% Create the population
chains = CreatePopulation(Nc, N, L);

%% Subroutine Check for Each Chain
%Subroutine without the checking of Over Flow flags
Merit = ChainMerit(chains, Nc, N, EdgeDisjoint);

end

function[chains] = CreatePopulation(Nc, N, L)

chains = zeros(Nc,N);

for i = 1:Nc
   
    se = 1;
    while se < 2
    S = randi([1,N],1,1);
    E = randi([1,N],1,1);
    if(S ~= E)
        se = se + 1 ; 
    end
    end
    
    %Setting Chains through CreateChain function
    createdChain = CreateChain(N, L); 
    chains(i,1:length(createdChain)) = createdChain;
end
end
