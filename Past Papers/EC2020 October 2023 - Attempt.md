# EC2020 October 2023
---
---

## Section A

### Question 1
Consider the following multivariate regression model:

\[ y_i = \beta_0 + \beta_1 x_{1i} + \beta_2 x_{2i} + u_i \quad \tag{1.1} \]

For a given random sample of \( n \) observations \(\{(y_i, x_{1i} > 0, x_{2i} > 0)\}^n_{i=1}\) under the standard **MLR.1-MLR.4** assumptions (linearity in parameters, random sampling, no perfect multicollinearity, and zero conditional mean). Let:

\[ z_i = x_{2i}^{20} + \sqrt[23]{x_{1i}}, \quad z̄ = \sum_{i=1}^n \frac{z_i}{n} \]

Define the following slope estimator:

\[ \hat{\beta}_1 = \frac{\sum_{i=1}^n (z_i - z̄) y_i}{\sum_{i=1}^n (z_i - z̄) x_{1i}} \]

1. (4 marks) Carefully derive the asymptotic bias in the estimator \( \hat{\beta}_1 \). What are the conditions for \( \hat{\beta}_1 \) to be a consistent estimator of \( \beta_1 \)? In your answer, clearly explain the concept of consistency.

2. (4 marks) Suppose the conditional variance of \( u_i \) takes the following form:

\[ \text{Var}(u_i | x_{1i}, x_{2i}) = \delta^2(x_{2i}^0 + \sqrt[22]{x_{2i}}) \]

   Describe the problem with the OLS estimator \( \hat{\beta}_{\text{OLS}, 1} \) of \( \beta_1 \). Explain why it is not BLUE and propose a method to obtain the BLUE of \( \beta_1 \).

---

### Question 2
A researcher is interested in the relationship between (the natural logarithm of) family income \(\log(\text{faminc}_i)\) and (the natural logarithm of) annual household savings \(\log(\text{saving}_i)\). Using a random sample of 2023 families in the UK, she estimates the following regression:

\[ \log(\text{saving}_i) = \beta_0 + \beta_1 \log(\text{faminc}_i) + \beta_2 \text{children}_i + \beta_3 \text{qualification}_i + \epsilon_i \quad \text{(2.1)} \]

Where:
- \( \text{qualification}_i \) is a binary variable for whether the household head has a professional qualification.
- \( \text{children}_i \) is the number of children in the household.

Assume that model **(1.2)** satisfies assumptions **MLR.1-MLR.4**.

1. (2 marks) The researcher plans to include the logarithm of total consumption \( \log(\text{cons}) \), where \( \text{cons} = \text{faminc} - \text{saving} \) into **(2.1)**. Should we be concerned about the multicollinearity problem? In your answer, explain clearly what multicollinearity is and its implications.

2. (4 marks) A colleague claims that the benefit of having a professional qualification on the saving level will be offset by having two additional children. Discuss how you can test for this claim and clearly specify your null hypothesis and other test specifics.

3. (2 marks) Another colleague observes that in the OLS estimation of **(2.1)**, the coefficient estimates for \( \text{children}_i \) and \( \text{qualification}_i \) are both not statistically significant. They claim it is an indicator of heteroscedasticity. Do you agree with this claim? In your answer, state two factors that can affect the statistical significance of a coefficient estimate.

---

### Question 3
A researcher is interested in the relationship between the political institution of a country, measured by a political stability index (\( \text{stability}_i \)), and the number of reported Covid-19 cases per one million residents, \( \text{cases}_i^* \). She captures the relationship in a simple regression, using data from 145 countries in 2022:

\[ \text{cases}_i^* = \alpha + \beta \text{stability}_i + u_i \quad \text{(3.1)} \]

Where \( u \) is the error term and assumed to satisfy SLR.1 to SLR.5.

1. (4 marks) A researcher is worried that the number of cases in a country is likely to be misreported, particularly in politically less stable countries. Instead of the true number of cases, \( \text{cases}_i^* \), the researcher only obtains a misreported number of cases, \( \text{cases}_i \):

   \[
   \text{cases}_i^* = \text{cases}_i + e_i
   \]
   
   Where \( e_i + u_i \) is negatively correlated with \( \text{stability}_i \) for each country. Derive the bias associated with this systematic error. What is the sign of the bias?

