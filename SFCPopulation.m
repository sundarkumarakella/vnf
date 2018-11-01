function [chains, Merit] = SFCPopulation(Nc, N, L, EdgeDisjoint)
%% Create the population
chains = CreatePopulation(Nc, N, L);

%% Subroutine Check for Each Chain
%Subroutine without the checking of Over Flow flags
Merit = ChainMerit(chains, Nc, N, EdgeDisjoint);

end