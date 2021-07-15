##################################################################
### R: Pacote tidyverse ou dpylr para usar os comandos select, ###
###                 filter e mutate na prática                 ###
###                                                            ###
### Autoria: Sigma Jr Consultoria Estatística                  ###
### Referência: https://www.instagram.com/p/CRUpu28MWJn/       ###
##################################################################
library(tidyverse) # pacote guarda chuva, que contem o pacote dplyr
library(dslabs) # pacote que tem o banco de dados murders

data("murders") # Conjunto de dados de assassinato nos EUA. 
                # Também contém a população de cada estado.
?murders # para mais informações use o help, opção do pacote dslabs
names(murders)

view(murders) # para visualizar o conjunto de dados

# select: usado para selecionar apenas as variáveis
# de interesse no banco de dados
murders %>%
  select(state, region, population)

# você também pode excluir do conjunto de dados as variáveis
# que não forem de interesse
murders  %>%
  select(-abb, total)


# filter: usado para filtrar, por exemplo
# por região, sendo escolhida a central norte
murders %>%
  filter(region=="North Central")%>%
  view()

# filter para excluir os estados diferentes da Florida e 
# do Arizona
murders%>%
   filter(state != "Florida")%>%
   filter(state != "Arizona")%>%
   view()

# mutate: usado para criar uma variável, em uma nova coluna
# no exemplo a variável pop_cat assume o valor 1, se o valor
# de population> a mediana , e zero em caso contrário
murders %>%
  mutate(pop_cat=ifelse(population> quantile(murders$population)[3], 1, 0))

# Para armazenar em um novo data frame as alterações feitas,
# basta usar os comandos abaixo
murders%>%
  filter(state != "Florida")%>%
  filter(state != "Arizona")-> Novo_DF

# Ainda, você pode usar todos esses comandos ao mesmo tempo
murders %>%
  select(-abb)%>%
  filter(region=="North Central")%>%
  filter(state!="Illinois")%>%
  mutate(total_car=ifelse(total<mean(total), 1, 2)) %>%
  mutate(total_car=ifelse(total>(mean(total)+sd(total)), 3,total_car)) -> Novo_DF


view(Novo_DF)
