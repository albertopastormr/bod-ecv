# Ejercicio 1

datos_sueno_iphone <- read.csv("C:\\Users\\Alberto\\Documents\\GitHub\\bod-ecv\\module1_R\\datasets\\DatosSueñoiPhone.csv", header = TRUE, sep = ";", skip = 2)
datos_sueno_iphone <- datos_sueno_iphone[datos_sueno_iphone["Fecha"] != "", ]

vector_corr_var <- c(   inicio_calidad = cor(datos_sueno_iphone$inicio, datos_sueno_iphone$calidad, use = "complete.obs"),
                        final_calidad = cor(datos_sueno_iphone$final, datos_sueno_iphone$calidad, use = "complete.obs"),
                        calidad_roncar = cor(datos_sueno_iphone$calidad, datos_sueno_iphone$roncar, use = "complete.obs"),
                        inicio_roncar = cor(datos_sueno_iphone$inicio, datos_sueno_iphone$roncar, use = "complete.obs"),
                        final_roncar = cor(datos_sueno_iphone$final, datos_sueno_iphone$roncar, use = "complete.obs"))

vector_corr_var.sorted <- sort(abs(vector_corr_var), decreasing = TRUE)

cat("Las correlaciones existentes entre las variables del dataset son: ", vector_corr_var.sorted, "\n")

cat("La mayor correlacion existente entre las variables del dataset es: ", vector_corr_var.sorted[1], " por ", names(vector_corr_var.sorted[1]))

vector_sourc_var <- c(inicio_calidad = c(inicio = datos_sueno_iphone$inicio, calidad = datos_sueno_iphone$calidad),
                   final_calidad = c(final = datos_sueno_iphone$final, calidad = datos_sueno_iphone$calidad),
                   calidad_roncar = c(calidad = datos_sueno_iphone$calidad, roncar = datos_sueno_iphone$roncar),
                   inicio_roncar = c(inicio = datos_sueno_iphone$inicio, roncar = datos_sueno_iphone$roncar),
                   final_roncar = c(final = datos_sueno_iphone$final, roncar = datos_sueno_iphone$roncar))

draw_plot <- function(x, y, msg, xlab, ylab){
    plot(x, y, main = msg, xlab = xlab, ylab = ylab)
    abline( lm(x~y))
}

cat("Las regresiones lineales que se producen entre las variables del dataset son: \n")

draw_plot(x = datos_sueno_iphone$inicio, y = datos_sueno_iphone$calidad, msg = "inicio_calidad", xlab = "inicio", ylab = "calidad")
draw_plot(x = datos_sueno_iphone$final, y = datos_sueno_iphone$calidad, msg = "final_calidad", xlab = "final", ylab = "calidad")
draw_plot(x = datos_sueno_iphone$calidad, y = datos_sueno_iphone$roncar, msg = "calidad_roncar", xlab = "calidad", ylab = "roncar")
draw_plot(x = datos_sueno_iphone$inicio, y = datos_sueno_iphone$roncar, msg = "inicio_roncar", xlab = "inicio", ylab = "roncar")
draw_plot(x = datos_sueno_iphone$final, y = datos_sueno_iphone$roncar, msg = "final_roncar", xlab = "final", ylab = "roncar")


# Ejercicio 2

get_minutes <- function (t){
    return (t %% 100 + (t %/% 100) * 60)
}



# Ejercicio 3

get_minutes_sleep <- function(tini, tend){
    return( ifelse(tini > tend, get_minutes(2400) - get_minutes(tini) + get_minutes(tend), get_minutes(tend) - get_minutes(tini)))
}

# Nuevas columnas con la hora de inicio en minutos y la hora de fin en minutos
datos_sueno_iphone <- cbind(datos_sueno_iphone, inicio_minutos = get_minutes(datos_sueno_iphone$inicio), final_minutos = get_minutes(datos_sueno_iphone$final))
# Nueva columna con la duracion del sueno
datos_sueno_iphone <- cbind(datos_sueno_iphone, duracion_minutos = get_minutes_sleep(datos_sueno_iphone$inicio, datos_sueno_iphone$final))

datos_sueno_iphone["duracion_minutos"]

