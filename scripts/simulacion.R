# scripts/simulacion.R
# Genera datos sintéticos (con errores) y los guarda en data/raw/

set.seed(123)

dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)

n <- 300
datos <- data.frame(
  id = 1:n,
  ingreso = round(rnorm(n, mean = 1500, sd = 400), 0),
  edad = sample(18:70, n, replace = TRUE),
  educacion = sample(c("primaria", "secundaria", "tecnica", "universitaria"), n, replace = TRUE),
  pobreza = rbinom(n, 1, 0.30)
)

datos$ingreso[sample(1:n, 10)] <- sample(c(-200, -50, 999999), 10, replace = TRUE)
datos$ingreso[sample(1:n, 15)] <- NA
datos$educacion[sample(1:n, 10)] <- NA
datos$edad[sample(1:n, 8)] <- NA

write.csv(datos, "data/raw/datos_crudos.csv", row.names = FALSE)
cat("OK: data/raw/datos_crudos.csv creado\n")