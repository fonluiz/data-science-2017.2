library(readr)
library(tidyverse)

# http://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/explicacoes-sobre-o-formato-dos-arquivos-xml

# cp_2015 <- read_delim("~/Faculdade/data/Ano-2015.csv", ";", escape_double = FALSE, trim_ws = TRUE)
# cp_2016 <- read_delim("~/Faculdade/data/Ano-2016.csv", ";", escape_double = FALSE, trim_ws = TRUE)
# cp_2017 <- read_delim("~/Faculdade/data/Ano-2017.csv", ";", escape_double = FALSE, trim_ws = TRUE)
# 
# dados_cota <- rbind(cp_2015, cp_2016, cp_2017)
# 
# teste <- dados_cota %>% select(-nuCarteiraParlamentar, -nuLegislatura, -codLegislatura, -txtNumero, -vlrRestituicao, -numRessarcimento, -numLote, -txtTrecho,
#                                     -txtPassageiro, -numSubCota, -numEspecificacaoSubCota, -numParcela, -numMes, -numAno, -nuDeputadoId, -ideDocumento)
# 
# write.csv(teste, file = "dadosCEAP.csv", row.names = F)


# Tranformar numeros com , em numeros com .

dadosCEAP <- read_csv("~/Faculdade/data-science-2017.2/dadosCEAP.csv")

# names(dadosCEAP) <- c("nomeParlamentar", "idCadastro", "sgUF", "sgPartido", "tipoDespesa", "especDespesa", "fornecedor", "CNPJCPF", "tipoDocumento", 
#                       "dataEmissao", "valorDocumento", "valorGlosa", "valorLíquido")

write.csv(dadosCEAP, file = "dadosCEAP.csv", row.names = F)

dadosCEAP$valorDocumento <- as.numeric(sub(",", ".", dadosCEAP$valorDocumento, fixed = TRUE))
dadosCEAP$valorGlosa <- as.numeric(sub(",", ".", dadosCEAP$valorGlosa, fixed = TRUE))
dadosCEAP$valorLíquido <- as.numeric(sub(",", ".", dadosCEAP$valorLíquido, fixed = TRUE))

# Perguntas
1. Quais os partidos que mais fazem uso da CEAP? Quais os partidos que menos fazem uso?
2. Quais os tipos de despesa são mais comuns para o uso da CEAP?
3. Levando em conta o estado pelo qual o deputado se elegeu, quais os estados que mais fazem uso da CEAP? Quais os que menos fazem uso? Por que você acha isso?
4. Quais os parlamentares que mais utilizam a CEAP e quais os que menos utilizam?
5. Levando em consideração a data, houve mudança em relação ao uso da CEAP ao longo dos anos?



