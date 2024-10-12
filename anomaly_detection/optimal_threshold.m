function [best_epsilon, best_F1, associated_precision, associated_recall] = optimal_threshold(truths, probabilities)
    best_F1 = 0;
    best_epsilon = 0;
    associated_precision = 0;
    associated_recall = 0;


    step_size = (max(probabilities) - min(probabilities)) / 1000;

    for epsilon = min(probabilities):step_size:max(probabilities)

        predictions = (probabilities < epsilon);


        tp = sum((predictions == 1) & (truths == 1));
        fp = sum((predictions == 1) & (truths == 0));
        fn = sum((predictions == 0) & (truths == 1));

        if (tp + fp) == 0
            precision = 0;
        else
            precision = tp / (tp + fp);
        end

        if (tp + fn) == 0
            recall = 0;
        else
            recall = tp / (tp + fn);
        end


        if (precision + recall) == 0
            F1 = 0;
        else
            F1 = 2 * precision * recall / (precision + recall);
        end


        if F1 > best_F1
            best_F1 = F1;
            best_epsilon = epsilon;
            associated_precision = precision;
            associated_recall = recall;
        end
    end
endfunction
