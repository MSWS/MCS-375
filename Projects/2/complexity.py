def a(n):
    count = 0
    for m in range(1, n+1):
        for k in range(50, m + 101):
            count += 1
    return count

def sa(n):
    return n*(n+103) / 2

def b(n):
    count = 0
    for k in range(1, n+1):
        for m in range(11, 101):
            for p in range(m, 9, -1):
                count += 1
            
    return count

def sb(n):
    return 4185*n

def c(n):
    count = 0
    for m in range(1, n+1):
        for q in range(1, m+2):
            for p in range(1, m+1):
                count += 1
    return count

def sc(n):
    return (n*(n+1)*(n+2))/3

for(n) in range(1, 100):
    # print(n, a(n), sa(n))
    # print(n, b(n), sb(n))
    print(n, c(n), sc(n))
