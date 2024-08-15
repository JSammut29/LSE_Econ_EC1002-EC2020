# Load the ggplot2 package
library(ggplot2)

# Define the data for the first function
x1 <- seq(10, 50, length.out = 500)
y1 <- 100 * x1 - x1^2 - 900

# Define the data for the second function
x2 <- seq(50, 90, length.out = 500)
y2 <- (100 * x2 - x2^2 - 900) / 2

# Create data frames
df1 <- data.frame(x = x1, y = y1)
df2 <- data.frame(x = x2, y = y2)

# Create a data frame for the line connecting the points (50, 1600) and (50, 800)
df_line <- data.frame(x = c(50, 50), y = c(1600, 800))

# Plot the functions
ggplot() +
  geom_line(data = df1, aes(x = x, y = y), color = "blue", size = 1.2) +
  geom_line(data = df2, aes(x = x, y = y), color = "blue", size = 1.2) +
  geom_segment(data = df_line, aes(x = x[1], xend = x[2], y = y[1], yend = y[2]), color = "blue", linetype = "dotted", size = 1.2) +
  labs(title = "Profit Maximization for Firm B",
       x = "Price (p)",
       y = "Profit",
       subtitle = "Assuming Firm A maintains Price and Output") +
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
