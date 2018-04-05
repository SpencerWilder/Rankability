function y = recursiveFunction(D, maximalArray, visitedArray, P, ranking)
%Do not call directly.
%Dependencies:
%   findMaximalElements(D)

    %base case, no more maximal elements
    if isempty(maximalArray)
        P = [P ranking];
        y = P;
    else
        element = maximalArray(1);
        visitedArray = [visitedArray element];
        %Modifying D is dangerous for rankings other than the first
        %may need to store a copy of D
        D(element,:) = 0;
        maximalArray = setdiff(findMaximalElements(D), visitedArray)
        ranking = [ranking; element];
        y = recursiveFunction(D, maximalArray, visitedArray, P, ranking);
    end
end

%if isempty(maximalArray) && len(visiteArray) == dim(D)
%go back to another function call, pick saved element
