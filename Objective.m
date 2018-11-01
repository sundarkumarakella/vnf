function [minimum] = Objective(chain, N, EdgeDisjoint)

minimum = inf;
for i = 1:N-1
    if(chain(1,i+1) == 0)
        break;
    end
    fnode = chain(1,i);
    snode = chain(1,i+1);
    if(EdgeDisjoint(fnode,snode) < minimum)
        minimum = EdgeDisjoint(fnode,snode);
    end 
end
end