# Load the ggplot2 package
library(ggplot2)

# Define the data for the function
x <- seq(10, 90, length.out = 500)
y <- 100 * x - x^2 - 900

# Create a data frame for the function
df <- data.frame(x = x, y = y)

# Create a data frame for the optimal point
optimal_point <- data.frame(x = 50, y = 1600)

# Plot the function
ggplot() +
  geom_line(data = df, aes(x = x, y = y), color = "blue", size = 1.2) +
  geom_point(data = optimal_point, aes(x = x, y = y), color = "red", size = 3) +
  geom_text(data = optimal_point, aes(x = x, y = y, label = "Optimal Point"), vjust = -1, color = "red", size = 4, fontface = "italic") +
  labs(title = "Total Profit Function",
       x = "Price (p)",
       y = "Profit",
       subtitle = "Function: 100p - p^2 - 900") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12, face = "italic"),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    legend.position = "none"
  ) +
  scale_x_continuous(breaks = seq(10, 90, by = 10)) +
  scale_y_continuous(breaks = seq(-1000, 2000, by = 500))
