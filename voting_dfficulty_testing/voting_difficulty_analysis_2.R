library(readr)
library(effsize)
data <- read_csv("DS_203/Lab1/anes_pilot_2022_csv_20221214.csv")

#data types
str(data)

#Defining party affiliation: Democrats=1 Republicans=2 setting to NA for all respondents.
data$party_affiliation <- NA

# Using pid1r to define party affiliation, if not already defined - identify as democrat or republican
data$party_affiliation[data$pid1r == 1 & is.na(data$party_affiliation)] <- "Democrat"
data$party_affiliation[data$pid1r == 2 & is.na(data$party_affiliation)] <- "Republican"

# Using pidlean to define party affiliation, if not already defined - leaning democrat or republican
data$party_affiliation[data$pidlean == 2 & is.na(data$party_affiliation)] <- "Democrat"
data$party_affiliation[data$pidlean == 1 & is.na(data$party_affiliation)] <- "Republican"

# Using vote20 to define party affiliation, if not already defined - vote for Biden or Trump
data$party_affiliation[data$vote20 == 1 & is.na(data$party_affiliation)] <- "Democrat"
data$party_affiliation[data$vote20 == 2 & is.na(data$party_affiliation)] <- "Republican"

# Using gov22p to define party affiliation - for governor vote, democrat or republican
data$party_affiliation[data$gov22p == 1 & is.na(data$party_affiliation)] <- "Democrat"
data$party_affiliation[data$gov22p == 2 & is.na(data$party_affiliation)] <- "Republican"

# Using house22p - for house vote, democrat or republican
data$party_affiliation[data$house22p == 1] <- "Democrat"
data$party_affiliation[data$house22p == 2] <- "Republican"

# Using senate22p to define party affiliation, - for senate vote, democrat or republican
data$party_affiliation[data$senate22p == 1 & is.na(data$party_affiliation)] <- "Democrat"
data$party_affiliation[data$senate22p == 2 & is.na(data$party_affiliation)] <- "Republican"

# Check the distribution of party affiliations
table(data$party_affiliation)


#DIFFCULTY VARIABLE
# Normalize regdiff and votehard (already on a 1-5 scale)
data$regdiff_norm <- data$regdiff
data$votehard_norm <- data$votehard

# Normalize waittime and triptime (assuming 1-5 scale for simplicity)
data$waittime_norm <- data$waittime
data$triptime_norm <- data$triptime

# Create binary indicators for specific difficulties (already binary, 0 or 1)
specific_difficulties <- c("vharder_0", "vharder_1", "vharder_2", "vharder_3", "vharder_4", 
                           "vharder_5", "vharder_6", "vharder_7", "vharder_8", "vharder_9", 
                           "vharder_10", "vharder_11")

# Sum binary indicators
data$specific_difficulties_sum <- rowSums(data[specific_difficulties], na.rm = TRUE)

# Normalize turnout22 and turnout22w (scale 1-5, assuming higher values indicate more difficulty)
# For turnout22, let's assume 1 = highest ease, 4 = highest difficulty
data$turnout22_norm <- ifelse(data$turnout22 == 1, 1, 
                              ifelse(data$turnout22 == 2, 2, 
                                     ifelse(data$turnout22 == 3, 3, 
                                            ifelse(data$turnout22 == 4, 4, 5))))

# For turnout22w, 1 = highest ease, 4 = highest difficulty
data$turnout22w_norm <- data$turnout22w

# Combine all normalized variables into a composite score
data$difficulty_score <- rowSums(data[, c("regdiff_norm", "votehard_norm", "waittime_norm", 
                                          "triptime_norm", "specific_difficulties_sum", 
                                          "turnout22_norm", "turnout22w_norm")], na.rm = TRUE)

# weigh to certain variables more heavily
weight_regdiff <- 1
weight_votehard <- 1
weight_waittime <- 0.5
weight_triptime <- 0.5
weight_specific_difficulties <- 1
weight_turnout22 <- 1
weight_turnout22w <- 0.5

data$difficulty_score_weighted <- (data$regdiff_norm * weight_regdiff) +
  (data$votehard_norm * weight_votehard) +
  (data$waittime_norm * weight_waittime) +
  (data$triptime_norm * weight_triptime) +
  (data$specific_difficulties_sum * weight_specific_difficulties) +
  (data$turnout22_norm * weight_turnout22) +
  (data$turnout22w_norm * weight_turnout22w)

# Define thresholds to categorize difficulty (e.g., low, medium, high)
threshold_low <- quantile(data$difficulty_score_weighted, 0.33)
threshold_medium <- quantile(data$difficulty_score_weighted, 0.66)

#classifies the difficulty score into categories. 
data$difficulty_category <- cut(data$difficulty_score_weighted, 
                                breaks = c(-Inf, threshold_low, threshold_medium, Inf), 
                                labels = c("Low", "Medium", "High"))

# Check the distribution of difficulty categories
table(data$difficulty_category)

#TESTS
# Two-sample t-test using party_affiliation
t_test_composite <- t.test(difficulty_score_weighted ~ data$party_affiliation, data = data, na.rm = TRUE)

# Summary of results
t_test_composite

##effect size
cohen_d_composite <- cohen.d(data$difficulty_score_weighted  ~ data$party_affiliation)
cohen_d_composite