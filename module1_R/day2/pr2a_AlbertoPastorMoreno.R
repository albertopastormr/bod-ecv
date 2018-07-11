# Ejercicio 1

# Apartado a
tablei <- read.csv(file = "C:\\Users\\Alberto\\Documents\\GitHub\\bod-ecv\\module1_R\\datasets\\DatosSueñoiPhone.csv", skip = 2, header = TRUE, sep = ";")
tablei <- tablei[tablei["Fecha"] != "", ]

# Apartado b
plot(tablei[,c("inicio","calidad")])

# Apartado c
plot(tablei[,c("final","calidad")])

# Apartado d
tablei_mod <- cbind(tablei, diferencia = c(tablei$final - tablei$inicio))

# Apartado e - conversion a segundos y posterior resta con condicional sobre final > inicio
tablei["inicio"] <- ( (as.integer(tablei$inicio / 100)) * 3600 + (tablei["inicio"] %% 100)* 60)
tablei["final"] <- ( (as.integer(tablei$final / 100)) * 3600 + (tablei["final"] %% 100)* 60)