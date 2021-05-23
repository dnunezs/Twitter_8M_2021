# Cargar base completa-----
library(readr)
df_rt <- read_csv("02_Base_Solo_RT.csv")


# Análisis del discurso base completa ----
df_comu_1_tweets <- df_rt[, "text"]

# Quitamos los enlaces
df_comu_1_tweets$text <- gsub("http\\w+","",df_comu_1_tweets$text)
#Quitando los hashtags y usuarios en los tweets
df_comu_1_tweets$text <- gsub("#\\w+","",df_comu_1_tweets$text)
df_comu_1_tweets$text <- gsub("@\\w+","",df_comu_1_tweets$text)
#Quitando los signos de puntuación, números y textos con números
df_comu_1_tweets$text <- gsub("[[:punct:]]","",df_comu_1_tweets$text)
df_comu_1_tweets$text <- gsub("\\w*[0-9]+\\w*\\s*", "",df_comu_1_tweets$text)

# cargamos librerias que vamos a necesitar
library(tidytext)
library(tidyverse)
library(wordcloud)
library(stopwords)
library(tm)
library(syuzhet)

# tokenizacion de frases
df_comu_1_token <- unnest_tokens(tbl=df_comu_1_tweets,
                                 output = "word",
                                 input = "text",
                                 token = "words")

# Eliminamos las palabras vacias
df_comu_1_token <- filter(df_comu_1_token, !(word %in% stopwords("spanish")))
df_comu_1_token <- filter(df_comu_1_token, !(word %in% stopwords("english")))

