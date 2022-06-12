seed = 215
nAmostras = 1450
dim = 1126
lambda = 1.08
alpha = 0.08
start = 1
set.seed(seed)

df1 = data.frame(c(1 : nAmostras))
names(df1)[1] = "Errors"

for(num in start : nAmostras) {
  amostra =  rexp(dim, lambda)
  stdDev = sd(amostra)
  minA = (1 - qnorm(1 - alpha/2) / sqrt(dim)) / mean(amostra)
  maxA = (1 + qnorm(1 - alpha/2) / sqrt(dim)) / mean(amostra)
  errorAmp = maxA - minA
  df1[num, 1] = errorAmp
}

round(mean(df1$Errors), 6)

