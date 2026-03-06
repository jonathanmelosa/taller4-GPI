Taller 5 – Pipeline reproducible con datos almacenados en Zenodo
Autor: Jonathan Melo

Descripción:

Este repositorio contiene un flujo de trabajo reproducible en R para simular, limpiar, analizar y reportar un conjunto de datos sintético. El proyecto fue desarrollado como parte de los ejercicios del curso y organiza el proceso completo de análisis en un pipeline automatizado.

El objetivo de este taller es modificar el pipeline original para que los datos no se lean desde una simulación local durante la ejecución automática, sino que se descarguen desde un repositorio persistente en Zenodo utilizando su API. De esta manera, el proyecto demuestra cómo integrar repositorios de datos externos dentro de un flujo de trabajo reproducible.

⸻

Objetivo del taller:

El objetivo de este ejercicio es modificar el código base de un proyecto previamente desarrollado para que la lectura de datos se realice desde un repositorio público en Zenodo en lugar de depender de la generación local de datos.

Aunque los datos pueden reproducirse mediante simulación, para efectos de este ejercicio fueron almacenados en Zenodo con el fin de practicar el uso de repositorios persistentes y su integración con pipelines automatizados. Esto permite que el flujo de trabajo siga funcionando en el futuro sin depender de la generación local de los datos.

⸻

Fuente de datos:

El conjunto de datos utilizado en este proyecto fue publicado en Zenodo (no en Sandbox Zenodo) para asegurar persistencia en el tiempo.

DOI del dataset:
10.5281/zenodo.18893524

Record ID utilizado en la API:
18893524

Los datos se descargan automáticamente desde Zenodo mediante la API oficial utilizando el script:

scripts/zenodo_data_acquisition.R

Este script consulta el registro del dataset, obtiene la URL del archivo y descarga el dataset al directorio:

data/raw/datos_crudos.csv

⸻

Estructura del proyecto

El repositorio se organiza de la siguiente manera:
.
├── data
│   ├── raw
│   │   └── datos_crudos.csv
│   └── processed
│
├── results
│   ├── figures
│   ├── tables
│   └── reporte.txt
│
├── scripts
│   ├── simulacion.R
│   ├── zenodo_data_acquisition.R
│   ├── limpieza.R
│   ├── analisis.R
│   ├── graficos.R
│   └── reporte.R
│
├── runall.sh
└── README.md

⸻

Descripción de los scripts:

simulacion.R

Genera el conjunto de datos sintético original utilizado en talleres anteriores. Este script documenta el proceso de generación de los datos y se conserva en el repositorio para mantener trazabilidad del proceso.

zenodo_data_acquisition.R

Descarga el dataset desde Zenodo utilizando la API oficial. Este script:
	•	consulta el registro de Zenodo
	•	obtiene la URL del archivo del dataset
	•	descarga el archivo
	•	guarda los datos en data/raw/

Este paso reemplaza la lectura de datos simulados durante la ejecución automática del pipeline.

limpieza.R

Realiza la limpieza y transformación de los datos crudos. Los datos procesados se guardan en el directorio:

data/processed/

analisis.R

Calcula estadísticas descriptivas y realiza análisis básicos sobre los datos procesados.

graficos.R

Genera visualizaciones a partir de los resultados del análisis. Los gráficos se guardan en:

results/figures/

reporte.R

Produce un reporte final con los resultados del análisis, que se guarda en:

results/reporte.txt

⸻

Ejecución del pipeline

El flujo completo del proyecto puede ejecutarse automáticamente desde la raíz del repositorio utilizando el siguiente comando en la terminal:

bash runall.sh

Este comando ejecuta, en orden:
	1.	Descarga de datos desde Zenodo
	2.	Limpieza de datos
	3.	Análisis descriptivo
	4.	Generación de gráficos
	5.	Creación del reporte final

⸻

Flujo de trabajo

El pipeline del proyecto sigue la siguiente estructura:

Zenodo
↓
zenodo_data_acquisition.R
↓
limpieza.R
↓
analisis.R
↓
graficos.R
↓
reporte.R

⸻

Resultados generados

Al ejecutar el pipeline completo se generan los siguientes archivos principales:

data/raw/datos_crudos.csv
data/processed/datos_limpios.csv
results/tables/tabla_resumen.csv
results/figures/*.png
results/reporte.txt

Estos archivos contienen los datos descargados, los datos procesados, las tablas de resultados, las visualizaciones y el reporte final del análisis.

⸻

Reproducibilidad

Este proyecto está diseñado para ser completamente reproducible. Cualquier usuario puede:
	1.	clonar el repositorio
	2.	ejecutar el script runall.sh
	3.	obtener los mismos resultados

La integración con Zenodo permite que los datos permanezcan disponibles en el tiempo, garantizando que el pipeline siga funcionando sin depender de la generación local de datos.

⸻

Nota sobre la simulación

El archivo scripts/simulacion.R se mantiene en el repositorio como parte del historial del proyecto y para documentar cómo se generó originalmente el dataset sintético.

Sin embargo, para efectos del pipeline de este taller, los datos se obtienen directamente desde Zenodo y no se generan mediante simulación durante la ejecución automática.

⸻

Requisitos

Para ejecutar el proyecto se requiere:
	•	R
	•	conexión a internet para descargar los datos desde Zenodo

Paquetes de R utilizados en el proyecto:
	•	pacman
	•	jsonlite
	•	here
	•	dplyr
	•	rio
	•	janitor

Estos paquetes se instalan automáticamente al ejecutar los scripts.

⸻