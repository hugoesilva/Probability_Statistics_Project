library(readxl)
library(tidyr)
library(ggplot2)
library(dplyr)
Utentes = read_excel("/Users/hugo/Desktop/LEIC-A/2ºAno/2ºSemestre/PE/Projeto/4/Utentes.xlsx", 
                range = "A1:D77")

IMC_COL = select(Utentes, c("IMC", "Colesterol"))

plot(x = IMC_COL$IMC, y = IMC_COL$Colesterol, pch=16,
     xlab = "IMC",
     ylab = "Colesterol",
     main = "Gráfico de Dispersão entre as Variáveis IMC e Colesterol")


#View(IMC_COL)
