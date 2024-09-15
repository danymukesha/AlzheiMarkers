#' Calculate Variable Importance
#'
#' This function calculates and returns the variable importance for each model.
#'
#' @param models List of trained models from train_models().
#' @return A list of data frames containing variable importance for each model.
#' @export
#' @importFrom caret varImp
calculate_variable_importance <- function(models) {
  lapply(models, function(model) caret::varImp(model, scale = TRUE))
}
