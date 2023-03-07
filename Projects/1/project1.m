f = @(x) cos(x);
pf = @(x) 1 - x .^ 2/2 + x .^ 4/24;
x = [-pi / 4:pi / 100:pi / 4];
y = f(x);
py = pf(x);
plot(x, y)
hold on
plot(x, py)
hold off
a = @(x) 230 * x .^ 4 + 18 * x .^ 3 + 9 * x .^ 2 - 221 * x - 9;
b = @(x) 1 + log(1 + x .^ 2);
c = @(x) exp(x) + 2 ^ (-x) + (2 * cos(x) - 6);
bisect(a, 0, 1, 10 ^ -6)
bisect(b, 0, 1, 10 ^ -6)
bisect(c, 1, 2, 10 ^ -6)
r = @(x) 1000 * (1 + x) ^ 20 + 2000 * (1 + x) ^ 14 - 5000;
bisect(r, 0, 0.05, 10 ^ -5)

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
