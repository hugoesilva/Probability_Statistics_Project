library(tidyr)
library(ggplot2)
library(dplyr)

n1 = 2; n2 = 29; n3 = 50; a = 0; b = 4; seed = 678; nAmostras = 260; start = 1
expectedVal = (a + b) / 2; variance = (b - a)^2 / 12; set.seed(678)

df1 = data.frame(c(1 : nAmostras)); df2 = data.frame(c(1 : nAmostras)); df3 = data.frame(c(1 : nAmostras))
names(df1)[1] = "means1"; names(df2)[1] = "means2"; names(df3)[1] = "means3"

for(num in start : nAmostras) {
  mean1 =  mean(runif(n1,min = 0,max = 4))
  df1[num, 1] = mean1
  
  mean2 = mean(runif(n2, min = 0, max = 4))
  df2[num, 1] = mean2
  
  mean3 = mean(runif(n3, min = 0, max = 4))
  df3[num, 1] = mean3
}

hist1 = ggplot(df1, aes(means1, color = "means1"))
hist1 = hist1 + geom_histogram(aes(y = ..density..), fill="white", alpha = 0.5, binwidth = 0.145) +
        stat_function(fun = function(x) dnorm(x, mean = expectedVal, sd = sqrt(variance/n1))) +
        scale_y_continuous("Density", sec.axis = sec_axis(trans = ~ . * 0.145, name = "Freq. Relativa", labels = scales::percent))
hist1 + xlab("valores obtidos da distribuição da média") + ggtitle("Histograma de frequência relativa para n = 2")

hist2 = ggplot(df2, aes(means2, color = "means2"))
hist2 = hist2 + geom_histogram(aes(y = ..density..), fill="white", alpha=0.5, binwidth = 0.145) +
    scale_y_continuous("Density", sec.axis = sec_axis(trans = ~ . * 0.145, name = "Freq. Relativa", labels = scales::percent)) +
    stat_function(fun = function(x) dnorm(x, mean = expectedVal, sd = sqrt(variance/n2))) + ylab("Frequência Relativa")
hist2 + xlab("valores obtidos da distribuição da média") + ggtitle("Histograma de frequência relativa para n = 29")

hist3 = ggplot(df3, aes(means3, color = "means3"))
hist3 = hist3 + geom_histogram(aes(y = ..density..), fill="white", alpha=0.5, binwidth = 0.145) +
    scale_y_continuous("Density", sec.axis = sec_axis(trans = ~ . * 0.145, name = "Freq. Relativa", labels = scales::percent)) +
    stat_function(fun = function(x) dnorm(x, mean = expectedVal, sd = sqrt(variance/n3))) + ylab("Frequência Relativa")
hist3 + xlab("valores obtidos da distribuição da média") + ggtitle("Histograma de frequência relativa para n = 50")