2. (2 marks) Instead of the error in the number of cases, another researcher is concerned about the objectivity of the political stability index. She argues that the index tends to exaggerate the true level of political stability by 10%. Discuss how this claim can affect the OLS estimator of \( \beta \). What is the direction of the bias?

3. (2 marks) How would your answer to (2) change if the researcher assumes that the subjectivity of the stability index is purely random?

---

### Question 4
Consider the following time series model:

\[ y_t = \alpha + \beta t + \epsilon_t, \quad t = 2, \dots, T \quad \text{(4.1)} \]

Where:

\[
\epsilon_t = \theta_1 u_t + \theta_2 u_{t-1} + u_{t-2}, \quad u_t \text{ is white noise with zero mean and variance } \delta^2, \quad \theta_1, \theta_2 \neq 0
\]

1. (4 marks) Provide the condition(s) that ensures the stationarity of \( \epsilon_t \). In your answer, discuss what is meant by stationarity and how it is different from weak dependence.

2. (2 marks) Show that under the condition(s) provided in (1), \( y_t \) is trend stationary.

3. (2 marks) Discuss the problem with OLS estimation of **(4.1)**. What are the consequences of this problem? Propose a method to address this problem.

---

### Question 5
A researcher is interested in the relationship between the annual salary growth rate \( \text{salary}_t \) and the number of university graduates \( \text{graduate}_t \) in France since 2000. She estimates the following regression model using observations from **T** quarters:

\[ \text{salary}_t = \beta_0 + \beta_1 \text{graduate}_t + \beta_2 \text{graduate}_{t-1} + \theta \text{salary}_{t-1} + u_t \quad \text{(5.1)} \]

Where \( |\theta| < 1 \) and \( u_t \) has mean zero and variance \( \delta^2 \). The researcher observes that salary growth rates are weakly dependent.

1. (2 marks) Discuss the statistical properties of the OLS estimator for \( \theta \). Be clear about whether any Gauss-Markov assumptions are violated.

2. (2 marks) What is the short-term and long-term effect of the number of graduates on the salary growth rate?

3. (4 marks) Suppose that \( u_t \) can be expressed as \( u_t = \rho u_{t-1} + e_t \), where \( e_t \) is a white noise series. Discuss how this assumption will affect your answer in (1). Propose a method to address the problem.

---

## Section B 

### Question 6
A team examines the determinants of the number of Covid-19 cases \( \text{cases}_i \) per million residents in 142 countries around the world in 2022. They also have the data on the number of hospitals per million residents \( \text{hospital}_i \), the total government expenses on healthcare \( \text{healthexp}_i \) (in millions of dollars), and a binary variable to indicate whether tourism accounts for more than 25% of the country’s GDP \( \text{tourism}_i \). They estimate the following model, using the logarithms of \( \text{healthexp}_i \):

\[
\hat{\text{cases}}_i = -5.001 (3.414) - 100.11 (20.231) \log(\text{healthexp}_i) - 15.507 (22.51) \text{hospital}_i + 10.501 (4.213) \text{tourism}_i \quad \text{(6.1)}
\]

Where \( n = 142 \) and \( R^2 = .728 \). The robust standard errors are reported in parentheses.

1. (5 marks) What is the interpretation of the coefficient estimates on \( \log(\text{healthexp}_i) \) and \( \text{tourism}_i \)? Are the sign and size of the coefficients as you would expect? Explain your answer. Can you interpret any of the estimates as causal effects? Give at least two distinct reasons for your answer.

2. (5 marks) An intern generates a different variable \( \text{nontourism}_i = 1 - \text{tourism}_i \) to indicate if a country is not dependent on tourism. Explain what will happen to the estimates reported in **(6.1)** if we:
   - (i) Replace \( \text{tourism}_i \) by \( \text{nontourism}_i \) in **(6.1)**.
   - (ii) Add \( \text{nontourism}_i \) to the regression in **(6.1)** and drop the intercept. Explain whether the interpretation of the coefficient estimate for \( \text{tourism}_i \) would be different.

3. (5 marks) The team manager would like to test whether being more reliant on tourism reduces the effect of government health expenses on the number of cases. Describe a suitable test. Be clear about any additional information or model specification you would need.

