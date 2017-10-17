library(readr)

# http://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/explicacoes-sobre-o-formato-dos-arquivos-xml

cp_2015 <- read_delim("~/Faculdade/data/Ano-2015.csv", ";", escape_double = FALSE, trim_ws = TRUE)
cp_2016 <- read_delim("~/Faculdade/data/Ano-2016.csv", ";", escape_double = FALSE, trim_ws = TRUE)
cp_2017 <- read_delim("~/Faculdade/data/Ano-2017.csv", ";", escape_double = FALSE, trim_ws = TRUE)

dados_cota <- rbind(cp_2015, cp_2016, cp_2017)
