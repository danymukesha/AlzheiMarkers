test_that("prepare_data works correctly", {
  # Create a mock CSV file
  mock_data <- data.frame(
    Cohort = c("AD", "HC", "AD", "HC"),
    Biomarker1 = c(1.1, 2.2, 3.3, 4.4),
    Biomarker2 = c(5.5, 6.6, 7.7, 8.8)
  )
  mock_file <- tempfile(fileext = ".csv")
  write.csv(mock_data, mock_file, row.names = FALSE)

  # Test the function
  result <- prepare_data(mock_file)

  expect_type(result, "list")
  expect_equal(nrow(result$AD), 2)
  expect_equal(nrow(result$HC), 2)

  # Clean up
  unlink(mock_file)
})

test_that("split_data works correctly", {
  mock_data <- list(
    HC = data.frame(Cohort = rep("HC", 100), Biomarker = rnorm(100)),
    AD = data.frame(Cohort = rep("AD", 100), Biomarker = rnorm(100))
  )

  result <- split_data(mock_data, train_ratio = 0.7)

  expect_type(result, "list")
  expect_equal(nrow(result$train), 140)
  expect_equal(nrow(result$test), 60)
})
