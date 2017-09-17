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

data %>% select(DP_CEDULA, SALARIO_16, SALARIO_15) %>% filter(SALARIO_15<354) %>% summary()
