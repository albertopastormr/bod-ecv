# Ejercicio 1
getwd()
load("C:\\Users\\Alberto\\Documents\\GitHub\\sasa\\day1\\my_ws_d1_p1.Rdata")

# Ejercicio 2
table_ana = data.frame(c(nombre.Ana, edad.Ana, ingresos.Ana, gastos.Ana))
table_luis = data.frame(c(nombre.Luis, edad.Luis, ingresos.Luis, gastos.Luis))
table_maria = data.frame(c(nombre.Maria, edad.Maria, ingresos.Maria, gastos.Maria))
table_students = data.frame(table_ana, table_luis, table_maria)
str(table_students)

# Ejercicio 3
a * 2 - b
c <- a * 2 - b
typeof(c)
pares <- numeros[(numeros%%2)==0]
impares <- numeros[(numeros%%2)==1]
ls()
ls.str()
save.image("~/Github/sasa/day1/my_ws_d1_p1.RData")

# Ejercicio 4
f.edades <- edades[s.edades == TRUE]
print(f.edades)
secuencia <- seq(from = 3, to = 7)
# Indexando con una lista de enteros (parametro) devuelve una lista con todos los valores indexados por los enteros de la lista parametro
primos[secuencia]
primos[secuencia - 1]
primos[secuencia - 2]
# La operacion siguiente le suma 6 a todos los elementos de la lista 'secuencia'
secuencia.siguiente <- secuencia + 6
secuencia.siguiente
# Devuelve "NA" para aquellas indexaciones por elementos de 'secuencia.siguiente' que salen del rango de 'primos'
primos[secuencia.siguiente]