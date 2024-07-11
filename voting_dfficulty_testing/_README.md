# Voting Difficulty Analysis
![alt text](<Screenshot 2024-06-30 054156.png>)
## Project Overview
This project analyzes the voting difficulty experienced by Democratic and Republican voters using data from the ANES 2022 Pilot Study. The main goal is to determine if there is a statistically significant difference in voting difficulty between the two groups.

## Objective
The primary objective is to compare the voting difficulty between Democratic and Republican voters and assess both the statistical and practical significance of any observed differences.

## Data Source
The data used in this analysis comes from the American National Election Studies (ANES) 2022 Pilot Study. ANES provides high-quality data on voting, public opinion, and political participation to support research in the social sciences.

### About ANES and the Survey
ANES conducts national surveys of voters in the United States, focusing on their political opinions, behaviors, and demographics. The 2022 Pilot Study collects detailed information on respondents' voting experiences, political affiliations, and other relevant variables.

## Data Cleaning
The data was cleaned to exclude rows with missing values for the variables of interest. The variables were also recoded to ensure consistency and accuracy in the analysis.

## Data Dictionary
### Selected Columns
- **votehard**: Voting difficulty experienced by respondents, measured on a scale from 1 (Not difficult at all) to 5 (Extremely difficult).
- **party_affiliation**: Respondents' political affiliation, categorized as Democrat or Republican based on several survey questions.

## Columns Used to Define Voting Difficulty
- `votehard`: Voting difficulty rating.

### Columns Used to Define Party Affiliation
- `pid1r`: Initial party identification.
- `pidlean`: Leaning towards a particular party.
- `vote20`: Vote choice in the 2020 presidential election.
- `gov22p`: Vote choice for governor in the 2022 election.
- `house22p`: Vote choice for U.S. House of Representatives in the 2022 election.
- `senate22p`: Vote choice for U.S. Senate in the 2022 election.

### Tests Conducted
- **Wilcoxon Rank-Sum Test**: A non-parametric test used to compare the voting difficulty between Democrats and Republicans.

### Statistical Analysis Results and Significance
- **Test Results**:
  - Wilcoxon rank-sum test with continuity correction
  - Data: `votehard` by `party_affiliation`
  - W = 174540, p-value = 0.001447
  - Alternative hypothesis: True location shift is not equal to 0

The p-value of 0.001447 indicates a statistically significant difference in voting difficulty between Democrats and Republicans.

### Practical Significance
The mean voting difficulty for Democrats (1.24) is slightly higher than for Republicans (1.13). The effect size (r) was calculated as -0.080003 to assess the practical significance of this difference. The small effect size suggests that while the difference is statistically significant, it is small in practical terms.

### Conclusion
The analysis shows a statistically significant difference in voting difficulty between Democratic and Republican voters. However, the practical significance is moderate, indicating that the observed difference, though meaningful, may not be substantial in real-world terms.

## Refined Voting Difficulty Variable Analysis
Using the same data from our previous test, we refined and categorized the voting difficulty variable by incorporating additional variables.
 ((`vharder_0` - `vharder_11`),`regdiff_norm`, `votehard_norm`, `waittime_norm`, `triptime_norm`, `specific_difficulties_sum`, `turnout22_norm`, `turnout22w_norm`)

### Statistical Analysis Results
**Welch Two Sample t-test:**
- data:  difficulty_score_weighted by data$party_affiliation
- t = 0.033525, df = 1365.1, p-value = 0.9733
- alternative hypothesis: true difference in means between group Democrat and group Republican is not equal to 0

The p-value of 0.9733 indicates no statistically significant difference in the mean voting difficulty scores between Democrats and Republicans.

**Effect Size (Cohen's d)**
- Cohen's d estimate: 0.001811119 (negligible)
The negligible effect size suggests that the practical difference in voting difficulty scores between Democrats and Republicans is minimal.

### Conclusion 2
The refined analysis shows no statistically significant difference in voting difficulty between Democratic and Republican voters, and the negligible effect size indicates minimal practical difference.

## Future Directions
- **Expanded Analysis**: Including additional variables and demographic factors could enhance the understanding of voting difficulty across different voter segments.

This README provides a brief but comprehensive overview of the project, methodology, and findings, serving as a guide for further analysis and research.