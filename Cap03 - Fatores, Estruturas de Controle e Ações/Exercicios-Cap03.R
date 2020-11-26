# Lista de Exercícios - Capítulo 3

# Exercícios 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files()

# Exercícios 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
vec1 <- c("Felipe", "Vivi", "Adriano", "Luana", "Danilo", "Mari")
vec2 <- c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)
vec3 <- c(1001, 1002, 1003, 1004, 1005, 1006)
df <- data.frame(vec1, vec2, vec3)
df


# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.
# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1
for (i in 1:length(vec1)){
  if (vec1[i] > 10) {
    print(vec1[i])
    print('Este elemento do vetor é maior que 10')  
  } else {
    print(vec1[i])
    print('Este elemento do vetor é menor que 10')
  }
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for (i in 1:length(lst2)) {
  print(lst2[[i]])}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as matrizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat3 <- mat1 * mat2
mat3

# Multiplicação de matrizes
# (multiplica primeira linha da mat1 com a primeira coluna de mat2)
# Item [1,1] ==> (1x1) + (2x2) + (3x3) X (4x4) x (5x5) = 55
# Item [2,1] ==> (6x1) + (7x2) + (8x3) x (9x4) x (10x5) = 130
# Item [3,1] ==> (11x1) + (12x2) + (13x3) x (14x4) x (15x5) = 130
# Usa-se a multiplicação % * %
# Item [1,1] seria multiplicar a Primeira Linha[1,] pela primeira coluna [,1]
# Item [2,1] seria multiplicar a Segunda Linha[2,] pela primeira coluna [,1]
mat4 <- mat1%*%mat2
mat4

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faÃ§a a nomeaÃ§Ã£o de cada um dos objetos
vec1 <- c(12, 3, 4, 19, 34)
names(vec1) <- c('col1', 'col2', 'col3', 'col4', 'col5')
vec1

mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
dimnames(mat1) = (list(c("obs1", "obs2", "obs3", "obs4", "obs5"), c("var1", "var2", "var3", "var4", "var5")))
mat1

lst1 <- list(2, 3, c(1, 2, 3))
names(lst1) <- c('dim1', 'dim2', 'dim3')
lst1

df1 <- data.frame(c("A", "B", "C"), c(4.5, 3.9, 7.2), c(TRUE, TRUE, FALSE))
colnames(df1) <- c('Caracteres', 'Float', 'Logico')
rownames(df1) <- c("obs1", "obs2", "obs3")
df1

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletÃ³ria para 50 elementos da matriz
# Dica: use a funÃ§Ã£o sample()
mat2 <- matrix(1:90, 10)
mat2
?sample
mat2[sample(1:50, 10)] = NA
mat2


# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
rowSums(mat1)
colSums(mat1)

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
order(a)
a[order(a)]

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for(i in mat1){
  if(i > 15){
    print(i)
  }
}