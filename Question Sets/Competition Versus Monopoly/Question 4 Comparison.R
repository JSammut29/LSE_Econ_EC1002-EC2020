# Load necessary libraries
library(ggplot2)

# Define the x values
x_values <- seq(0, 100, by = 2)

# Define the left Y axis (Perfect Market Competition)
y_left <- 10 - x_values / 10

# Define the right Y axis (Monopoly)
y_right <- 100 * x_values - x_values^2

# Create a data frame
data <- data.frame(x = x_values, y_left = y_left, y_right = y_right)

# Points to be labeled
points <- data.frame(
  x = c(50, 60),
  y_left = c(5, 4),
  label = c("(50,5) Monopoly Decision", "(60,4) Perfect Equilibrium"),
  vjust = c(-1, 1.5)
  
)

# Create the plot
ggplot(data, aes(x = x)) +
  # Plot for Perfect Market Competition
  geom_line(aes(y = y_left), color = "#69b3a2", size = 1.2) +
  
  # Plot for Monopoly (scaled for left y-axis visibility)
  geom_line(aes(y = y_right / 2750 * 20), color = "orange", size = 1.2) +
  
  # Add the vertical line for x = 60
  geom_vline(xintercept = 60, color = "#69b3a2", size = 1.2) +
  
  # Add the vertical line for x = 50
  geom_vline(xintercept = 50, linetype = "dotted", color = "orange") +

  # Highlighting Consumer Surplus
  geom_polygon(data = data.frame(x = c(0, 50, 0), y = c(10, 5, 5)), 
               aes(x = x, y = y), fill = "lightgreen", alpha = 0.5) +
  geom_text(aes(x = 10, y = 7.5, label = "Consumer Surplus"), color = "darkgrey") +
  
  # Highlighting Producer Surplus
  geom_polygon(data = data.frame(x = c(0, 50, 50, 0), y = c(0, 0, 5, 5)), 
               aes(x = x, y = y), fill = "lightcoral", alpha = 0.5) +
  geom_text(aes(x = 25, y = 2.5, label = "Producer Surplus"), color = "darkgrey") +
  
  # Highlighting Deadweight Loss
  geom_polygon(data = data.frame(x = c(50, 60, 60, 50), y = c(5, 4, 0, 0)), 
               aes(x = x, y = y), fill = "lightgrey", alpha = 0.5) +
  geom_text(aes(x = 55, y = 2.5, label = "Deadweight Loss"), color = "darkgrey") +

  # Plot and label the points (50,5) and (60,4)
  geom_point(data = points, aes(x = x, y = y_left), size = 3, color = "black") +
  geom_text(data = points, aes(x = x, y = y_left, label = label, vjust = vjust)) +
    
  # Customize the axes
  scale_y_continuous(
    name = "Perfect Market Competition",
    limits = c(0, 20),
    sec.axis = sec_axis(~ . * 2750 / 20, name = "Monopoly Profits", breaks = seq(0, 2750, by = 500))
  ) +
  
  # Set x limits
  xlim(0, 100) +
  
  # Apply minimal theme and customize axis title colors
  theme_minimal() +
  theme(
    axis.title.y.right = element_text(color = "orange"),
    axis.title.y.left = element_text(color = "#69b3a2"),
    legend.position = "none"
  )

# Print the plot
