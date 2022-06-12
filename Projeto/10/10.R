seed = 558; set.seed(seed); nAmostras = 550; lambda = 1.8; lambda2 = 0.12; nN = 25; alpha = 0.09; start = 1; p = 0.85

df1 = data.frame(matrix(nrow = nN, ncol = 2)) ; names(df1)[1] = "Ns"; names(df1)[2] = "Medias"
df3 = data.frame(matrix(nrow = nN, ncol = 2)) ; names(df3)[1] = "Ns"; names(df3)[2] = "Medias"

aux = 0
for(num in start : nN) {
  aux = aux + 100
  df1[num, 1] = aux
  df3[num, 1] = aux
}

df2 = data.frame(c(1 : nAmostras)) ; names(df2)[1] = "Errors"
df4 = data.frame(c(1 : nAmostras)) ; names(df4)[1] = "Errors"

dim = 0
for (i in start : nN) {
  dim = dim + 100
  for(num in start : nAmostras) {
    amostra =  rexp(dim, lambda)
    minA = (1 - qnorm(1 - alpha/2) / sqrt(dim)) / mean(amostra); maxA = (1 + qnorm(1 - alpha/2) / sqrt(dim)) / mean(amostra)
    errorAmp = maxA - minA; df2[num, 1] = errorAmp
    amostraAux = rexp((1-p) * dim, lambda2)
    amostra2 = c(amostra[1:(p*dim)], amostraAux)
    minA2 = (1 - qnorm(1 - alpha/2) / sqrt(dim)) / mean(amostra2); maxA2 = (1 + qnorm(1 - alpha/2) / sqrt(dim)) / mean(amostra2)
    errorAmp2 = maxA2 - minA2; df4[num, 1] = errorAmp2
  }
  df1[i, 2] = mean(df2$Errors); df3[i, 2] = mean(df4$Errors)
}

ggplot() + geom_point(aes(x = df1$Ns, y = df1$Medias, colour = "Sem")) + geom_point(aes(x = df3$Ns, y = df3$Medias, colour = "Com")) +
  geom_line(aes(x = df1$Ns, y = df1$Medias, colour = "Sem"), color = "sky blue") + geom_line(aes(x = df3$Ns, y = df3$Medias, colour = "Com"), color = "orange") +
  ylab("Médias das Amplitudes dos Intervalos de Confiança") + xlab("Dimensão da Amostra") + labs(colour = "Contaminação:") +
  ggtitle("Médias das Amplitudes dos 550 intervalos de confiança com e sem
          contaminação para um nível de confiança de 91%")
