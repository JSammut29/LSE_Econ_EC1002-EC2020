# Load necessary libraries
library(ggplot2)
library(ggthemes)

# Define the values of x
x <- seq(0.1, 5, by = 0.05)

# Define the corresponding values of y for each indifference curve
y1 <- 1 / x
y2 <- 2 / x
y3 <- 3 / x
y4 <- 4 / x
y5 <- 5 / x

# Combine the data into a data frame
indifference_data <- data.frame(
  x = rep(x, times = 5),
  y = c(y1, y2, y3, y4, y5),
  Curve = rep(c("xy=1", "xy=2", "xy=3", "xy=4", "xy=5"), each = length(x))
)

# Define the MRS line (y = 2x)
y_MRS <- 2 * x

# Create a separate data frame for the MRS line
MRS_data <- data.frame(
  x = x,
  y = y_MRS
)

# Plotting the indifference curves
p <- ggplot(indifference_data, aes(x = x, y = y, color = Curve)) +
  geom_line(size = 1) +
  scale_color_manual(values = c("#FFD700", "#FFC300", "#FFA500", "#FF8C00", "#FF7F50")) + # Custom gold/orange shades
  geom_line(data = MRS_data, aes(x = x, y = y), color = "darkgrey", linetype = "dashed", size = 0.8) +  # Add MRS line (y = 2x)
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
    legend.position = "none"        # No legend
  ) +

    # Add labels and title
  labs(x = "X = Fashion", 
       y = "Y = Cosmetics", 
       title = "Indifference Curves",
       color = "") +  # Remove legend title
  
  scale_x_continuous(limits=c(0,5), expand=c(0,0)) + 
  scale_y_continuous(limits=c(0,5), expand=c(0,0)) + 
  
  # Adjust plot limits to focus on positive values of x and y
  coord_cartesian(xlim = c(0, 5), ylim = c(0, 5))

# Save the plot as a PNG file
ggsave("EC1002_1022_Q11_Indifference.png", plot = p, width = 6, height = 7, units = "in")
