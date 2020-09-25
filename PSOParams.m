MaxIt=100;      

nPop = 20; 


for i=1:nPop
    

    particle(i).Position = chains(i,1:N);

    nodes = 0;
    for l = 1:N
        if(chains(i,l) == 0)
            break;
        end
        nodes = nodes + 1;
    end
    particle(i).Length = nodes;

    particle(i).Velocity=zeros(1,N);
    

    particle(i).Cost=CostFunction(particle(i).Position);
    

    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    

    if particle(i).Best.Cost>GlobalBest.Cost
        
        GlobalBest=particle(i).Best;
        
    end
    
end
