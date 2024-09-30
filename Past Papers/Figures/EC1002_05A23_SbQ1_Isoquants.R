# Load necessary library
library(ggplot2)
library(ggthemes)

# Create a data frame for different output levels
K <- seq(0, 10, by = 0.1)  # Capital (Sewing Machines)
Q1 <- 4   # Output level 1
Q2 <- 8   # Output level 2
Q3 <- 12  # Output level 3

# Calculate corresponding Labor (L) for each Q
L1 <- Q1 - 2 * K
L2 <- Q2 - 2 * K
L3 <- Q3 - 2 * K

# Combine data into a data frame
isoquant_data <- data.frame(
  K = rep(K, times = 3),
  L = c(L1, L2, L3),
  Output = rep(c("Q=4", "Q=8", "Q=12"), each = length(K))
)

# Filter out negative labor values
isoquant_data <- isoquant_data[isoquant_data$L >= 0, ]

# Plotting with enhanced aesthetics
p <- ggplot(isoquant_data, aes(x = K, y = L, color = Output)) +
  geom_line(size = 1) +
  theme_economist() +
  theme(
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.line.x = element_line(color = "black", size = 0.8),
    axis.line.y = element_line(color = "black", size = 0.8),
    plot.title = element_text(margin = margin(b = 10)),
    legend.position = "none"
    ) +
  labs(x = "Sewing Machines", y = "Labour Hours") +
  ggtitle("Isoquants | Q = 2K + L") +
  scale_color_manual(values = c("darkblue", "darkblue", "darkblue")) +
  coord_cartesian(xlim = c(0, 8), ylim = c(0, 13)) +                 
  scale_x_continuous(breaks = seq(0, 8, by = 1), expand = c(0, 0)) + 
  scale_y_continuous(breaks = seq(0, 13, by = 1), expand = c(0, 0))   

# Save the plot as a PNG file
ggsave("EC1002_05A23_SbQ1_Isoquants.png", plot = p, width = 6, height = 7, units = "in")