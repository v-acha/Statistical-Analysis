# Data Science Projects
![](https://cdn.pixabay.com/photo/2024/01/29/22/47/ai-generated-8540922_1280.jpg)

Welcome to the Data Science Project repository! This repository showcases my exploration of data science. You can dive into a curated selection of my data science projects, each offering unique insights and analyses across diverse domains. My projects range from exploratory data analysis to predictive modeling and machine learning applications, all aimed at uncovering meaningful trends, solving problems, and driving informed decision-making. As a beginner, I'm embarking on a journey to learn and grow my skills by working on various projects. I invite you to join me on this learning adventure as I uncover insights, tackle challenges, and build foundational knowledge in data science.

1. [Voting Difficulty Analysis](https://github.com/v-acha/Data_Science_Projects/tree/main/TikTok_Salary_Survey)
   - **Description:** This project entails analyzing salary data gathered from a TikTok survey to predict salary amounts based on various categories and gender, using specific variables as predictors.
   - **Technologies Used:** This analysis employs R and its packages including dplyr for data manipulation, readr for data import, ggplot2 for data visualization, car for statistical testing, and effsize for calculating effect sizes.
   - **Results:** 
        - Wilcoxon Rank-Sum Test: The first rank-sum test showed a statistically significant difference in voting difficulty between Democrats and Republicans with a p-value of 0.001447. The effect size (r) was calculated as -0.080003 to assess the practical significance of this difference. The small effect size suggests that while the difference is statistically significant, it is small in practical terms.
        - Welch Two Sample t-test: The Welch Two Sample t-test showed no statistically significant difference in the mean voting difficulty scores between Democrats and Republicans (t = 0.033525, df = 1365.1, p-value = 0.9733). Cohen's d indicated a negligible effect size (d = 0.0018), suggesting minimal practical difference.
        
2. [Campaign Spending Analysis]()
   - **Description:** The primary aims to understand the impact of campaign spending and party affiliation on election outcomes, and to assess the statistical and practical significance of these factors.
   - **Technologies Used:** The anlysis uses R and its packages dplyr, ggplot2, stargaze and lmtest libraries for performing t-tests on the regression models. `fec16` library for campaign data,
   - **Results:** 
        - The linear model results indicate that for every additional dollar spent on a campaign, the number of votes increases by approximately 0.013, and this relationship is statistically significant.
        - The hypothesis test results confirm that the coefficient for total disbursements is statistically significant, indicating a positive relationship between campaign spending and votes.
        - The F-statistic in the ANOVA test is 210.58, which measures the ratio of the variance explained by adding party affiliation (candidate_party) to the model compared to the variance within the model.