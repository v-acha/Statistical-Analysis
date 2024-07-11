# Load necessary libraries
library(fec16)
library(ggplot2)
library(dplyr)
library(lmtest)
library(stargazer)

# Load the datasets
data("candidates")
data("results_house")
data("campaigns")

# View the first few rows of each dataset
head(candidates)
head(results_house)
head(campaigns)

# Create histograms # Q4.1 Exploring - Make Histograms
ggplot(results_house, aes(x = general_percent)) +
  geom_histogram(binwidth = 1, fill = 'blue', color = 'black') +
  labs(title = "Distribution of General Percent", x = "General Percent", y = "Frequency")

ggplot(campaigns, aes(x = ttl_disb)) +
  geom_histogram(binwidth = 1000, fill = 'green', color = 'black') +
  labs(title = "Distribution of Total Disbursements", x = "Total Disbursements", y = "Frequency")

#Exploring - Build a Data Frame pt 2
# Perform inner join
new_df <- inner_join(results_house, campaigns, by = "cand_id")

# Number of rows in the new dataframe
n_rows <- nrow(new_df)
n_rows

#Q4.3 Exploring - Build a Data Frame pt 2
# Number of columns in the new dataframe
n_cols <- ncol(new_df)
n_cols

#Exploring - Indicator Variables and Scatter Plot
# Create candidate_party variable in new_df
new_df <- new_df %>%
  mutate(candidate_party = case_when(
    party == "DEM" ~ "Democrat",
    party == "REP" ~ "Republican",
    TRUE ~ "Other Party"
  ))

# Produce the scatter plot
ggplot(new_df, aes(x = ttl_disb, y = general_votes, color = candidate_party)) +
  geom_point() +
  labs(
    title = "Scatter Plot of General Votes vs. Total Disbursements",
    x = "Total Disbursements",
    y = "General Votes",
    color = "Candidate Party"
  ) +
  theme_minimal()

# Perform linear regression
model <- lm(general_votes ~ ttl_disb + candidate_party, data = new_df)

# Summary of the model
summary(model)

# Generate Stargazer table and save to a .tex file
stargazer(model, 
          type = "latex", 
          title = "Regression Results for General Votes on Total Disbursements and Candidate Party",
          covariate.labels = c("Total Disbursements", "Other Party", "Republican"),
          dep.var.labels = "General Votes",
          no.space = TRUE, 
          style = "default",
          notes = "Standard errors are in parentheses.",
          single.row = TRUE,
          out = "regression_results.tex")
# Perform hypothesis test on the model coefficients
test_result <- coeftest(model)

# Print the test results 
print(test_result)

## Does the addition of candidate_party to our model provide any additional information about 
# Fit the reduced model without candidate_party
reduced_model <- lm(general_votes ~ ttl_disb, data = new_df)

# Fit the full model with candidate_party
full_model <- lm(general_votes ~ ttl_disb + candidate_party, data = new_df)

# Perform the F-test to compare the reduced and full models
anova_result <- anova(reduced_model, full_model)
print(anova_result)

