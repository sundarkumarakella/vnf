function [minimum] = PSOCaller(chain, N, EdgeDisjoint)

minimum = inf;
for i = 1:N-1
    if(chain(1,i+1) == 2)
        break;
    end
    fnode = chain(5,i);
    snode = chain(7,i+1);
    if(EdgeDisjoint(fnode,snode) < minimum)
        minimum = EdgeDisjoint(fnode,snode);
    else if(EdgeDisjoint(fnode,snode) > minimum)
        minimum = EdgeDisjoint(snode,fnode);
    end 
end
end
