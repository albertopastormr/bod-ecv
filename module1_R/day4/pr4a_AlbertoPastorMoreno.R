# Ejercicio 1

datos_sueno_iphone <- read.csv("C:\\Users\\Alberto\\Documents\\GitHub\\bod-ecv\\module1_R\\datasets\\DatosSueñoiPhone.csv", header = TRUE, sep = ";", skip = 2)

# Apartado a

datos_sueno_iphone <- datos_sueno_iphone[datos_sueno_iphone["Fecha"] != "", ]

# Apartado b

# Automaticamente al guardar en el apartado e, se completaran con NA los datos ausentes

# Apartado c

datos_sueno_iphone <- cbind(datos_sueno_iphone, dia_semana = weekdays(as.Date(datos_sueno_iphone$Fecha, format = "%d-%m-%Y")))

# Apartado d

get_minutes <- function (t){
    return (t %% 100 + (t %/% 100) * 60)
}

get_minutes_sleep <- function(tini, tend){
    return( ifelse(tini > tend, get_minutes(2400) - get_minutes(tini) + get_minutes(tend), get_minutes(tend) - get_minutes(tini)))
}

datos_sueno_iphone <- cbind(datos_sueno_iphone, duracion_minutos = get_minutes_sleep(datos_sueno_iphone$inicio, datos_sueno_iphone$final))

# Apartado e

write.csv(datos_sueno_iphone, file = "C:\\Users\\Alberto\\Documents\\GitHub\\bod-ecv\\module1_R\\datasets\\datos_sueno_iphone_mejorado.csv")


# Ejercicio 2

datos_sueno_pulsera <- read.csv("C:\\Users\\Alberto\\Documents\\GitHub\\bod-ecv\\module1_R\\datasets\\DatosSueñoPulsera.csv", header = TRUE, sep = ";", skip = 2)

datos_sueno_pulsera <- datos_sueno_pulsera[datos_sueno_pulsera["Fecha"] != "", ]

datos_sueno_pulsera <- cbind(datos_sueno_pulsera, dia_semana = weekdays(as.Date(datos_sueno_pulsera$Fecha, format = "%d-%m-%Y")))

datos_sueno_pulsera <- cbind(datos_sueno_pulsera, duracion_minutos = get_minutes(datos_sueno_pulsera$profundo) + get_minutes(datos_sueno_pulsera$ligero))

write.csv(datos_sueno_pulsera, file = "C:\\Users\\Alberto\\Documents\\GitHub\\bod-ecv\\module1_R\\datasets\\datos_sueno_pulsera_mejorado.csv")


# Apartado a

datos_sueno_pulsera <- na.omit(datos_sueno_pulsera)
datos_sueno_pulsera$Fecha <- NULL
datos_sueno_pulsera$dia_semana <- NULL

dist(datos_sueno_pulsera, method = "euclidian")

plot(hclust(dist(datos_sueno_pulsera[, c("inicio","final","profundo","ligero","despierto","duracion_minutos")], method = "euclidian"), method = "single"))

library(cluster)

clusplot( datos_sueno_pulsera , kmeans(datos_sueno_pulsera, centers = 2)$cluster)

clusplot( datos_sueno_pulsera , kmeans(datos_sueno_pulsera, centers = 3)$cluster)

clusplot( datos_sueno_pulsera , kmeans(datos_sueno_pulsera, centers = 5)$cluster)