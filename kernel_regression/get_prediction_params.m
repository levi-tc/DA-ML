function [a] = get_prediction_params(K, y, lambda)
  % GET_PREDICTION_PARAMS computes the prediction parameters using the Cholesky decomposition
  % Inputs:
  %   K      - The kernel matrix
  %   y      - The target values vector
  %   lambda - The regularization parameter
  
  % The regularization term is added to the diagonal of K
  K_reg = K + lambda * eye(size(K));
  
  % Perform Cholesky decomposition on the regularized kernel matrix
  L = chol(K_reg, 'lower');
  
  % Solve L * z = y for z using forward substitution
  z = L \ y;
  
  % Solve L' * a = z for a using backward substitution
  a = L' \ z;
endfunction
