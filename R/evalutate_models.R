#' Evaluate Model Performance
#'
#' This function evaluates the performance of trained models using various metrics.
#'
#' @param models List of trained models from train_models().
#' @return A list containing performance metrics and plots.
#' @export
#' @importFrom caret resamples
#' @importFrom MLeval evalm
evaluate_models <- function(models) {
  results <- caret::resamples(models)

  eval_results <- MLeval::evalm(models)

  list(
    results = results,
    eval_results = eval_results
  )
}
