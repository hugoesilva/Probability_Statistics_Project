library(readxl)
library(tidyr)
library(ggplot2)
library(dplyr)
EsperancaVida = read_excel("/Users/hugo/Desktop/LEIC-A/2Ano/2Semestre/PE/Projeto/2/EsperancaVida.xlsx", range = "A51:CY69")

names(EsperancaVida)[1] = "Anos" ; names(EsperancaVida)[56] = "LetoniaH"
names(EsperancaVida)[57] = "LituaniaH" ; names(EsperancaVida)[58] = "LuxemburgoH"
names(EsperancaVida)[90] = "LetoniaM" ; names(EsperancaVida)[91] = "LituaniaM"
names(EsperancaVida)[92] = "LuxemburgoM"

ac = select(EsperancaVida, c("Anos", "LetoniaH", "LituaniaH", "LuxemburgoH", "LetoniaM", "LituaniaM", "LuxemburgoM"))

HM <- ggplot(data = ac, aes(x = Anos))+
  geom_line(aes(y = LetoniaH, colour = "Letónia-Homens")) + geom_point(aes(y = LetoniaH , colour ="Letónia-Homens")) +
  geom_line(aes(y = LituaniaH , colour = "Lituânia-Homens")) + geom_point(aes(y = LituaniaH, colour = "Lituânia-Homens")) +
  geom_line(aes(y = LuxemburgoH, colour = "Luxemburgo-Homens")) + geom_point(aes(y = LuxemburgoH, colour = "Luxemburgo-Homens")) +
  geom_line(aes(y = LetoniaM, colour = "Letónia-Mulheres")) + geom_point(aes(y = LetoniaM, colour = "Letónia-Mulheres"), shape = 1) +
  geom_line(aes(y = LituaniaM, colour = "Lituânia-Mulheres")) + geom_point(aes(y = LituaniaM, colour = "Lituânia-Mulheres"), shape = 1) +
  geom_line(aes(y = LuxemburgoM, colour = "Luxemburgo-Mulheres")) + geom_point(aes(y = LuxemburgoM, colour = "Luxemburgo-Mulheres"),shape = 1)
  
HM = HM + ylab("Esperança de Vida em Anos") + ggtitle("Esperança de vida à nascença entre 2002 e 2019") + labs(colour = "Países e Sexo")
print(HM)