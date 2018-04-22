function y = unionMate(mate1, mate2)
%Mating method takes the first half of mate1 and the second half
%of mate2 and unions them to create the offsping.

[numRows, numCols] = size(mate1);
offspring = zeros(numRows,1);

for i = 1:ceil(numRows/2)
  offspring(i) = mate1(i);
end

pos  = ceil(numRows/2) + 1;
offspring((pos:end), numCols) = setdiff(mate2, offspring, 'stable');

y = offspring;
end
