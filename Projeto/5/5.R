# probabilidade do tempo de atendimento de um doente
# escolhido ao acaso ser maior do que 13

seed = 1943
n = 595
lambda = 0.13

set.seed(seed)

generatedValues = rexp(n, lambda)
fAux = ecdf(generatedValues)
generatedValues


#confirmar
valor_teorico = 1 - pexp(13, lambda)
valor_teorico

valor_pratico = 1 - fAux(13)
valor_pratico

round(abs(valor_teorico - valor_pratico), 6)

#hist(generatedValues, main = "", xlab = "valores", col = "steelblue")

# OU
valor_pratico2 = sum(generatedValues > 13) / length(generatedValues)

round(abs(valor_teorico - valor_pratico2), 6)


