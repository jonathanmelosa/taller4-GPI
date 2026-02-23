#!/usr/bin/env bash
set -e

# ============================================================
# runall.sh
# Pipeline reproducible del proyecto
# ============================================================

# 1) Calcular la ruta absoluta del directorio donde esta runall.sh
#    $0       = como se llamo este script (ej: ./runall.sh)
#    dirname  = extrae la carpeta que contiene al script
#    cd ... && pwd = entra a esa carpeta e imprime la ruta absoluta
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 2) Cambiar el directorio actual a la raíz del proyecto
#    Esto hace que rutas como "data/..." y "results/..." funcionen siempre.
cd "$PROJECT_DIR"

echo "== Ejecutando pipeline del proyecto =="
echo "Directorio del proyecto: $PROJECT_DIR"

# Corre scripts en orden (modo limpio)
Rscript --vanilla scripts/simulacion.R
Rscript --vanilla scripts/limpieza.R
Rscript --vanilla scripts/analisis.R
Rscript --vanilla scripts/graficos.R
Rscript --vanilla scripts/reporte.R

echo "== Listo. Revisa la carpeta results/ =="