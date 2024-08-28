## EC2020 Live Session Exercise 2


#### Question 1

To investigate the relationship between the price of wine and consumption of wine, an economist estimates the following regression using a sample of 32 individuals for one week in 2013:

$$
\begin{aligned}
\widehat{\log (\text { wine })}= & \underset{(0.8911)}{4.2514}-\underset{(0.0031)}{0.8328} \log (\text { price }), \\
& n=32, R^2=0.89 .
\end{aligned}
$$

wine denotes the amount of wine consumed per week in milliliters (a medium glass contains 175 ml ), and price denotes the average price of a medium glass of wine of a selection of wines during the week in GBP ( $£$ ). The numbers in parentheses are the standard errors.

(a) Discuss what would happen to the parameter estimate of the slope coefficient if we had measured the amount of wine consumed per week in number of medium glasses instead of millilitres. Explain your answer.

(b) Discuss what would happen to the parameter estimate of the intercept if we had measured the amount of wine consumed per week in number of medium glasses instead of millilitres. Explain your answer.

---
<br>
<div align="center">
  <img src="EC2020 Live Session Exercise 2\Question 1.png" alt="Figure 1" />
</div>
<br>

When working with regressions, the interpretation of coefficients depends on the units of measurement for the variables. In this problem, the dependent variable is the logarithm of the quantity of wine consumed, and the independent variable is the logarithm of the price. The regression model is in a **log-log** form, which means the coefficients represent elasticities (i.e., the percentage change in the dependent variable for a 1% change in the independent variable).

- The coefficient of $\log(\text{price})$ is -0.8328, indicating that **a 1% increase in price is associated with a 0.8328% decrease in the quantity of wine consumed**, on average.
- The intercept \(4.2514\) represents the expected value of $\log(\text{wine})$ when $\log(\text{price})$ is zero (i.e., when the price is 1 GBP).

> a) The slope coefficient measures the **elasticity** of wine consumptions with respect to price. If we change the units of the dependend variable, from milliliters to glasses, we would change the scale of the variable but not the relative percentage changes. Therefore, the slope coefficient will remain 0.8328%.

> b) The intercept represents the log of the expected value of wine consumption when price is 1 GBP. If you measure wine in glasses rather than milliliters, the intercept will adjusted by $$4.2514 - \log(175) = \log(\frac{17783.9}{175}) = 2.0069$$ reflecting the conversion factor between milliliters and glasses.

---

#### Question 2

Suppose that average worker productivity at manufacturing firms (*avgprod*) depends on two factors, average hours of training (*avgtrain*) and average worker ability (*avgabil*):

$$
\text { avgprod }=\beta_0+\beta_1 \text { avgtrain }+\beta_2 \text { avgabil }+u
$$


Assume that this equation satisfies the Gauss-Markov assumptions.

(a) Provide a clear interpretation of the parameter $\beta_1$.

(b) Suppose firms whose workers have less than average ability receive grants to provide training, so that *avgtrain* and *avgabil* are negatively correlated. Discuss the effect of omitting *avgabil* on the OLS estimator of $\beta_1$. Will the bias be upward or downward? Explain your answer.

(c) You are told that you can obtain the estimator of $\beta_1$ by running the regression

$$
\operatorname{avgprod}_i=\beta_1 \operatorname{avgtrain}_i^*+e_i, \quad i=1, \ldots, n
$$

where $\textit{avgtrain}_i^*$ is obtained by running a regression of *avgtrain* on an intercept and *avgabil*. Discuss this statement.

---
<br>

The model given is:
$$
\text{avgprod} = \beta_0 + \beta_1 \text{avgtrain} + \beta_2 \text{avgabil} + u
$$
where:
- $\text{avgprod}$ is the average worker productivity,
- $\text{avgtrain}$ is the average hours of training,
- $\text{avgabil}$ is the average worker ability,
- $u$ is the error term, which captures other factors affecting productivity that are not included in the model.

Assume the Gauss-Markov assumptions hold, which means the Ordinary Least Squares (OLS) estimators are unbiased, efficient, and consistent.

> a) $\beta_1$ measures the change in average worker productivity associated with a one-unit increase in average hours of training, assuming no change in worker ability.

If you omit *avgabil* from the regression model, the new model becomes:
$$
\text{avgprod} = \beta_0' + \beta_1' \text{avgtrain} + u'
$$
where $\beta_1'$ is the new OLS estimate of the effect of training on productivity, and $u'$ now includes the effect of *avgabil*.

Since *avgtrain* and *avgabil* are negatively correlated (as stated in the problem), we can denote this correlation as:

$$
\text{Cov}(\text{avgtrain}, \text{avgabil}) < 0
$$

If we assume that higher *avgabil* is associated with higher *avgprod*, i.e. $\beta_2 > 0$, then omitting *avgabil* means that the effect of *avgabil* is absorbed into the error term $u'$. 

> **Omitted Variable Bias Formula:** The bias in $\beta_1'$ due to omitting *avgabil* is given by:
>$$
\text{Bias}(\beta_1) = \text{Cov}(\text{avgtrain}, \text{avgabil}) \times \beta_2
>$$
>This negative bias in the residual $u'$ causes the regression to overestimate $\beta_1$, leading to an **upward bias** overall. Essentially, omitting **avgabil* causes the model to attribute more of the variance in productivity to training than it should, inflating the estimate of $\beta_1$.





