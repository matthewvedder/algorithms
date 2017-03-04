from math import factorial

def binomial_dist(n, k, p):
    return factorial(n)/(factorial(k) * factorial(n-k)) * (p**k * (1-p)**(n-k))
