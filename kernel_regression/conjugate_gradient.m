function [x] = conjugate_gradient(A, b, x0, tol, max_iter)
    r = b - A * x0;
    v = r;
    x = x0;
    tol_squared = tol^2;
    k = 0;
    
    while k < max_iter && (r' * r) > tol_squared
        t = (v' * A * v);
        if t == 0
            break;
        end
        alpha = (r' * r) / t;
        x = x + alpha * v;
        r_new = r - alpha * A * v;
        s = (r_new' * r_new) / (r' * r);
        v = r_new + s * v;
        r = r_new;
        k = k + 1;
    end
endfunction
