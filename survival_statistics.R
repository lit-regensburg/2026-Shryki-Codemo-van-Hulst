
# Survival Analysis

# Pairwise survival comparisons
# stratified by cell line.

# Load required packages
library(survival)
library(survminer)
library(ggplot2)


# Read survival data
data_path <- "toumor_data.csv"
df <- read.csv(data_path)

# Ensure tumor is a factor
df$tumor <- factor(df$tumor)


# Kaplan-Meier Survival Analysis

# Fit survival model
survobj <- survfit(
  Surv(time = futime, event = event) ~ tumor,
  data = df
)


# Pairwise Survival Comparisons
# Perform pairwise comparisons with multiple testing correction

pairwise_results <- pairwise_survdiff(
  Surv(futime, event) ~ tumor,
  data = df,
  p.adjust.method = "holm"
)

print(pairwise_results)



