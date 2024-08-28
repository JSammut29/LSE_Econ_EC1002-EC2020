# Load necessary libraries
library(ggplot2)
library(gridExtra)  # For arranging plots side by side

# Define the regression parameters
intercept <- 4.2514
slope <- -0.8328
std_error_intercept <- 0.8911
std_error_slope <- 0.0031
n <- 32

# Generate a narrower sequence of prices
price <- seq(1, 50, length.out = 100)  # Prices from £1 to £50

# Calculate log(price) and predicted log(wine) values
log_price <- log(price)
predicted_log_wine <- intercept + slope * log_price

# Convert back to original wine values
predicted_wine <- exp(predicted_log_wine)

# Calculate the standard error of the predicted log values
se_prediction <- std_error_slope * log_price

# Calculate the upper and lower bounds of the 95% confidence interval for log(wine)
upper_bound_log <- predicted_log_wine + 1.96 * se_prediction + std_error_intercept
lower_bound_log <- predicted_log_wine - 1.96 * se_prediction - std_error_intercept

# Convert these bounds back to the original wine values
upper_bound <- exp(upper_bound_log)
lower_bound <- exp(lower_bound_log)

# Create a data frame for plotting
data <- data.frame(
  price = price,
  predicted_wine = predicted_wine,
  upper_bound = upper_bound,
  lower_bound = lower_bound
)

# First plot: original scale
plot1 <- ggplot(data, aes(x = price, y = predicted_wine)) +
  geom_line(color = "blue", size = 1.2) +  # Regression line
  geom_ribbon(aes(ymin = lower_bound, ymax = upper_bound), alpha = 0.2) +  # Confidence interval
  labs(
    title = "Predicted Wine Consumption vs. Price (Original Scale)",
    x = "Price (GBP)",
    y = "Predicted Wine Consumption (ml)"
  ) +
  theme_minimal()

# Second plot: log scale with original ml y-axis labels
plot2 <- ggplot(data, aes(x = price, y = predicted_wine)) +
  geom_line(color = "blue", size = 1.2) +  # Regression line
  geom_ribbon(aes(ymin = lower_bound, ymax = upper_bound), alpha = 0.2) +  # Confidence interval
  scale_y_log10(
    breaks = scales::trans_breaks("log10", function(x) 10^x),
    labels = scales::trans_format("log10", scales::math_format(10^.x))
  ) +
  labs(
    title = "Predicted Wine Consumption vs. Price (Log Scale)",
    x = "Price (GBP)",
    y = "Predicted Wine Consumption (ml)"
  ) +
  theme_minimal()

# Arrange the plots side by side
grid.arrange(plot1, plot2, ncol = 2, widths = c(1, 1.1))
