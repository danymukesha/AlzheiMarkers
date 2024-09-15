#' Split Data into Training and Test Sets
#'
#' This function splits the prepared data into training and test sets.
#'
#' @param prepared_data List containing the prepared data from prepare_data().
#' @param train_ratio Numeric value between 0 and 1 specifying the ratio of
#' training data.
#' @return A list containing the training and test datasets.
#' @export
#' @importFrom dplyr bind_rows sample_n
split_data <- function(prepared_data, train_ratio = 0.7) {
  HC <- prepared_data$HC
  AD <- prepared_data$AD

  train_HC <- dplyr::sample_n(HC, size = nrow(HC) * train_ratio)
  train_AD <- dplyr::sample_n(AD, size = nrow(AD) * train_ratio)
  train <- dplyr::bind_rows(train_HC, train_AD)

  test_HC <- dplyr::anti_join(HC, train_HC)
  test_AD <- dplyr::anti_join(AD, train_AD)
  test <- dplyr::bind_rows(test_HC, test_AD)

  list(
    train = train,
    test = test
  )
}
