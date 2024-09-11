## EC2020 Live Session Exercise 2


#### Question 1

Let us consider a model for the sale price of Monet paintings. The data we have contains the sale prices, widths, and heights of 430 Monet paintings, which sold at auction for prices ranging from $\$ 10,000$ to $\$ 33\text{ million}$ . A linear regression provided the following result:

$$
\begin{aligned}
& \widehat{\log \text { Price }_i}=\underset{(0.612)}{-8.427}+\underset{(0.091)}{1.334} \log \text { Area }_i-\underset{(0.125)}{0.165} \text { Aspect Ratio }_i \\
& N=430, R^2=0.336,
\end{aligned}
$$

where Area=Width $\times$ Height and Aspect Ratio=Height/Width. The standard errors are given in parentheses. We will assume all Gauss Markov assumptions are satisfied.

(a) Interpret the parameters and test the significance of each. What additional assumption do you need to make?

(b) Explain whether the $p$-value for the test of significance of the Aspect Ratio is larger or smaller than 0.05 . Sketch a graph to indicate how the $p$-value is obtained.

(c) Provide the $95 \%$ confidence interval for $\beta_{\log A}$ Area . Discuss how you can use this interval to test the significance of $\log$ Area.

(d) Test the joint significance of the regression. Discuss its relation to the goodness of fit measure: $R^2$.

(e) You want to test $H_0: \beta_{\log \text { Area }}=1$ against $H_1: \beta_{\log \text { Area }}>1$. Perform this test using the information provided and provide an economic interpretation of your result. In view of your answer, indicate whether the $p$-value for the test is bigger or smaller than $5 \%$ and provide a sketch that indicates how the $p$-value is obtained.

---
<br>

1. **Intercept -8.427:**
   - The **y-intercept** tells us the predicted log of price when both **log(Area)** and **Aspect Ratio** are zero. 
   - It may not have practical relevance, ($\text{Area} = 1 \text{ cm}^2$, $\text{Aspect Ratio} \neq 0$  but is just part of the model fitting.

2. **Coefficient for $\log(\text{Area})$ 1.334:**
   - This coefficient tells us the **elasticity of price with respect to area**. Since we have logs on both sides, we can say:
     - **A 1% increase in area results in a 1.334% increase in price**.
   - Larger paintings get disproportionately more expensive This helps explain why bigger paintings tend to command higher prices at auction.

3. **Coefficient for Aspect Ratio -0.165:**
   - Since it’s not logged, we interpret this as: 
     - **A 1 unit increase in the aspect ratio is associated with a 16.5% decrease in price, holding the area constant.**
   - So, paintings that are much taller relative to their width (i.e., higher aspect ratio) tend to sell for less, while more square or wider paintings are more valuable.

<br>

>To perform valid hypothesis testing, we assume that the **residuals (errors) of the regression model are normally distributed**.

We may test the significance of each parameters using the t-statistic;
$$
t = \frac{\hat{\beta}}{\text{SE}(\hat{\beta})}
$$
- $\hat{\beta}$ - the estimated coefficient 
- $\text{SE}(\hat{\beta})$ - the standard error of the coefficient. 

<br>

- **Null Hypothesis ($H_0$):** The coefficient is equal to zero (i.e., the variable has no effect on the log of price).
- **Alternative Hypothesis ($H_1$):** The coefficient is not equal to zero (i.e., the variable has a significant effect on the log of price).

For $\beta_{\log(\text{Area})}$ | $H_0: \beta_{\log(\text{Area})} = 0$, $H_1: \beta_{\log(\text{Area})} \neq 0$

For $\beta_{\text{Aspect Ratio}}$ | $H_0: \beta_{\text{Aspect Ratio}} = 0$, $H_1: \beta_{\text{Aspect Ratio}} \neq 0$

With 430 observations, the degrees of freedom are;
$$N - k - 1 = 430 - 2 - 1 = 427$$
For a typical significance level of 5%, the critical t-value for a two-tailed test is about **1.96**. This means:
- If the absolute value of the t-statistic is greater than 1.96, we reject the null hypothesis and conclude the coefficient is significant.

1. **For $\log(\text{Area})$:**
   $$
   t = \frac{1.334}{0.091} = 14.66 > 1.96
   $$

2. **For Aspect Ratio:**
   $$
   t = \frac{|-0.165|}{0.125} = |-1.32| < 1.96
   $$

> a) Therefore we may conclude that; <br>
\- For $\log(\text{Area})$ the t-statistic is **14.66**, which is much greater than 1.96. This means that $log(\text{Area})$ is highly significant, and we can reject the null hypothesis. **Larger areas significantly increase the price.** <br> 
\- For Aspect Ratio the t-statistic is **-1.32**, which is less than 1.96 in absolute value. This means we fail to reject the null hypothesis, so **the aspect ratio does not significantly affect the price at the 5% significance level.**