4. (5 marks) Another colleague believes that the number of cases will vary more for countries with higher health expenses than for those with lower health expenses. Discuss a statistical test for this claim. Discuss what will happen to the estimation in **(6.1)** if we fail to reject the null hypothesis of this test.

---

### Question 7
An economist is interested in the relationship between social stability and economic output. She examines the following model for the (logarithm of) output-per-capita GDP \( \text{GDP}_i \) in a given country \( i \):

\[
\text{GDP}_i = \alpha + \beta_1 \text{protest}_i + \beta_2 \text{public}_i + \beta_3 \text{regions}_i + u_i \quad \text{(7.1)}
\]

Where:
- \( \text{protest}_i \) is the number of public protests happening in the country during a fiscal year.
- \( \text{public}_i \) is the per capita government spending (set by law) on social benefits in a single year.
- \( \text{regions}_i \) is a variable indicating the regional geography of the country (Asia, Europe, North America, etc.).

The economist obtains data for \( n = 150 \) countries around the world in 2022.

1. (5 marks) Give two distinct reasons why an OLS regression applied to **(7.1)** is inappropriate for estimating the causal effect of social instability (measured by \( \text{protest}_i \)) on economic development (\( \text{GDP}_i \)). Be clear on the direction of bias, if any.

2. (5 marks) The data contains a variable \( \text{adverseweather}_i \), which indicates the number of adverse weather events happening in the country during the year that prevented large public gatherings. The OLS estimation of \( \text{protest}_i \) on \( \text{adverseweather}_i \) with robust standard errors is reported in parentheses:

\[
\hat{\text{protest}}_i = 5.13 (2.214) - 10.61 (2.31) \text{adverseweather}_i - 15.57 (11.51) \text{public}_i + 1.01 (4.13) \text{regions}_i
\]
Where \( n = 150 \), \( R^2 = .718 \), \( Fstat = 24.33 \).

The economist aims to use \( \text{adverseweather}_i \) as an instrumental variable for \( \text{protest}_i \) in Equation **(7.1)**. What is the purpose of the estimation in **(7.2)**? Discuss whether you believe \( \text{adverseweather}_i \) is a valid instrument for \( \text{protest}_i \). In your answer, evaluate the required assumptions for a valid instrument.

3. (7 marks) The economist learns about the following relationship between \( \text{protest}_i \) and \( \text{GDP}_i \) from a senior colleague:

\[
\text{protest}_i = \gamma_0 + \gamma_1 \text{GDP}_i + \gamma_2 \text{regions}_i + \gamma_3 \text{trust}_i + \gamma_4 (\text{trust}_i \times \text{GDP}_i) + v_i \quad \text{(7.3)}
\]

Where \( \text{trust}_i \) indicates whether the residents of the country overwhelmingly support the government, and \( \text{trust}_i \times \text{GDP}_i \) is the interaction term. Examine the identification of each structural equation in **(7.1)** and **(7.3)**. Be clear on the problem of using OLS to estimate the models and whether you would be able to estimate the \( \beta_1 \) or \( \gamma_1 \) parameters in **(7.1)** consistently. Describe an estimator to estimate the parameters consistently.

4. (3 marks) Demonstrate that \( \text{public}_i \) and \( \text{trust}_i \times \text{public}_i \) are valid instruments to identify the parameters in **(7.3)**. Which estimator would you use to estimate the parameters in **(7.3)**? Hint: Show how the variables satisfy the conditions for valid instruments.

---

### Question 8
A researcher examines the probability of a random sample of economics professors in Europe using Twitter to share their professional ideas (\( \text{Twitter}_i = 1 \) if yes, and \( = 0 \) otherwise), where \( i \) indicates an individual economics professor. She uses OLS with conventional standard errors to obtain the following OLS regression results:

\[
\hat{\text{Twitter}}_i = 0.138 (0.114) - 0.011 (0.023) \text{age}_i - 0.135 (0.415) \text{male}_i + 0.754 (0.312) \text{head}_i + 0.064 (0.005) \text{pub}_i \quad \text{(8.1)}
\]

