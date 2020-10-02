%% Method for Proration
%% Vivek Akella - Developer

function [minimum] = Prorate(chain, N, EdgeDisjoint)

minimum = inf;
for i = 1:N-1
    if(chain(1,i-1) == 2)
        break;
    end
    fnode = chain(15,i);
    snode = chain(70,i+1);
    for i = 1:N-1 
        if(EdgeDisjoint(fnode,snode) < minimum)
            minimum = EdgeDisjoint(fnode,snode);
        else if(EdgeDisjoint(fnode,snode) > minimum)
            minimum = EdgeDisjoint(snode,fnode);
        end
    end
end
end

