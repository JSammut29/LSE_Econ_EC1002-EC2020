# Load necessary libraries
library(ggplot2)
library(ggthemes)

# Define the values of x for the budget line
x <- seq(0, 5, by = 0.05)

# Define the line for MRS
y_MRS <- 2 * x

# Define the budget line equation: 50x + 25y = 100
# Solve for y: y = (100 - 50x) / 25
budget_y <- (100 - 50 * x) / 25

# Define the indifference curve for xy=2
indifference_y <- 2 / x

# Combine the data into a data frame
data <- data.frame(x = x, 
                   budget_y = budget_y, 
                   indifference_y = indifference_y,
                   y_MRS = y_MRS)

# Start plotting
p <- ggplot() +
  
  # Add the budget line (blue)
  geom_line(aes(x = x, y = budget_y, color = "Budget £100"), size = 1) +
  
  # Add the indifference curve for xy=2 (gold)
  geom_line(aes(x = x, y = indifference_y, color = "Indifference Curve"), size = 0.8) +
  
  # Add the dashed dark grey line for y=2x
  geom_line(aes(x = x, y = y_MRS), color = "darkgrey", linetype = "dashed", size = 0.8) +
  
  # Add the gold point at (1, 2) (Optimal Point)
  geom_point(aes(x = 1, y = 2, color = "Optimal Point"), size = 3, shape = 16) +
  
  # Add red Xs at (0, 4) and (2, 0) (Possible Combinations)
  geom_point(aes(x = 0, y = 4, color = "Possible Combinations"), size = 2, shape = 4, stroke = 1.5) +
  geom_point(aes(x = 2, y = 0, color = "Possible Combinations"), size = 2, shape = 4, stroke = 1.5) +
  
  # Define custom colors for the elements
  scale_color_manual(values = c(
    "Budget £100" = "blue", 
    "Indifference Curve" = "#FFC300",  # gold
    "Optimal Point" = "#FFC300",  # gold
    "Possible Combinations" = "red")) +
  
  # Customize the theme
  theme_economist() +
  theme(
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.ticks.x = element_line(size = 0.8),  # X-axis ticks visible
    axis.ticks.y = element_line(size = 0.8),  # Y-axis ticks visible
    axis.line.x = element_line(color = "black", size = 1.0),  # X-axis line at y=0
    axis.line.y = element_line(color = "black", size = 1.0),  # Y-axis line at x=0
    legend.position = c(1,1),       # Position legend at the top right
    legend.justification = c(1,1),   # Align legend to top right corner
  ) +
  
  # Add labels and title
  labs(x = "X = Fashion", 
       y = "Y = Cosmetics", 
       title = "Optimization of £100 Spending",
       color = "") +  # Remove legend title
  
  scale_x_continuous(limits=c(0,5), expand=c(0,0)) + 
  scale_y_continuous(limits=c(0,5), expand=c(0,0)) + 
  
  # Adjust plot limits to focus on positive values of x and y
  coord_cartesian(xlim = c(0, 5), ylim = c(0, 5))

# Save the plot as a PNG file
ggsave("EC1002_1022_Q11_Optimization.png", plot = p, width = 6, height = 7, units = "in")
