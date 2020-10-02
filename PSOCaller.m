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


function [minimum] = MultipleCalls(chain, N, EdgeDisjoint)

N = 20;


Ends = zeros(N,2);


    for i = 1:Nc
        
    se = 1;
    while se < 2
    Ends(i,1) = randi([N+1,2*N],1,1);
    Ends(i,2) = randi([N+1,2*N],1,1);
    if(Ends(i,1) ~= Ends(i,2))
        se = se + 1 ; 
    end
    
    end
    
    end
end
