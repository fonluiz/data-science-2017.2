library(readr)
library(tidyverse)
library(stringr)

dadosIDH <- read_csv("~/Faculdade/data-science-2017.2/lab-2/idh.csv")
dadosIDH <- dadosIDH[-(1:2), , drop = FALSE]

names(dadosIDH) <- c("ranking", "municipio", "IDHM_2010",
                     "IDHM_renda", "IDHM_longevidade", "IDHM_educação")


dadosIDH$IDHM_2010 <- as.numeric(sub(",", ".", dadosIDH$IDHM_2010, fixed = TRUE)) 
dadosIDH$IDHM_renda <- as.numeric(sub(",", ".", dadosIDH$IDHM_renda, fixed = TRUE)) 
dadosIDH$IDHM_longevidade <- as.numeric(sub(",", ".", dadosIDH$IDHM_longevidade, fixed = TRUE)) 
dadosIDH$IDHM_educação <- as.numeric(sub(",", ".", dadosIDH$IDHM_educação, fixed = TRUE)) 

dadosIDH <- dadosIDH %>%
  mutate(estado = str_trim(substring(municipio, nchar(municipio) - 4)),
         municipio = str_trim(substring(municipio, 1,nchar(municipio) - 4)))

dadosIDH <- dadosIDH %>%
  mutate(estado = substring(estado, 2, 3))

write.csv(dadosIDH, "dadosIDH.csv", row.names = F)

################
dadosDeputados <- read_delim("~/Downloads/receitas_deputado_federal_2014", ";",
                             escape_double = FALSE, col_types = cols(`Sequencial Candidato` = col_character()), 
                             trim_ws = TRUE)

despesas <- read_delim("~/Downloads/despesa_deputado_federal_2014", ";", escape_double = FALSE,
                       col_types = cols(`Sequencial Candidato` = col_character()), trim_ws = TRUE)

perfil <- read_delim("~/Downloads/perfil_deputado_federal_2014", ";", escape_double = FALSE,
                     col_types = cols(SEQUENCIAL_CANDIDATO = col_character()), trim_ws = TRUE)

dados <- inner_join(dadosDeputados, despesas, by = "Sequencial Candidato")
dados <- inner_join(dados, perfil, by = c("Sequencial Candidato" = "SEQUENCIAL_CANDIDATO"))

names(dados) <- c("sequencial_candidato", "nome", "numero_cadidato", "UF", "partido",
                  "setor_economico_receita", "quantidade_doacoes", "quantidade_doadores",
                  "total_receita", "media_receita", "excluir1", "excluir2",
                  "excluir3", "recursos_de_outros_candidatos/comites", "recursos_de_partidos",
                  "recursos_de_pessoas_físicas", "recursos_de_pessoas_juridicas", "recursos_proprios",
                  "excluir4", "votos", "quantidade_despesas", "quantidade_fornecedores", "total_despesa",
                  "media_despesa", "setor_economico_despesa", "exlcuir5", "cargo", "idade", "sexo", "grau", 
                  "estado_civil")

dados <- dados %>% select(-excluir1, -excluir2, -excluir3, -excluir4, -exlcuir5)

write.csv(dados, "dadosEleicoes.csv", row.names = FALSE)
############

