# scripts/graficos.R
# Genera histograma y lo guarda en results/figures/

dir.create("results/figures", recursive = TRUE, showWarnings = FALSE)

df <- read.csv("data/processed/datos_limpios.csv")

png("results/figures/histograma_ingreso.png", width = 900, height = 600)
hist(df$ingreso,
     breaks = 30,
     main = "Histograma de ingreso (datos sintéticos)",
     xlab = "Ingreso",
     ylab = "Frecuencia"
     col = "green",      
     border = "white")
dev.off()

cat("OK: results/figures/histograma_ingreso.png creada\n")