# scripts/reporte.R
# Escribe un reporte simple usando la tabla generada

dir.create("results", showWarnings = FALSE)

tabla <- read.csv("results/tables/tabla_resumen.csv")

texto <- paste0(
  "REPORTE (salida automatizada)\n",
  "=============================\n\n",
  "Observaciones: ", tabla$n, "\n",
  "Ingreso promedio: ", round(tabla$ingreso_promedio, 2), "\n",
  "Ingreso mediana: ", round(tabla$ingreso_mediana, 2), "\n",
  "Ingreso SD: ", round(tabla$ingreso_sd, 2), "\n",
  "Edad promedio: ", round(tabla$edad_promedio, 2), "\n",
  "Tasa de pobreza: ", round(tabla$pobreza_tasa, 3), "\n\n",
  "Archivos generados:\n",
  "- results/tables/tabla_resumen.csv\n",
  "- results/figures/histograma_ingreso.png\n"
)

writeLines(texto, "results/reporte.txt")
cat("OK: results/reporte.txt creado\n")