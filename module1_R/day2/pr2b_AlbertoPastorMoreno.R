# Ejercicio 1

# Calculo de la paridad de un numero
is_even <- function(num){
    if (num%%2 == 0)
        return(TRUE)
    else 
        return(FALSE)
}

# Calculo factorial de un numero
fact <- function(num){
    ret <- 1
    while (num > 0){
        ret <- ret * num
        num <- num - 1
    }
    return(ret)
}

# Ejercicio 2

# Construccion vector n numeros siguientes con la misma paridad a m
next_evens <- function(n,m){
    ret <- m + 2
    m <- m + 2
    while(n > 1){
        m <- m + 2
        ret <- c(v,m)
        n <- n - 1
    }
    return(ret)
}

# Ejercicio 3

# Apartado a
max_num <- function (v){
    if(length(v) == 0) # Vector entrada vacio
        return(NULL)
    ret <- v[1] # Maximo de retorno
    for (possible_max in v){
        if(possible_max > ret)
            ret <- possible_max
    }
    return(ret)
}

# Apartado b
freq_num <- function (v, x){
    if(length(v) == 0) # Vector entrada vacio
        return(NULL)
    ret <- 0
    for (num in v){
        if (num == x)
            ret <- ret + 1
    }
    return (ret)
}

# Apartado c
freq_max_num_lazy <- function(v){
    return(freq_num(v, max_num(v)))
}

freq_max_num <- function(v){
    freq_ret <- 1
    max_num <- v[1]
    for (num in v){
        if(num > max_num){
            max_num <- num
            freq_ret <- 1
        }
        else if(num == max_num)
            freq_ret <- freq_ret + 1
    }
    return(freq_ret)
}