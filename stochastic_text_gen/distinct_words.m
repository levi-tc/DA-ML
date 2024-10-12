function retval = distinct_words (tokens)
  % TODO: Find unique strings HINT: unique
  unique_tokens = unique(tokens);
  retval = sort(unique_tokens);
endfunction
