function retval = polynomial_kernel(x, y, d)
  % The polynomial kernel is computed as (x * y' + 1)^d
  % x and y are input vectors, and d is the degree of the polynomial
  retval = (1 + y * x')^d;
endfunction
