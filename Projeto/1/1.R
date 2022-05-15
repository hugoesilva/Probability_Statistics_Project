library(readxl)
library(tidyr)
library(ggplot2)
library(dplyr)
#install.packages("dplyr")
ResiduosPerCapita = read_excel("/Users/hugo/Desktop/LEIC-A/2ºAno/2ºSemestre/PE/Projeto/1/ResiduosPerCapita.xlsx", 
                                 range = "A13:C43")


Paises = ResiduosPerCapita[c(21-13,22-13,42-13), ]
names(Paises)[1] = "Paises"
names(Paises)[2] = "2004"
names(Paises)[3] = "2018"

View(Paises)

df <- gather(Paises, anos,  Residuos_per_Capita, "2004":"2018")

plot <- ggplot(df, aes(Paises,  Residuos_per_Capita, fill=anos))
plot <- plot + geom_bar(stat = "identity", position = 'dodge')
plot + ylab("Resíduos Produzidos per Capita") + ggtitle("Produção de Resíduos per Capita em 2004 e 2018")

  

