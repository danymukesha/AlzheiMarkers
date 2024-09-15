# ---
#   title: "Alzheimer's Biomarker Analysis"
# output: rmarkdown::html_vignette
# vignette: >
#   %\VignetteIndexEntry{Alzheimer's Biomarker Analysis}
#   %\VignetteEngine{knitr::rmarkdown}
#   %\VignetteEncoding{UTF-8}
# ---
#
# ```{r, include = FALSE}
# knitr::opts_chunk$set(
#   collapse = TRUE,
#   comment = "#>"
# )
# ```
#
# ```{r setup}
# library(AlzheimerBiomarkers)
# ```
#
# A basic workflow for using the `AlzhMarkers` package which analyze metabolomic biomarkers for distinguishing Alzheimer's Disease (AD) patients from Healthy Controls (HC).
#
# ## Data Preparation
#
# First, let's prepare our data:
#
# ```{r data_prep}
# data <- prepare_data("../ inst/example_data.csv")
# split_data <- split_data(data)
# ```
#
# ## Model Training
#
# Now, we'll train our models:
#
#   ```{r model_training, eval=FALSE}
# models <- train_models(split_data$train)
# ```
#
# ## Model Evaluation
#
# Then, evaluate our models:
#
#   ```{r model_evaluation, eval=FALSE}
# eval_results <- evaluate_models(models)
# var_imp <- calculate_variable_importance(models)
# ```
#
# ## Visualization
#
# Finally, we'll visualize our results:
#
# ```{r visualization, eval=FALSE}
# roc_plot <- plot_roc_curves(eval_results$eval_results)
# print(roc_plot)
#
# imp_plot <- plot_variable_importance(var_imp, "rf")
# print(imp_plot)
# ```
