test_that("plot_roc_curves works correctly", {
  mock_eval_results <- list(
    roc = data.frame(
      Specificity = runif(100),
      Sensitivity = runif(100),
      Model = rep(c("Model1", "Model2"), each = 50)
    )
  )

  result <- plot_roc_curves(mock_eval_results)

  expect_s3_class(result, "ggplot")
})

test_that("plot_variable_importance works correctly", {
  mock_var_imp <- list(
    rf = data.frame(
      Overall = runif(10),
      row.names = paste0("Var", 1:10)
    )
  )

  result <- plot_variable_importance(mock_var_imp, "rf")

  expect_s3_class(result, "ggplot")
})

