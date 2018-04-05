function y = initializationFunction(D)
% Call only on matrices returned from antiTransitive function.
% initializes arrays
% Dependencies:
%   findMaximalElements(D) computes column sum to find maximal elements
%       returns array of maximal elements
%   recursiveFunction(D, maximalArray, visitedArray, P, ranking)
    visitedArray = [];
    P = [];
    ranking = [];
    maximalArray = findMaximalElements(D)

y = recursiveFunction(D, maximalArray, visitedArray, P, ranking);
end
