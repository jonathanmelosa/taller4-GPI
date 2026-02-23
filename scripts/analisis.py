# scripts/analisis.R
# Genera tabla resumen y la guarda en results/tables/

dir.create("results/tables", recursive = TRUE, showWarnings = FALSE)

df <- read.csv("data/processed/datos_limpios.csv")

tabla <- data.frame(
  n = nrow(df),
  ingreso_promedio = mean(df$ingreso),
  ingreso_mediana = median(df$ingreso),
  ingreso_sd = sd(df$ingreso),
  edad_promedio = mean(df$edad),
  pobreza_tasa = mean(df$pobreza)
)

write.csv(tabla, "results/tables/tabla_resumen.csv", row.names = FALSE)
cat("OK: results/tables/tabla_resumen.csv creada\n")
