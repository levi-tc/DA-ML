
# Tema 1 MN - Huzum Petrisor 315CB

## Task1
Funcții

`optimal_threshold(truths, probabilities)`

Scop: Determină pragul optim pentru clasificarea exemplarelor (data points) bazat pe probabilitățile lor, cu scopul de a maximiza scorul F1.
Intrări:
truths: Vector cu etichetele corecte (valorile adevărate, de obicei 0 sau 1).
probabilities: Vector de probabilități asociate fiecărui exemplu.
Rezultate:
best_epsilon: Valoarea pragului optim.
best_F1: Scorul F1 maxim realizat.
associated_precision: Precizia asociată pragului optim.
associated_recall: Sensibilitatea (recall) asociată pragului optim.

`multivariate_gaussian(X, mean_values, variances)`

Scop: Calculează densitatea de probabilitate Gaussiană multivariată pentru fiecare exemplu dintr-un set de date.
Intrări:
X: Setul de date (fiecare rând e un exemplu).
mean_values: Vectorul de medii al distribuției Gaussian.
variances: Matricea de covarianță a distribuției Gaussian.
Rezultat:
probabilities: Vector de probabilități, unde fiecare element corespunde densității de probabilitate pentru exemplul respectiv din X.
metrics(true_positives, false_positives, false_negatives)

Scop: Calculează precizia, sensibilitatea (recall), și scorul F1, bazându-se pe numărul de pozitive adevărate, pozitive false, și negative false.
Intrări: (explicație similară)
Rezultat: (explicație similară)

`identify_outliers(X, yval)`

Scop: Identifică valorile atipice (outliers) într-un set de date folosind un model bazat pe distribuția Gaussiană.
Intrări:
X: Setul de date (matrice de trăsături).
yval: Vector cu etichetele adevărate, folosit pentru determinarea pragului optim asupra probabilităților.
Rezultat:
outliers: Indecșii exemplelor din X identificate ca valori atipice.

`estimate_gaussian(X)`


Scop: Estimează parametrii de medie și varianță ai unei distribuții Gaussiene dintr-un set de date.
Intrare:
X: Setul de date (matrice de trăsături).
Rezultat:
mean_values: Vectorul de medii estimat.
variances: Matricea de covarianță estimată.

`gaussian_distribution(X, mean_value, variance)`

Scop: Pare a fi o altă implementare pentru calcularea densității de probabilitate Gaussiană, posibil o versiune mai generală a funcției multivariate_gaussian. Spuneți-mi dacă credeți că are funcționalități semnificativ diferite.
check_predictions(predictions, truths)

Scop: Calculează numărul de pozitive adevărate, pozitive false, și negative false, având un vector de predicții și etichetele adevărate corespunzătoare.
Intrări: (explicație similară)
Rezultat: (explicație similară)
Cum funcționează împreună

Aceste funcții formează cel mai probabil un sistem pentru detecția anomaliilor folosind un model Gaussian:

estimate_gaussian învață parametrii unei distribuții Gaussian din date.
multivariate_gaussian/gaussian_distribution calculează probabilitățile pentru exemplele din date.
optimal_threshold găsește un prag de discriminare între inliers (valori normale) și outliers (valori atipice) pe baza acestor probabilități.
identify_outliers aplică pragul și returnează indecșii valorilor atipice.

## Task2

Funcții

`split_dataset(X, y, percentage)`

Scop: Împarte setul de date în două seturi distincte: unul de antrenare și unul de predicție (sau testare), pe baza unui procent dat.
Intrări:
X: Matricea cu trăsături (features).
y: Vectorul coloană cu valorile asociate fiecărui exemplu din X.
percentage: Procentul, ca valoare zecimală între 0 și 1, care indică proporția din setul de date care va fi folosită pentru antrenare.
Rezultate:
X_train: Trăsăturile pentru antrenare.
y_train: Valorile țintă pentru antrenare.
X_pred: Trăsăturile pentru predicție/testare.
y_pred: Valorile țintă pentru predicție/testare.

`polynomial_kernel(x, y, d)`

Scop: Calculează nucleul polinomial (polynomial kernel) dintre doi vectori.
Intrări:
x: Primul vector de intrare.
y: Al doilea vector de intrare.
d: Gradul polinomului.
Rezultat:
retval: Valoarea calculată a nucleului polinomial.

`linear_kernel (x, y, other)`

Scop: Calculează nucleul liniar dintre doi vectori.
Intrări:
x: Primul vector de intrare.
y: Al doilea vector de intrare.
other: (Parametru ignorat în această implementare).
Rezultat:
retval: Valoarea calculată a nucleului liniar.

