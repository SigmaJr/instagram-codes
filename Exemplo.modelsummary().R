# Pacote para melhorar saídas de regressão

library(modelsummary)

# O super Tidyverse

library(tidyverse)

# Dados de Salário

library(wooldridge)

Dados <- wooldridge::wage1 %>% 
         view()

# Criando uma lista de modelos a serem comparados

ListaDeModelos <- list(
  
  "Modelo 1" = lm(wage~educ, data=Dados),
  "Modelo 2" = lm(wage~educ+exper, data=Dados),
  "Modelo 3" = lm(wage~educ+exper+tenure, data=Dados)
)

# Obtendo uma linda tabela para comparar os modelos

modelsummary(ListaDeModelos)


