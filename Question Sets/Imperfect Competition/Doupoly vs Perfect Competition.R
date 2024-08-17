# Load necessary libraries
library(ggplot2)

# Define functions for the curves
MC <- function(x) { 0.02 * x^2 - 4 * x + 300 }
AVC <- function(x) { (0.02/3) * x^2 - 2 * x + 300 }
Demand <- function(x) { 500 - x }

# Create a sequence of x values (Quantity)
x_values <- seq(0, 600, by = 1)

# Create data frame
data <- data.frame(
  Quantity = x_values,
  MC_Curve = MC(x_values),
  AVC_Curve = AVC(x_values),
  Demand_Curve = Demand(x_values)
)

# Define equilibrium points
duopoly_point <- data.frame(Quantity = 200, Price_Cost = 300)
perfect_competition_point <- data.frame(Quantity = 150, Price_Cost = 150)

# Plot the graph
ggplot(data, aes(x = Quantity)) +
  geom_line(aes(y = MC_Curve, color = "Marginal Cost"), size = 1) +
  geom_line(aes(y = AVC_Curve, color = "Average Variable Cost"), size = 1) +
  geom_line(aes(y = Demand_Curve, color = "Demand"), size = 1) +
  geom_point(data = duopoly_point, aes(x = Quantity, y = Price_Cost), color = "red", size = 3) +
  geom_text(data = duopoly_point, aes(x = Quantity, y = Price_Cost, label = "Duopoly Equilibrium Point"), 
            vjust = -1, hjust = -0.1, color = "red") +
  geom_point(data = perfect_competition_point, aes(x = Quantity, y = Price_Cost), color = "blue", size = 3) +
  geom_text(data = perfect_competition_point, aes(x = Quantity, y = Price_Cost, label = "Perfect Competition Equilibrium Point"), 
            vjust = 1.5, hjust = -0.1, color = "blue") +
  geom_hline(yintercept = 300, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 150, linetype = "dashed", color = "black") +
  scale_color_manual(values = c("Marginal Cost" = "red", "Average Variable Cost" = "blue", "Demand" = "purple")) +
  labs(title = "Duopoly vs Perfect Competition",
       subtitle = "Equilibrium Output Analysis",
       x = "Quantity",
       y = "Price / Cost",
       color = "Curves") +
  theme_minimal() +
  theme(legend.position = "bottom") + 
  xlim(0, 600) + 
  ylim(-100, 800) # Adjusted y-limits to accommodate curve ranges

