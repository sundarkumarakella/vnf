%% The Nodes Start and End Points are to be set
%Nc indicates the number of chains
Nc = 20;

%Initialising the Ends to zeros
Ends = zeros(Nc,2);

%Randomly setting the start and end points
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