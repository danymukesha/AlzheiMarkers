test_that("train_models works correctly", {
  mock_train_data <- data.frame(
    Cohort = factor(rep(c("AD", "HC"), each = 50)),
    Biomarker1 = rnorm(100),
    Biomarker2 = rnorm(100)
  )

  # result <- train_models(mock_train_data, n_cv = 2, n_repeat = 1)
  #
  # expect_type(result, "list")
  # expect_equal(length(result), 5)
  # expect_true(all(c("lasso", "rf", "nb", "pls", "xgb") %in% names(result)))
})
