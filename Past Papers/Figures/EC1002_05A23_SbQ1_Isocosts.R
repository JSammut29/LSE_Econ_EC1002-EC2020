# Load necessary library
library(ggplot2)
library(ggthemes)

# Create a data frame for output 100
K <- seq(-10, 50, by = 0.05)  # Capital (Sewing Machines)
Q <- 100

# Calculate corresponding Labor (L)
L <- Q - 2 * K

# Combine data into a data frame
isoquant_data <- data.frame(
  K = K,
  L = L,
  Output = rep("Q=100", each = length(K))
)
# Filter out negative capital values
isoquant_data <- isoquant_data[isoquant_data$K >= 0, ]

# Calculate Isocost lines for C = 100x + 20y
L_1000 <- (1000 - 100 * K) / 20
L_2000 <- (2000 - 100 * K) / 20  # Optimal line
L_3000 <- (3000 - 100 * K) / 20

# Combine data into a data frame
lines_data <- data.frame(
  K = rep(K, 3),
  L = c(L_1000, L_2000, L_3000),
  Line = rep(c("1000", "2000 (Optimal)", "3000"), each = length(K))
)

# Plotting with enhanced aesthetics
p <- ggplot(isoquant_data, aes(x = K, y = L, color = Output)) +
  geom_line(data = lines_data, aes(x = K, y = L, color = Line), size = 1) +
  geom_line(size = 1) +
  geom_vline(xintercept = 0, color = "black", size = 0.8) +
  theme_economist() +
  theme(
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.line.x = element_line(color = "black", size = 0.8),
    axis.line.y = element_blank(),
    plot.title = element_text(margin = margin(b = 10)),
    plot.subtitle = element_text(face = "bold", margin = margin(b = 10), hjust=0),
    legend.position = "none"
  ) +
  labs(x = "Sewing Machines", y = "Labour Hours") +
  ggtitle("Optimisation | 100 = 2K + L") +
  labs(subtitle = "Isocost C = 100K + 20L optimal for C = £2000") +
  scale_color_manual(values = c("darkred", "darkgreen", "darkred", "darkblue"))  +
  coord_cartesian(xlim = c(-10, 60), ylim = c(0, 120)) +                 
  scale_x_continuous(breaks = seq(-10, 60, by = 5), expand = c(0, 0)) + 
  scale_y_continuous(breaks = seq(0, 120, by = 10), expand = c(0, 0))   


# Save the plot as a PNG file
ggsave("EC1002_05A23_SbQ1_Isocosts.png", plot = p, width = 6, height = 7, units = "in")