`gaussian_kernel(x, y, sigma)`

Scop: Calculează nucleul Gaussian, cunoscut și ca Radial Basis Function (RBF) kernel.
Intrări:
x: Primul vector de intrare.
y: Al doilea vector de intrare.
sigma: Parametru ce controlează dispersia (width) funcției Gaussian.
Rezultat:
retval: Valoarea calculată a nucleului Gaussian.

`build_kernel(X, f, f_param)`

Scop: Construiește o matrice de nucleu (matricea Gram) pentru un set de date folosind o funcție de nucleu specificată.
Intrări:
X: Matricea cu trăsături.
f: Un handle către funcția de nucleu dorită (ex: polynomial_kernel, linear_kernel, gaussian_kernel).
f_param: Parametrii necesari funcției de nucleu.
Rezultat:
K: Matricea de nucleu construită.

`get_prediction_params(K, y, lambda)`

Scop: Rezolvă pentru parametrii de predicție 'a' în modelele de învățare bazate pe nuclee, folosind descompunerea Cholesky pentru stabilitate numerică.
Intrări:
K: Matricea de nucleu.
y: Vectorul cu valorile țintă.
lambda: Parametrul de regularizare.
Rezultat:
a: Vectorul cu parametrii de predicție.

`get_prediction_params_iterative(K, y, lambda)`

Scop: O implementare alternativă pentru rezolvarea parametrilor de predicție, folosind metoda iterativă Preconditioned Conjugate Gradient (PCG). Utilă pentru seturi de date mari, unde descompunerea Cholesky ar putea fi mai puțin eficientă.
Intrări: (Aceleași ca get_prediction_params)
Rezultat: (Același ca get_prediction_params)

`eval_value(x, X, f, f_param, a)`

Scop: Evaluează/prezice pentru un nou exemplu 'x' folosind un model antrenat bazat pe nuclee.
Intrări: (Explicații similare)
Rezultat:
pred: Valoarea prezisă.

## Task3
Funcții

`stochastic_matrix(k_secv_corpus, corpus_words, words_idx, k_secv_idx, k)`

Scop: Construiește o matrice stochastică rară reprezentând probabilitățile de tranziție dintre k-secvențe (secvențe de 'k' cuvinte) și cuvintele individuale care urmează.
Intrări:
k_secv_corpus: (Probabil) Un array celular de k-secvențe extrase din corpusul text.
corpus_words: Un array celular de cuvinte individuale din corpus.
words_idx: O asociere (dicționar) pentru indexarea cuvintelor.
k_secv_idx: O asociere pentru indexarea k-secvențelor.
k: Lungimea k-secvențelor.
Rezultat:
stoch: O matrice rară în care rândurile reprezintă k-secvențe, coloanele reprezintă cuvinte individuale, iar valorile reprezintă probabilități de tranziție.

`k_secv_idx(distinct_k_sec)`

Scop: Creează o asociere (index) a k-secvențelor distincte cu valori numerice.
Intrare:
distinct_k_sec: Un array celular de k-secvențe unice.
Rezultat:
retval: O asociere unde cheile sunt k-secvențe și valorile sunt indicii lor corespunzători.
distinct_words(tokens)

Scop: Găsește cuvintele unice din corpus.
Intrare:
tokens: Un array celular de cuvinte.
Rezultat:
retval: Un array celular de cuvinte unice din intrare.

`distinct_k_secv(cell_array)`

Scop: Găsește k-secvențele unice dintr-un array celular.
Intrare:
cell_array: Un array celular conținând k-secvențe (probabil concatenate cu spații).
Rezultat:
retval: Un array celular de k-secvențe unice.

`sample_n_words(text, word_set, kscv_set, k, stoch, n)`

Scop: Generează 'n' cuvinte de text bazat pe un text inițial (seed) și pe matricea stochastică.
Intrări: (Similar cu alte funcții)
Rezultat:
retval: Textul generat.
`randsample(set, num_samples, replace, weights)`

Scop: Extrage eșantioane (samples) din elemente dintr-un set în funcție de probabilitățile furnizate.
Intrări: (Similar cu alte funcții)
Rezultat:
word: Elementul sau elementele extrase.

`sample_next_word(text, words_idx, k_secv_idx, k, stoch)`

Scop: Determină probabilitățile următorului cuvânt, având în vedere ultimele 'k' cuvinte din text.
Intrări: (Similar cu alte funcții)
Rezultat:
probs: Un vector de probabilități unde indicii corespund cuvintelor din words_idx.