Where \( n = 2123 \), \( R^2 = 0.19 \), and:
- \( \text{age}_i \) = professor's age.
- \( \text{male}_i \) = whether the professor is male.
- \( \text{pub}_i \) = the number of publications.
- \( \text{head}_i \) = whether the professor is head of the department.

1. (2 marks) What is the interpretation of the intercept estimate? Is the sign what you would expect?

2. (5 marks) Looking at the estimates, a colleague claims that being a departmental head has a strong and statistically significant effect on the probability of an economics professor using Twitter. Explain why you would be skeptical about this claim. In your answer, propose two adjustments to the OLS estimation that can fix the problem you identify.

The researcher decides to re-estimate the model using Logit and obtains the following regression results:

\[
\hat{\text{Pr}}(\text{Twitter}_i = 1) = \Lambda \left( 0.238 (0.114) - 0.021 (0.013) \text{age}_i - 0.125 (0.215) \text{male}_i + 0.854 (0.012) \text{head}_i + 0.054 (0.022) \text{pub}_i \right) \quad \text{(8.2)}
\]

Where \( n = 2123 \), Pseudo-\( R^2 = 0.034 \), \(

 \log L = -316.60 \), and \( \Lambda(.) \) is the logistic cumulative density function, \( \Lambda(z) = \frac{\exp(z)}{1 + \exp(z)} \), and conventional standard errors are reported in parentheses.

3. (5 marks) Explain the advantages and potential drawbacks of using Logit estimation to examine the probability of using Twitter. In your answer, briefly describe the estimator behind the Logit estimation and state its statistical properties.

4. (5 marks) Describe how we can test whether age and the number of publications both have no effect on the probability of using Twitter by an economics professor. Be specific about the testing procedure and any additional information required.

5. (3 marks) What is the estimated effect of being a head of the department on using Twitter for a 40-year-old female professor with 10 publications? Hint: There is no need to give an exact number, clarity of the computation suffices.

---

### Question 9
Consider the following model that describes the relationship between the log of monthly revenue of a retail chain (\( \log(\text{revenue}_t) \)) and the log of monthly expenses on advertisement (\( \log(\text{ad}_t) \)) at quarter \( t \):

\[
\log(\text{revenue}_t) = \beta_0 + \beta_1 \log(\text{revenue}_{t-1}) + \beta_2 \log(\text{ad}_t) + \beta_3 \log(\text{ad}_{t-1}) + u_t \quad \text{(9.1)}
\]

We assume that \( \text{revenue}_t \) and \( \log(\text{ad}_t) \) are both **I(1)** variables, \( |\beta_1| < 1 \), and the error term \( u_t \) is independent of the regressors and has a zero mean and constant variance.

1. (5 marks) Explain the concepts of spurious relationship and co-integration. Clearly discuss why it is important to test whether the relationship in **(9.1)** is spurious or co-integrating. Hint: You are expected to discuss the statistical consequences of spurious relationship and co-integration on an OLS estimation of **(9.1)**.

2. (5 marks) Show that the model **(9.1)** can be fitted by an Error Correction Model (ECM) with the following structure:

\[
\Delta \log(\text{revenue}_t) = \rho \left( \log(\text{revenue}_{t-1}) - \gamma_1 - \gamma_2 \log(\text{ad}_{t-1}) \right) + \gamma_3 \Delta \log(\text{ad}_t) + u_t \quad \text{(9.2)}
\]

Explain what an Error Correction Model is and how the existence of the ECM relates to your answer in (1). Express \( \rho \), \( \gamma_1 \), \( \gamma_2 \), and \( \gamma_3 \) in terms of \( \beta_0 \), \( \beta_1 \), \( \beta_2 \), and \( \beta_3 \), and carefully interpret the various components of this ECM.

3. (5 marks) What are the advantages and challenges of estimating **(9.2)** using OLS? Discuss a procedure using OLS that can fit the ECM in **(9.2)**.

4. (5 marks) A colleague suspects that the error term \( u_t \) follows an AR(1) structure. Describe how you can test for this claim, knowing that firms are likely to spend more on advertisement during the summer to prepare for the festive shopping seasons. Based on your answers from (1) to (3), would you expect to reject the null hypothesis of this test? Explain your testing procedure and the rationale behind your answer.

---

**End of Paper**

---
