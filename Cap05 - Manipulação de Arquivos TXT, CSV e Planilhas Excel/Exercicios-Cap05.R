# Solução Lista de Exercícios - Capítulo 5


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double")

# correção
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
# col.names = colocar título da coluna, no caso seria NA


# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
df_iris <- read_csv("iris.csv", col_types = matrix(
  Sepal.Length = col_double(1),
  Sepal.Width = col_double(1),
  Petal.Length = col_double(1),
  Petal.Width = col_double(1),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

# CORREÇÃO
df_iris <- read_csv("iris.csv", col_types = list( # não é matriz e sim list
  Sepal.Length = col_double(), # não contém argumento 1 dentro parenteses
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

## CORREÇÃO
hist(dataset1, breaks = 30, xlim =c(0,300), col=rgb(1,0,0,0.5), xlab = "height", ylab="nbr of plants", main="distribution of heingth")
hist(dataset2, breaks = 30, xlim =c(0,300), col=rgb(0,0,1,0.5), add=T)
legend("topright", legend=c("Dataset 1", "Dataset2"), col=c(rgb(1,0,0,0.5),
                                                      rgb(0,0,1,0.5)), pt.cex=2, pch=15)

# add = T = sobrepor um sobre o outro e muda alguns parâmetros como cor entre outros


# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)
help("plotly")

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = Species , marker=list(size=20 , opacity=0.5))

# CORREÇÃO
plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))
                # faltou o "~" antes de Species


# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
# https://www.r-graph-gallery.co,/111-interactive-3d-plot-plotly/
library(plotly)
head(volcano)

# 3D plot
p = plot_ly(z = volcano, type = "surface")
p

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
install.packages("rjson")
library("rjson")
result <- fromJSON(file = "input.json")
print(result)
class(result)


# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
result <- fromJSON(file = "input.json")
json_data_frame <- as.data.frame(result)
print(json_data_frame)
class(json_data_frame)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages("xml2")
library("XML")
library("methods")
# NÃO FUNCIONA O PACOTE "XML" TEM QUE USAR O CÓDIGO ABAIXO
install.packages("XML", type = "binary")
library(XML)

result <- xmlParse(file = "input.xml")
print(result)
class(result)

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)
class(xmldataframe)
View(xmldataframe)


# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
# Pergunta 2 - Qual o maior salário?
# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 

data <- read.csv("input.csv")
print(data)
View(data)

# 1
dim(data)

# correto
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))

# 2
# Get the max salary from data frame
sal <- max(data$salary)
print(sal)

# 3
pessoa <- subset(data, salary == max(salary))
pessoa

# 4
it <- subset(data, dept == 'IT')
it

# 5
itsup <- subset(data, dept == 'IT' & salary > 600)
itsup

