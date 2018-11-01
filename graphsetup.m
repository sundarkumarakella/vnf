%% Create Chains with Nodes 
Nc = 20;
N = 10;

%Assuming all the function require same Capacities
Freq = 400;

%Bandwidth Setup
BandwdthReq = 200 ;
Bandwidth = 1200;

chains = CreatePopulation(Nc, N, S, E, L);

%Setting up Matrix for Edge Disjoint paths
EdgeDisjoint = zeros(N,N);
for i = 1:N
    for j = 1:N
        if(i == j)
            EdgeDisjoint(i,j) = 0 ;
            continue;
        end
        if(i > j)
            continue;
        end
        paths = randi([4,10],1,1);
        EdgeDisjoint(i,j) = paths;
        EdgeDisjoint(j,i) = paths;
    end
end

%% Creating the Graph from the above chains
GraphNodes = zeros(N,N);
for i = 1:Nc
    for j = 1:N
        if(chains(i,j+1) == 0)
            break;
        else
        snode = chains(i,j);
        fnode = chains(i,j+1);
        GraphNodes(snode, fnode) = GraphNodes(snode, fnode) + 1;
        GraphNodes(fnode, snode) = GraphNodes(fnode, snode) + 1;
        end
    end
end

%% OBJECTIVE 1 : Check for Capacity Constraint matching
%Setting up Capacities for Nodes
Capacities = 110*randi([50,70],1,N);

%Checking from Chains
for i = 1:Nc
    for j = 1:N
        if(chains(i,j) == 0)
            break;
        end
        
        %Update the Capacities Matrix
        Capacities(1,chains(i,j)) = Capacities(1,chains(i,j)) - Freq ;
    end   
end

%Overflow falg is set to 1 if any of the Nodes service capacity is less tha
%the assigned values
CapacityOverflow = false ;

for i = 1:N
    if(Capacities(1,i) < 0)
        CapacityOverflow = true ;
        break;
    end
end

%% OBJECTIVE 2 : Check Bandwidth Constraints
BandwidthOverflow = false;

for i = 1:N
    for j = 1:N
        if(GraphNodes(i,j)*BandwdthReq > Bandwidth)
            BandwidthOverflow = true;
            break;
        end
    end
    
    if(BandwidthOverflow == true)
        break;
    end
end

%% Subroutine Check for Each Chain
%Subroutine without the checking of Over Flow flags
%Merit = ChainMerit(chains, Nc, N, EdgeDisjoint);

%Subroutine involving the over flow flags
%Uncomment the below line to use it
Merit = ChainMeritWithFlags(chains, Nc, N, EdgeDisjoint, CapacityOverflow, BandwidthOverflow);

%% OBJECTIVE 3 : PSO Parameter Check



%% OBJECTIVE 3: PSO Calls


