# Load necessary library
library(ggplot2)
library(ggthemes)

# Create a data frame for different output levels
Q <- seq(-5, 40, by = 0.1)

# Calculate corresponding Prices (P) for each Q
P <- 50 - 1.25 * Q
MR <- 50 - 2.5 * Q
MC <- 20 + 0 * Q

# Combine data into a data frame
monopoly <- data.frame(
  Q = rep(Q, times = 3),
  P = c(P, MR, MC),
  Output = rep(c("Price", "Marginal Revenue", "Marginal Cost"), each = length(Q))
)

# Filter out negative prices
monopoly <- monopoly[monopoly$P >= 0, ]

# Create data frames for shaded areas
shaded_box <- data.frame(
  xmin = 0, xmax = 12, ymin = 20, ymax = 35,
  Label = "Supernormal Profit"
)

shaded_triangle <- data.frame(
  x = c(12, 24, 12), y = c(35, 20, 20),
  Label = "Deadweight Welfare Loss"
)

# Plotting with labels for shaded areas in the legend
p <- ggplot(monopoly, aes(x = Q, y = P, color = Output)) +
  geom_line(size = 1) +
  geom_vline(xintercept = 0, color = "black", size = 0.8) +
  
  # Dashed lines
  geom_segment(aes(x = 0, y = 20, xend = 12, yend = 20), color = "darkgrey", linetype = "dashed", size = 1) +
  geom_segment(aes(x = 12, y = 0, xend = 12, yend = 20), color = "darkgrey", linetype = "dashed", size = 1) +
  geom_segment(aes(x = 0, y = 35, xend = 12, yend = 35), color = "darkgrey", linetype = "dashed", size = 1) +
  geom_segment(aes(x = 0, y = 20, xend = 24, yend = 20), color = "darkgrey", linetype = "dashed", size = 1) +
  geom_segment(aes(x = 24, y = 0, xend = 24, yend = 20), color = "darkgrey", linetype = "dashed", size = 1) +
  
  # Light green shading for the box (0,20), (0,35), (12,35), (12,20) without inheriting Output
  geom_rect(data = shaded_box, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = Label), 
            alpha = 0.5, inherit.aes = FALSE) +
  
  # Light red shading for the triangle (12,35), (24,20), (12,20) without inheriting Output
  geom_polygon(data = shaded_triangle, aes(x = x, y = y, fill = Label), 
               alpha = 0.5, inherit.aes = FALSE) +
  
  theme_economist() +
  theme(
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.line.x = element_line(color = "black", size = 0.8),
    axis.line.y = element_blank(),
    plot.title = element_text(margin = margin(b = 10)),
    legend.title = element_blank(),
    legend.position = c(0.72, 0.82)
  ) +
  labs(x = "Quantity", y = "Price") +
  ggtitle("Monopolist Optimisation") +
  scale_color_manual(values = c("brown", "blueviolet", "blue4")) +
  
  # Add fill scale to include the shaded areas in the legend
  scale_fill_manual(values = c("lightcoral", "lightgreen")) +
  
  coord_cartesian(xlim = c(-5, 40), ylim = c(0, 50)) +                 
  scale_x_continuous(breaks = seq(0, 40, by = 5), expand = c(0, 0)) + 
  scale_y_continuous(breaks = seq(0, 50, by = 5), expand = c(0, 0))

#Save the plot as a PNG file
ggsave("EC1002_05A23_SbQ1_Monopoly.png", plot = p, width = 6, height = 7, units = "in")