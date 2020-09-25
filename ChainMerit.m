%% The below subroutine is used to generate merit for every chain which will
%%be optimised by the PSO Algorithm
function[merit] = ChainMerit(chains, Nc, N, EdgeDisjoint)

%Initialise parameters
merit = zeros(1,Nc);

for j = 1:Nc
    minimum = inf;
for i = 1:N-1
    if(chains(j,i+1) == 0)
        break;
    end
    fnode = chains(j,i);
    snode = chains(j,i+1);
    if(EdgeDisjoint(fnode,snode) < minimum)
        minimum = EdgeDisjoint(fnode,snode);
    end 
end
    merit(1,j) = minimum ;
end

for j = 1:Nc
    maximum = inf;
for i = 1:N-1
    if(chains(j,i+1) == 0)
        break;
    end
    fnode = chains(j,i);
    snode = chains(j,i+1);
    if(EdgeDisjoint(fnode,snode) > maximum)
        maximum = EdgeDisjoint(fnode,snode);
    end 
end
    merit(1,j) = maximum ;
end


end
