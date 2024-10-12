function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)
    % build the stochastic matrix. Bonus if it is sparse
    % The 'stochastic' matrix SHOULD NOT be scaled (divided by sum of all)
    % It should just be entry-wise
    % This is how the checker tests it, to not have to deal with floating point errors
  num_words = length(words_set);
  num_k_secv = length(k_secv_set);
  num_corpus_word = length(corpus_words);
  retval = sparse(num_k_secv, num_words);
  widx = word_idx(words_set);
  kscvidx = k_secv_idx(k_secv_set);
  for ii = 1:(length(corpus_words)-k);
    i = kscvidx(k_secv_corpus{ii});
    j =  widx(corpus_words{ii+k});
    retval(i, j) = retval(i, j) + 1;
  endfor
endfunction
