library(ggplot2)
seed = 155; nAmostras = 1450; start = 1; set.seed(seed); lambda = 1.44; alpha = 0.08

df1 = data.frame(matrix(nrow = 50, ncol = 2))
names(df1)[1] = "Ns"
names(df1)[2] = "Medias"

aux = 0
for(num in start : 50) {
  aux = aux + 100
  df1[num, 1] = aux
}

df2 = data.frame(c(1 : nAmostras))
names(df2)[1] = "Errors"

dim = 0
for (i in start : 50) {
  dim = dim + 100
  print(dim)
  for(num in start : nAmostras) {
    amostra =  rexp(dim, lambda)
    minA = (1 - qnorm(1 - alpha/2) / sqrt(dim)) / mean(amostra)
    maxA = (1 + qnorm(1 - alpha/2) / sqrt(dim)) / mean(amostra)
    errorAmp = maxA - minA
    df2[num, 1] = errorAmp
  }
  df1[i, 2] = mean(df2$Errors)
}

ggplot() + geom_point(aes(x = df1$Ns, y = df1$Medias)) + geom_line(aes(x = df1$Ns, y = df1$Medias), col = "red") +
  ylab("Médias das Amplitudes dos Intervalos de Confiança") + xlab("Dimensão da Amostra") +
  ggtitle("Média da Amplitude dos 1450 intervalos de confiança obtidos\npara um nível de confiança de 92%")