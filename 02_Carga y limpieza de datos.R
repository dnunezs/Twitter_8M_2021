# Carga de datos -----
library(readr)

Data_comp <- read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_8+de+marzo.csv")

Data_comp = rbind(Data_comp, read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_8M.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_8M2021.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_8Marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_8Marzo2021.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_dia+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_dia+internacional+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_Diadelamujer.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_DíaInternacionalDeLaMujer.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_DíaVíctimasCovid.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_Marcha8M.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_6/2021_03_06_KW_SerMujerEsAlgoGrande.csv")
                  )

Data_comp = rbind(Data_comp, read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_8+de+marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_8M.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_8M2021.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_8Marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_8Marzo2021.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_dia+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_dia+internacional+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_Diadelamujer.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_DíaInternacionalDeLaMujer.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_DíaVíctimasCovid.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_Marcha8M.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_7/2021_03_07_KW_SerMujerEsAlgoGrande.csv")
)


Data_comp = rbind(Data_comp, read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_8+de+marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_8M.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_8M2021.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_8Marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_8Marzo2021.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_dia+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_dia+internacional+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_Diadelamujer.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_DíaInternacionalDeLaMujer.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_DíaVíctimasCovid.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_Marcha8M.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_8/2021_03_08_KW_SerMujerEsAlgoGrande.csv")
)

Data_comp = rbind(Data_comp, read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_8+de+marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_8M.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_8M2021.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_8Marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_8Marzo2021.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_dia+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_dia+internacional+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_Diadelamujer.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_DíaInternacionalDeLaMujer.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_DíaVíctimasCovid.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_Marcha8M.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_9/2021_03_09_KW_SerMujerEsAlgoGrande.csv")
)

Data_comp = rbind(Data_comp, read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_8+de+marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_8M.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_8M2021.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_8Marzo.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_8Marzo2021.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_dia+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_dia+internacional+de+la+mujer.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_Diadelamujer.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_DíaInternacionalDeLaMujer.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_DíaVíctimasCovid.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_EsteFeminismoEsViolencia.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_FeminismoEsLibertad.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_Marcha8M.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_MujeresPioneras.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_QueNadaNosLimite.csv")
                  , read_csv("Datasets_8M/DS_TW_10/2021_03_10_KW_SerMujerEsAlgoGrande.csv")
)


# Limpieza de datos ----
library(dplyr)

# quitamos los datos duplicados 
Data_sinRep <- Data_comp %>% 
  group_by(status_id) %>%
  slice(1)

# filtramos los datos y nos quedamos solo con los RTs
data_solo_RT <- subset(Data_sinRep, is_retweet == TRUE )
data_solo_RT <- as.data.frame(data_solo_RT)






