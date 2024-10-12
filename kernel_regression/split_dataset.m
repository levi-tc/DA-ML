function [X_train, y_train, X_pred, y_pred] = split_dataset(X, y, percentage)
  % Splits the dataset into training and prediction sets based on the given percentage
  % X is the feature matrix, y is the column vector of associated values
  % percentage is a decimal between 0 and 1 indicating the proportion of the dataset to be used for training
  
  % Calculate the number of data points for training
  total_data_points = size(X, 1);
  num_train = round(percentage * total_data_points);
  
  % Divide the dataset
  X_train = X(1:num_train, :);
  y_train = y(1:num_train, :);
  
  X_pred = X(num_train+1:end, :);
  y_pred = y(num_train+1:end, :);
endfunction
