#Load necessary libraries
library(readr)
library(ggplot2)
library(dplyr)
library(lmtest)
library(stargazer)
library(tidyverse)
library(caret)
#library(GGally)

data <- read.csv("DS_203/Lab2/atusresp_2023.dat",header = TRUE)
head(data)

#Cleaning the data
# Select relevant columns, filter out invalid values (-1) and transform TRERNWA to proper dollar values
data <- data %>%
  select(TUCASEID, TRTEC, TRERNWA) %>%
  filter(TRTEC >= 0 & TRERNWA >= 0) %>%
  mutate(TRERNWA = TRERNWA / 100)

# View the number of rows
nrow(data)  # Returns the number of rows

# View the number of columns
ncol(data)  # Returns the number of columns

# Summary statistics
summary(data)

# Distribution plots
ggplot(data, aes(x = TRTEC)) +
  geom_histogram(bins = 30, fill = 'blue', alpha = 0.7) +
  labs(title = 'Distribution of Time Spent on Eldercare (Minutes)', x = 'Minutes', y = 'Frequency')

ggplot(data, aes(x = TRERNWA)) +
  geom_histogram(bins = 30, fill = 'green', alpha = 0.7) +
  labs(title = 'Distribution of Weekly Earnings ($)', x = 'Earnings ($)', y = 'Frequency')

# View unique values in the TUCASEID column
unique_tucaseid <- unique(data$TUCASEID)

# Print the unique values
print(unique_tucaseid)

# Count the number of unique values in the TUCASEID column
num_unique_tucaseid <- length(unique(data$TUCASEID))

# Print the count
print(num_unique_tucaseid)

#Modeling
# Simple Linear Regression - Model 1
model <- lm(TRERNWA ~ TRTEC, data = data)
summary(model)

# Enhanced Model: Log Transformation - Model 2
# Clean the data by filtering out invalid values
data_cleaned <- data %>%
  filter(TRTEC >= 0 & TRERNWA >= 0) %>%
  mutate(
    TRERNWA = TRERNWA / 100,  # Convert earnings to dollars
    log_TRERNWA = log(TRERNWA + 1),  # Apply log transformation (adding 1 to avoid log(0))
    log_TRTEC = log(TRTEC + 1)  # Apply log transformation (adding 1 to avoid log(0))
  )

# Fit the new linear model with log-transformed variables
log_model <- lm(log_TRERNWA ~ log_TRTEC, data = data_cleaned)

# Summary of the new model
summary(log_model)

#plotting models
# Model diagnostics: Residuals vs Fitted plot
par(mfrow = c(2, 2))
plot(model)

par(mfrow = c(2, 2))
plot(model_transformed)

