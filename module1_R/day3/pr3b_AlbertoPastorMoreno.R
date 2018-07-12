# Ejercicio 1

str(swiss)
head(swiss)

sort(swiss$Education[1:25], method = "s", index.return = TRUE)

sort(as.integer(rnorm(200, 5, 7)), method = "q")

sort(as.integer(rnorm(200, 5, 7)), partial = 1:5)

# Ejercicio 2

# Numero de pie chicos 18 yo
x <- round(rnorm(100, 42, sqrt(2.5)))
# Estatura chicos 18 yo
y <- round(rnorm(100, 177, sqrt(10)))

datos <- data.frame( num_pie = x, estatura = y)

lapply(datos, mean)

lapply(datos, var)

cov_datos <- cov(datos$num_pie, datos$estatura)

cor_datos <- cor(datos$num_pie, datos$estatura)

plot(datos$num_pie, datos$estatura, main = sprintf("Covariance = %.2f Correlation = %.2f", cov_datos, cor_datos),
     xlab = "num_pie(EU)", ylab = "estatura(cm)")
abline(lm(datos$num_pie~datos$estatura))

k1 <- readline("Give me a number for 'k1': ")
k1 <- as.integer(k1)
k2 <- readline("Give me a number for 'k2': ")
k2 <- as.integer(k2)
lambda <- readline("Give me a number for 'lambda': ")
lambda <- as.integer(lambda)

k1 <- 4; k2 <- 4; lambda <- 4

rmatrix <- matrix(rpois(n = k1 * k2, lambda = lambda), nrow = k1, ncol = k2)

transpuesta <- function(m, k1, k2){
    ret <- matrix(nrow = k2, ncol = k1)
    for (i in 1:k1){
        for (j in 1:k2){
            ret[j, i] <- m[i, j]
        }
    }
    return(ret)
}

cat("Matriz original generada por una distribucion aleatoria Poisson: \n")

rmatrix

cat("Matriz transpuesta por mi implementacion: \n")

transpuesta(rmatrix, k1, k2)

cat("Matriz transpuesta por la funcion de libreria de R: \n")

t(rmatrix)