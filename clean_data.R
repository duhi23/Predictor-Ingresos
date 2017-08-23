######################################################################
##########       Predictor de Ingresos - Dependientes       ##########
######################################################################

library(haven)
library(dplyr)
library(readr)

afi15 <- read_tsv("Afiliados Activos062015.txt")


afi15 <- read_sav("Afiliados Activos062015.sav")
afi15 %>% filter(DP_VALOR_SUELDO>10000)
