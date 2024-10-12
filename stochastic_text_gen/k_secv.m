function B = k_secv (A, k)
  % given an array [a b a b c] and k=2
  % should return [ab ba ab bc]
  % HINT: use strjoin
  n = length(A);
  B = cell(length(A)-k,1);
  for i=1:length(A)-k
    seq = A(i:i+k-1);
    B{i} = strjoin(seq, ' ');
  endfor
endfunction
