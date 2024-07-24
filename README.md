
![image](https://github.com/v-acha/Statistical-Analysis/assets/166547727/64ccdf25-6b75-42e3-9770-0948e03c6a68)

# Learning Stastics Through Projects
Welcome to my Statistics Project repository! Here, you’ll find a range of projects focused on statistical analysis, hypothesis testing, data visualization, and more. Each project is designed to deepen my understanding and proficiency in statistics. Explore the code, datasets, and documentation to see how statistical methods are applied in various scenarios. I aim to continuously improve my skills and knowledge through these projects. Your feedback and insights are welcome and appreciated!

1. [Voting Difficulty Analysis](https://github.com/v-acha/Statistical-Analysis/tree/main/voting_dfficulty_testing)
   - **Description:** This project entails analyzing salary data gathered from a TikTok survey to predict salary amounts based on various categories and gender, using specific variables as predictors.
   - **Technologies Used:** This analysis employs R and its packages including dplyr for data manipulation, readr for data import, ggplot2 for data visualization, car for statistical testing, and effsize for calculating effect sizes.
   - **Results:** 
        - Wilcoxon Rank-Sum Test: The first rank-sum test showed a statistically significant difference in voting difficulty between Democrats and Republicans with a p-value of 0.001447. The effect size (r) was calculated as -0.080003 to assess the practical significance of this difference. The small effect size suggests that while the difference is statistically significant, it is small in practical terms.
        - Welch Two Sample t-test: The Welch Two Sample t-test showed no statistically significant difference in the mean voting difficulty scores between Democrats and Republicans (t = 0.033525, df = 1365.1, p-value = 0.9733). Cohen's d indicated a negligible effect size (d = 0.0018), suggesting minimal practical difference.
        
2. [Campaign Spending Analysis](https://github.com/v-acha/Statistical-Analysis/tree/main/campaign_spending_analysis)
   - **Description:** The primary aims to understand the impact of campaign spending and party affiliation on election outcomes, and to assess the statistical and practical significance of these factors.
   - **Technologies Used:** The analysis uses R and its packages dplyr, ggplot2, stargazer and lmtest libraries for performing t-tests on the regression models. `fec16` library for campaign data,
   - **Results:** 
        - The linear model results indicate that for every additional dollar spent on a campaign, the number of votes increases by approximately 0.013, and this relationship is statistically significant.
        - The hypothesis test results confirm that the coefficient for total disbursements is statistically significant, indicating a positive relationship between campaign spending and votes.
        - The F-statistic in the ANOVA test is 210.58, which measures the ratio of the variance explained by adding party affiliation (candidate_party) to the model compared to the variance within the model.

3. [Elder Care Analysis](https://github.com/v-acha/Statistical-Analysis/tree/main/elder_care_analysis)
   - **Description:** This project investigates the relationship between weekly earnings and the time spent on eldercare. The study aims to understand how various factors, such as employment status, presence of children, presence of a spouse, and total hours worked, influence the time devoted to eldercare.
   - **Technologies Used:** The analysis uses R and its packages dplyr, ggplot2, stargazer, lmtest libraries for data analysis, regression model building and output formatting.
   - **Results:** 
      - Model 1: Weekly earnings do not significantly predict eldercare time.
      - Model 2: Neither earnings nor employment status significantly impact eldercare time.
      - Model 3: The presence of children significantly increases eldercare time, while earnings remain insignificant.
      - Model 4: The presence of children is a significant predictor of eldercare time, with other variables, including earnings and employment status, showing no significant relationships.
   - The study found that family dynamics, particularly the presence of children, are more critical in determining eldercare time than weekly earnings or employment status. The presence of children was identified as a statistically significant predictor with a p-value of 0.00158. Future studies should consider a broader range of variables and more sophisticated modeling techniques to deepen the understanding of the determinants of eldercare time.
