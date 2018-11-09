function [chains, Merit] = SFCPopulation(Nc, N, EdgeDisjoint)
%% Length of the chain
L = randi([3,6],1,1);

%% Create the population
chains = CreatePopulation(Nc, N, L);

%% Subroutine Check for Each Chain
%Subroutine without the checking of Over Flow flags
Merit = ChainMerit(chains, Nc, N, EdgeDisjoint);

end