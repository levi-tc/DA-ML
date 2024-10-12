function [a] = get_prediction_params_iterative(K, y, lambda)
    n = size(K, 1); % Dimension of K
    A = K + lambda * eye(n); % Adjusted matrix A = K + lambda * I
    b = y; % Target vector
    
    % Initial guess
    a0 = zeros(n, 1);
    
    % Tolerance and maximum iterations for the pcg method
    tol = 1e-6;
    max_iter = 1000;
    
    % Solve using pcg
    [a, flag] = pcg(A, b, tol, max_iter, [], [], a0);
    
    % Check for successful convergence
    if flag != 0
        error('PCG did not converge within the maximum number of iterations.');
    end
endfunction

