# Regression Analysis: Relationship between Income and providing elder care
![image](https://github.com/user-attachments/assets/9ab2ff00-e9f4-48d6-9b49-be393d0d287b)
## Introduction
This project investigates the relationship between weekly earnings and time spent on eldercare. By examining various factors that could influence the time devoted to eldercare, we aim to understand the underlying dynamics and identify significant predictors.

## Objective
The primary objective of this study is to determine how weekly earnings impact the time spent on eldercare. Additionally, we aim to explore other potential factors such as part-time/full-time employment status, presence of children, presence of a spouse, and total hours worked.

## Data
The data used in this study comes from the American Time Use Survey (ATUS) 2023. The dataset includes information on labor force and earnings, total time providing eldercare, and various household characteristics.

## Data Cleaning
1. Replaced missing values indicated by -1 with NA.
2. Selected relevant columns: TUCASEID, TRTEC, TRERNWA, TRHHCHILD, TRDPFTPT, TEHRUSLT, TRSPPRES, TRYHHCHILD, TRTCC, TRTSPOUSE, TRTFAMILY.
3. Filtered out rows with negative values in TRTEC, TRERNWA, TEHRUSLT, and TRHHCHILD.
4. Converted earnings to dollars and applied log transformations to earnings (TRERNWA) and time spent on eldercare (TRTEC).
5. Recoded and factorized categorical variables: part-time/full-time status, presence of children, and presence of spouse.

## Modeling
We developed four regression models to explore the relationship between weekly earnings and time spent on eldercare, along with other potential covariates:
1. **Model 1:** Examines the direct relationship between weekly earnings and eldercare time.
    - **Learned:** Earnings do not significantly predict eldercare time.
2. **Model 2:** Includes part-time/full-time status along with log-transformed earnings and eldercare time.
    - **Learned:** Neither earnings nor employment status significantly impact eldercare time.
3. **Model 3:** Adds the presence of children and spouse to the log-transformed model.
    - **Learned:** The presence of children significantly increases eldercare time, while earnings remain insignificant.
4. **Model 4:** Further includes total hours worked.
    - **Learned:** The presence of children remains a significant predictor, with other variables, including earnings, still not showing significant relationships.

## Selected Model
Model 4 was selected as it provides the most comprehensive insight by including all relevant covariates. It highlights that family dynamics, particularly the presence of children, are more critical in determining eldercare time than earnings or employment status.

## Practical and Statistical Significance
- **Practical Significance:** The model shows that households with children spend significantly more time on eldercare, emphasizing the role of family structure in caregiving responsibilities.
- **Statistical Significance:** The presence of children (TRHHCHILDChildren Present) is a statistically significant predictor with a p-value of 0.00158.

## Future Improvements
1. **Expand Variables:** Include additional variables such as health status, availability of external caregiving services, and more detailed income breakdowns.
2. **Longitudinal Analysis:** Conduct a longitudinal study to observe changes over time and better capture causal relationships.
3. **Interaction Effects:** Explore interaction effects between variables, such as how the presence of children interacts with other key variables.
4. **Model Validation:** Use cross-validation techniques to ensure the robustness of the model.

## Conclusion
This study provides valuable insights into the factors influencing time spent on eldercare. While weekly earnings were initially thought to be a significant predictor, family dynamics such as the presence of children play a more crucial role. Future studies should consider a broader range of variables and more sophisticated modeling techniques to deepen the understanding of eldercare time determinants.
