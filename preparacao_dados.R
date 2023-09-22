# Importar pacote
library(dplyr)

# Definir diretório
setwd('G:/Meu Drive/GitHub/amazon_popular_books')

# Exportar Dataset
popular_books <- read.csv('Amazon_popular_books_dataset.csv')

# Selecionar colunas
popular_books_mod <- popular_books %>% select(c(2, 30, 5, 11, 18, 14))

# Verificar valores ausentes
sapply(popular_books_mod, function(x) sum(is.na(x)))
sapply(popular_books_mod, function(x) sum(is.nan(x)))

# Substituir valores ausentes
popular_books_mod$final_price <- ifelse(is.na(popular_books_mod$final_price),
                                        popular_books_mod$discount + popular_books_mod$initial_price,
                                        popular_books_mod$final_price)
# Remover linhas com valores NA
popular_books_mod <- na.omit(popular_books_mod)

# Exportar arquivo
library("readr")
write_delim(popular_books_mod, "Amazon_popular_books_dataset_tratado.csv", delim = ",")