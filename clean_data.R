######################################################################
##########       Predictor de Ingresos - Dependientes       ##########
######################################################################

library(haven)
library(dplyr)
library(readr)
library(data.table)
list.files()

afi15 <- fread("Afiliados Activos062015.txt", sep = "|", dec = ",")
afi16 <- fread("AFILIADOS_2016_COMPLETA.txt", sep = ";")


afi15 <- read_sav("Afiliados Activos062015.sav")
afi15 %>% filter(DP_VALOR_SUELDO>10000)
