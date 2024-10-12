function probabilities = multivariate_gaussian(X, mean_values, variances)
    % X is the dataset where each row represents a data point.
    % mean_values is the mean vector of the Gaussian distribution.
    % variances is the covariance matrix of the Gaussian distribution.


    n = size(X, 2);

    det_sigma = det(variances);

    inv_sigma = inv(variances);


    normalization_const = (2 * pi) ^ (-n / 2) * det_sigma ^ (-0.5);


    probabilities = zeros(size(X, 1), 1);


    for i = 1:size(X, 1)

        x_minus_mu = X(i, :) - mean_values;


        exponent = -0.5 * x_minus_mu * inv_sigma * x_minus_mu';


        probabilities(i) = normalization_const * exp(exponent);
    end
endfunction

