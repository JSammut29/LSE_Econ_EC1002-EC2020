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