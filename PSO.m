%% Problem Definition

CostFunction=@(chain) Objective(chain, N, EdgeDisjoint);        % Cost Function

N=10;            % Number of Decision Variables

%VarSize=[1 nVar];   % Size of Decision Variables Matrix

VarMin = 1;         % Lower Bound of Variables
VarMax = 10;         % Upper Bound of Variables


%% PSO Parameters

MaxIt=100;      % Maximum Number of Iterations

nPop = 20;        % Population Size (Swarm Size)

% PSO Parameters
%w=1;            % Inertia Weight
%wdamp=0.99;     % Inertia Weight Damping Ratio
%c1=1.5;         % Personal Learning Coefficient
%c2=2.0;         % Global Learning Coefficient

% If you would like to use Constriction Coefficients for PSO,
% uncomment the following block and comment the above set of parameters.

% % Constriction Coefficients
phi1=2.05;
phi2=2.05;
phi=phi1+phi2;
chi=2/(phi-2+sqrt(phi^2-4*phi));
w=chi;          % Inertia Weight
wdamp=1;        % Inertia Weight Damping Ratio
c1=chi*phi1;    % Personal Learning Coefficient
c2=chi*phi2;    % Global Learning Coefficient

% Velocity Limits
VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;

%% Initialization

empty_particle.Position=[];
empty_particle.Length=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];

particle=repmat(empty_particle,nPop,1);

GlobalBest.Cost = 0;



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

%% PSO Main Loop

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

BestSol = GlobalBest;
