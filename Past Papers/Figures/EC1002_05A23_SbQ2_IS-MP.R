# Load necessary libraries
library(ggplot2)
library(ggthemes)
library(gridExtra)

# Define the data range for X-axis (Output)
X <- seq(0, 8, by = 0.1)

# Equations for the first graph
black_line <- X  # 45-deg
red_line <- 2 + 0.5 * X  # AE 5%
blue_line <- 1 + 0.5 * X  # AE 4%

# Create the data frame for the first graph
data_top <- data.frame(
  X = rep(X, 3),
  Y = c(black_line, red_line, blue_line),
  Line = rep(c("", "AE 5%", "AE 4%"), each = length(X))
)

# Equations for the second graph (Interest Rates - IS curve)
is_curve <- -0.5 * X + 6

# Create the data frame for the second graph
data_bottom <- data.frame(
  X = X,
  Y = is_curve,
  Line = "IS Curve"
)

# Plot 1: Spending vs Output
top_plot <- ggplot(data_top, aes(x = X, y = Y, color = Line)) +
  geom_line(size = 1) +
  geom_vline(xintercept = 0, color = "black", size = 0.8) +
  theme_economist() +
  theme(
    axis.title.x = element_blank(),  # Remove x-axis label for the top plot
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.line.x = element_line(color = "black", size = 0.8),
    axis.line.y = element_blank(),
    plot.title = element_blank(),
    legend.position = "none",
    plot.margin = unit(c(0, 1, 0, 1), "lines")  # Reduce space around the top plot
  ) +
  
  # Add vertical dashed lines for (2,2) and (4,4)
  geom_vline(xintercept = 2, linetype = "dashed") +
  geom_vline(xintercept = 4, linetype = "dashed") +
  
  # Customize axis and labels
  labs(y = "Spending") +
  scale_color_manual(values = c("black", "maroon", "blue4")) +  # Line colors
  
  # Move y-axis to x=0
  coord_cartesian(xlim = c(0, 8))

# Plot 2: Interest Rates vs Output
bottom_plot <- ggplot(data_bottom, aes(x = X, y = Y, color = Line)) +
  geom_line(size = 1, color = "darkgreen") +
  geom_vline(xintercept = 0, color = "black", size = 0.8) +
  theme_economist() +
  theme(
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.line.x = element_line(color = "black", size = 0.8),
    axis.line.y = element_blank(),
    plot.title = element_blank(),
    legend.position = "none",
    plot.margin = unit(c(0, 1, 0, 1), "lines")  # Reduce space around the bottom plot
  ) +
  
  # Mark the points (4,4) and (2,5) with x
  geom_point(aes(x = 4, y = 4), shape = 4, size = 3, stroke = 1.75, color = "blue4") +  # Point (4,4)
  geom_point(aes(x = 2, y = 5), shape = 4, size = 3, stroke = 1.75, color = "maroon") +  # Point (2,5)
  
  # Add vertical dashed lines for (2,0) and (4,0)
  geom_vline(xintercept = 2, linetype = "dashed") +
  geom_vline(xintercept = 4, linetype = "dashed") +
  
  # Add horizontal lines at y=4 and y=5
  geom_hline(yintercept = 4, color = "blue4", size = 0.75) +
  geom_hline(yintercept = 5, color = "maroon", size = 0.75) +
  
  # Customize axis and labels
  labs(x = "Output (Y)", y = "Interest Rates (r)") +
  scale_color_manual(values = "darkgreen") +  # Line color
  
  # Move y-axis to x=0
  coord_cartesian(xlim = c(0, 8))

# Combine the plots using grid.arrange from gridExtra package
p <- grid.arrange(top_plot, bottom_plot, nrow = 2)


# Save the plot as a PNG file
ggsave("EC1002_05A23_SbQ2_IS-MP.png", plot = p, width = 6, height = 7, units = "in")
