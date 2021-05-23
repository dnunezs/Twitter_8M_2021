#Cargar librería rtweet----
library(rtweet)

#Preparamos el token para acceder a la API----
twitter_token <- create_token(
  app = "Astroturfing_Party"
  ,consumer_key = 'XXXXXXXXXXXXXXXXXXXXXXXXX'
  ,consumer_secret = 'XXXXXXXXXXXXXXXXXXXXXXXXX'
  ,access_token = 'XXXXXXXXXXXXXXXXXXXXXXXXX'
  ,access_secret = 'XXXXXXXXXXXXXXXXXXXXXXXXX')

#hasgtag y palabras clave a descargar----
"8M 
8M2021 
8Marzo 
Diadelamujer 
DíaInternacionalDeLaMujer 
8Marzo2021 
Marcha8M 
8+de+marzo 
dia+de+la+mujer 
dia+internacional+de+la+mujer 
EsteFeminismoEsViolencia 
QueNadaNosLimite 
MujeresPioneras 
SerMujerEsAlgoGrande 
DíaVíctimasCovid 
FeminismoEsLibertad"

# Funcion para descargar los tweet y sustituir las palabras y las fechas
tweets <- search_tweets(q = "8M2021"
                        , n = 2000000
                       , include_rts = TRUE
                       , retryonratelimit = TRUE
                       , since='2021-03-06', until='2021-03-07')

# Lo guardamos en csv
save_as_csv(tweets,"2021_03_06_KW_8M2021.csv")


