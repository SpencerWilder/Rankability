function y = shiftUpOneMutate(ranking)

numRows = length(ranking);
offspring = zeros(numRows,1);

for i = 1:numRows
  if i == 1
    offspring(1) = ranking(numRows);
  else
    offspring(i-1) = ranking(i);
  end
end

y = offspring;
end
