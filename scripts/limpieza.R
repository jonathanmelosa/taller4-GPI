# scripts/01_limpieza.R
# Lee datos crudos, limpia y guarda datos procesados

dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

df <- read.csv("data/raw/datos_crudos.csv")

df$ingreso[df$ingreso < 0] <- NA
df$ingreso[df$ingreso > 20000] <- NA
df$ingreso[is.na(df$ingreso)] <- median(df$ingreso, na.rm = TRUE)

df$educacion <- as.character(df$educacion)
df$educacion[is.na(df$educacion) | df$educacion == ""] <- "desconocida"

df$edad[is.na(df$edad)] <- median(df$edad, na.rm = TRUE)

write.csv(df, "data/processed/datos_limpios.csv", row.names = FALSE)
cat("OK: data/processed/datos_limpios.csv creado\n")