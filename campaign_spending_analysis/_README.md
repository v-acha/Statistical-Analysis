# Campaign Spending Analysis
![image](https://github.com/v-acha/Statistical-Analysis/assets/166547727/adda64c2-6453-4405-9b09-6962f892debb) 

## Project Overview
This project analyzes the relationship between campaign spending, party affiliation, and election outcomes using the `fec16` dataset from the 2016 election cycle. The main goal is to determine how financial expenditures and party support influence the number of votes received by candidates.

## Objective
The primary objective is to understand the impact of campaign spending and party affiliation on election outcomes, and to assess the statistical and practical significance of these factors.

## Data Source
The data used in this analysis comes from the `fec16` package, which compiles spending and results from the 2016 election cycle. The dataset includes information on candidates, race attributes, and campaign finances.

### About `fec16` and the Dataset
The `fec16` package provides detailed information on federal election campaigns, including financial contributions, expenditures, and voting results. The analysis focuses on the `results_house` and `campaigns` data frames.

### Selected Columns
- **general_votes**: Total number of votes received by a candidate.
- **ttl_disb**: Total disbursements (campaign spending).
- **candidate_party**: Categorical variable representing party affiliation (Democrat, Republican, Other).

### Columns Used to Define Party Affiliation
- **party**: Party affiliation of the candidate.

## Tests Conducted
- **Linear Regression**: To analyze the relationship between campaign spending and votes.
- **t-tests**: To assess the significance of the slope coefficients.
- **ANOVA**: To compare models with and without party affiliation.

## Analysis and Results

### Distributions of Votes and Spending
- The distribution of **general_percent** (percentage of votes) is skewed.
- The distribution of **ttl_disb** (total disbursements) is right-skewed, with a long tail indicating a few campaigns with very high spending.

### Relationship between Total Disbursements and General Votes
There appears to be a positive relationship between total disbursements and general votes.

### Linear Regression Model
The model was fitted as follows: lm(formula = general_votes ~ ttl_disb + candidate_party, data = new_df)

**Summary Test Results:**

- **Residuals:**
  - Min: -146242
  - 1Q: -38135
  - Median: -11551
  - 3Q: 37488
  - Max: 679443

- **Coefficients:**
  - **(Intercept)**: Estimate = 1.401e+05, Std. Error = 3.741e+03, t value = 37.438, p-value < 2e-16 ***
  - **ttl_disb**: Estimate = 1.326e-02, Std. Error = 1.742e-03, t value = 7.614, p-value = 6.9e-14 ***
  - **candidate_partyOther Party**: Estimate = -1.131e+05, Std. Error = 6.154e+03, t value = -18.378, p-value < 2e-16 ***
  - **candidate_partyRepublican**: Estimate = 6.534e+03, Std. Error = 4.833e+03, t value = 1.352, p-value = 0.177

### Linear Regression - Evaluate Large Sample Assumptions

- **Assumption 1: Identically and Independently Distributed (I.I.D.) Data Points**
  - The data consists of campaign finance and vote counts from the 2016 election cycle, where each data point represents a different candidate's campaign. Observations are independent, with no obvious clustering or patterns suggesting dependency.

- **Assumption 2: Best Linear Predictor (BLP) Exists and is Unique**
  - The linear relationship between spending (total disbursements) and votes (general votes) is common in political science. The scatter plot indicates a general trend of higher disbursements associated with higher vote counts, supporting a linear relationship. The regression summary shows significant coefficients, confirming the BLP's existence and uniqueness.

### Hypothesis Testing

- **Money's Relationship with Votes**
  - The t-test results for the coefficient of **ttl_disb** show a p-value of **6.899e-14**, which is significantly less than 0.05. This indicates that **ttl_disb** is statistically significant. Practically, the coefficient estimate of **0.01326** implies that for every additional dollar spent, the number of votes increases by approximately **0.01326**, meaning that an increase in campaign spending by **$1,000,000** is associated with an increase of about **13,260 votes**.

- **Party's Relationship with Votes**
  - The F-test comparing the reduced model to the full model shows that adding **candidate_party** significantly improves the model, with a p-value less than **2.2e-16**. This indicates that including **candidate_party** provides important additional information about **general_votes**, and the reduction in residual error underscores the relevance of party affiliation in explaining election outcomes.

### Conclusion
- The distribution of votes and campaign spending is skewed, with most candidates receiving low percentages of votes and spending relatively little, while a few receive high percentages and spend significantly more.
- There is a positive relationship between total disbursements and general votes, suggesting that increased campaign spending tends to result in more votes.
- Adding party affiliation to the model provides additional explanatory power, emphasizing the importance of party support in determining election outcomes.
- The t-tests show that the slope coefficient for **ttl_disb** is statistically significant, and the ANOVA test confirms that the model with **candidate_party** is significantly better than the model without it.

