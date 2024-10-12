function [K] = build_kernel(X, f, f_param)
  % Get the number of data points
  n = size(X, 1);
  
  % Initialize the kernel matrix
  K = zeros(n, n);
  
  % Fill the kernel matrix by applying the kernel function to all pairs of data points
  for i = 1:n
    for j = 1:n
      % Call the kernel function with the current pair of rows from X
      K(i, j) = f(X(i, :), X(j, :), f_param);
    endfor
  endfor
endfunction
