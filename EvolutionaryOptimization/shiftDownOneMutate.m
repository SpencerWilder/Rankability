function y = shiftDownOneMutate(ranking)

numRows = length(ranking);
offspring = zeros(numRows,1);

for i = 1:numRows
  if i == numRows
    offspring(1) = ranking(i);
  else
    offspring(i+1) = ranking(i);
  end
end

y = offspring;
end
