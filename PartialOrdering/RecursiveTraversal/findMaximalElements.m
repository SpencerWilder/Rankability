function y = findMaximalElements(D)
  %Returns array of maximal elements by computing column sum.
    [numRow, ~] = size(D);
    maximalArray = [];
    sumArray = sum(D);
    for i=1:numRow
        if sumArray(i) == 0
            maximalArray = [maximalArray i];
        end
    end
y = maximalArray;
end
