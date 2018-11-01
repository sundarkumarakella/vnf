%% The below subroutine is used to generate merit for every chain which will
%%be optimised by the PSO Algorithm
function[merit] = ChainMeritWithFlags(chains, Nc, N, EdgeDisjoint, CapacityOverflow, BandwidthOverflow)

%Initialise parameters
merit = zeros(1,Nc);

if(~(CapacityOverflow == true || BandwidthOverflow == true))

for j = 1:Nc
for i = 1:N
    if(chains(j,i+1) == 0)
        break;
    end
    fnode = chains(j,i);
    snode = chains(j,i+1);
    
    merit(1,j) = merit(1,j) + EdgeDisjoint(fnode,snode);
end %End i
end %end j

else
    merit = -1 * ones(1,Nc);
end

end