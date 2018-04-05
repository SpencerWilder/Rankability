function y = antiTransitive(D)
% function removes transitive edges from a graph
% function dependencies
%   function countingSymmetries that returns number of symmetric pairs.
%   function enumeratingSymmetries returns cell array of resulting from
%            the removal of symmetric entries.

  %No symmetric entries, just remove transitive edges.
  if countingSymmetries(D) == 0
      [xCoord, yCoord] = find(D);
      for i = 1:length(xCoord)
          for j = 1:length(yCoord)
              if xCoord(i) == yCoord(j) || xCoord(j) ~= yCoord(i)
                  continue
              else
                  deleteElement = [xCoord(i), yCoord(j)];
                  if D(xCoord(i), yCoord(j)) == 1
                          D(xCoord(i), yCoord(j)) = 0;
                  end
              end
          end
      end
  y = D;

  %1 or more symmetries
  else
      %call to enumeratingSymmetries which returns cell array
      A = enumeratingSymmetries(D);
      B = A;
      for k= 1:length(A)
          A_k = A{k};
          [xCoord, yCoord] = find(A{k});
          for i = 1:length(xCoord)
              for j = 1:length(yCoord)
                  if xCoord(i) == yCoord(j) || xCoord(j) ~= yCoord(i)
                      continue
                  else
                      deleteElement = [xCoord(i), yCoord(j)];
                      if A{k}(xCoord(i), yCoord(j)) == 1
                          A{k}(xCoord(i), yCoord(j)) = 0;
                      end
                  end
              end
          end
      end
  y = A;
  end
end
