# Lista de Exercícios - Capítulo 7


# Formatando os dados de uma página web
library(rvest)
library(stringr)
library(tidyr)

# Exercício 1 - Faça a leitura da url abaixo e grave no objeto pagina
# http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I
pagina <- read_html("http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I")
pagina

# Exercício 2 - Da página coletada no item anterior, extraia o texto que contenha as tags:
# "#detailed-forecast-body b  e .forecast-text"
resultados <- pagina %>% html_nodes("#detailed-forecast-body b, .forecast-text")
resultados

previsao <- html_nodes(pagina, "#detailed-forecast-body b, .forecast-text")

# Exercício 3 - Transforme o item anterior em texto
texto <- html_text(resultados)
paste(texto, collapse = " ")

textos <- html_text(previsao)
paste(textos, collapse = " ")


# Exercício 4 - Extraímos a página web abaixo para você. Agora faça a coleta da tag "table"
url <- 'http://espn.go.com/nfl/superbowl/history/winners'
paginas <- read_html(url)
paginas
tag <- paginas %>% html_nodes('table')
class(tag)

# Exercício 5 - Converta o item anterior em um dataframe
tab <- html_table(tag)[[1]]
class(tab)
head(tab)
View(tab)

# Exercício 6 - Remova as duas primeiras linhas e adicione nomes as colunas
tab <- tab[-(1:2), ]
head(tab)
names(tab) <- c("number", "date", "site", "result")
head(tab)


# Exercício 7 - Converta de algarismos romanos para números inteiros
tab$number <- 1:54
tab$date <- as.Date(tab$date, "%B. %d, %Y")
head(tab)
View(tab)


# Exercício 8 - Divida a coluna result em 2 colunas com vencedores e perdedores
tab <- separate(tab, result, c('vencedor', 'perdedor'), sep = ', ', remove = TRUE)
head(tab)
View(tab)


# Exercício 9 - Inclua mais 2 colunas com o score dos vencedores e perdedores
# Dica: Você deve fazer mais uma divisão nas colunas
pattern <- " \\d+$"
tab$pontosVencedor <- as.numeric(str_extract(tab$vencedor, pattern))
tab$pontosPerdedor <- as.numeric(str_extract(tab$perdedor, pattern))
View(tab)
tab$vencedor <- gsub(pattern, "", tab$vencedor)
tab$perdedor <- gsub(pattern, "", tab$perdedor)
head(tab)
View(tab)


# Exercício 10 - Grave o resultado em um arquivo csv
write.csv(tab, 'superbowl.csv',row.names = F)
dir()


