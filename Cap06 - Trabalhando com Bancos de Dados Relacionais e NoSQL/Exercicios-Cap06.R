# Lista de Exercícios - Capítulo 6


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
install.packages("RSQLite")
library(RSQLite)
library(dplyr)
library(dbplyr)

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "mamiferos.sqlite")
dbListTables(con)


# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
help(src_dbi)
src_dbi(con)


# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
?tbl
cons <- tbl(con, sql("SELECT year, species_id, plot_id FROM surveys"))
class(cons)
query = "SELECT year, species_id, plot_id FROM surveys"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados


# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
class(dados)


# Exercicio 6 - Já carregamos a tabela abaixo para você. Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(mamiferos, "surveys")
consulta = "SELECT species_id, sex, weight FROM surveys WHERE weight < 5"
sc = dbSendQuery(con, consulta)
dado = fetch(sc, n = -1)
dado

# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe
sc = dbSendQuery(con, consulta)
dado = fetch(sc, n = -1)
dado
class(dado)

# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(con)

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbWriteTable(con, "Felipe", mtcars, row.names = TRUE)
dbListTables(con)


# Exercicio 10 - Imprima os dados da tabela criada no item anterior
minha_consulta = "SELECT * FROM FELIPE"
envio = dbSendQuery(con, minha_consulta)
dd = fetch(envio, n = -1)
dd



