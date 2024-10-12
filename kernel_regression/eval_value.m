function pred = eval_value(x, X, f, f_param, a)
    % Initialize the prediction to zero
    pred = 0;
    
    % Iterate over all training examples
    for i = 1:size(X, 1)
        % Compute the kernel between x and the ith training example
        k = f(x, X(i, :), f_param);
        
        % Add the weighted kernel to the prediction
        pred = pred + a(i) * k;
    end
endfunction
