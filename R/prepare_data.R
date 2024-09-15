#' Prepare Data for Alzheimer's Biomarker Analysis
#'
#' This function loads and prepares the data for analysis, separating it into
#' Alzheimer's Disease (AD) and Healthy Control (HC) groups.
#'
#' @param file_path Character string specifying the path to the CSV file.
#' @return A list containing the prepared data and other relevant information.
#' @export
#' @importFrom data.table fread
#' @importFrom dplyr filter
prepare_data <- function(file_path) {
  data <- data.table::fread(file_path)
  data <- as.data.frame(data)

  HC <- dplyr::filter(data, Cohort == "HC")
  AD <- dplyr::filter(data, Cohort == "AD")

  list(
    data = data,
    HC = HC,
    AD = AD
  )
}
