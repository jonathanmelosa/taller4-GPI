# scripts/zenodo_data_acquisition.R

if (!require("pacman")) install.packages("pacman")
pacman::p_load(jsonlite, here)

get_zenodo_data <- function(zenodo_id,
                            api_endpoint = "https://zenodo.org/api/records/",
                            output_dir = here::here("data", "raw"),
                            output_filename = "datos_crudos.csv") {

  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

  api_url <- paste0(api_endpoint, zenodo_id)
  metadata_file <- file.path(output_dir, "metadata.json")

  message("Downloading metadata from Zenodo...")
  download.file(api_url, destfile = metadata_file, mode = "wb", quiet = TRUE)

  message("Parsing metadata...")
  metadata <- jsonlite::fromJSON(metadata_file)

  if (is.null(metadata$files) || length(metadata$files) == 0) {
    stop("No files found in the Zenodo record.")
  }

  file_url <- metadata$files$links$self[1]
  output_file <- file.path(output_dir, output_filename)

  message("Downloading data file from Zenodo...")
  download.file(file_url, destfile = output_file, mode = "wb", quiet = TRUE)

  message("File saved in: ", output_file)

  invisible(output_file)
}

if (!interactive()) {
  ZENODO_ID <- "18893524"

  get_zenodo_data(
    zenodo_id = ZENODO_ID,
    output_filename = "datos_crudos.csv"
  )
}