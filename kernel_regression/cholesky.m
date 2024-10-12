function [L] = cholesky(A)
    % Ensure the matrix A is square
    [n, m] = size(A);
    if n ~= m
        error('Matrix A must be square');
    end

    % Initialize L as a zero matrix of the same size as A
    L = zeros(n, n);

    % Perform the Cholesky decomposition
    for i = 1:n
        for j = 1:i
            if i == j
                % Diagonal elements
                L(i, j) = sqrt(A(i, i) - sum(L(i, :) .^ 2));
            else
                % Off-diagonal elements
                L(i, j) = (A(i, j) - sum(L(i, :) .* L(j, :))) / L(j, j);
            end
        end
    end
endfunction

