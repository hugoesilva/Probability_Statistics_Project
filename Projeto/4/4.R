library(readxl)
library(tidyr)
library(ggplot2)
library(dplyr)
Utentes = read_excel("/Users/hugo/Desktop/LEIC-A/2Ano/2Semestre/PE/Projeto/4/Utentes.xlsx", 
                range = "A1:D77")

IMC_COL = select(Utentes, c("IMC", "Colesterol"))

ggplot(IMC_COL, aes(x = IMC, y = Colesterol)) + geom_point() +
  geom_smooth(method = lm, color = "sky  blue", se = FALSE) +
     xlab("IMC") +
     ylab("Colesterol") +
     ggtitle("Gráfico de Dispersão entre as Variáveis IMC e Colesterol")