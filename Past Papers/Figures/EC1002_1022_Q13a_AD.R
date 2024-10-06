# Load necessary libraries
library(ggplot2)

# Define the values for x
x <- seq(0, 600, by = 1)

# Define the three lines
line1 <- 80 + 0.8 * x      # y = 80 + 0.8x
line2 <- 20                # y = 20 (constant line)
line3 <- 100 + 0.8 * x     # y = 100 + 0.8x

# Define the y = x line
yx_line <- x

# Start plotting
p <- ggplot() +
  
  # Add the first line (red with 60% opacity)
  geom_line(aes(x = x, y = line1), color = "red", alpha = 0.6, size = 1) +
  
  # Add the second line (y = 20, red with 60% opacity)
  geom_line(aes(x = x, y = rep(line2, length(x))), color = "red", alpha = 0.6, size = 1) +
  
  # Add the third line (red with 100% opacity)
  geom_line(aes(x = x, y = line3, color = "Aggregate Demand"), size = 1) +
  
  # Add the y = x line (black, long dash)
  geom_line(aes(x = x, y = yx_line), color = "black", linetype = "longdash", size = 1) +
  
  # Mark and label the equilibrium point (500, 500)
  geom_point(aes(x = 500, y = 500, shape = "Equilibrium"), color = "black", size = 3, stroke = 1.5) +
  
  # Adjusted label position to top-left of the X
  geom_text(aes(x = 500, y = 500), label = "(500,500)", vjust = -1.5, hjust = 1.2, size = 5) +
  
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
    legend.position = "top"  # Position legend at the top
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
ggsave("EC1002_1022_Q13a_AD.png", plot = p, width = 6, height = 7, units = "in")
