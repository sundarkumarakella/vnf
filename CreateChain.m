%% Function to Generate the first solution.
% Input needed : Maximum number of intermediate nodes 

function[chain] = CreateChain(N, L)
    
    %%Initialisation of Chain and its length
    %The length of the chain hence generated
    length = randi([L,N],1,1);
         
    chain = randperm(N, length);    
end