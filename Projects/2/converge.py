def g(x):
    return (3*x + 1/2)**(1/3)

x = -2.0  # initial guess
tol = 1e-6  # tolerance
max_iter = 100  # maximum number of iterations

for i in range(max_iter):
    x_new = g(x)
    if abs(x_new - x) < tol:
        print("Converged to root: ", x_new)
        break
    x = x_new
else:
    print("Failed to converge")