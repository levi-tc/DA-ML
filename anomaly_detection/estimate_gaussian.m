% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values variances] = estimate_gaussian(X)
    %mean_values = zeros(1,1);
    %variances = zeros(1,1);
    m = size(X,1);
    mean_values = (1/m) * sum(X);
    variances = (1/m) * (X - mean_values)' * (X - mean_values);
endfunction
