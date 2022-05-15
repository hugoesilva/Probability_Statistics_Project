seed = 558
set.seed(seed)

nAmostras = 550
lambda = 1.8
nN = 25
alpha = 0.09
start = 1


df1 = data.frame(matrix(nrow = nN, ncol = 2))
names(df1)[1] = "Ns"
names(df1)[2] = "Medias"

df3 = data.frame(matrix(nrow = nN, ncol = 2))
names(df3)[1] = "Ns"
names(df3)[2] = "Medias"

aux = 0
for(num in start : nN) {
  aux = aux + 100
  df1[num, 1] = aux
  df3[num, 1] = aux
}


df2 = data.frame(c(1 : nAmostras))
names(df2)[1] = "Errors"

#construa um intervalo de confiança aproximado 
#para o inverso do valor esperado.

dim = 0
for (i in start : nN) {
  dim = dim + 100
  print(dim)
  for(num in start : nAmostras) {
    amostra =  rexp(dim, lambda)
    stdDev = sd(amostra)
    # errorAmp esta incorreto
    errorAmp = 2 * qt(1 - alpha/2, dim - 1) * stdDev / sqrt(dim)
    df2[num, 1] = errorAmp
  }
  df1[i, 2] = mean(df2$Errors)
}

dim = 0
for (i in start : nN) {
  dim = dim + 100
  print(dim)
  for(num in start : nAmostras) {
    #sample??????
    amostra =  rexp(0.85 * dim, lambda)
    amostraAux = rexp(0.15 * dim, lambda)
    res = c(amostra, amostraAux)
    stdDev = sd(res)
    # errorAmp esta incorreto
    errorAmp = 2 * qt(1 - alpha/2, dim - 1) * stdDev / sqrt(dim)
    df2[num, 1] = errorAmp
  }
  df3[i, 2] = mean(df2$Errors)
}


ggplot() + geom_point(aes(x = df1$Ns, y = df1$Medias, colour = "Sem")) +
  geom_point(aes(x = df3$Ns, y = df3$Medias, colour = "Com")) +
  ylab("MA(n)") + xlab("Dimensão da Amostra") + labs(colour = "Contaminação:")
  ggtitle("ddd")


