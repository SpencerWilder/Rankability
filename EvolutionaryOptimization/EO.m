%Evolutionary Optimization 1.0
%
tic
% D = [1,1,1,1,1,1;
%      1,0,1,1,0,1;
%      0,0,0,0,0,1;
%      1,0,1,0,1,0;
%      0,1,1,0,0,0;
%      1,0,0,1,1,0];
D=[0 1 1 0 1 1;
   0 0 1 1 0 0;
   0 1 0 0 0 0;
   1 0 0 0 0 1;
   1 0 1 0 0 0;
   0 1 1 0 1 0];

%Collect information about data
[numRows, numCols] = size(D);
perm = [1:numRows];
maxP = factorial(numRows);
populationSize = 10;
maxk = numRows*numRows - numRows;

%First: Generate a population (i.e. generate rankings)
%NOTE: There are numRows! possible rankings
%Write a for loop using randperm for get a more random initial population
population = [];
for i = 1:populationSize
    perm = randperm(numRows);
    population = [population perm'];
end

%Second: Calculate fitness
%As of now, fitness = k
%Need to find a way to keep track of permuatations and their fitness
fitArray = [];
for i = 1:populationSize
     perm = population(:,i);
     A = D(perm, perm);
     fitness=nnz(tril(A))+(numRows*(numRows-1)/2 - nnz(triu(A,1)));
     fitArray = [fitArray fitness];
end
[fitArray, indices] = sort(fitArray);
population = population(:, indices);

iteration = 1;
previousk = 100000000;
while iteration < 50 %k < previousk || iteration <15

  %Fourth: Mating
  for i = 1:ceil(populationSize/2)
      for j = i:ceil(populationSize/2)
        offspring = leftTieBreakMate(population(:,i), population(:,j));
        population = [population offspring];
      end
  end

  %Fifth: Mutating remaining offspring
  for i = ceil(populationSize/2)+1:populationSize
    offspring = flipMutate(population(:,i));
    population = [population offspring];
  end

  %Fifth: Fitness of offspring
  fitArray = [];
  for i = 1:length(population)
      R = D(population(:,i),population(:,i));
      newFit =nnz(tril(R))+(numRows*(numRows-1)/2 - nnz(triu(R,1)));
      fitArray = [fitArray newFit];
  end

  [fitArray, indices] = sort(fitArray);
  population = population(:,indices);
  population = unique(population', 'rows', 'stable');
  population = population';


  %select most fit
  populationSize
  if populationSize <= length(population)
    population = population(:,[1:populationSize]);
    fitArray = fitArray(1:populationSize);
  end

  %take unique
  k = min(fitArray);
  iteration = iteration + 1;
end
k
toc
