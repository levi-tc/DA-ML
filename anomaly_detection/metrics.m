function [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives)

    if true_positives + false_positives == 0
        precision = 0;
    else
        precision = true_positives / (true_positives + false_positives);
    end


    if true_positives + false_negatives == 0
        recall = 0;
    else
        recall = true_positives / (true_positives + false_negatives);
    end


    if precision + recall == 0
        F1 = 0;
    else
        F1 = 2 * (precision * recall) / (precision + recall);
    end
endfunction
