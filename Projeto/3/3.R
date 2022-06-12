library(readxl)
library(tidyr)
library(ggplot2)
library(dplyr)
Ar = read_excel("/Users/hugo/Desktop/LEIC-A/2Ano/2Semestre/PE/Projeto/3/QualidadeARO3.xlsx", range = "A1:J8785")

Ar = select(Ar, c("Laranjeiro-Almada", "VNTelha-Maia"))

df <- gather(Ar, Estacoes, qualidadeAr, "Laranjeiro-Almada":"VNTelha-Maia")
  
hist <- ggplot(df, aes(qualidadeAr, color = Estacoes))
hist <- hist + geom_histogram(fill = "white", alpha = 0.5, position = "identity", bins = 20)
hist + xlab("Níveis de Ozono Registados em Microgramas por Metro Cúbico") + ggtitle("Níveis de Ozono Registados Laranjeiro-Almada e VNTelha-Maia") +
  labs(colour = "Estações")