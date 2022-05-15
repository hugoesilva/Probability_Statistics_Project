n1 = 2
n2 = 29
n3 = 50

a = 0
b = 4

seed = 678

nAmostras = 260
start = 1

expectedVal = (a + b) / 2
variance = (b - a)^2 / 12

sum1 = 0
sum2 = 0
sum3 = 0

df1 = data.frame(c(1 : nAmostras))
df2 = data.frame(c(1 : nAmostras))
df3 = data.frame(c(1 : nAmostras))

names(df1)[1] = "means1"
names(df2)[1] = "means2"
names(df3)[1] = "means3"

#View(df1)
#View(df2)
#View(df3)

set.seed(678)

for(num in start : nAmostras){
  mean1 =  mean(runif(n1,min = 0,max = 4))
  df1[num, 1] = mean1
  sum1 = sum1 + mean1
  
  mean2 = mean(runif(n2, min = 0, max = 4))
  df2[num, 1] = mean2
  sum2 = sum2 + mean2
  
  mean3 = mean(runif(n3, min = 0, max = 4))
  df3[num, 1] = mean3
  sum3 = sum3 + mean3
}

firstMean = sum1 / nAmostras
secondMean = sum2 / nAmostras
thirdMean = sum3 / nAmostras

firstMean
secondMean
thirdMean

expectedVal
variance

hist1 = ggplot(df1, aes(means1, color="means1"))
hist1 = hist1 + geom_histogram(fill="white", alpha=0.5)
hist1 + xlab("valores obtidos da distribuição da média") + ggtitle("Histograma de frequência relativa associado aos \nvalores obtidos da distribuição da média para n = 2") +
  geom_line(aes(y = expectedVal, colour = "Valor Esperado")) + geom_line(aes(y = variance, colour = "Variância"))

hist2 = ggplot(df2, aes(means2, color="means2"))
hist2 = hist2 + geom_histogram(fill="white", alpha=0.5)
hist2 + xlab("valores obtidos da distribuição da média") + ggtitle("Histograma de frequência relativa associado aos \nvalores obtidos da distribuição da média para n = 29") +
  geom_line(aes(y = expectedVal, colour = "Valor Esperado")) + geom_line(aes(y = variance, colour = "Variância"))

hist3 = ggplot(df3, aes(means3, color="means3"))
hist3 = hist3 + geom_histogram(fill="white", alpha=0.5)
hist3 + xlab("valores obtidos da distribuição da média") + ggtitle("Histograma de frequência relativa associado aos \nvalores obtidos da distribuição da média para n = 50") +
  geom_line(aes(y = expectedVal, colour = "Valor Esperado")) + geom_line(aes(y = variance, colour = "Variância"))

