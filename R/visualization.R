#' Plot ROC Curves
#'
#' This function plots ROC curves for the trained models.
#'
#' @param eval_results Evaluation results from evaluate_models().
#' @return A ggplot object containing the ROC curves.
#' @export
#' @importFrom ggplot2 ggplot aes geom_line geom_abline theme_minimal labs
plot_roc_curves <- function(eval_results) {
  ggplot2::ggplot(eval_results$roc, ggplot2::aes(x = 1 - Specificity,
                                                 y = Sensitivity,
                                                 color = Model)) +
    ggplot2::geom_line() +
    ggplot2::geom_abline(intercept = 0, slope = 1, linetype = "dashed") +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = "ROC Curves for Different Models")
}

#' Plot Variable Importance
#'
#' This function plots the variable importance for a specified model.
#'
#' @param var_imp Variable importance results from
#' calculate_variable_importance().
#' @param model_name Name of the model to plot.
#' @return A ggplot object containing the variable importance plot.
#' @export
#' @importFrom ggplot2 ggplot aes geom_bar coord_flip theme_minimal labs
plot_variable_importance <- function(var_imp, model_name) {
  imp_df <- var_imp[[model_name]]
  imp_df$variable <- rownames(imp_df)

  ggplot2::ggplot(imp_df, ggplot2::aes(x = reorder(variable, Overall),
                                       y = Overall)) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::coord_flip() +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = paste("Variable Importance -", model_name),
                  x = "Variables", y = "Importance")
}
