#' Train Multiple Machine Learning Models
#'
#' This function trains multiple machine learning models on the provided data.
#'
#' @param train_data Training data frame.
#' @param n_cv Number of cross-validation folds.
#' @param n_repeat Number of repetitions for cross-validation.
#' @return A list of trained models.
#' @export
#' @importFrom caret trainControl train
#' @importFrom dplyr select
train_models <- function(train_data, n_cv = 10, n_repeat = 10) {
  set.seed(123)

  control <- caret::trainControl(
    method = "repeatedcv",
    number = n_cv,
    repeats = n_repeat,
    classProbs = TRUE,
    summaryFunction = caret::twoClassSummary
  )

  predictors <- train_data %>% dplyr::select(-Cohort)
  response <- train_data$Cohort

  models <- list(
    lasso = caret::train(x = predictors, y = response, method = "glmnet", metric = "ROC", trControl = control),
    rf = caret::train(x = predictors, y = response, method = "rf", metric = "ROC", trControl = control),
    nb = caret::train(x = predictors, y = response, method = "naive_bayes", metric = "ROC", trControl = control),
    pls = caret::train(x = predictors, y = response, method = "pls", metric = "ROC", trControl = control),
    xgb = caret::train(x = predictors, y = response, method = "xgbTree", metric = "ROC", trControl = control)
  )

  models
}
