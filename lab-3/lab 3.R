library(tidyverse)

eleicoes2014 <- read.csv("~/Downloads/eleicoes2014.csv", encoding="latin1")
eleicoes2014_test <- read.csv("~/Downloads/eleicoes2014-test.csv", encoding="latin1")

dados_cepesp <- read_csv("~/Downloads/TSE_DEPUTADO_FEDERAL_UF_CANDIDATO_2014.csv")
names(dados_cepesp) <- tolower(names(dados_cepesp))
colnames(dados_cepesp)[6] <- "nome"
colnames(dados_cepesp)[3] <- "UF"
colnames(dados_cepesp)[6] <- "numero_cadidato"

dados_treino <- inner_join(eleicoes2014, dados_cepesp, by=c("nome", "numero", "UF")) 
dados_teste <- inner_join(eleicoes2014_test, dados_cepesp, by=c("nome", "numero", "UF"))

dados_treino$recursos_de_outros_candidatos.comites[is.na(dados_treino$recursos_de_outros_candidatos.comites)] <- 0
dados_treino$recursos_de_partidos[is.na(dados_treino$recursos_de_partidos)] <- 0
dados_treino$recursos_de_pessoas_físicas[is.na(dados_treino$recursos_de_pessoas_físicas)] <- 0
dados_treino$recursos_de_pessoas_juridicas[is.na(dados_treino$recursos_de_pessoas_juridicas)] <- 0
dados_treino$recursos_proprios[is.na(dados_treino$recursos_proprios)] <- 0

dados_teste$recursos_de_outros_candidatos.comites[is.na(dados_teste$recursos_de_outros_candidatos.comites)] <- 0
dados_teste$recursos_de_partidos[is.na(dados_teste$recursos_de_partidos)] <- 0
dados_teste$recursos_de_pessoas_físicas[is.na(dados_teste$recursos_de_pessoas_físicas)] <- 0
dados_teste$recursos_de_pessoas_juridicas[is.na(dados_teste$recursos_de_pessoas_juridicas)] <- 0
dados_teste$recursos_proprios[is.na(dados_teste$recursos_proprios)] <- 0

write.csv(dados_treino, "dados_treino.csv", row.names = F)
write.csv(dados_teste, "dados_teste.csv", row.names = F)
