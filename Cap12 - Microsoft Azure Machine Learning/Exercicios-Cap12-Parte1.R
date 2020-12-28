# Lista de Exercícios - Capítulo 12


# Existem diversos pacotes para arvores de recisao em R. Usaremos aqui o rpart.
install.packages('rpart')
library(rpart)
?rpart

# Vamos utilizar um dataset que é disponibilizado junto com o pacote rpart
str(kyphosis)
head(kyphosis)
?kyphosis
View(kyphosis)

# Exercício 1 - Depois de explorar o dataset, crie um modelo de árvore de decisão
# Divindo Dados de Treino e Teste
intrain <- createDataPartition(kyphosis$Kyphosis,p=0.7,list=FALSE)

treino <- kyphosis[intrain,]  
teste <- kyphosis[-intrain,]

tree <- rpart(Kyphosis ~ .,
              treino
              )
tree
rpart.plot(tree)

## CORREÇÃO##
arvore <- rpart(Kyphosis ~ ., method = 'class', data = kyphosis)
arvore
rpart.plot(arvore)

# Para examinar o resultado de uma árvore de decisao, existem diversas funcões, mas você pode usar printcp()
printcp(tree)


# Visualizando a ávore (execute uma função para o plot e outra para o texto no plot)
# Utilize o zoom para visualizar melhor o gráfico
plotcp(arvore) # Não foi utilizado
rpart.plot(prune(arvore, cp = 0.023387)) # Não foi utilizado

## CORREÇÃO ##
plot(arvore, uniform = TRUE, main = "Arvore de Decisao em R")
text(arvore, use.n = TRUE, all = TRUE)

# Este outro pacote faz a visualizaco ficar mais legivel
install.packages('rpart.plot')
library(rpart.plot)
prp(tree)

prp(arvore)