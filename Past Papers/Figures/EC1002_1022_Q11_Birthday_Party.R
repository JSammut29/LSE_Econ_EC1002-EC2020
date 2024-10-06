# Load necessary libraries
library(ggplot2)
library(ggthemes)

# Define the values of x for the budget line
x <- seq(0, 15, by = 0.05)

# Define the line for MRS
y_MRS <- 2 * x

# Define the old budget line equation: 50x + 25y = 100
budget_y <- (100 - 50 * x) / 25

# Define the new budget line equation: 50x + 25y = 500
vouchers_y <- (500 - 50 * x) / 25

# Define the indifference curve for xy=2
indifference_y <- 2 / x

# Define the new indifference curve for xy=18
new_indifference_y <- 18 / x

# Define the optimal indifference curve for xy=50
opt_indifference_y <- 50 / x

# Combine the data into a data frame
data <- data.frame(x = x, 
                   budget_y = budget_y, 
                   vouchers_y = vouchers_y,
                   indifference_y = indifference_y,
                   new_indifference_y = new_indifference_y,
                   opt_indifference_y = opt_indifference_y,
                   y_MRS = y_MRS)

# Start plotting
p <- ggplot() +
  
  # Add the old budget line (blue, thinner)
  geom_line(aes(x = x, y = budget_y), color = "blue", linetype = "dashed", size = 0.5) +
  
  # Add the new budget line (coral, thinner)
  geom_line(aes(x = x, y = vouchers_y), color = "darkgreen", linetype = "dashed", size = 0.5) +
  
    
  # Add the indifference curve for xy=2 (gold)
  geom_line(aes(x = x, y = indifference_y, color = "Previous Indifference Curve"), size = 0.8) +
  
  # Add the dashed dark grey line for y=2x
  geom_line(aes(x = x, y = y_MRS), color = "darkgrey", linetype = "dashed", size = 0.8) +
  
  # Add the old point at (1, 2) in gold color
  geom_point(aes(x = 1, y = 2), color = "#FFC300", size = 3, shape = 16) +
  
  # Add the new point at (9, 2) in coral color
  geom_point(aes(x = 9, y = 2), color = "#FF7F50", size = 3, shape = 16) +
  
  # Add the optimal point at (5, 10) in green color
  geom_point(aes(x = 5, y = 10), color = "darkgreen", size = 3, shape = 16) +
  
  # Add the new indifference curve for xy=18 in coral color
  geom_line(aes(x = x, y = new_indifference_y, color = "New Indifference Curve"), size = 0.8) +

  # Add the optimal indifference curve for xy=50 in green color
  geom_line(aes(x = x, y = opt_indifference_y, color = "Optimal Indifference Curve"), size = 0.8) +
  
  # Add an arrow from (1, 2) to (9, 2)
  geom_segment(aes(x = 1.5, y = 2, xend = 8.5, yend = 2), 
               arrow = arrow(length = unit(0.3, "cm")), 
               color = "black", size = 1) +
  
  # Add an arrow from (9, 2) to (5, 10)
  geom_segment(aes(x = 8.875, y = 2.25, xend = 5.125, yend = 9.75), 
               arrow = arrow(length = unit(0.3, "cm")), 
               color = "black", size = 1) +
  
  # Customize the theme
  theme_economist() +
  theme(
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.ticks.x = element_line(size = 0.8),  # X-axis ticks visible
    axis.ticks.y = element_line(size = 0.8),  # Y-axis ticks visible
    axis.line.x = element_line(color = "black", size = 1.0),  # X-axis line at y=0
    axis.line.y = element_line(color = "black", size = 1.0),  # Y-axis line at x=0
    legend.position = c(1, 1),       # Position legend at the top right
    legend.justification = c(1, 1)   # Align legend to top right corner
  ) +
  
  # Add labels and title
  labs(x = "X = Fashion", 
       y = "Y = Cosmetics", 
       title = "Birthday Party",
       color = "") +  # Remove legend title
  
  scale_color_manual(values = c("Previous Indifference Curve" = "#FFC300", 
                                "New Indifference Curve" = "#FF7F50",
                                "Optimal Indifference Curve" = "darkgreen")) +
  
  scale_x_continuous(limits = c(0, 15), expand = c(0, 0)) + 
  scale_y_continuous(limits = c(0, 15), expand = c(0, 0)) + 
  
  # Adjust plot limits to focus on positive values of x and y
  coord_cartesian(xlim = c(0, 15), ylim = c(0, 15))

# Save the plot as a PNG file
ggsave("EC1002_1022_Q11_Birthday_Party.png", plot = p, width = 6, height = 7, units = "in")
