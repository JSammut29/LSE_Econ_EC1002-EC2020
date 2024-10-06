# Load necessary libraries
library(ggplot2)

# Define the values for x
x <- seq(0, 600, by = 1)

# Define the equations for the lines
line1_blue <- 80 + 0.6 * x      # y = 80 + 0.6x (blue 60%)
line2_blue <- 20                # y = 20 (constant, blue 60%)
line3_blue <- 100               # y = 100 (constant, blue 60%)
line3_red <- 100 + 0.8 * x      # y = 100 + 0.8x (red 100% opacity)
line4_blue <- 200 + 0.6 * x     # y = 200 + 0.6x (blue 100% opacity)

# Define the y = x line (black dashed)
yx_line <- x

# Start plotting
p <- ggplot() +
  
  # Add the first blue line (80 + 0.6x, blue with 60% opacity)
  geom_line(aes(x = x, y = line1_blue), color = "blue", alpha = 0.6, size = 1) +
  
  # Add the second blue line (y = 20, blue with 60% opacity)
  geom_line(aes(x = x, y = rep(line2_blue, length(x))), color = "blue", alpha = 0.6, size = 1) +
  
  # Add the third blue line (y = 100, blue with 60% opacity)
  geom_line(aes(x = x, y = rep(line3_blue, length(x))), color = "blue", alpha = 0.6, size = 1) +
  
  # Add the red line (100 + 0.8x, red with 100% opacity)
  geom_line(aes(x = x, y = line3_red, color = "Aggregate Demand"), size = 1) +
  
  # Add the new blue line (200 + 0.6x, blue with 100% opacity)
  geom_line(aes(x = x, y = line4_blue), color = "blue", size = 1) +
  
  # Add the y = x line (black, long dash)
  geom_line(aes(x = x, y = yx_line), color = "black", linetype = "longdash", size = 1) +
  
  # Mark and label the equilibrium point (500, 500)
  geom_point(aes(x = 500, y = 500, shape = "Equilibrium"), color = "black", size = 3, stroke = 1.5) +
  
  # Adjust label position to top-left of the X
  geom_text(aes(x = 500, y = 500), label = "(500,500)", vjust = 1.5, hjust = 1.2, size = 5) +
  
  # Customize the theme
  theme_economist() +
  theme(
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.text.x = element_text(size = 12),  # x-axis number labels
    axis.text.y = element_text(size = 12),  # y-axis number labels
    axis.ticks.x = element_line(size = 0.8),
    axis.ticks.y = element_line(size = 0.8),
    axis.line.x = element_line(color = "black", size = 0.8),
    axis.line.y = element_line(color = "black", size = 0.8),
    legend.position = "top"              # Position legend at the top right
  ) +
  
  # Add labels and title
  labs(x = "Output (Y)", 
       y = "Aggregate Demand (AG)", 
       title = "Aggregate Demand Schedule",
       color = "") +  # No legend title
  
  # Set axis limits (same scale for x and y)
  scale_x_continuous(limits = c(0, 600), expand = c(0, 0)) + 
  scale_y_continuous(limits = c(0, 600), expand = c(0, 0)) + 
  
  # Ensure the axes have the same scale for the 45-degree line
  coord_equal() +  
  
  # Define custom colors for the elements
  scale_color_manual(values = c("Aggregate Demand" = "red")) +
  
  # Add the Equilibrium point to the legend
  scale_shape_manual(values = c("Equilibrium" = 4)) +
  
  # Ensure both color and shape legends show
  guides(color = guide_legend(override.aes = list(linetype = c("solid"))),
         shape = guide_legend(title = NULL))

# Save the plot as a PNG file
ggsave("EC1002_1022_Q13b_AD.png", plot = p, width = 6, height = 7, units = "in")