# grafico con las principales palabras
df_comu_1_token %>%
  count(word, sort = TRUE) %>%
  filter(n > 200000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_text(aes(label=n), hjust= -0.1) +
  geom_col(colour = "deeppink4", fill = 'purple') +
  coord_flip()+
  theme_minimal()


# nube de palabras
df_comu_1_token %>%
  count(word, sort = TRUE) %>%
  with(wordcloud(words = word, 
                 freq = n, 
                 max.words = 100,
                 random.order = FALSE,
                 rot.per = 0.3,
                 colors = brewer.pal(8,"Dark2")))

# Grafos y comunidades base completa ----

# librerias 
library(rtweet)
library(igraph)
library(hrbrthemes)
library(tidyverse)
library(ggraph)

# Creamos el grafo
filter(df_rt , retweet_count > 0) %>%
  select(screen_name, retweet_screen_name) %>%
  filter(!is.na(retweet_screen_name)) %>% 
  graph_from_data_frame() -> rt_g

# Vemos sus componentes 
summary(rt_g)

# Densidad
edge_density(rt_g)

# Reciprocidad
reciprocity(rt_g)

# Grados
sort(degree(rt_g, mode="all"), decreasing = TRUE)
sort(degree(rt_g, mode="in"), decreasing = TRUE)
sort(degree(rt_g, mode="out"), decreasing = TRUE)

# simplificamos el grafo para poder usar louvine
detach("package:igraph", unload = TRUE)
library(igraph)
rt_g_sim <- simplify(rt_g, remove.multiple = TRUE, remove.loops = TRUE)
rt_g_sim <- as.undirected(rt_g_sim)

# deteccion de comunidades
library(geomnet)

# Louvain
lc <- cluster_louvain(rt_g_sim)
membership(lc)
communities(lc)
modularity(lc)
length(lc)

# creamos df con las comunidades
df_comu <- data.frame(
  "membership" = lc$membership
  #, "memberships" = lc$memberships
  #, "modularity" = lc$modularity
  , "names" = lc$names
  #, "vcount" = lc$vcount
  #, "algorithm" = lc$algorithm
)


# Vemos las comunidades mas grandes
tabla_comunidades <- sort(table(df_comu$membership), decreasing = TRUE)
# a partir de 100.000 miembros
tabla_comunidades[0:5]

# Nos quedamos solo con las 5 comunidades grandes
tabla_comunidades <- data.frame(tabla_comunidades)
tabla_comunidades$Var1 <-as.character(tabla_comunidades$Var1)
tabla_comunidades$Var1 <-as.numeric(tabla_comunidades$Var1)
nombre_com <- tabla_comunidades[1:5, 1]

# Creamos una base con los nombres y las comunidades a las que pertenecen solo de los 5 grandes
df_5Gandes_com <- filter(df_comu, membership %in% nombre_com)

# Análisis comunidades y filtro -----

nodos_Com_G <- filter(df_5Gandes_com, membership %in% nombre_com[1]) #CAMBIAR NUMERO DE LA COMUNIDAD!!!!!!!

df_rt_5Com <- filter(df_rt, screen_name %in% nodos_Com_G$names)
df_rt_5Com2 <- filter(df_rt, retweet_screen_name %in% nodos_Com_G$names)

df_rt_5Com <- rbind(df_rt_5Com, df_rt_5Com2)

# quitamos los duplicados
library(dplyr)

df_rt_5Com <- df_rt_5Com %>% 
  group_by(status_id) %>%
  slice(1) 

write.csv(df_rt_5Com,file="99_Base_Comunidad_1.csv" ) # CAMBIAR NOMBRE DEL EXCEL !!!!!!!!!!!!!!!!!!

# Análisis del discurso por comunidades ----
df_comu_1_tweets <- df_rt_5Com[, "text"]

# Quitamos los enlaces
df_comu_1_tweets$text <- gsub("http\\w+","",df_comu_1_tweets$text)
#Quitando los hashtags y usuarios en los tweets
df_comu_1_tweets$text <- gsub("#\\w+","",df_comu_1_tweets$text)
df_comu_1_tweets$text <- gsub("@\\w+","",df_comu_1_tweets$text)
#Quitando los signos de puntuación, números y textos con números
df_comu_1_tweets$text <- gsub("[[:punct:]]","",df_comu_1_tweets$text)
df_comu_1_tweets$text <- gsub("\\w*[0-9]+\\w*\\s*", "",df_comu_1_tweets$text)

# tokenizacion de frases
df_comu_1_token <- unnest_tokens(tbl=df_comu_1_tweets,
                                 output = "word",
                                 input = "text",
                                 token = "words")

# Eliminamos las palabras vacias
df_comu_1_token <- filter(df_comu_1_token, !(word %in% stopwords("spanish")))
df_comu_1_token <- filter(df_comu_1_token, !(word %in% stopwords("english")))

# grafico con las principales palabras
df_comu_1_token %>%
  count(word, sort = TRUE) %>%
  filter(n > 20000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_text(aes(label=n), hjust= -0.2) +
  geom_col(colour = "deeppink4", fill = 'purple') +
  coord_flip()+
  theme_minimal()


# nube de palabras
df_comu_1_token %>%
  count(word, sort = TRUE) %>%
  with(wordcloud(words = word, 
                 freq = n, 
                 max.words = 100,
                 random.order = FALSE,
                 rot.per = 0.3,
                 colors = brewer.pal(8,"Dark2")))

# Grafos y comunidades ----

# Creamos el grafo
df_rt_5Com_garp <- df_rt_5Com[, c("screen_name","retweet_screen_name")]
rt_g <- graph.data.frame(df_rt_5Com_garp, directed = TRUE)

# Vemos sus componenetes 
summary(rt_g)

# Densidad
edge_density(rt_g)

# Reciprocidad
reciprocity(rt_g)

# Grados
indg <- sort(degree(rt_g, mode="in"), decreasing = TRUE)
outdg <- sort(degree(rt_g, mode="out"), decreasing = TRUE)

indg[1:5]
outdg[1:5]

#guardar grafo para Gephi
write_graph(rt_g, "g_5.gml", "gml")

# Partidos España ------

Data_part <- read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_EsteFeminismoEsViolencia.csv")

Data_part = rbind(Data_part,
                   read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_SerMujerEsAlgoGrande.csv")
                             
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_SerMujerEsAlgoGrande.csv")

                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_SerMujerEsAlgoGrande.csv")

                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_SerMujerEsAlgoGrande.csv")

                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_SerMujerEsAlgoGrande.csv")
)

# Limpieza de datos 
library(dplyr)

# quitamos los datos duplicados
Data_sinRep <- Data_part %>% 
  group_by(status_id) %>%
  slice(1)

# Solo nos quedamos con RT
data_solo_RT <- subset(Data_sinRep, is_retweet == TRUE )

write.csv(data_solo_RT, file="99_Base_partidos_politicos.csv" )

# Análisis del discurso partidos ----
df_comu_1_tweets <- data_solo_RT[, "text"]

# Quitamos los enlaces
df_comu_1_tweets$text <- gsub("http\\w+","",df_comu_1_tweets$text)
#Quitando los hashtags y usuarios en los tweets
df_comu_1_tweets$text <- gsub("#\\w+","",df_comu_1_tweets$text)
df_comu_1_tweets$text <- gsub("@\\w+","",df_comu_1_tweets$text)
#Quitando los signos de puntuación, números y textos con números
df_comu_1_tweets$text <- gsub("[[:punct:]]","",df_comu_1_tweets$text)
df_comu_1_tweets$text <- gsub("\\w*[0-9]+\\w*\\s*", "",df_comu_1_tweets$text)

# cargamos librerias que vamos a necesitar
library(tidytext)
library(tidyverse)
library(wordcloud)
library(stopwords)
library(tm)
library(syuzhet)

# tokenizacion de frases
df_comu_1_token <- unnest_tokens(tbl=df_comu_1_tweets,
                                 output = "word",
                                 input = "text",
                                 token = "words")

# Eliminamos las palabras vacias
df_comu_1_token <- filter(df_comu_1_token, !(word %in% stopwords("spanish")))
df_comu_1_token <- filter(df_comu_1_token, !(word %in% stopwords("english")))

# grafico con las principales palabras
df_comu_1_token %>%
  count(word, sort = TRUE) %>%
  filter(n > 1000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_text(aes(label=n), hjust= -0.1) +
  geom_col(colour = "deeppink4", fill = 'purple') +
  coord_flip()+
  theme_minimal()

# nube de palabras
df_comu_1_token %>%
  count(word, sort = TRUE) %>%
  with(wordcloud(words = word, 
                 freq = n, 
                 max.words = 100,
                 random.order = FALSE,
                 rot.per = 0.3,
                 colors = brewer.pal(8,"Dark2")))

# Grafos y comunidades partidos ----

# librerias 
library(rtweet)
library(igraph)
library(hrbrthemes)
library(tidyverse)
library(ggraph)

# Creamos el grafo
filter(data_solo_RT , retweet_count > 0) %>%
  select(screen_name, retweet_screen_name) %>%
  filter(!is.na(retweet_screen_name)) %>% 
  graph_from_data_frame() -> rt_g

# Vemos sus componenetes 
summary(rt_g)

# Densidad
edge_density(rt_g)

# Reciprocidad
reciprocity(rt_g)

# Grados
indg <- sort(degree(rt_g, mode="in"), decreasing = TRUE)
outdg <- sort(degree(rt_g, mode="out"), decreasing = TRUE)

indg[1:5]
outdg[1:5]

# Análisis sentimientos partidos politicos -----

#Carga de paquetes
library(SnowballC)
library(tm)
library(syuzhet)

#Quitando los links en los tweets
df_comu_1_tweets$text <- gsub("http.*","",df_comu_1_tweets$text)
#Quitando los hashtags y usuarios en los tweets
df_comu_1_tweets$text <- gsub("#\\w+","",df_comu_1_tweets$text)
df_comu_1_tweets$text <- gsub("@\\w+","",df_comu_1_tweets$text)
#Quitando los signos de puntuación, números y textos con números
df_comu_1_tweets$text <- gsub("[[:punct:]]","",df_comu_1_tweets$text)
df_comu_1_tweets$text <- gsub("\\w*[0-9]+\\w*\\s*", "",df_comu_1_tweets$text)

# Pasamos el df de los texto a vector 
vector_tweet <- as.vector(df_comu_1_tweets$text)

# Aplicamos el analisis de sentimientos con el idioma español
emocion.df <- get_nrc_sentiment(char_v = vector_tweet, language = "spanish")

# Agregamos los sentimientos al df original
emocion.df2 <- cbind(df_comu_1_tweets, emocion.df)











