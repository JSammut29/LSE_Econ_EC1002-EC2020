# Load necessary libraries
library(ggplot2)

# Define the values for x
x <- seq(0, 14, by = 0.05)

# Define the Average Total Cost (ATC) formula
atc <- 4 + (1/3) * (x / 3 - 2)^2

# Define the Marginal Cost (MC) formula
mc <- 2 * (x / 3 - 1)^2 + 2

# Define the Supply Curve (only for x >= 6)
x_supply <- x[x >= 6]  # limit the supply curve to x >= 6
supply <- 2 * (x_supply / 3 - 1)^2 + 2

# Split MC into two: one for x < 6 (solid) and one for x >= 6 (dashed)
x_mc_solid <- x[x <= 6]
mc_solid <- 2 * (x_mc_solid / 3 - 1)^2 + 2

x_mc_dashed <- x[x > 6]
mc_dashed <- 2 * (x_mc_dashed / 3 - 1)^2 + 2

# Start plotting
p <- ggplot() +
  
  # Add the supply curve (deep pink, thicker, sent to back)
  geom_line(aes(x = x_supply, y = supply, color = "Supply Curve"), size = 1.5) +
  
  # Add the ATC curve (thinner, brought to front)
  geom_line(aes(x = x, y = atc, color = "Average Total Cost"), size = 0.8) +
  
  # Add the MC curve (solid for x < 6, dashed for x > 6)
  geom_line(aes(x = x_mc_solid, y = mc_solid, color = "Marginal Cost"), size = 0.8) +
  geom_line(aes(x = x_mc_dashed, y = mc_dashed, color = "Marginal Cost"), size = 1, linetype = "twodash") +
  
  # Customize the theme
  theme_economist() +
  theme(
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.text.x = element_blank(),  # No x-axis number labels
    axis.text.y = element_blank(),  # No y-axis number labels
    axis.ticks.x = element_blank(), # No x-axis tick marks
    axis.ticks.y = element_blank(), # No y-axis tick marks
    axis.line.x = element_line(color = "black", size = 0.8),
    axis.line.y = element_line(color = "black", size = 0.8),
    legend.position = c(1, 1),       # Position legend at the top right
    legend.justification = c(1, 1)   # Align legend to top right corner
  ) +
  
  # Add labels and title
  labs(x = "Quantity (X)", 
       y = "Cost (Y)", 
       title = "Cost Curves and Supply Curve",
       color = "") +  # No legend title
  
  # Set axis limits
  scale_x_continuous(limits = c(0, 15), expand = c(0, 0)) + 
  scale_y_continuous(limits = c(0, 10), expand = c(0, 0)) + 
  
  # Adjust plot limits and appearance
  coord_cartesian(xlim = c(0, 15), ylim = c(0, 10)) +
  
  # Define custom colors for the lines in the legend
  scale_color_manual(values = c(
    "Average Total Cost" = "blue",
    "Marginal Cost" = "darkgreen",
    "Supply Curve" = "deeppink"
  ))

# Save the plot as a PNG file
ggsave("EC1002_1022_Q12_Supply.png", plot = p, width = 6, height = 7, units = "in")
