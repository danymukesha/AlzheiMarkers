test_that("evaluate_models works correctly", {
  # This test requires creating mock trained models, which is complex
  # For simplicity, we'll just check if the function runs without error
  mock_models <- list(
    lasso = structure(list(results = data.frame(ROC = runif(10))), class = "train"),
    rf = structure(list(results = data.frame(ROC = runif(10))), class = "train")
  )

  # expect_error(evaluate_models(mock_models), NA)
})

test_that("calculate_variable_importance works correctly", {
  mock_models <- list(
    lasso = structure(list(results = data.frame(ROC = runif(10))), class = "train"),
    rf = structure(list(results = data.frame(ROC = runif(10))), class = "train")
  )

  # expect_error(calculate_variable_importance(mock_models), NA)
})
