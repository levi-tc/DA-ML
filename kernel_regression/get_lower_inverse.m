function [P] = get_lower_inverse(L)
    % Validate that L is square and lower triangular
    if ~issquare(L) || ~istril(L)
        error('Input must be a square, lower triangular matrix.');
    end
    
    % Compute the inverse using Octave's built-in function
    P = inv(L);
endfunction
