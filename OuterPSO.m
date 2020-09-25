for i=1:nPop
    
    % Initialize Position
    particle(i).Position = chains(i,1:N);
    
    % Initialize Length
    nodes = 0;
    for l = 1:N
        if(chains(i,l) == 0)
            break;
        end
        nodes = nodes + 1;
    end
    particle(i).Length = nodes;
    
    % Initialize Velocity
    particle(i).Velocity=zeros(1,N);
    
    % Evaluation
    particle(i).Cost=CostFunction(particle(i).Position);
    
    % Update Personal Best
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    
    % Update Global Best
    if particle(i).Best.Cost>GlobalBest.Cost
        
        GlobalBest=particle(i).Best;
        
    end
    
end

BestCost=zeros(MaxIt,1);



for it=1:MaxIt
    
    for i=1:nPop
              
        % Update limits
        update = zeros(1,N);
        k = 1;
        while(k <= particle(i).Length)
            update(1,k) = 1;
            k = k + 1;
        end
        
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(1,N).*(particle(i).Best.Position-particle(i).Position).*update ...
            +c2*rand(1,N).*(GlobalBest.Position-particle(i).Position).*update ;
        
        % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);
        
        % Update Position
        particle(i).Position = round(particle(i).Position + particle(i).Velocity);
                
        % Velocity Mirror Effect
        IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);
        
        % Apply Position Limits
        particle(i).Position = max(particle(i).Position,VarMin);
        particle(i).Position = min(particle(i).Position,VarMax);
        
        % The Position is set to 0 where it exceeds the Length
        for k = particle(i).Length+1 : N
             particle(i).Position(1,k) = 0;
        end
        
        % Evaluation
        particle(i).Cost = CostFunction(particle(i).Position);
        
        % Update Personal Best
        if particle(i).Cost>particle(i).Best.Cost
            
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            
            % Update Global Best
            if particle(i).Best.Cost>GlobalBest.Cost
                
                GlobalBest=particle(i).Best;
                
            end
            
        end
        
    end
    
    BestCost(it)=GlobalBest.Cost;
    
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    w=w*wdamp;
    
end

