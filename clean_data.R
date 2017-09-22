######################################################################
##########       Predictor de Ingresos - Dependientes       ##########
######################################################################

library(haven)
library(dplyr)
library(readr)
library(data.table)
list.files()

afi15 <- read_sav("Afiliados_Activos062015.sav")
afi16 <- read_sav("Afiliados_Activos052016.sav")
colnames(afi16) <- c("DP_CEDULA", "SUELDO16")
cons <- full_join(afi15, afi16, by="DP_CEDULA")
# data para depurar en SPSS
write_sav(cons, "data_consolidada.sav")

# datos depurados
data <- read_sav("data_consolidada.sav")

data %>% select(DP_CEDULA, DP_SUELDO_15, DP_SUELDO_16) %>% filter(DP_SUELDO_15>50000) %>% summary()


#data17 <- read_csv2("export_20_09_2017.txt")
datos <- read_sav("data_consolidada_17.sav")

load("Info.RData")

datos_cne <- tbl_df(datos_cne)
datos_rc <- tbl_df(datos_rc)

datos_rc <- datos_rc %>% mutate(DP_CEDULA = ifelse(nchar(identificacion)==9, paste("0", identificacion, sep=""), identificacion)) %>% 
      select(DP_CEDULA, fecha_nacimiento)

datos <- left_join(datos, datos_rc, by="DP_CEDULA")
rm(list=c("datos_rc"))

datos_cne <- datos_cne %>% mutate(DP_CEDULA = ifelse(nchar(identificacion)==9, paste("0", identificacion, sep=""), identificacion)) %>% 
      select(DP_CEDULA, provincia, canton, parroquia, genero)

datos <- left_join(datos, datos_cne, by="DP_CEDULA")
rm(list=c("datos_cne"))