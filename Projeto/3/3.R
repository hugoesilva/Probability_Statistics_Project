library(readxl)
library(tidyr)
library(ggplot2)
library(dplyr)
Ar = read_excel("/Users/hugo/Desktop/LEIC-A/2ºAno/2ºSemestre/PE/Projeto/3/QualidadeARO3.xlsx", 
                           range = "A1:J8785")

Ar = select(Ar, c("Laranjeiro-Almada", "VNTelha-Maia"))

df <- gather(Ar, Estacoes, qualidadeAr, "Laranjeiro-Almada":"VNTelha-Maia")

View(df)


hist <- ggplot(df, aes(qualidadeAr, color=Estacoes))
hist <- hist + geom_histogram(fill="white", alpha=0.5, position="dodge")
hist + xlab("Níveis de Ozono Registados") + ggtitle("Níveis de Ozono Registados nas Estações Laranjeiro-Almada e VNTelha-Maia")

#View(Ar)
