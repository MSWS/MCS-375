f1 = @(x) nthroot(3 * x +1/2, 3);
f2 = @(x) 1 / (2 * x ^ 2 - 6);
f3 = f1;

% iteratefixed(f1, -2, -1.641783527452926, 10^(-8))
% iteratefixed(f2, -1, -0.168254401764093, 10^(-8))
% iteratefixed(f3, 3, 1.810037929236685, 10^(-8))

fn = @(x) exp(sin(x) ^ 3) +x ^ 6 - 2 * x ^ 4 - x ^ 3 - 1;
dfn = @(x) (6 * x ^ 3 - 8 * x - 3) * x ^ 2 + 3 * exp(sin(x) ^ 3) * sin(x) ^ 2 * cos(x) ^ 2;

iteratenewtons(fn, dfn, 2, 1.53013350816662, 10 ^ (-8))

function x = iteratefixed(fun, x, actualRoot, TOL)
    fprintf(" i \t xi \t\t\t g(xi) \t\t error \t\t\t error/lastError\n");
    err = 0;
    step = 0;

    while abs(x - actualRoot) > TOL
        px = x;
        gx = fun(x);
        lastError = err;
        err = abs(x - actualRoot);
        fprintf("%2d %13.9f %13.9f %13.9f", step, px, gx, err);

        if lastError > 0 && err > 0
            fprintf("%13.9f", err / lastError);
        end

        fprintf("\n");
        step = step + 1;
        x = gx;
    end

end

function x = iteratenewtons(fun, dfun, x, actualRoot, TOL)
    fprintf(" i \t xi \t\t   error \t\t\t error/lastError^2\n");
    err = abs(x - actualRoot);
    step = 1;
    lastError = 0;
    fprintf("%2d %13.9f %13.9f\n", 0, x, err);

    while err > TOL
        px = x;
        x = px - fun(px) / dfun(px);
        lastError = abs(px - actualRoot);
        err = abs(x - actualRoot);
        fprintf("%2d %13.9f %13.9f ", step, x, err);

        if lastError > 0 && err > 0
            fprintf("%13.9f", (err / lastError) ^ 2);
        end

        fprintf("\n");
        step = step + 1;
    end

end

function c = bisect(fun, a, b, tol)
    fa = fun(a); fb = fun(b);

    if fa * fb >= 0
        fprintf("%f and %f must be opposite signs\n", fun(a), fun(b));
        return;
    end

    n = ((log(b - a) - log(tol)) / log(2)) - 1;
    fprintf("N: %d\n", n);
    n = ceil(n);
    fprintf("Iterating %d times\n", n);
    fprintf(" k   A          B          c           f(c)\n");

    for k = 0:n
        c = (a + b) / 2;
        fc = fun(c);
        fprintf("%2d: %10.7f %10.7f %10.7f %11.7f\n", k, a, b, c, fc);

        if fc == 0
            return
        end

        if fa * fc > 0
            a = c;
            continue
        end

        b = c;
    end

end
