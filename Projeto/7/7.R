seed = 1723
nAmostras = 4110
dim = 18
n = 39
p = 0.67
start = 1

sum = 0

set.seed(seed)

expectedVal = n * p

for(num in start : nAmostras){
  mean1 =  mean(rbinom(dim, n, p))
  mean1
  sum = sum + mean1
}

valor_pratico = sum / nAmostras

abs(expectedVal - valor_pratico)

