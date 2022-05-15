library(ggplot2)
seed = 155
nAmostras = 1450
start = 1
set.seed(seed)

lambda = 1.44

alpha = 0.08

df1 = data.frame(matrix(nrow = 50, ncol = 2))
names(df1)[1] = "Ns"
names(df1)[2] = "Medias"

aux = 0
for(num in start : 50) {
  aux = aux + 100
  df1[num, 1] = aux
}

#View(df1)

df2 = data.frame(c(1 : nAmostras))
names(df2)[1] = "Errors"
#df2 = matrix(nrow = 1, ncol = nAmostras)


dim = 0
for (i in start : 50) {
  dim = dim + 100
  print(dim)
  for(num in start : nAmostras) {
    amostra =  rexp(dim, lambda)
    stdDev = sd(amostra)
    # errorAmp está errado
    errorAmp = 2 * qt(1 - alpha/2, dim - 1) * stdDev / sqrt(dim)
    df2[num, 1] = errorAmp
    #df2[num] = errorAmp
  }
  df1[i, 2] = mean(df2$Errors)
  #df1[i, 2] = mean(df2)
}

View(df1)

ggplot() + geom_point(aes(x = df1$Ns, y = df1$Medias)) +
  ylab("MA(n)") + xlab("Dimensão da Amostra") +
  ggtitle("ddd")

# ADD TITLE TO GRAPH!!!!!!!